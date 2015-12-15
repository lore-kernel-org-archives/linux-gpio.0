From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH] gpio: Add driver for TI TPIC2810
Date: Tue, 15 Dec 2015 14:10:52 -0600
Message-ID: <1450210252-12121-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:56444 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753203AbbLOULA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 15 Dec 2015 15:11:00 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>

Add driver for TI TPIC2810 8-Bit LED Driver with I2C Interface.

The TPIC2810 has 8 open-drain outputs that can but used to drive
LEDs and other low-side switched resistive loads.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpio/Kconfig         |   8 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-tpic2810.c | 165 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 drivers/gpio/gpio-tpic2810.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b60f40a..1696209 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -709,6 +709,14 @@ config GPIO_SX150X
 	  8 bits:  sx1508q
 	  16 bits: sx1509q
 
+config GPIO_TPIC2810
+	tristate "TPIC2810 8-Bit I2C GPO expander"
+	help
+	  Say yes here to enable the GPO driver for the TI TPIC2810 chip.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-tpic2810.
+
 endmenu
 
 menu "MFD GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 548e9b5..3bc66c6 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= gpio-tegra.o
 obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
 obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
+obj-$(CONFIG_GPIO_TPIC2810)	+= gpio-tpic2810.o
 obj-$(CONFIG_GPIO_TPS6586X)	+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)	+= gpio-tps65910.o
 obj-$(CONFIG_GPIO_TPS65912)	+= gpio-tps65912.o
diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
new file mode 100644
index 0000000..2be828f
--- /dev/null
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -0,0 +1,165 @@
+/*
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+
+#define TPIC2810_WS_COMMAND 0x44
+
+/**
+ * struct tpic2810 - GPIO driver data
+ * @chip: GPIO controller chip
+ * @client: I2C device pointer
+ * @buffer: Buffer for device register
+ * @lock: Protects write sequences
+ */
+struct tpic2810 {
+	struct gpio_chip chip;
+	struct i2c_client *client;
+	u8 buffer;
+	struct mutex lock;
+};
+
+static inline struct tpic2810 *to_tpic2810(struct gpio_chip *chip)
+{
+	return container_of(chip, struct tpic2810, chip);
+}
+
+static int tpic2810_get_direction(struct gpio_chip *chip,
+				  unsigned offset)
+{
+	/* This device always output */
+	return 0;
+}
+
+static int tpic2810_direction_input(struct gpio_chip *chip,
+				    unsigned offset)
+{
+	/* This device is output only */
+	return -EINVAL;
+}
+
+static int tpic2810_direction_output(struct gpio_chip *chip,
+				     unsigned offset, int value)
+{
+	/* This device always output */
+	return 0;
+}
+
+static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct tpic2810 *gpio = to_tpic2810(chip);
+
+	mutex_lock(&gpio->lock);
+
+	if (value)
+		gpio->buffer |= BIT(offset);
+	else
+		gpio->buffer &= ~BIT(offset);
+
+	i2c_smbus_write_byte_data(gpio->client, TPIC2810_WS_COMMAND,
+				  gpio->buffer);
+
+	mutex_unlock(&gpio->lock);
+}
+
+static void tpic2810_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				  unsigned long *bits)
+{
+	struct tpic2810 *gpio = to_tpic2810(chip);
+
+	mutex_lock(&gpio->lock);
+
+	/* clear bits under mask */
+	gpio->buffer &= ~(*mask);
+	/* set bits under mask */
+	gpio->buffer |= ((*mask) & (*bits));
+
+	i2c_smbus_write_byte_data(gpio->client, TPIC2810_WS_COMMAND,
+				  gpio->buffer);
+
+	mutex_unlock(&gpio->lock);
+}
+
+static struct gpio_chip template_chip = {
+	.label			= "tpic2810",
+	.owner			= THIS_MODULE,
+	.get_direction		= tpic2810_get_direction,
+	.direction_input	= tpic2810_direction_input,
+	.direction_output	= tpic2810_direction_output,
+	.set			= tpic2810_set,
+	.set_multiple		= tpic2810_set_multiple,
+	.base			= -1,
+	.ngpio			= 8,
+	.can_sleep		= true,
+};
+
+static int tpic2810_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct tpic2810 *gpio;
+	int ret;
+
+	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, gpio);
+
+	gpio->chip = template_chip;
+	gpio->chip.parent = &client->dev;
+
+	gpio->client = client;
+
+	mutex_init(&gpio->lock);
+
+	ret = gpiochip_add(&gpio->chip);
+	if (ret < 0) {
+		dev_err(&client->dev, "Unable to register gpiochip\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tpic2810_remove(struct i2c_client *client)
+{
+	struct tpic2810 *gpio = i2c_get_clientdata(client);
+
+	gpiochip_remove(&gpio->chip);
+
+	return 0;
+}
+
+static const struct i2c_device_id tpic2810_id_table[] = {
+	{ "tpic2810", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, tpic2810_id_table);
+
+static struct i2c_driver tpic2810_driver = {
+	.driver = {
+		.name = "tpic2810",
+	},
+	.probe = tpic2810_probe,
+	.remove = tpic2810_remove,
+	.id_table = tpic2810_id_table,
+};
+module_i2c_driver(tpic2810_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TPIC2810 8-Bit LED Driver GPIO Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.6.4

