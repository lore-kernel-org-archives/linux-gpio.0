From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC/PATCH 1/2] gpio: Add PCA9621 driver
Date: Thu,  8 Oct 2015 21:32:31 +0300
Message-ID: <1444329152-11946-2-git-send-email-laurent.pinchart@ideasonboard.com>
References: <1444329152-11946-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51281 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754662AbbJHSce (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2015 14:32:34 -0400
In-Reply-To: <1444329152-11946-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

The PCA9621 is an I2C 8-bit output open-drain expander.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/gpio/nxp,pca9621.txt       |  19 +++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-pca9621.c                        | 163 +++++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pca9621.txt
 create mode 100644 drivers/gpio/gpio-pca9621.c

diff --git a/Documentation/devicetree/bindings/gpio/nxp,pca9621.txt b/Documentation/devicetree/bindings/gpio/nxp,pca9621.txt
new file mode 100644
index 000000000000..f863aa23150b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,pca9621.txt
@@ -0,0 +1,19 @@
+* NXP PCA9621 I2C GPIO multiplexer
+
+Required properties:
+
+ - compatible: Should be "nxp,pca9621".
+ - gpio-controller: Marks the device as a gpio controller.
+ - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
+   cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
+   GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
+
+
+Example:
+
+	gpio@20 {
+		compatible = "nxp,pca9621";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8f1fe739c985..f0e19fc0add8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -644,6 +644,12 @@ config GPIO_PCA953X_IRQ
 	  Say yes here to enable the pca953x to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.
 
+config GPIO_PCA9621
+	tristate "PCA9621 I2C output port"
+	depends on I2C
+	help
+	  Say yes here to provide access to the PCA9621 I2C output expander.
+
 config GPIO_PCF857X
 	tristate "PCF857x, PCA{85,96}7x, and MAX732[89] I2C GPIO expanders"
 	depends on I2C
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f82cd678ce08..36f5cb5eade6 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_GPIO_MXS)		+= gpio-mxs.o
 obj-$(CONFIG_GPIO_OCTEON)	+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)		+= gpio-omap.o
 obj-$(CONFIG_GPIO_PCA953X)	+= gpio-pca953x.o
+obj-$(CONFIG_GPIO_PCA9621)	+= gpio-pca9621.o
 obj-$(CONFIG_GPIO_PCF857X)	+= gpio-pcf857x.o
 obj-$(CONFIG_GPIO_PCH)		+= gpio-pch.o
 obj-$(CONFIG_GPIO_PL061)	+= gpio-pl061.o
diff --git a/drivers/gpio/gpio-pca9621.c b/drivers/gpio/gpio-pca9621.c
new file mode 100644
index 000000000000..c26bb5126dea
--- /dev/null
+++ b/drivers/gpio/gpio-pca9621.c
@@ -0,0 +1,163 @@
+/*
+ * Driver for pca9621 I2C GPIO expanders
+ *
+ * Copyright (C) 2015 Laurent Pinchart
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+struct pca9621 {
+	struct gpio_chip	chip;
+	struct i2c_client	*client;
+	struct mutex		lock;		/* protect 'out' */
+	unsigned int		out;
+};
+
+static inline struct pca9621 *to_pca9621(struct gpio_chip *chip)
+{
+	return container_of(chip, struct pca9621, chip);
+}
+
+static int pca9621_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct pca9621 *gpio = to_pca9621(chip);
+	int ret;
+
+	mutex_lock(&gpio->lock);
+
+	gpio->out &= ~(1 << offset);
+	ret = i2c_smbus_write_byte(gpio->client, gpio->out);
+
+	mutex_unlock(&gpio->lock);
+
+	return ret;
+}
+
+static int pca9621_output(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct pca9621 *gpio = to_pca9621(chip);
+	int ret;
+
+	/* The output is open-drain and can't be driven high. */
+	if (value)
+		return -EINVAL;
+
+	mutex_lock(&gpio->lock);
+
+	gpio->out |= 1 << offset;
+	ret = i2c_smbus_write_byte(gpio->client, gpio->out);
+
+	mutex_unlock(&gpio->lock);
+
+	return ret;
+}
+
+static int pca9621_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct pca9621 *gpio = to_pca9621(chip);
+
+	return !(gpio->out & (1 << offset));
+}
+
+static void pca9621_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	pca9621_output(chip, offset, value);
+}
+
+static int pca9621_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct pca9621 *gpio;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE))
+		return -EIO;
+
+	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	mutex_init(&gpio->lock);
+
+	gpio->chip.base = -1;
+	gpio->chip.can_sleep = true;
+	gpio->chip.dev = &client->dev;
+	gpio->chip.owner = THIS_MODULE;
+	gpio->chip.get = pca9621_get;
+	gpio->chip.set = pca9621_set;
+	gpio->chip.direction_input = pca9621_input;
+	gpio->chip.direction_output = pca9621_output;
+	gpio->chip.ngpio = 8;
+	gpio->chip.label = client->name;
+
+	gpio->client = client;
+	i2c_set_clientdata(client, gpio);
+
+	/* Read the current output state. */
+	ret = i2c_smbus_read_byte(gpio->client);
+	if (ret < 0)
+		return ret;
+
+	gpio->out = ret;
+
+	ret = gpiochip_add(&gpio->chip);
+	if (ret < 0)
+		return ret;
+
+	dev_info(&client->dev, "probed\n");
+
+	return 0;
+}
+
+static int pca9621_remove(struct i2c_client *client)
+{
+	struct pca9621 *gpio = i2c_get_clientdata(client);
+
+	gpiochip_remove(&gpio->chip);
+
+	return 0;
+}
+
+static const struct i2c_device_id pca9621_id[] = {
+	{ "pca9621" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pca9621_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id pca9621_of_table[] = {
+	{ .compatible = "nxp,pca9621" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pca9621_of_table);
+#endif
+
+static struct i2c_driver pca9621_driver = {
+	.driver = {
+		.name	= "pca9621",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(pca9621_of_table),
+	},
+	.probe	= pca9621_probe,
+	.remove	= pca9621_remove,
+	.id_table = pca9621_id,
+};
+module_i2c_driver(pca9621_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Laurent Pinchart");
-- 
2.4.9

