From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH RFC] gpio: Driver for SYSCON-based GPIOs
Date: Fri, 15 Nov 2013 10:42:32 +0400
Message-ID: <1384497752-19032-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback3.mail.ru ([94.100.176.58]:44773 "EHLO
	fallback3.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754065Ab3KOGqe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2013 01:46:34 -0500
Received: from smtp43.i.mail.ru (smtp43.i.mail.ru [94.100.177.103])
	by fallback3.mail.ru (mPOP.Fallback_MX) with ESMTP id 5E96B100397D0
	for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2013 10:43:14 +0400 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shiyan <shc_work@mail.ru>

SYSCON driver was designed for using memory areas (registers)
that are used in several subsystems. There are systems (CPUs)
which use bits in one register for various purposes and thus
should be handled by various kernel subsystems. This driver
allows you to use the individual SYSCON bits as GPIOs.
This is RFC only yet, so I did not add DT bindings for this
driver.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/Kconfig       |   6 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-syscon.c | 141 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/gpio/gpio-syscon.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0f04444..08a3a51 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -252,6 +252,12 @@ config GPIO_STA2X11
 	  Say yes here to support the STA2x11/ConneXt GPIO device.
 	  The GPIO module has 128 GPIO pins with alternate functions.
 
+config GPIO_SYSCON
+	tristate "GPIO based on SYSCON"
+	depends on MFD_SYSCON && OF
+	help
+	  Say yes here to support GPIO functionality though SYSCON driver.
+
 config GPIO_TS5500
 	tristate "TS-5500 DIO blocks and compatibles"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 7971e36..01c05d2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_GPIO_STA2X11)	+= gpio-sta2x11.o
 obj-$(CONFIG_GPIO_STMPE)	+= gpio-stmpe.o
 obj-$(CONFIG_GPIO_STP_XWAY)	+= gpio-stp-xway.o
 obj-$(CONFIG_GPIO_SX150X)	+= gpio-sx150x.o
+obj-$(CONFIG_GPIO_SYSCON)	+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TB10X)	+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= gpio-tegra.o
diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
new file mode 100644
index 0000000..f0c1093
--- /dev/null
+++ b/drivers/gpio/gpio-syscon.c
@@ -0,0 +1,141 @@
+/*
+ *  SYSCON GPIO driver
+ *
+ *  Copyright (C) 2013 Alexander Shiyan <shc_work@mail.ru>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define GPIO_SYSCON_INPUT	(1 << 0)
+#define GPIO_SYSCON_OUTPUT	(1 << 1)
+
+struct syscon_gpio_priv {
+	struct gpio_chip	chip;
+	struct regmap		*syscon;
+	u32			bit_offset;
+};
+
+static inline struct syscon_gpio_priv *to_syscon_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct syscon_gpio_priv, chip);
+}
+
+static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->syscon, priv->bit_offset / 32, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & (priv->bit_offset % 32));
+}
+
+static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+{
+	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+
+	regmap_update_bits(priv->syscon, priv->bit_offset / 32,
+			   priv->bit_offset % 32,
+			   val ? priv->bit_offset % 32 : 0);
+}
+
+static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
+{
+	return 0;
+}
+
+static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
+{
+	syscon_gpio_set(chip, offset, val);
+
+	return 0;
+}
+
+static const struct of_device_id syscon_gpio_ids[] = {
+	{
+		.compatible	= "gpio-syscon-input",
+		.data		= (void *)GPIO_SYSCON_INPUT,
+	},
+	{
+		.compatible	= "gpio-syscon-output",
+		.data		= (void *)GPIO_SYSCON_OUTPUT,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
+
+static int syscon_gpio_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+		of_match_device(syscon_gpio_ids, &pdev->dev);
+	struct device_node *np = pdev->dev.of_node;
+	struct syscon_gpio_priv *priv;
+	unsigned int flags;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->syscon = syscon_regmap_lookup_by_phandle(np, "syscon");
+	if (IS_ERR(priv->syscon))
+		return PTR_ERR(priv->syscon);
+
+	if (of_property_read_u32(np, "gpio-syscon,offset", &priv->bit_offset))
+		return -EINVAL;
+
+	flags = (unsigned int)of_id->data;
+
+	priv->chip.owner = THIS_MODULE;
+	priv->chip.label = dev_name(&pdev->dev);
+	priv->chip.base = -1;
+	priv->chip.ngpio = 1;
+	if (flags & GPIO_SYSCON_INPUT) {
+		priv->chip.get = syscon_gpio_get;
+		priv->chip.direction_input = syscon_gpio_dir_in;
+	}
+	if (flags & GPIO_SYSCON_OUTPUT) {
+		priv->chip.set = syscon_gpio_set;
+		priv->chip.direction_output = syscon_gpio_dir_out;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	return gpiochip_add(&priv->chip);
+}
+
+static int syscon_gpio_remove(struct platform_device *pdev)
+{
+	struct syscon_gpio_priv *priv = platform_get_drvdata(pdev);
+
+	return gpiochip_remove(&priv->chip);
+}
+
+static struct platform_driver syscon_gpio_driver = {
+	.driver	= {
+		.name		= "gpio-syscon",
+		.owner		= THIS_MODULE,
+		.of_match_table	= syscon_gpio_ids,
+	},
+	.probe	= syscon_gpio_probe,
+	.remove	= syscon_gpio_remove,
+};
+module_platform_driver(syscon_gpio_driver);
+
+MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
+MODULE_DESCRIPTION("SYSCON GPIO driver");
+MODULE_LICENSE("GPL");
-- 
1.8.1.5

