From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] gpio: gpio-ftdi-cbus: add driver for FTDI CBUS GPIOs
Date: Sun, 21 Jun 2015 00:12:57 +0200
Message-ID: <1434838377-8042-3-git-send-email-stefan@agner.ch>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: grant.likely@secretlab.ca, gregkh@linuxfoundation.org, x-linux@infra-silbe.de, hachti@hachti.de, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-gpio@vger.kernel.org

This driver allows to use the CBUS pins, e.g. CBUS 0-3 on FT232R
type of devices. Note that the pins need to be configured first
by using I/O mode signal option in the EEPROM. This is _not_ the
factory default configuration of any of the four pins.

See also FTDI's Application Note AN_232R-01.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpio/Kconfig          |  10 +++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-ftdi-cbus.c | 167 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/serial/ftdi_sio.c |  16 ++++
 4 files changed, 194 insertions(+)
 create mode 100644 drivers/gpio/gpio-ftdi-cbus.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index caefe80..450ba9f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -975,6 +975,16 @@ endmenu
 menu "USB GPIO expanders"
 	depends on USB
 
+config GPIO_FTDI_CBUS
+	tristate "FTDI FT232R CBUS bitmode GPIO support"
+	depends on USB_SERIAL_FTDI_SIO
+	help
+	  Say yes to use up to four CBUS pins on FT232R type of devices
+	  Note that the pins need to be configured in EEPROM using to
+          "I/O mode" signal option first. The factory configuration
+	  does not ship with this signal option set for any of the four
+	  supported CBUS pins.
+
 config GPIO_VIPERBOARD
 	tristate "Viperboard GPIO a & b support"
 	depends on MFD_VIPERBOARD && USB
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f71bb97..a5d661b4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_GPIO_DWAPB)	+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EM)		+= gpio-em.o
 obj-$(CONFIG_GPIO_EP93XX)	+= gpio-ep93xx.o
 obj-$(CONFIG_GPIO_F7188X)	+= gpio-f7188x.o
+obj-$(CONFIG_GPIO_FTDI_CBUS)	+= gpio-ftdi-cbus.o
 obj-$(CONFIG_GPIO_GE_FPGA)	+= gpio-ge.o
 obj-$(CONFIG_GPIO_GRGPIO)	+= gpio-grgpio.o
 obj-$(CONFIG_GPIO_ICH)		+= gpio-ich.o
diff --git a/drivers/gpio/gpio-ftdi-cbus.c b/drivers/gpio/gpio-ftdi-cbus.c
new file mode 100644
index 0000000..3a4dc46
--- /dev/null
+++ b/drivers/gpio/gpio-ftdi-cbus.c
@@ -0,0 +1,167 @@
+/*
+ * gpiolib support for FTDI SIO chips supporting CBUS GPIO's (FT232R class)
+ *
+ * Copyright 2015 Stefan Agner
+ *
+ * Author: Stefan Agner <stefan@agner.ch>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ * Note: To use the GPIOs on CBUS the signal option need to be set to
+ * I/O mode in EEPROM!
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/regmap.h>
+
+#include <linux/usb/ftdi_sio.h>
+
+struct ftdi_cbus_gpio {
+	struct usb_serial_port *port;
+	struct gpio_chip gpio_chip;
+	u8 cbus_mask;
+};
+
+static inline struct ftdi_cbus_gpio *to_ftdi_cbus_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct ftdi_cbus_gpio, gpio_chip);
+}
+
+static int ftdi_cbus_gpio_direction_input(struct gpio_chip *chip,
+					  unsigned offset)
+{
+	struct ftdi_cbus_gpio *fcg = to_ftdi_cbus_gpio(chip);
+
+	fcg->cbus_mask &= ~((1 << offset) << 4);
+
+	return ftdi_sio_set_bitmode(fcg->port, fcg->cbus_mask, BITMODE_CBUS);
+}
+
+static int ftdi_cbus_gpio_direction_output(struct gpio_chip *chip,
+					   unsigned offset, int value)
+{
+	struct ftdi_cbus_gpio *fcg = to_ftdi_cbus_gpio(chip);
+
+	fcg->cbus_mask |= ((1 << offset) << 4);
+	if (value)
+		fcg->cbus_mask |= (1 << offset);
+	else
+		fcg->cbus_mask &= ~(1 << offset);
+
+	return ftdi_sio_set_bitmode(fcg->port, fcg->cbus_mask, BITMODE_CBUS);
+}
+
+static void ftdi_cbus_gpio_set(struct gpio_chip *chip, unsigned offset,
+			       int value)
+{
+	struct ftdi_cbus_gpio *fcg = to_ftdi_cbus_gpio(chip);
+	int ret;
+
+	if (value)
+		fcg->cbus_mask |= (1 << offset);
+	else
+		fcg->cbus_mask &= ~(1 << offset);
+
+	ret = ftdi_sio_set_bitmode(fcg->port, fcg->cbus_mask, 0x20);
+	if (ret < 0)
+		dev_warn(chip->dev, "error setting pin value, %d\n", ret);
+}
+
+static int ftdi_cbus_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct ftdi_cbus_gpio *fcg = to_ftdi_cbus_gpio(chip);
+	u8 val;
+	int ret;
+
+	ret = ftdi_sio_read_pins(fcg->port, &val);
+
+	if (ret < 0) {
+		dev_warn(chip->dev, "error getting pin value, %d\n", ret);
+		return 0;
+	}
+
+	if (val & (1 << offset))
+		return 1;
+	else
+		return 0;
+}
+
+static struct gpio_chip ftdi_cbus_gpio_chip = {
+	.label			= "ftdi-cbus-gpio",
+	.owner			= THIS_MODULE,
+	.direction_input	= ftdi_cbus_gpio_direction_input,
+	.direction_output	= ftdi_cbus_gpio_direction_output,
+	.get			= ftdi_cbus_gpio_get,
+	.set			= ftdi_cbus_gpio_set,
+	.can_sleep		= true,
+};
+
+static int ftdi_cbus_gpio_probe(struct platform_device *pdev)
+{
+	struct ftdi_cbus_gpio *ftdi_cbus_gpio;
+	int ret = 0;
+
+	ftdi_cbus_gpio = devm_kzalloc(&pdev->dev, sizeof(*ftdi_cbus_gpio),
+				      GFP_KERNEL);
+	if (ftdi_cbus_gpio == NULL)
+		return -ENOMEM;
+
+	ftdi_cbus_gpio->port = to_usb_serial_port(pdev->dev.parent);
+	ftdi_cbus_gpio->gpio_chip = ftdi_cbus_gpio_chip;
+	ftdi_cbus_gpio->gpio_chip.base = -1;
+	ftdi_cbus_gpio->gpio_chip.ngpio = 4;
+	ftdi_cbus_gpio->gpio_chip.dev = &pdev->dev;
+
+	ret = gpiochip_add(&ftdi_cbus_gpio->gpio_chip);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
+			ret);
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, ftdi_cbus_gpio);
+
+err:
+	return ret;
+}
+
+static int ftdi_cbus_gpio_remove(struct platform_device *pdev)
+{
+	struct ftdi_cbus_gpio *fcg = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&fcg->gpio_chip);
+
+	return 0;
+}
+
+static struct platform_driver ftdi_cbus_gpio_driver = {
+	.driver.name	= "ftdi-cbus-gpio",
+	.driver.owner	= THIS_MODULE,
+	.probe		= ftdi_cbus_gpio_probe,
+	.remove		= ftdi_cbus_gpio_remove,
+};
+
+static int __init ftdi_cbus_gpio_init(void)
+{
+	return platform_driver_register(&ftdi_cbus_gpio_driver);
+}
+subsys_initcall(ftdi_cbus_gpio_init);
+
+static void __exit ftdi_cbus_gpio_exit(void)
+{
+	platform_driver_unregister(&ftdi_cbus_gpio_driver);
+}
+module_exit(ftdi_cbus_gpio_exit);
+
+MODULE_AUTHOR("Stefan Agner <stefan@agner.ch>");
+MODULE_DESCRIPTION("GPIO interface for FTDI SIO chips using CBUS bitmode");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ftdi-cbus-gpio");
diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 23a3280..2711d24 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -33,6 +33,7 @@
 
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/tty_driver.h>
@@ -1846,6 +1847,21 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
 		priv->latency = 16;
 	write_latency_timer(port);
 	create_sysfs_attrs(port);
+
+	if (priv->chip_type == FT232RL) {
+		struct platform_device *pdev;
+		int ret;
+
+		pdev = platform_device_alloc("ftdi-cbus-gpio", priv->interface);
+		if (!pdev)
+			return -ENOMEM;
+		pdev->dev.parent = &port->dev;
+
+		ret = platform_device_add(pdev);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.4.4
