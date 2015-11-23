From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: Add GPIO support for the ACCES 104-IDI-48
Date: Mon, 23 Nov 2015 12:54:50 -0500
Message-ID: <20151123175450.GA16041@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:36660 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751104AbbKWRzA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2015 12:55:00 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The ACCES 104-IDI-48 family of PC/104 utility boards feature 48
individually optically isolated digital inputs. Enabled inputs feature
change-of-state detection capability; if change-of-state detection is
enabled, an interrupt is fired off if a change of input level
(low-to-high or high-to-low) is detected. Change-of-state IRQs are
enabled/disabled on 8-bit boundaries, for a total of six boundaries.

This driver provides GPIO and IRQ support for these 48 channels of
digital input. The base port address for the device may be configured
via the idi_48_base module parameter. The interrupt line number for the
device may be configured via the idi_48_irq module parameter.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 MAINTAINERS                    |   6 +
 drivers/gpio/Kconfig           |   9 ++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-104-idi-48.c | 349 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 365 insertions(+)
 create mode 100644 drivers/gpio/gpio-104-idi-48.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 629727e..f04fb49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,6 +240,12 @@ L:	lm-sensors@lm-sensors.org
 S:	Maintained
 F:	drivers/hwmon/abituguru3.c
 
+ACCES 104-IDI-48 GPIO DRIVER
+M:	"William Breathitt Gray" <vilhelm.gray@gmail.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-104-idi-48.c
+
 ACCES 104-IDIO-16 GPIO DRIVER
 M:	"William Breathitt Gray" <vilhelm.gray@gmail.com>
 L:	linux-gpio@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 18e1aa0..30d8bd3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -503,6 +503,15 @@ config GPIO_104_IDIO_16
 	  parameter. The interrupt line number for the device may be set via the
 	  idio_16_irq module parameter.
 
+config GPIO_104_IDI_48
+	tristate "ACCES 104-IDI-48 GPIO support"
+	select GPIOLIB_IRQCHIP
+	help
+	  Enables GPIO support for the ACCES 104-IDI-48 family. The base port
+	  address for the device may be configured via the idi_48_base module
+	  parameter. The interrupt line number for the device may be configured
+	  via the idi_48_irq module parameter.
+
 config GPIO_F7188X
 	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 986dbd8..548e9b5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 
 obj-$(CONFIG_GPIO_104_IDIO_16)	+= gpio-104-idio-16.o
+obj-$(CONFIG_GPIO_104_IDI_48)	+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_74X164)	+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)	+= gpio-74xx-mmio.o
 obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
new file mode 100644
index 0000000..b5c6934
--- /dev/null
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -0,0 +1,349 @@
+/*
+ * GPIO driver for the ACCES 104-IDI-48 family
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
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/interrupt.h>
+#include <linux/irqdesc.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+static unsigned idi_48_base;
+module_param(idi_48_base, uint, 0);
+MODULE_PARM_DESC(idi_48_base, "ACCES 104-IDI-48 base address");
+static unsigned idi_48_irq;
+module_param(idi_48_irq, uint, 0);
+MODULE_PARM_DESC(idi_48_irq, "ACCES 104-IDI-48 interrupt line number");
+
+/**
+ * struct idi_48_gpio - GPIO device private data structure
+ * @chip:	instance of the gpio_chip
+ * @lock:	synchronization lock to prevent I/O race conditions
+ * @irq_mask:	input bits affected by interrupts
+ * @base:	base port address of the GPIO device
+ * @extent:	extent of port address region of the GPIO device
+ * @irq:	Interrupt line number
+ * @cos_enb:	Change-Of-State IRQ enable boundaries mask
+ */
+struct idi_48_gpio {
+	struct gpio_chip chip;
+	spinlock_t lock;
+	unsigned char irq_mask[6];
+	unsigned base;
+	unsigned extent;
+	unsigned irq;
+	unsigned char cos_enb;
+};
+
+static int idi_48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	return 1;
+}
+
+static int idi_48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	return 0;
+}
+
+static struct idi_48_gpio *to_idi48gpio(struct gpio_chip *gc)
+{
+	return container_of(gc, struct idi_48_gpio, chip);
+}
+
+static int idi_48_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	unsigned i;
+	const unsigned register_offset[6] = { 0, 1, 2, 4, 5, 6 };
+	unsigned base_offset;
+	unsigned mask;
+
+	for (i = 0; i < 48; i += 8)
+		if (offset < i + 8) {
+			base_offset = register_offset[i / 8];
+			mask = BIT(offset - i);
+
+			return !!(inb(idi48gpio->base + base_offset) & mask);
+		}
+
+	/* The following line should never execute since offset < 48 */
+	return 0;
+}
+
+static void idi_48_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&idi48gpio->lock, flags);
+
+	inb(idi48gpio->base + 7);
+
+	spin_unlock_irqrestore(&idi48gpio->lock, flags);
+}
+
+static void idi_48_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	const unsigned offset = irqd_to_hwirq(data);
+	unsigned i;
+	unsigned mask;
+	unsigned boundary;
+	unsigned long flags;
+
+	for (i = 0; i < 48; i += 8)
+		if (offset < i + 8) {
+			mask = BIT(offset - i);
+			boundary = i / 8;
+
+			idi48gpio->irq_mask[boundary] &= ~mask;
+
+			if (!idi48gpio->irq_mask[boundary]) {
+				idi48gpio->cos_enb &= ~BIT(boundary);
+
+				spin_lock_irqsave(&idi48gpio->lock, flags);
+
+				outb(idi48gpio->cos_enb, idi48gpio->base + 7);
+
+				spin_unlock_irqrestore(&idi48gpio->lock, flags);
+			}
+
+			return;
+		}
+}
+
+static void idi_48_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	const unsigned offset = irqd_to_hwirq(data);
+	unsigned i;
+	unsigned mask;
+	unsigned boundary;
+	unsigned prev_irq_mask;
+	unsigned long flags;
+
+	for (i = 0; i < 48; i += 8)
+		if (offset < i + 8) {
+			mask = BIT(offset - i);
+			boundary = i / 8;
+			prev_irq_mask = idi48gpio->irq_mask[boundary];
+
+			idi48gpio->irq_mask[boundary] |= mask;
+
+			if (!prev_irq_mask) {
+				idi48gpio->cos_enb |= BIT(boundary);
+
+				spin_lock_irqsave(&idi48gpio->lock, flags);
+
+				outb(idi48gpio->cos_enb, idi48gpio->base + 7);
+
+				spin_unlock_irqrestore(&idi48gpio->lock, flags);
+			}
+
+			return;
+		}
+}
+
+static int idi_48_irq_set_type(struct irq_data *data, unsigned flow_type)
+{
+	/* The only valid irq types are none and both-edges */
+	if (flow_type != IRQ_TYPE_NONE &&
+		(flow_type & IRQ_TYPE_EDGE_BOTH) != IRQ_TYPE_EDGE_BOTH)
+		return -EINVAL;
+
+	return 0;
+}
+
+static struct irq_chip idi_48_irqchip = {
+	.name = "104-idi-48",
+	.irq_ack = idi_48_irq_ack,
+	.irq_mask = idi_48_irq_mask,
+	.irq_unmask = idi_48_irq_unmask,
+	.irq_set_type = idi_48_irq_set_type
+};
+
+static irqreturn_t idi_48_irq_handler(int irq, void *dev_id)
+{
+	struct idi_48_gpio *const idi48gpio = dev_id;
+	unsigned long cos_status;
+	unsigned long boundary;
+	unsigned long irq_mask;
+	unsigned long bit_num;
+	unsigned long gpio;
+	struct gpio_chip *const chip = &idi48gpio->chip;
+
+	spin_lock(&idi48gpio->lock);
+
+	cos_status = inb(idi48gpio->base + 7);
+
+	spin_unlock(&idi48gpio->lock);
+
+	/* IRQ Status (bit 6) is active low (0 = IRQ generated by device) */
+	if (cos_status & BIT(6))
+		return IRQ_NONE;
+
+	/* Bit 0-5 indicate which Change-Of-State boundary triggered the IRQ */
+	cos_status &= 0x3F;
+
+	for_each_set_bit(boundary, &cos_status, 6) {
+		irq_mask = idi48gpio->irq_mask[boundary];
+
+		for_each_set_bit(bit_num, &irq_mask, 8) {
+			gpio = bit_num + boundary * 8;
+
+			generic_handle_irq(irq_find_mapping(chip->irqdomain,
+				gpio));
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int __init idi_48_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct idi_48_gpio *idi48gpio;
+	const unsigned base = idi_48_base;
+	const unsigned extent = 8;
+	const char *const name = dev_name(dev);
+	int err;
+	const unsigned irq = idi_48_irq;
+
+	idi48gpio = devm_kzalloc(dev, sizeof(*idi48gpio), GFP_KERNEL);
+	if (!idi48gpio)
+		return -ENOMEM;
+
+	if (!request_region(base, extent, name)) {
+		dev_err(dev, "Unable to lock %s port addresses (0x%X-0x%X)\n",
+			name, base, base + extent);
+		err = -EBUSY;
+		goto err_lock_io_port;
+	}
+
+	idi48gpio->chip.label = name;
+	idi48gpio->chip.parent = dev;
+	idi48gpio->chip.owner = THIS_MODULE;
+	idi48gpio->chip.base = -1;
+	idi48gpio->chip.ngpio = 48;
+	idi48gpio->chip.get_direction = idi_48_gpio_get_direction;
+	idi48gpio->chip.direction_input = idi_48_gpio_direction_input;
+	idi48gpio->chip.get = idi_48_gpio_get;
+	idi48gpio->base = base;
+	idi48gpio->extent = extent;
+	idi48gpio->irq = irq;
+
+	spin_lock_init(&idi48gpio->lock);
+
+	dev_set_drvdata(dev, idi48gpio);
+
+	err = gpiochip_add(&idi48gpio->chip);
+	if (err) {
+		dev_err(dev, "GPIO registering failed (%d)\n", err);
+		goto err_gpio_register;
+	}
+
+	/* Disable IRQ by default */
+	outb(0, base + 7);
+	inb(base + 7);
+
+	err = gpiochip_irqchip_add(&idi48gpio->chip, &idi_48_irqchip, 0,
+		handle_edge_irq, IRQ_TYPE_NONE);
+	if (err) {
+		dev_err(dev, "Could not add irqchip (%d)\n", err);
+		goto err_gpiochip_irqchip_add;
+	}
+
+	err = request_irq(irq, idi_48_irq_handler, 0, name, idi48gpio);
+	if (err) {
+		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
+		goto err_request_irq;
+	}
+
+	return 0;
+
+err_request_irq:
+err_gpiochip_irqchip_add:
+	gpiochip_remove(&idi48gpio->chip);
+err_gpio_register:
+	release_region(base, extent);
+err_lock_io_port:
+	return err;
+}
+
+static int idi_48_remove(struct platform_device *pdev)
+{
+	struct idi_48_gpio *const idi48gpio = platform_get_drvdata(pdev);
+
+	free_irq(idi48gpio->irq, idi48gpio);
+	gpiochip_remove(&idi48gpio->chip);
+	release_region(idi48gpio->base, idi48gpio->extent);
+
+	return 0;
+}
+
+static struct platform_device *idi_48_device;
+
+static struct platform_driver idi_48_driver = {
+	.driver = {
+		.name = "104-idi-48"
+	},
+	.remove = idi_48_remove
+};
+
+static void __exit idi_48_exit(void)
+{
+	platform_device_unregister(idi_48_device);
+	platform_driver_unregister(&idi_48_driver);
+}
+
+static int __init idi_48_init(void)
+{
+	int err;
+
+	idi_48_device = platform_device_alloc(idi_48_driver.driver.name, -1);
+	if (!idi_48_device)
+		return -ENOMEM;
+
+	err = platform_device_add(idi_48_device);
+	if (err)
+		goto err_platform_device;
+
+	err = platform_driver_probe(&idi_48_driver, idi_48_probe);
+	if (err)
+		goto err_platform_driver;
+
+	return 0;
+
+err_platform_driver:
+	platform_device_del(idi_48_device);
+err_platform_device:
+	platform_device_put(idi_48_device);
+	return err;
+}
+
+module_init(idi_48_init);
+module_exit(idi_48_exit);
+
+MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
+MODULE_DESCRIPTION("ACCES 104-IDI-48 GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.4.10

