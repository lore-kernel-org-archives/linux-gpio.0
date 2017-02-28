From: Marc Pignat <marc@pignat.org>
Subject: [PATCH,v2 1/1] gpio: add NCT5104D gpio driver
Date: Tue, 28 Feb 2017 09:19:09 +0100
Message-ID: <c89b1094-3db4-6c62-0b86-f359b2bc0073@pignat.org>
References: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
 <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
 <20170222210420.GA15290@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:39231 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751898AbdB1I0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Feb 2017 03:26:14 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by slow1-d.mail.gandi.net (Postfix) with ESMTP id 1FB344864FF
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2017 09:20:15 +0100 (CET)
In-Reply-To: <20170222210420.GA15290@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0504307..e899792 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -620,6 +620,14 @@ config GPIO_IT87
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio_it87
 
+config GPIO_NCT5104D
+	tristate "Nuvotron NCT5104D GPIO support"
+	help
+	  Enables GPIO support for the Nuvotron NCT5104D  Super-I/O chip.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called nct5104d-gpio.
+
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
 	depends on (X86 || COMPILE_TEST) && PCI
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index becb96c..4b35109 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_GPIO_MSIC)		+= gpio-msic.o
 obj-$(CONFIG_GPIO_MVEBU)        += gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)		+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)		+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NCT5104D)	+= gpio-nct5104d.o
 obj-$(CONFIG_GPIO_OCTEON)	+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)		+= gpio-omap.o
 obj-$(CONFIG_GPIO_PCA953X)	+= gpio-pca953x.o
diff --git a/drivers/gpio/gpio-nct5104d.c b/drivers/gpio/gpio-nct5104d.c
new file mode 100644
index 0000000..d36518a
--- /dev/null
+++ b/drivers/gpio/gpio-nct5104d.c
@@ -0,0 +1,432 @@
+/*
+ * GPIO driver for Nuvoton Super-I/O NCT5104D
+ *
+ * Copyright (C) 2017 Marc Pignat
+ *
+ * Inspired from gpio-nct5104d.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/gpio/driver.h>
+#include <linux/bitops.h>
+
+#define DRVNAME "gpio-nct5104d"
+
+/*
+ * Super-I/O registers
+ */
+#define SIO_LDSEL		0x07	/* Logical device select */
+#define SIO_DEVID		0x20	/* Device ID (2 bytes) */
+
+#define SIO_LD_GPIO		0x07	/* GPIO logical device */
+#define SIO_GPIO_ENABLE		0x30	/* GPIO enable */
+#define SIO_LD_GPIO_MODE	0x0F	/* GPIO mode control device */
+#define SIO_GPIO1_MODE		0xE0	/* GPIO1 Mode OpenDrain/Push-Pull */
+#define SIO_GPIO2_MODE		0xE1	/* GPIO2 Mode OpenDrain/Push-Pull */
+
+#define SIO_UNLOCK_KEY		0x87	/* Key to enable Super-I/O */
+#define SIO_LOCK_KEY		0xAA	/* Key to disable Super-I/O */
+
+#define SIO_NCT5104D_ID		0x1061
+#define SIO_PCENGINES_APU_ID	0xc452
+
+struct nct5104d_sio {
+	int addr;
+};
+
+struct nct5104d_gpio_bank {
+	struct gpio_chip chip;
+	unsigned int regbase;
+	unsigned int reg_od;
+	struct nct5104d_gpio_data *data;
+};
+
+struct nct5104d_gpio_data {
+	struct nct5104d_sio *sio;
+	int nr_bank;
+	struct nct5104d_gpio_bank *bank;
+};
+
+/*
+ * Super-I/O functions.
+ */
+
+static inline int superio_inb(int base, int reg)
+{
+	outb(reg, base);
+	return inb(base + 1);
+}
+
+static int superio_inw(int base, int reg)
+{
+	int val;
+
+	outb(reg++, base);
+	val = inb(base + 1) << 8;
+	outb(reg, base);
+	val |= inb(base + 1);
+
+	return val;
+}
+
+static inline void superio_outb(int base, int reg, int val)
+{
+	outb(reg, base);
+	outb(val, base + 1);
+}
+
+static inline int superio_enter(int base)
+{
+	/* Don't step on other drivers' I/O space by accident. */
+	if (!request_muxed_region(base, 2, DRVNAME)) {
+		pr_err(DRVNAME "I/O address 0x%04x already in use\n", base);
+		return -EBUSY;
+	}
+
+	/* According to the datasheet the key must be send twice. */
+	outb(SIO_UNLOCK_KEY, base);
+	outb(SIO_UNLOCK_KEY, base);
+
+	return 0;
+}
+
+static inline void superio_select(int base, int ld)
+{
+	outb(SIO_LDSEL, base);
+	outb(ld, base + 1);
+}
+
+static inline void superio_exit(int base)
+{
+	outb(SIO_LOCK_KEY, base);
+	release_region(base, 2);
+}
+
+#define gpio_dir(base) (base + 0)
+#define gpio_data(base) (base + 1)
+
+static int nct5104d_gpio_get_direction(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	int err;
+
+	struct nct5104d_gpio_bank *bank = gpiochip_get_data(chip);
+	struct nct5104d_sio *sio = bank->data->sio;
+	u8 dir;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
+
+	superio_exit(sio->addr);
+
+	return !!(dir & BIT(offset));
+}
+
+static int nct5104d_gpio_direction_in(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank = gpiochip_get_data(chip);
+	struct nct5104d_sio *sio = bank->data->sio;
+	u8 dir;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
+	dir |= BIT(offset);
+	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
+
+	superio_exit(sio->addr);
+
+	return 0;
+}
+
+static int nct5104d_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank = gpiochip_get_data(chip);
+	struct nct5104d_sio *sio = bank->data->sio;
+	u8 data;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	data = superio_inb(sio->addr, gpio_data(bank->regbase));
+
+	superio_exit(sio->addr);
+
+	return !!(data & BIT(offset));
+}
+
+static int nct5104d_gpio_direction_out(struct gpio_chip *chip,
+				     unsigned int offset, int value)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank = gpiochip_get_data(chip);
+	struct nct5104d_sio *sio = bank->data->sio;
+	u8 dir, data_out;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	data_out = superio_inb(sio->addr, gpio_data(bank->regbase));
+	if (value)
+		data_out |= BIT(offset);
+	else
+		data_out &= ~BIT(offset);
+	superio_outb(sio->addr, gpio_data(bank->regbase), data_out);
+
+	dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
+	dir &= ~BIT(offset);
+	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
+
+	superio_exit(sio->addr);
+
+	return 0;
+}
+
+static void nct5104d_gpio_set(struct gpio_chip *chip,
+			      unsigned int offset, int value)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank = gpiochip_get_data(chip);
+	struct nct5104d_sio *sio = bank->data->sio;
+	u8 data_out;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	data_out = superio_inb(sio->addr, gpio_data(bank->regbase));
+	if (value)
+		data_out |= BIT(offset);
+	else
+		data_out &= ~BIT(offset);
+	superio_outb(sio->addr, gpio_data(bank->regbase), data_out);
+
+	superio_exit(sio->addr);
+}
+
+static int nct5104d_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				    unsigned long config)
+{
+	int err;
+	enum pin_config_param param = pinconf_to_config_param(config);
+	struct nct5104d_gpio_bank *bank = gpiochip_get_data(chip);
+	struct nct5104d_sio *sio = bank->data->sio;
+	u8 data;
+
+	if (param != PIN_CONFIG_DRIVE_OPEN_DRAIN &&
+	    param != PIN_CONFIG_DRIVE_PUSH_PULL)
+		return -ENOTSUPP;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO_MODE);
+
+	data = superio_inb(sio->addr, bank->reg_od);
+	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
+		data |= BIT(offset);
+	else
+		data &= ~BIT(offset);
+	superio_outb(sio->addr, bank->reg_od, data);
+
+	superio_exit(sio->addr);
+	return 0;
+}
+
+#define NCT5104D_GPIO_BANK(_base, _ngpio, _regbase, _reg_od)		\
+	{								\
+		.chip = {						\
+			.label            = DRVNAME,			\
+			.owner            = THIS_MODULE,		\
+			.get_direction    = nct5104d_gpio_get_direction,\
+			.direction_input  = nct5104d_gpio_direction_in,	\
+			.get              = nct5104d_gpio_get,		\
+			.direction_output = nct5104d_gpio_direction_out,\
+			.set              = nct5104d_gpio_set,		\
+			.set_config       = nct5104d_gpio_set_config,	\
+			.base             = _base,			\
+			.ngpio            = _ngpio,			\
+			.can_sleep        = true,			\
+		},							\
+		.regbase = _regbase,					\
+		.reg_od = _reg_od,					\
+	}
+
+static struct nct5104d_gpio_bank nct5104d_gpio_bank[] = {
+	NCT5104D_GPIO_BANK(0,  8, 0xE0, SIO_GPIO1_MODE),
+	NCT5104D_GPIO_BANK(10, 8, 0xE4, SIO_GPIO2_MODE)
+};
+
+/*
+ * Platform device and driver.
+ */
+
+static int nct5104d_gpio_probe(struct platform_device *pdev)
+{
+	int err;
+	int i;
+	struct nct5104d_sio *sio = dev_get_platdata(&pdev->dev);
+	struct nct5104d_gpio_data *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nr_bank = ARRAY_SIZE(nct5104d_gpio_bank);
+	data->bank = nct5104d_gpio_bank;
+	data->sio = sio;
+
+	platform_set_drvdata(pdev, data);
+
+	/* For each GPIO bank, register a GPIO chip. */
+	for (i = 0; i < data->nr_bank; i++) {
+		struct nct5104d_gpio_bank *bank = &data->bank[i];
+
+		bank->chip.parent = &pdev->dev;
+		bank->data = data;
+
+		err = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to register gpiochip %d: %d\n",
+				i, err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int __init nct5104d_find(int addr, struct nct5104d_sio *sio)
+{
+	int err;
+	u16 devid;
+	u8 gpio_cfg;
+
+	err = superio_enter(addr);
+	if (err)
+		return err;
+
+	devid = superio_inw(addr, SIO_DEVID);
+
+	if (devid != SIO_NCT5104D_ID &&
+	    devid != SIO_PCENGINES_APU_ID) {
+		err = -ENODEV;
+		goto err;
+	}
+
+	sio->addr = addr;
+	err = 0;
+
+	pr_info(DRVNAME ": Found at %#x\n", (unsigned int) addr);
+
+	superio_select(addr, SIO_LD_GPIO);
+
+	/* Enable GPIO0-1 */
+	gpio_cfg = superio_inb(addr, SIO_GPIO_ENABLE);
+	gpio_cfg |= 0x03;
+	superio_outb(addr, SIO_GPIO_ENABLE, gpio_cfg);
+
+err:
+	superio_exit(addr);
+	return err;
+}
+
+static struct platform_device *nct5104d_gpio_pdev;
+
+static int __init
+nct5104d_gpio_device_add(const struct nct5104d_sio *sio)
+{
+	int err;
+
+	nct5104d_gpio_pdev = platform_device_alloc(DRVNAME, -1);
+	if (!nct5104d_gpio_pdev)
+		return -ENOMEM;
+
+	err = platform_device_add_data(nct5104d_gpio_pdev,
+				       sio, sizeof(*sio));
+	if (err) {
+		pr_err(DRVNAME "Platform data allocation failed\n");
+		goto err;
+	}
+
+	err = platform_device_add(nct5104d_gpio_pdev);
+	if (err) {
+		pr_err(DRVNAME "Device addition failed\n");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	platform_device_put(nct5104d_gpio_pdev);
+
+	return err;
+}
+
+/*
+ * Try to match a supported Fintek device by reading the (hard-wired)
+ * configuration I/O ports. If available, then register both the platform
+ * device and driver to support the GPIOs.
+ */
+
+static struct platform_driver nct5104d_gpio_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct5104d_gpio_probe,
+};
+
+static int __init nct5104d_gpio_init(void)
+{
+	int err;
+	struct nct5104d_sio sio;
+
+	if (nct5104d_find(0x2e, &sio) &&
+	    nct5104d_find(0x4e, &sio))
+		return -ENODEV;
+
+	err = platform_driver_register(&nct5104d_gpio_driver);
+	if (!err) {
+		err = nct5104d_gpio_device_add(&sio);
+		if (err)
+			platform_driver_unregister(&nct5104d_gpio_driver);
+	}
+
+	return err;
+}
+
+static void __exit nct5104d_gpio_exit(void)
+{
+	platform_device_unregister(nct5104d_gpio_pdev);
+	platform_driver_unregister(&nct5104d_gpio_driver);
+}
+subsys_initcall(nct5104d_gpio_init);
+module_exit(nct5104d_gpio_exit);
+
+MODULE_DESCRIPTION("GPIO driver for Super-I/O chip Nuvoton NCT5104D");
+MODULE_AUTHOR("Marc Pignat <marc@pignat.org>");
+MODULE_LICENSE("GPL");

