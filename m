From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v6] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Wed, 7 Oct 2015 13:06:30 -0400
Message-ID: <20151007170630.GA19396@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:35974 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753818AbbJGRGj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2015 13:06:39 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

The ACCES 104-IDIO-16 family of PC/104 utility boards feature 16
optically isolated inputs and 16 optically isolated FET solid state
outputs. This driver provides GPIO support for these 32 channels of
digital I/O. Change-of-State detection interrupts are not supported.

GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
correspond to digital inputs 0-15. The base port address for the device
may be set via the a_104_idio_16_base module parameter.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v6:
  - Add support for gpio_get_direction functionality
  - Add __init attribute to the driver probe function since it is only
    called at module initialization
  - Resolve checkpatch.pl warning about length of return line for the
    module init function

 drivers/gpio/Kconfig            |  10 ++
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-104-idio-16.c | 207 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/gpio/gpio-104-idio-16.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8949b3f..dc843e0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -684,6 +684,16 @@ config GPIO_SX150X
 
 endmenu
 
+menu "ISA GPIO drivers"
+
+config GPIO_104_IDIO_16
+	tristate "ACCES 104-IDIO-16 GPIO support"
+	depends on X86
+	help
+	  Enables GPIO support for the ACCES 104-IDIO-16 family.
+
+endmenu
+
 menu "MFD GPIO expanders"
 
 config GPIO_ADP5520
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f79a7c4..6f2fea5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 # Device drivers. Generally keep list sorted alphabetically
 obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 
+obj-$(CONFIG_GPIO_104_IDIO_16)	+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)	+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)	+= gpio-74xx-mmio.o
 obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
new file mode 100644
index 0000000..38db84d
--- /dev/null
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -0,0 +1,207 @@
+/*
+ * GPIO driver for the ACCES 104-IDIO-16 family
+ * Copyright (C) 2015 William Breathitt Gray
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License, version 2, as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ */
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+static unsigned a_104_idio_16_base;
+module_param(a_104_idio_16_base, uint, 0);
+MODULE_PARM_DESC(a_104_idio_16_base, "ACCES 104-IDIO-16 base address");
+
+/**
+ * struct a_104_idio_16_gpio - GPIO device private data structure
+ * @chip:	instance of the gpio_chip
+ * @lock:	synchronization lock to prevent gpio_set race conditions
+ * @base:	base port address of the GPIO device
+ * @extent:	extent of port address region of the GPIO device
+ * @out_state:	output bits state
+ */
+struct a_104_idio_16_gpio {
+	struct gpio_chip chip;
+	spinlock_t lock;
+	unsigned base;
+	unsigned extent;
+	unsigned out_state;
+};
+
+static int a_104_idio_16_gpio_get_direction(struct gpio_chip *chip,
+	unsigned offset)
+{
+	if (offset > 15)
+		return 1;
+
+	return 0;
+}
+
+static int a_104_idio_16_gpio_direction_input(struct gpio_chip *chip,
+	unsigned offset)
+{
+	return 0;
+}
+
+static int a_104_idio_16_gpio_direction_output(struct gpio_chip *chip,
+	unsigned offset, int value)
+{
+	chip->set(chip, offset, value);
+	return 0;
+}
+
+static struct a_104_idio_16_gpio *to_a104idio16gp(struct gpio_chip *gc)
+{
+	return container_of(gc, struct a_104_idio_16_gpio, chip);
+}
+
+static int a_104_idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct a_104_idio_16_gpio *const a104idio16gp = to_a104idio16gp(chip);
+	const unsigned BIT_MASK = 1U << (offset-16);
+
+	if (offset < 16)
+		return -ENODEV;
+
+	if (offset < 24)
+		return !!(inb(a104idio16gp->base + 1) & BIT_MASK);
+
+	return !!(inb(a104idio16gp->base + 5) & (BIT_MASK>>8));
+}
+
+static void a_104_idio_16_gpio_set(struct gpio_chip *chip, unsigned offset,
+	int value)
+{
+	struct a_104_idio_16_gpio *const a104idio16gp = to_a104idio16gp(chip);
+	const unsigned BIT_MASK = 1U << offset;
+	unsigned long flags;
+
+	if (offset > 15)
+		return;
+
+	spin_lock_irqsave(&a104idio16gp->lock, flags);
+
+	if (value)
+		a104idio16gp->out_state |= BIT_MASK;
+	else
+		a104idio16gp->out_state &= ~BIT_MASK;
+
+	if (offset > 7)
+		outb(~a104idio16gp->out_state >> 8, a104idio16gp->base + 4);
+	else
+		outb(~a104idio16gp->out_state, a104idio16gp->base);
+
+	spin_unlock_irqrestore(&a104idio16gp->lock, flags);
+}
+
+static int __init a_104_idio_16_probe(struct platform_device *pdev)
+{
+	struct a_104_idio_16_gpio *const a104idio16gp = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	int err;
+
+	const unsigned BASE = a104idio16gp->base;
+	const unsigned EXTENT = a104idio16gp->extent;
+
+	if (!request_region(BASE, EXTENT, "104-idio-16")) {
+		dev_err(dev, "Unable to lock 104-idio-16 port addresses (0x%X-0x%X)\n",
+			BASE, BASE + EXTENT);
+		err = -EBUSY;
+		goto out_lock_a_104_idio_16_port;
+	}
+
+	spin_lock_init(&a104idio16gp->lock);
+
+	dev_info(dev, "104-IDIO-16 GPIO detected\n");
+	err = gpiochip_add(&a104idio16gp->chip);
+	if (err) {
+		dev_err(dev, "GPIO registering failed (%d)\n", err);
+		goto out_gpio_register;
+	}
+
+	return 0;
+
+out_gpio_register:
+	release_region(BASE, EXTENT);
+out_lock_a_104_idio_16_port:
+	return err;
+}
+
+static int a_104_idio_16_remove(struct platform_device *pdev)
+{
+	struct a_104_idio_16_gpio *const a104idio16gp = pdev->dev.platform_data;
+
+	gpiochip_remove(&a104idio16gp->chip);
+	release_region(a104idio16gp->base, a104idio16gp->extent);
+
+	return 0;
+}
+
+static struct platform_device *a_104_idio_16_device;
+
+static struct platform_driver a_104_idio_16_driver = {
+	.driver = {
+		.name = "104-idio-16",
+	},
+	.remove = a_104_idio_16_remove
+};
+
+static void __exit a_104_idio_16_exit(void)
+{
+	dev_info(&a_104_idio_16_device->dev, "Exiting module\n");
+
+	platform_device_unregister(a_104_idio_16_device);
+	platform_driver_unregister(&a_104_idio_16_driver);
+}
+
+static int __init a_104_idio_16_init(void)
+{
+	int ret;
+	struct a_104_idio_16_gpio a104idio16gp = {
+		.chip = {
+			.label = "104-IDIO-16 GPIO",
+			.owner = THIS_MODULE,
+			.base = -1,
+			.ngpio = 32,
+			.get_direction = a_104_idio_16_gpio_get_direction,
+			.direction_input = a_104_idio_16_gpio_direction_input,
+			.direction_output = a_104_idio_16_gpio_direction_output,
+			.get = a_104_idio_16_gpio_get,
+			.set = a_104_idio_16_gpio_set
+		},
+		.base = a_104_idio_16_base,
+		.extent = 8
+	};
+
+	a_104_idio_16_device = platform_device_register_data(NULL,
+		"104-idio-16", -1, &a104idio16gp, sizeof(a104idio16gp));
+	if (IS_ERR(a_104_idio_16_device))
+		return PTR_ERR(a_104_idio_16_device);
+
+	dev_info(&a_104_idio_16_device->dev, "Initializing module\n");
+
+	ret = platform_driver_probe(&a_104_idio_16_driver, a_104_idio_16_probe);
+	return ret;
+}
+
+module_init(a_104_idio_16_init);
+module_exit(a_104_idio_16_exit);
+
+MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
+MODULE_DESCRIPTION("ACCES 104-IDIO-16 GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.4.9

