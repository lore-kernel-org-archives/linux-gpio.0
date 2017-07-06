From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH 2/3] gpio: Add FT232H CBUS GPIO driver
Date: Thu,  6 Jul 2017 22:49:17 +0200
Message-ID: <1499374158-12388-3-git-send-email-agust@denx.de>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499374158-12388-1-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add driver for CBUS pins on FT232H. The driver supports setting
GPIO direction and getting/setting CBUS 0-3 pin value. The CBUS
pins have to be enabled by configuring I/O mode in the FTDI EEPROM.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/gpio/Kconfig          |  11 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-ftdi-cbus.c | 251 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 drivers/gpio/gpio-ftdi-cbus.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f235eae..cca784a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -929,6 +929,17 @@ config HTC_EGPIO
 	    several HTC phones.  It provides basic support for input
 	    pins, output pins, and irqs.
 
+config GPIO_FTDI_CBUS
+	tristate "Support for CBUS GPIO pins on FTDI FT232H"
+	depends on MFD_FTDI_FT232H
+	select GPIO_GENERIC
+	help
+	  This driver provides basic support for up to four CBUS GPIOs
+	  on FT232H. It allows to configure CBUS pins as input or output
+	  and to read and write CBUS pin state. You need to enable I/O-mode
+	  for ACBUS 5/6/8/9 pins in FTDI EEPROM first. I/O-mode disabled GPIOs
+	  will not be used in the driver.
+
 config GPIO_JANZ_TTL
 	tristate "Janz VMOD-TTL Digital IO Module"
 	depends on MFD_JANZ_CMODIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a9fda6c..c2ab813 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_GPIO_EP93XX)	+= gpio-ep93xx.o
 obj-$(CONFIG_GPIO_ETRAXFS)	+= gpio-etraxfs.o
 obj-$(CONFIG_GPIO_EXAR)		+= gpio-exar.o
 obj-$(CONFIG_GPIO_F7188X)	+= gpio-f7188x.o
+obj-$(CONFIG_GPIO_FTDI_CBUS)	+= gpio-ftdi-cbus.o
 obj-$(CONFIG_GPIO_FTGPIO010)	+= gpio-ftgpio010.o
 obj-$(CONFIG_GPIO_GE_FPGA)	+= gpio-ge.o
 obj-$(CONFIG_GPIO_GPIO_MM)	+= gpio-gpio-mm.o
diff --git a/drivers/gpio/gpio-ftdi-cbus.c b/drivers/gpio/gpio-ftdi-cbus.c
new file mode 100644
index 0000000..b0adfe3
--- /dev/null
+++ b/drivers/gpio/gpio-ftdi-cbus.c
@@ -0,0 +1,251 @@
+/*
+ * FTDI FT232H CBUS GPIO driver
+ *
+ * Copyright (C) 2017 DENX Software Engineering
+ * Anatolij Gustschin <agust@denx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/mfd/ftdi/ftdi.h>
+
+struct ftdi_cbus_gpio {
+	struct platform_device *pdev;
+	struct gpio_chip gpio;
+	const char *gpio_names[4];
+	u8 cbus_pin_offsets[4];
+	u8 cbus_mask;
+	u8 pinbuf[4];
+	u8 eeprom[FTDI_MAX_EEPROM_SIZE];
+};
+
+static const char *ftdi_acbus_names[5] = {
+	"ACBUS5", "ACBUS6", NULL, "ACBUS8", "ACBUS9"
+};
+
+static int ftdi_cbus_gpio_read_pins(struct ftdi_cbus_gpio *priv,
+				    unsigned char *pins)
+{
+	struct gpio_chip *chip = &priv->gpio;
+	struct ctrl_desc desc;
+	int ret;
+
+	desc.dir_out = false;
+	desc.request = FTDI_SIO_READ_PINS_REQUEST;
+	desc.requesttype = USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN;
+	desc.value = 0;
+	desc.index = 1;
+	desc.data = &priv->pinbuf[0];
+	desc.size = 1;
+	desc.timeout = USB_CTRL_GET_TIMEOUT;
+
+	ret = ftdi_ctrl_xfer(priv->pdev, &desc);
+	if (ret < 0) {
+		dev_dbg(chip->parent, "failed to get pin values: %d\n", ret);
+		return ret;
+	}
+
+	*pins = priv->pinbuf[0];
+	return 0;
+}
+
+static inline void ftdi_cbus_init_gpio_data(struct ftdi_cbus_gpio *priv,
+					    int gpio_num, int cbus_num)
+{
+	switch (cbus_num) {
+	case 5:
+	case 6:
+		priv->cbus_pin_offsets[gpio_num] = cbus_num - 5;
+		break;
+	case 8:
+	case 9:
+		priv->cbus_pin_offsets[gpio_num] = cbus_num - 6;
+		break;
+	default:
+		return;
+	}
+
+	priv->gpio_names[gpio_num] = ftdi_acbus_names[cbus_num - 5];
+}
+
+static int ftdi_read_eeprom(struct ftdi_cbus_gpio *priv)
+{
+	struct ctrl_desc desc;
+	unsigned int i;
+	int ret;
+
+	desc.dir_out = false;
+	desc.request = FTDI_SIO_READ_EEPROM_REQUEST;
+	desc.requesttype = USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN;
+	desc.value = 0;
+	desc.size = 2;
+	desc.timeout = USB_CTRL_GET_TIMEOUT;
+
+	for (i = 0; i < FTDI_MAX_EEPROM_SIZE / 2; i++) {
+		desc.index = i;
+		desc.data = &priv->eeprom[i * 2];
+
+		ret = ftdi_ctrl_xfer(priv->pdev, &desc);
+		if (ret < 0) {
+			dev_dbg(&priv->pdev->dev, "EEPROM read failed: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	print_hex_dump(KERN_DEBUG, "EEPROM: ", DUMP_PREFIX_OFFSET, 16, 1,
+		       priv->eeprom, sizeof(priv->eeprom), 1);
+	return 0;
+}
+
+static int ftdi_cbus_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ftdi_cbus_gpio *priv = gpiochip_get_data(chip);
+	unsigned int offs;
+	int ret;
+	u8 pins = 0;
+
+	ret = ftdi_cbus_gpio_read_pins(priv, &pins);
+	if (ret)
+		return ret;
+
+	offs = priv->cbus_pin_offsets[offset];
+
+	return !!(pins & BIT(offs));
+}
+
+static void ftdi_cbus_gpio_set(struct gpio_chip *chip,
+			       unsigned int offset, int value)
+{
+	struct ftdi_cbus_gpio *priv = gpiochip_get_data(chip);
+	unsigned int offs;
+	int ret;
+
+	offs = priv->cbus_pin_offsets[offset];
+
+	if (value)
+		priv->cbus_mask |= BIT(offs);
+	else
+		priv->cbus_mask &= ~BIT(offs);
+
+	ret = ftdi_set_bitmode(priv->pdev, priv->cbus_mask, BITMODE_CBUS);
+	if (ret < 0)
+		dev_dbg(chip->parent, "setting pin value failed: %d\n", ret);
+}
+
+static int ftdi_cbus_gpio_direction_input(struct gpio_chip *chip,
+					  unsigned int offset)
+{
+	struct ftdi_cbus_gpio *priv = gpiochip_get_data(chip);
+	unsigned int offs;
+
+	offs = priv->cbus_pin_offsets[offset];
+	/* Direction bits are in the upper nibble */
+	priv->cbus_mask &= ~(BIT(offs) << 4);
+
+	return ftdi_set_bitmode(priv->pdev, priv->cbus_mask, BITMODE_CBUS);
+}
+
+static int ftdi_cbus_gpio_direction_output(struct gpio_chip *chip,
+					   unsigned int offset, int value)
+{
+	struct ftdi_cbus_gpio *priv = gpiochip_get_data(chip);
+	unsigned int offs;
+
+	offs = priv->cbus_pin_offsets[offset];
+	priv->cbus_mask |= BIT(offs) << 4;
+
+	if (value)
+		priv->cbus_mask |= BIT(offs);
+	else
+		priv->cbus_mask &= ~BIT(offs);
+
+	return ftdi_set_bitmode(priv->pdev, priv->cbus_mask, BITMODE_CBUS);
+}
+
+static int ftdi_cbus_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ftdi_cbus_gpio *priv;
+	unsigned int i;
+	int ret, ngpio = 0;
+	u8 val;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->pdev = pdev;
+	priv->gpio.label = dev_name(&pdev->dev);
+	priv->gpio.parent = dev;
+	priv->gpio.owner = THIS_MODULE;
+	priv->gpio.names = priv->gpio_names;
+	priv->gpio.base = -1;
+	priv->gpio.ngpio = 0; /* will be set if I/O mode enabled in EEPROM */
+	priv->gpio.can_sleep = true;
+	priv->gpio.set = ftdi_cbus_gpio_set;
+	priv->gpio.get = ftdi_cbus_gpio_get;
+	priv->gpio.direction_input = ftdi_cbus_gpio_direction_input;
+	priv->gpio.direction_output = ftdi_cbus_gpio_direction_output;
+
+	ret = ftdi_read_eeprom(priv);
+	if (ret < 0)
+		return ret;
+
+	/* Check if I/O mode is enabled for supported pins 5, 6, 8, 9 */
+	for (i = 5; i < 10; i++) {
+		val = priv->eeprom[0x18 + i / 2] >> (i % 2 ? 4 : 0);
+		if ((val & 0x0f) == FTDI_232H_CBUS_IOMODE) {
+			dev_info(&priv->pdev->dev, "gpio-%d @ ACBUS%d\n",
+				 priv->gpio.ngpio++, i);
+			ftdi_cbus_init_gpio_data(priv, ngpio++, i);
+		}
+	}
+
+	if (!priv->gpio.ngpio) {
+		dev_warn(dev, "I/O mode disabled in EEPROM\n");
+		return -ENODEV;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = devm_gpiochip_add_data(dev, &priv->gpio, priv);
+	if (ret) {
+		dev_err(dev, "failed to add CBUS gpiochip: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(dev, "using %d CBUS pins\n", priv->gpio.ngpio);
+	return 0;
+}
+
+static int ftdi_cbus_gpio_remove(struct platform_device *pdev)
+{
+	platform_set_drvdata(pdev, NULL);
+	return 0;
+}
+
+static struct platform_driver ftdi_cbus_gpio_driver = {
+	.driver.name	= "ftdi-cbus-gpio",
+	.probe		= ftdi_cbus_gpio_probe,
+	.remove		= ftdi_cbus_gpio_remove,
+};
+
+module_platform_driver(ftdi_cbus_gpio_driver);
+
+MODULE_ALIAS("platform:ftdi-cbus-gpio");
+MODULE_AUTHOR("Anatolij Gustschin <agust@denx.de");
+MODULE_DESCRIPTION("FT232H CBUS GPIO interface driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
