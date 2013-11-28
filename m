From: Bruno Randolf <br1@einfach.org>
Subject: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Thu, 28 Nov 2013 00:18:15 +0000
Message-ID: <1385597895-26418-1-git-send-email-br1@einfach.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from postler.einfach.org ([91.250.116.113]:46059 "EHLO
	postler.einfach.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754085Ab3K1A2m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2013 19:28:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: wim@iguana.be, linux-gpio@vger.kernel.org, Bruno Randolf <br1@einfach.org>

This patch adds support for the first eight GPIOs found on the SMSC "Super I/O"
chips SCH311x.

This chip is used on Atom based embedded boards (e.g. "Advantec MIO-2261") and
actually has more GPIO lines, but they are not connected on the board I have
access to.

The chip detection and I/O functions are copied from sch311x_wdt.c

Signed-off-by: Bruno Randolf <br1@einfach.org>
---
 drivers/gpio/Kconfig        |  10 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-sch311x.c | 315 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/gpio/gpio-sch311x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b6ed304..3d6bc8d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -237,6 +237,16 @@ config GPIO_SAMSUNG
 	  Legacy GPIO support. Use only for platforms without support for
 	  pinctrl.
 
+config GPIO_SCH311X
+	tristate "SMSC SCH311x SuperI/O GPIO"
+	depends on X86
+	help
+	  Driver to enable the GPIOs found on SMSC SMSC SCH3112, SCH3114 and
+	  SCH3116 "Super I/O" chipsets.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-sch311x.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 98e23eb..b63c11f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_GPIO_RCAR)		+= gpio-rcar.o
 obj-$(CONFIG_GPIO_SAMSUNG)	+= gpio-samsung.o
 obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
+obj-$(CONFIG_GPIO_SCH311X)	+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SODAVILLE)	+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)	+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_STA2X11)	+= gpio-sta2x11.o
diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
new file mode 100644
index 0000000..1ca7450
--- /dev/null
+++ b/drivers/gpio/gpio-sch311x.c
@@ -0,0 +1,315 @@
+/*
+ * GPIO driver for the SMSC SCH311x Super-I/O chips
+ *
+ * Copyright (C) 2013 Bruno Randolf <br1@einfach.org>
+ *
+ * SuperIO functions and chip detection:
+ * (c) Copyright 2008 Wim Van Sebroeck <wim@iguana.be>.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/gpio.h>
+#include <linux/i2c-gpio.h>
+
+#define DRV_NAME	"gpio-sch311x"
+
+/*
+ * Note: This driver only supports the first 8 GPIOs of the chip.
+ */
+
+
+/* Runtime registers */
+
+#define GP1	0x4B	/* GP10-17 data register */
+
+static unsigned int sch311x_gpio_conf[] = {
+	{ 0x23,		/* GP10 config register */
+	0x24,		/* GP11 config register */
+	0x25,		/* GP12 config register */
+	0x26,		/* GP13 config register */
+	0x27,		/* GP14 config register */
+	0x29,		/* GP15 config register */
+	0x2a,		/* GP16 config register */
+	0x2b,		/* GP17 config register */
+};
+
+#define SCH311X_GPIO_CONF_IN		0x01
+#define SCH311X_GPIO_CONF_OUT		0x00
+#define SCH311X_GPIO_CONF_INV		0x02
+#define SCH311X_GPIO_CONF_OPEN_DRAIN	0x80
+
+static int sch311x_ioports[] = { 0x2e, 0x4e, 0x162e, 0x164e, 0x00 };
+
+/* internal variables */
+static struct platform_device *sch311x_gpio_pdev;
+static struct platform_device *i2c_gpio_pdev;
+
+static struct {
+	unsigned short runtime_reg;	/* Runtime Register base address */
+	spinlock_t lock;		/* lock for io operations */
+} sch311x_gpio_data;
+
+
+/*
+ *	Super-IO functions
+ */
+
+static inline void sch311x_sio_enter(int sio_config_port)
+{
+	outb(0x55, sio_config_port);
+}
+
+static inline void sch311x_sio_exit(int sio_config_port)
+{
+	outb(0xaa, sio_config_port);
+}
+
+static inline int sch311x_sio_inb(int sio_config_port, int reg)
+{
+	outb(reg, sio_config_port);
+	return inb(sio_config_port + 1);
+}
+
+static inline void sch311x_sio_outb(int sio_config_port, int reg, int val)
+{
+	outb(reg, sio_config_port);
+	outb(val, sio_config_port + 1);
+}
+
+
+/*
+ *	GPIO functions
+ */
+
+static int sch311x_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	unsigned char data = inb(sch311x_gpio_data.runtime_reg + GP1);
+	return ((data >> offset) & 1);
+}
+
+static void __sch311x_gpio_set(unsigned offset, int value)
+{
+	unsigned char data;
+	data = inb(sch311x_gpio_data.runtime_reg + GP1);
+	if (value)
+		data |= 1 << offset;
+	else
+		data &= ~(1 << offset);
+	outb(data, sch311x_gpio_data.runtime_reg + GP1);
+}
+
+static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	spin_lock(&sch311x_gpio_data.lock);
+
+	 __sch311x_gpio_set(offset, value);
+
+	spin_unlock(&sch311x_gpio_data.lock);
+}
+
+static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+{
+	spin_lock(&sch311x_gpio_data.lock);
+
+	outb(SCH311X_GPIO_CONF_IN, sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);
+
+	spin_unlock(&sch311x_gpio_data.lock);
+	return 0;
+}
+
+static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned offset, int value)
+{
+	spin_lock(&sch311x_gpio_data.lock);
+
+#if 0
+	/* configure as "push/pull": output voltage is 3.3V */
+	outb(SCH311X_GPIO_CONF_OUT, sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);
+#else
+	/* configure as "open drain": output voltage is 5V on an unconnected PIN */
+	outb(SCH311X_GPIO_CONF_OUT | SCH311X_GPIO_CONF_OPEN_DRAIN,
+	     sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);
+#endif
+	__sch311x_gpio_set(offset, value);
+
+	spin_unlock(&sch311x_gpio_data.lock);
+	return 0;
+}
+
+static struct gpio_chip sc_gpio_chip = {
+	.label			= "sch311x_gpio",
+	.owner			= THIS_MODULE,
+	.direction_input	= sch311x_gpio_direction_in,
+	.get			= sch311x_gpio_get,
+	.direction_output	= sch311x_gpio_direction_out,
+	.set			= sch311x_gpio_set,
+	.can_sleep		= 0,
+	.base			= 0,
+	.ngpio			= 8,
+};
+
+static int sch311x_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int err, i;
+
+	spin_lock_init(&sch311x_gpio_data.lock);
+
+	if (!request_region(sch311x_gpio_data.runtime_reg + GP1, 1, DRV_NAME)) {
+		dev_err(dev, "Failed to request region 0x%04x-0x%04x.\n",
+			sch311x_gpio_data.runtime_reg + GP1,
+			sch311x_gpio_data.runtime_reg + GP1);
+		err = -EBUSY;
+		goto exit;
+	}
+
+	for (i=0; i < ARRAY_SIZE(sch311x_gpio_conf); i++) {
+		if (!request_region(sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i], 1, DRV_NAME)) {
+			dev_err(dev, "Failed to request region 0x%04x-0x%04x.\n",
+				sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i],
+				sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i]);
+			err = -EBUSY;
+			goto exit_release_region;
+		}
+	}
+
+	sc_gpio_chip.dev = &pdev->dev;
+	err = gpiochip_add(&sc_gpio_chip);
+	if (err < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", err);
+		goto exit_release_region2;
+	}
+
+	dev_info(dev, "SMSC SCH311x GPIO registered.\n");
+
+	return 0;
+
+exit_release_region2:
+	for (i=0; i < ARRAY_SIZE(sch311x_gpio_conf); i++) {
+		release_region(sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i], 1);
+	}
+exit_release_region:
+	release_region(sch311x_gpio_data.runtime_reg + GP1, 1);
+	sch311x_gpio_data.runtime_reg = 0;
+exit:
+	return err;
+}
+
+static int sch311x_gpio_remove(struct platform_device *pdev)
+{
+	int i;
+
+	release_region(sch311x_gpio_data.runtime_reg + GP1, 1);
+	for (i=0; i < ARRAY_SIZE(sch311x_gpio_conf); i++) {
+		release_region(sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i], 1);
+	}
+	sch311x_gpio_data.runtime_reg = 0;
+
+	return gpiochip_remove(&sc_gpio_chip);
+}
+
+static struct platform_driver sch311x_gpio_driver = {
+	.driver.name	= DRV_NAME,
+	.driver.owner	= THIS_MODULE,
+	.probe		= sch311x_gpio_probe,
+	.remove		= sch311x_gpio_remove,
+};
+
+
+/*
+ *	Init & exit routines
+ */
+
+static int __init sch311x_detect(int sio_config_port, unsigned short *addr)
+{
+	int err = 0, reg;
+	unsigned short base_addr;
+	unsigned char dev_id;
+
+	sch311x_sio_enter(sio_config_port);
+
+	/* Check device ID. We currently know about:
+	 * SCH3112 (0x7c), SCH3114 (0x7d), and SCH3116 (0x7f). */
+	reg = sch311x_sio_inb(sio_config_port, 0x20);
+	if (!(reg == 0x7c || reg == 0x7d || reg == 0x7f)) {
+		err = -ENODEV;
+		goto exit;
+	}
+	dev_id = reg == 0x7c ? 2 : reg == 0x7d ? 4 : 6;
+
+	/* Select logical device A (runtime registers) */
+	sch311x_sio_outb(sio_config_port, 0x07, 0x0a);
+
+	/* Check if Logical Device Register is currently active */
+	if ((sch311x_sio_inb(sio_config_port, 0x30) & 0x01) == 0)
+		pr_info("Seems that LDN 0x0a is not active...\n");
+
+	/* Get the base address of the runtime registers */
+	base_addr = (sch311x_sio_inb(sio_config_port, 0x60) << 8) |
+			   sch311x_sio_inb(sio_config_port, 0x61);
+	if (!base_addr) {
+		pr_err("Base address not set\n");
+		err = -ENODEV;
+		goto exit;
+	}
+	*addr = base_addr;
+
+	pr_info("Found an SMSC SCH311%d chip at 0x%04x\n", dev_id, base_addr);
+
+exit:
+	sch311x_sio_exit(sio_config_port);
+	return err;
+}
+
+static int __init sch311x_gpio_init(void)
+{
+	int err, i, found = 0;
+	unsigned short addr = 0;
+
+	for (i = 0; !found && sch311x_ioports[i]; i++)
+		if (sch311x_detect(sch311x_ioports[i], &addr) == 0)
+			found++;
+
+	if (!found)
+		return -ENODEV;
+
+	sch311x_gpio_data.runtime_reg = addr;
+
+	err = platform_driver_register(&sch311x_gpio_driver);
+	if (err)
+		return err;
+
+	sch311x_gpio_pdev = platform_device_register_simple(DRV_NAME, addr, NULL, 0);
+
+	if (IS_ERR(sch311x_gpio_pdev)) {
+		err = PTR_ERR(sch311x_gpio_pdev);
+		goto unreg_platform_driver;
+	}
+
+	return 0;
+
+unreg_platform_driver:
+	platform_driver_unregister(&sch311x_gpio_driver);
+	return err;
+}
+
+static void __exit sch311x_gpio_exit(void)
+{
+	platform_device_unregister(sch311x_gpio_pdev);
+	platform_driver_unregister(&sch311x_gpio_driver);
+}
+
+module_init(sch311x_gpio_init);
+module_exit(sch311x_gpio_exit);
+
+MODULE_AUTHOR("Bruno Randolf <br1@einfach.org>");
+MODULE_DESCRIPTION("SMSC SCH311x GPIO Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:gpio-sch311x");
-- 
1.8.3.2

