From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v3] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Mon, 5 Oct 2015 20:08:41 -0400
Message-ID: <20151006000841.GA20844@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f170.google.com ([209.85.160.170]:33100 "EHLO
	mail-yk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbbJFAIt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 20:08:49 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

The ACCES 104-IDIO-16 family of PC/104 utility boards feature 16
optically isolated inputs and 16 optically isolated FET solid state
outputs. This driver provides GPIO support for these 32 channels of
digital I/O. Change-of-State detection interrupts are not supported.

GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
correspond to digital inputs 0-15.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v3:
  - Replace gpio.h include with gpio/driver.h since all needed
    relevant symbols and resources are within the latter
  - Rename struct a_104_idio_16 'data' member to the more apt and
    descriptive 'out_state'
  - Add kerneldoc for struct a_104_idio_16_gpio
  - Reorganize function definitions to eliminate need for forward
    declarations

 drivers/gpio/Kconfig            |  15 ++++
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-104-idio-16.c | 154 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/gpio/gpio-104-idio-16.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8949b3f..70b63f1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -684,6 +684,21 @@ config GPIO_SX150X
 
 endmenu
 
+menu "ISA GPIO expanders"
+
+menuconfig GPIO_104_IDIO_16
+	tristate "ACCES 104-IDIO-16 GPIO support"
+	depends on X86
+	help
+	  Enables GPIO support for the ACCES 104-IDIO-16 family.
+
+config 104_IDIO_16_BASE
+	hex "ACCES 104-IDIO-16 base address"
+	depends on GPIO_104_IDIO_16
+	default 0x000
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
index 0000000..f6b2afd
--- /dev/null
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -0,0 +1,154 @@
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
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/spinlock.h>
+
+/**
+ * struct a_104_idio_16_gpio - gpio device private data structure
+ * @chip:	instance of the gpio_chip
+ * @lock:	synchronization lock to prevent gpio_set race conditions
+ * @base:	base port address of the GPIO device
+ * @out_state:	output bits state
+ */
+struct a_104_idio_16_gpio {
+	struct gpio_chip chip;
+	spinlock_t lock;
+	unsigned base;
+	unsigned out_state;
+};
+
+static const unsigned A_104_IDIO_16_EXTENT = 8;
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
+static struct a_104_idio_16_gpio *to_a104i16gp(struct gpio_chip *gc)
+{
+	return container_of(gc, struct a_104_idio_16_gpio, chip);
+}
+
+static int a_104_idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct a_104_idio_16_gpio *a104i16gp = to_a104i16gp(chip);
+	const unsigned BIT_MASK = 1U << (offset-16);
+
+	if (offset < 16)
+		return 0;
+
+	if (offset < 24)
+		return !!(inb(a104i16gp->base + 1) & BIT_MASK);
+
+	return !!(inb(a104i16gp->base + 5) & (BIT_MASK>>8));
+}
+
+static void a_104_idio_16_gpio_set(struct gpio_chip *chip, unsigned offset,
+	int value)
+{
+	struct a_104_idio_16_gpio *a104i16gp = to_a104i16gp(chip);
+	const unsigned BIT_MASK = 1U << offset;
+	unsigned long flags;
+
+	if (offset > 15)
+		return;
+
+	spin_lock_irqsave(&a104i16gp->lock, flags);
+
+	if (value)
+		a104i16gp->out_state |= BIT_MASK;
+	else
+		a104i16gp->out_state &= ~BIT_MASK;
+
+	if (offset > 7)
+		outb(~a104i16gp->out_state >> 8, a104i16gp->base + 4);
+	else
+		outb(~a104i16gp->out_state, a104i16gp->base);
+
+	spin_unlock_irqrestore(&a104i16gp->lock, flags);
+}
+
+static struct a_104_idio_16_gpio gp = {
+	.chip = {
+		.label = "104-IDIO-16 GPIO",
+		.owner = THIS_MODULE,
+		.base = -1,
+		.ngpio = 32,
+		.direction_input = a_104_idio_16_gpio_direction_input,
+		.direction_output = a_104_idio_16_gpio_direction_output,
+		.get = a_104_idio_16_gpio_get,
+		.set = a_104_idio_16_gpio_set
+	},
+	.base = CONFIG_104_IDIO_16_BASE
+};
+
+static void __exit a_104_idio_16_exit(void)
+{
+	pr_info("104-idio-16: Exiting 104-idio-16 module\n");
+
+	gpiochip_remove(&gp.chip);
+	release_region(CONFIG_104_IDIO_16_BASE, A_104_IDIO_16_EXTENT);
+}
+
+static int __init a_104_idio_16_init(void)
+{
+	int err = 0;
+
+	pr_info("104-idio-16: Initializing 104-idio-16 module\n");
+
+	if (!request_region(CONFIG_104_IDIO_16_BASE, A_104_IDIO_16_EXTENT,
+		"104-idio-16")) {
+		pr_err("104-idio-16: Unable to lock 104-idio-16 port addresses (0x%X-0x%X)\n",
+			CONFIG_104_IDIO_16_BASE,
+			CONFIG_104_IDIO_16_BASE + A_104_IDIO_16_EXTENT);
+		err = -EBUSY;
+		goto out_lock_a_104_idio_16_port;
+	}
+
+	spin_lock_init(&gp.lock);
+
+	pr_info("104-idio-16: 104-IDIO-16 GPIO detected\n");
+	err = gpiochip_add(&gp.chip);
+	if (err) {
+		pr_err("104-idio-16: GPIO registering failed (%d)\n", err);
+		goto out_gpio_register;
+	}
+
+	return 0;
+
+out_gpio_register:
+	release_region(CONFIG_104_IDIO_16_BASE, A_104_IDIO_16_EXTENT);
+out_lock_a_104_idio_16_port:
+	return err;
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

