From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: Add GPIO support for the WinSystems WS16C48
Date: Sun, 3 Jan 2016 19:05:26 -0500
Message-ID: <20160104000526.GA13169@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:33917 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739AbcADAFf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2016 19:05:35 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The WinSystems WS16C48 device provides 48 lines of digital I/O. In
addition, the first 24 lines may be used for interrupt-handled edge
detection; rising edge detection and falling edge detection are
supported.

This driver provides GPIO and IRQ support for these 48 channels of
digital I/O. The base port address for the device may be configured via
the ws16c48_base module parameter. The interrupt line number for the
device may be configured via the ws16c48_irq module parameter.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 MAINTAINERS                 |   6 +
 drivers/gpio/Kconfig        |   9 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-ws16c48.c | 437 ++++++++++++++++++++++++++++++++++++=
++++++++
 4 files changed, 453 insertions(+)
 create mode 100644 drivers/gpio/gpio-ws16c48.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d7d83c..0b24c42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11659,6 +11659,12 @@ M:	David H=E4rdeman <david@hardeman.nu>
 S:	Maintained
 F:	drivers/media/rc/winbond-cir.c
=20
+WINSYSTEMS WS16C48 GPIO DRIVER
+M:	"William Breathitt Gray" <vilhelm.gray@gmail.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-ws16c48.c
+
 WIMAX STACK
 M:	Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>
 M:	linux-wimax@intel.com
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b60f40a..a050a99 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -577,6 +577,15 @@ config GPIO_TS5500
 	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
 	  LCD port.
=20
+config GPIO_WS16C48
+	tristate "WinSystems WS16C48 GPIO support"
+	select GPIOLIB_IRQCHIP
+	help
+	  Enables GPIO support for the WinSystems WS16C48. The base port addr=
ess
+	  for the device may be configured via the ws16c48_base module
+	  parameter. The interrupt line number for the device may be configur=
ed
+	  via the ws16c48_irq module parameter.
+
 endmenu
=20
 menu "I2C GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 548e9b5..bcb6cbe 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_GPIO_VX855)	+=3D gpio-vx855.o
 obj-$(CONFIG_GPIO_WM831X)	+=3D gpio-wm831x.o
 obj-$(CONFIG_GPIO_WM8350)	+=3D gpio-wm8350.o
 obj-$(CONFIG_GPIO_WM8994)	+=3D gpio-wm8994.o
+obj-$(CONFIG_GPIO_WS16C48)	+=3D gpio-ws16c48.o
 obj-$(CONFIG_GPIO_XGENE)	+=3D gpio-xgene.o
 obj-$(CONFIG_GPIO_XGENE_SB)	+=3D gpio-xgene-sb.o
 obj-$(CONFIG_GPIO_XILINX)	+=3D gpio-xilinx.o
diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
new file mode 100644
index 0000000..c2ea5c6
--- /dev/null
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -0,0 +1,437 @@
+/*
+ * GPIO driver for the WinSystems WS16C48
+ * Copyright (C) 2016 William Breathitt Gray
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
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
+static unsigned ws16c48_base;
+module_param(ws16c48_base, uint, 0);
+MODULE_PARM_DESC(ws16c48_base, "WinSystems WS16C48 base address");
+static unsigned ws16c48_irq;
+module_param(ws16c48_irq, uint, 0);
+MODULE_PARM_DESC(ws16c48_irq, "WinSystems WS16C48 interrupt line numbe=
r");
+
+/**
+ * struct ws16c48_gpio - GPIO device private data structure
+ * @chip:	instance of the gpio_chip
+ * @io_state:	bit I/O state (whether bit is set to input or output)
+ * @out_state:	output bits state
+ * @lock:	synchronization lock to prevent I/O race conditions
+ * @irq_mask:	I/O bits affected by interrupts
+ * @flow_mask:	IRQ flow type mask for the respective I/O bits
+ * @base:	base port address of the GPIO device
+ * @extent:	extent of port address region of the GPIO device
+ * @irq:	Interrupt line number
+ */
+struct ws16c48_gpio {
+	struct gpio_chip chip;
+	unsigned char io_state[6];
+	unsigned char out_state[6];
+	spinlock_t lock;
+	unsigned long irq_mask;
+	unsigned long flow_mask;
+	unsigned base;
+	unsigned extent;
+	unsigned irq;
+};
+
+static struct ws16c48_gpio *to_ws16c48gpio(struct gpio_chip *gc)
+{
+	return container_of(gc, struct ws16c48_gpio, chip);
+}
+
+static int ws16c48_gpio_get_direction(struct gpio_chip *chip, unsigned=
 offset)
+{
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned port =3D offset / 8;
+	const unsigned mask =3D BIT(offset % 8);
+
+	return !!(ws16c48gpio->io_state[port] & mask);
+}
+
+static int ws16c48_gpio_direction_input(struct gpio_chip *chip, unsign=
ed offset)
+{
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned port =3D offset / 8;
+	const unsigned mask =3D BIT(offset % 8);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	ws16c48gpio->io_state[port] |=3D mask;
+	ws16c48gpio->out_state[port] &=3D ~mask;
+	outb(ws16c48gpio->out_state[port], ws16c48gpio->base + port);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+
+	return 0;
+}
+
+static int ws16c48_gpio_direction_output(struct gpio_chip *chip,
+	unsigned offset, int value)
+{
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned port =3D offset / 8;
+	const unsigned mask =3D BIT(offset % 8);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	ws16c48gpio->io_state[port] &=3D ~mask;
+	if (value)
+		ws16c48gpio->out_state[port] |=3D mask;
+	else
+		ws16c48gpio->out_state[port] &=3D ~mask;
+	outb(ws16c48gpio->out_state[port], ws16c48gpio->base + port);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+
+	return 0;
+}
+
+static int ws16c48_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned port =3D offset / 8;
+	const unsigned mask =3D BIT(offset % 8);
+	unsigned long flags;
+	unsigned port_state;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	/* ensure that GPIO is set for input */
+	if (!(ws16c48gpio->io_state[port] & mask)) {
+		spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+		return -EINVAL;
+	}
+
+	port_state =3D inb(ws16c48gpio->base + port);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+
+	return !!(port_state & mask);
+}
+
+static void ws16c48_gpio_set(struct gpio_chip *chip, unsigned offset, =
int value)
+{
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned port =3D offset / 8;
+	const unsigned mask =3D BIT(offset % 8);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	/* ensure that GPIO is set for output */
+	if (ws16c48gpio->io_state[port] & mask) {
+		spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+		return;
+	}
+
+	if (value)
+		ws16c48gpio->out_state[port] |=3D mask;
+	else
+		ws16c48gpio->out_state[port] &=3D ~mask;
+	outb(ws16c48gpio->out_state[port], ws16c48gpio->base + port);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+}
+
+static void ws16c48_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned long offset =3D irqd_to_hwirq(data);
+	const unsigned port =3D offset / 8;
+	const unsigned mask =3D BIT(offset % 8);
+	unsigned long flags;
+	unsigned port_state;
+
+	/* only the first 3 ports support interrupts */
+	if (port > 2)
+		return;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	port_state =3D ws16c48gpio->irq_mask >> (8*port);
+
+	outb(0x80, ws16c48gpio->base + 7);
+	outb(port_state & ~mask, ws16c48gpio->base + 8 + port);
+	outb(port_state | mask, ws16c48gpio->base + 8 + port);
+	outb(0xC0, ws16c48gpio->base + 7);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+}
+
+static void ws16c48_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned long offset =3D irqd_to_hwirq(data);
+	const unsigned long mask =3D BIT(offset);
+	const unsigned port =3D offset / 8;
+	unsigned long flags;
+
+	/* only the first 3 ports support interrupts */
+	if (port > 2)
+		return;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	ws16c48gpio->irq_mask &=3D ~mask;
+
+	outb(0x80, ws16c48gpio->base + 7);
+	outb(ws16c48gpio->irq_mask >> (8*port), ws16c48gpio->base + 8 + port)=
;
+	outb(0xC0, ws16c48gpio->base + 7);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+}
+
+static void ws16c48_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned long offset =3D irqd_to_hwirq(data);
+	const unsigned long mask =3D BIT(offset);
+	const unsigned port =3D offset / 8;
+	unsigned long flags;
+
+	/* only the first 3 ports support interrupts */
+	if (port > 2)
+		return;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	ws16c48gpio->irq_mask |=3D mask;
+
+	outb(0x80, ws16c48gpio->base + 7);
+	outb(ws16c48gpio->irq_mask >> (8*port), ws16c48gpio->base + 8 + port)=
;
+	outb(0xC0, ws16c48gpio->base + 7);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+}
+
+static int ws16c48_irq_set_type(struct irq_data *data, unsigned flow_t=
ype)
+{
+	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
+	struct ws16c48_gpio *const ws16c48gpio =3D to_ws16c48gpio(chip);
+	const unsigned long offset =3D irqd_to_hwirq(data);
+	const unsigned long mask =3D BIT(offset);
+	const unsigned port =3D offset / 8;
+	unsigned long flags;
+
+	/* only the first 3 ports support interrupts */
+	if (port > 2)
+		return -EINVAL;
+
+	spin_lock_irqsave(&ws16c48gpio->lock, flags);
+
+	switch (flow_type) {
+	case IRQ_TYPE_NONE:
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		ws16c48gpio->flow_mask |=3D mask;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		ws16c48gpio->flow_mask &=3D ~mask;
+		break;
+	default:
+		spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+		return -EINVAL;
+	}
+
+	outb(0x40, ws16c48gpio->base + 7);
+	outb(ws16c48gpio->flow_mask >> (8*port), ws16c48gpio->base + 8 + port=
);
+	outb(0xC0, ws16c48gpio->base + 7);
+
+	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
+
+	return 0;
+}
+
+static struct irq_chip ws16c48_irqchip =3D {
+	.name =3D "ws16c48",
+	.irq_ack =3D ws16c48_irq_ack,
+	.irq_mask =3D ws16c48_irq_mask,
+	.irq_unmask =3D ws16c48_irq_unmask,
+	.irq_set_type =3D ws16c48_irq_set_type
+};
+
+static irqreturn_t ws16c48_irq_handler(int irq, void *dev_id)
+{
+	struct ws16c48_gpio *const ws16c48gpio =3D dev_id;
+	struct gpio_chip *const chip =3D &ws16c48gpio->chip;
+	unsigned long int_pending;
+	unsigned long port;
+	unsigned long int_id;
+	unsigned long gpio;
+
+	int_pending =3D inb(ws16c48gpio->base + 6) & 0x7;
+	/* loop until all pending interrupts are handled */
+	while (int_pending) {
+		for_each_set_bit(port, &int_pending, 3) {
+			int_id =3D inb(ws16c48gpio->base + 8 + port);
+			for_each_set_bit(gpio, &int_id, 8)
+				generic_handle_irq(irq_find_mapping(
+					chip->irqdomain, gpio + 8*port));
+		}
+
+		int_pending =3D inb(ws16c48gpio->base + 6) & 0x7;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int __init ws16c48_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct ws16c48_gpio *ws16c48gpio;
+	const unsigned base =3D ws16c48_base;
+	const unsigned extent =3D 16;
+	const char *const name =3D dev_name(dev);
+	int err;
+	const unsigned irq =3D ws16c48_irq;
+
+	ws16c48gpio =3D devm_kzalloc(dev, sizeof(*ws16c48gpio), GFP_KERNEL);
+	if (!ws16c48gpio)
+		return -ENOMEM;
+
+	if (!request_region(base, extent, name)) {
+		dev_err(dev, "Unable to lock %s port addresses (0x%X-0x%X)\n",
+			name, base, base + extent);
+		err =3D -EBUSY;
+		goto err_lock_io_port;
+	}
+
+	ws16c48gpio->chip.label =3D name;
+	ws16c48gpio->chip.parent =3D dev;
+	ws16c48gpio->chip.owner =3D THIS_MODULE;
+	ws16c48gpio->chip.base =3D -1;
+	ws16c48gpio->chip.ngpio =3D 48;
+	ws16c48gpio->chip.get_direction =3D ws16c48_gpio_get_direction;
+	ws16c48gpio->chip.direction_input =3D ws16c48_gpio_direction_input;
+	ws16c48gpio->chip.direction_output =3D ws16c48_gpio_direction_output;
+	ws16c48gpio->chip.get =3D ws16c48_gpio_get;
+	ws16c48gpio->chip.set =3D ws16c48_gpio_set;
+	ws16c48gpio->base =3D base;
+	ws16c48gpio->extent =3D extent;
+	ws16c48gpio->irq =3D irq;
+
+	spin_lock_init(&ws16c48gpio->lock);
+
+	dev_set_drvdata(dev, ws16c48gpio);
+
+	err =3D gpiochip_add(&ws16c48gpio->chip);
+	if (err) {
+		dev_err(dev, "GPIO registering failed (%d)\n", err);
+		goto err_gpio_register;
+	}
+
+	/* Disable IRQ by default */
+	outb(0x80, base + 7);
+	outb(0, base + 8);
+	outb(0, base + 9);
+	outb(0, base + 10);
+	outb(0xC0, base + 7);
+
+	err =3D gpiochip_irqchip_add(&ws16c48gpio->chip, &ws16c48_irqchip, 0,
+		handle_edge_irq, IRQ_TYPE_NONE);
+	if (err) {
+		dev_err(dev, "Could not add irqchip (%d)\n", err);
+		goto err_gpiochip_irqchip_add;
+	}
+
+	err =3D request_irq(irq, ws16c48_irq_handler, 0, name, ws16c48gpio);
+	if (err) {
+		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
+		goto err_request_irq;
+	}
+
+	return 0;
+
+err_request_irq:
+err_gpiochip_irqchip_add:
+	gpiochip_remove(&ws16c48gpio->chip);
+err_gpio_register:
+	release_region(base, extent);
+err_lock_io_port:
+	return err;
+}
+
+static int ws16c48_remove(struct platform_device *pdev)
+{
+	struct ws16c48_gpio *const ws16c48gpio =3D platform_get_drvdata(pdev)=
;
+
+	free_irq(ws16c48gpio->irq, ws16c48gpio);
+	gpiochip_remove(&ws16c48gpio->chip);
+	release_region(ws16c48gpio->base, ws16c48gpio->extent);
+
+	return 0;
+}
+
+static struct platform_device *ws16c48_device;
+
+static struct platform_driver ws16c48_driver =3D {
+	.driver =3D {
+		.name =3D "ws16c48"
+	},
+	.remove =3D ws16c48_remove
+};
+
+static void __exit ws16c48_exit(void)
+{
+	platform_device_unregister(ws16c48_device);
+	platform_driver_unregister(&ws16c48_driver);
+}
+
+static int __init ws16c48_init(void)
+{
+	int err;
+
+	ws16c48_device =3D platform_device_alloc(ws16c48_driver.driver.name, =
-1);
+	if (!ws16c48_device)
+		return -ENOMEM;
+
+	err =3D platform_device_add(ws16c48_device);
+	if (err)
+		goto err_platform_device;
+
+	err =3D platform_driver_probe(&ws16c48_driver, ws16c48_probe);
+	if (err)
+		goto err_platform_driver;
+
+	return 0;
+
+err_platform_driver:
+	platform_device_del(ws16c48_device);
+err_platform_device:
+	platform_device_put(ws16c48_device);
+	return err;
+}
+
+module_init(ws16c48_init);
+module_exit(ws16c48_exit);
+
+MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
+MODULE_DESCRIPTION("WinSystems WS16C48 GPIO driver");
+MODULE_LICENSE("GPL");
--=20
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
