From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v2 1/2] GPIO: Add driver for 74xx-ICs with MMIO access
Date: Fri,  3 Oct 2014 11:31:57 +0400
Message-ID: <1412321517-28348-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback7.mail.ru ([94.100.181.128]:38871 "EHLO
	fallback7.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751437AbaJCJsW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Oct 2014 05:48:22 -0400
Received: from smtp48.i.mail.ru (smtp48.i.mail.ru [94.100.177.108])
	by fallback7.mail.ru (mPOP.Fallback_MX) with ESMTP id 1174A1174045B
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2014 11:32:07 +0400 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>

This patch adds driver to support GPIO functionality for 74xx-compatible
ICs with MMIO access. Compatible models include:
 1 bit:   741G125 (Input), 741G74 (Output)
 2 bits:  742G125 (Input), 7474 (Output)
 4 bits:  74125 (Input), 74175 (Output)
 6 bits:  74365 (Input), 74174 (Output)
 8 bits:  74244 (Input), 74273 (Output)
 16 bits: 741624 (Input), 7416374 (Output)

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/Kconfig          |  14 ++++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-74xx-mmio.c | 170 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/gpio/gpio-74xx-mmio.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0959ca9..cd33134 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -112,6 +112,20 @@ config GPIO_MAX730X
 
 comment "Memory mapped GPIO drivers:"
 
+config GPIO_74XX_MMIO
+	tristate "GPIO driver for 74xx-ICs with MMIO access"
+	depends on OF_GPIO
+	select GPIO_GENERIC
+	help
+	  Say yes here to support GPIO functionality for 74xx-compatible ICs
+	  with MMIO access. Compatible models include:
+	    1 bit:	741G125 (Input), 741G74 (Output)
+	    2 bits:	742G125 (Input), 7474 (Output)
+	    4 bits:	74125 (Input), 74175 (Output)
+	    6 bits:	74365 (Input), 74174 (Output)
+	    8 bits:	74244 (Input), 74273 (Output)
+	    16 bits:	741624 (Input), 7416374 (Output)
+
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
 	depends on ARCH_CLPS711X || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e5d346c..4486bbd 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 
 obj-$(CONFIG_GPIO_74X164)	+= gpio-74x164.o
+obj-$(CONFIG_GPIO_74XX_MMIO)	+= gpio-74xx-mmio.o
 obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
new file mode 100644
index 0000000..0763655
--- /dev/null
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -0,0 +1,170 @@
+/*
+ * 74xx MMIO GPIO driver
+ *
+ *  Copyright (C) 2014 Alexander Shiyan <shc_work@mail.ru>
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
+#include <linux/of_device.h>
+#include <linux/basic_mmio_gpio.h>
+#include <linux/platform_device.h>
+
+#define MMIO_74XX_DIR_IN	(0 << 8)
+#define MMIO_74XX_DIR_OUT	(1 << 8)
+#define MMIO_74XX_BIT_CNT(x)	((x) & 0xff)
+
+struct mmio_74xx_gpio_priv {
+	struct bgpio_chip	bgc;
+	unsigned		flags;
+};
+
+static const struct of_device_id mmio_74xx_gpio_ids[] = {
+	{
+		.compatible	= "ti,741g125",
+		.data		= (const void *)(MMIO_74XX_DIR_IN | 1),
+	},
+	{
+		.compatible	= "ti,742g125",
+		.data		= (const void *)(MMIO_74XX_DIR_IN | 2),
+	},
+	{
+		.compatible	= "ti,74125",
+		.data		= (const void *)(MMIO_74XX_DIR_IN | 4),
+	},
+	{
+		.compatible	= "ti,74365",
+		.data		= (const void *)(MMIO_74XX_DIR_IN | 6),
+	},
+	{
+		.compatible	= "ti,74244",
+		.data		= (const void *)(MMIO_74XX_DIR_IN | 8),
+	},
+	{
+		.compatible	= "ti,741624",
+		.data		= (const void *)(MMIO_74XX_DIR_IN | 16),
+	},
+	{
+		.compatible	= "ti,741g74",
+		.data		= (const void *)(MMIO_74XX_DIR_OUT | 1),
+	},
+	{
+		.compatible	= "ti,7474",
+		.data		= (const void *)(MMIO_74XX_DIR_OUT | 2),
+	},
+	{
+		.compatible	= "ti,74175",
+		.data		= (const void *)(MMIO_74XX_DIR_OUT | 4),
+	},
+	{
+		.compatible	= "ti,74174",
+		.data		= (const void *)(MMIO_74XX_DIR_OUT | 6),
+	},
+	{
+		.compatible	= "ti,74273",
+		.data		= (const void *)(MMIO_74XX_DIR_OUT | 8),
+	},
+	{
+		.compatible	= "ti,7416374",
+		.data		= (const void *)(MMIO_74XX_DIR_OUT | 16),
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mmio_74xx_gpio_ids);
+
+static inline struct mmio_74xx_gpio_priv *to_74xx_gpio(struct gpio_chip *gc)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+
+	return container_of(bgc, struct mmio_74xx_gpio_priv, bgc);
+}
+
+static int mmio_74xx_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	struct mmio_74xx_gpio_priv *priv = to_74xx_gpio(gc);
+
+	return (priv->flags & MMIO_74XX_DIR_OUT) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;
+}
+
+static int mmio_74xx_dir_in(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct mmio_74xx_gpio_priv *priv = to_74xx_gpio(gc);
+
+	return (priv->flags & MMIO_74XX_DIR_OUT) ? -ENOTSUPP : 0;
+}
+
+static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct mmio_74xx_gpio_priv *priv = to_74xx_gpio(gc);
+
+	if (priv->flags & MMIO_74XX_DIR_OUT) {
+		gc->set(gc, gpio, val);
+		return 0;
+	}
+
+	return -ENOTSUPP;
+}
+
+static int mmio_74xx_gpio_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+		of_match_device(mmio_74xx_gpio_ids, &pdev->dev);
+	struct mmio_74xx_gpio_priv *priv;
+	struct resource *res;
+	void __iomem *dat;
+	int err;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dat = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dat))
+		return PTR_ERR(dat);
+
+	priv->flags = (unsigned)of_id->data;
+
+	err = bgpio_init(&priv->bgc, &pdev->dev,
+			 DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8),
+			 dat, NULL, NULL, NULL, NULL, 0);
+	if (err)
+		return err;
+
+	priv->bgc.gc.direction_input = mmio_74xx_dir_in;
+	priv->bgc.gc.direction_output = mmio_74xx_dir_out;
+	priv->bgc.gc.get_direction = mmio_74xx_get_direction;
+	priv->bgc.gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
+	priv->bgc.gc.owner = THIS_MODULE;
+
+	platform_set_drvdata(pdev, priv);
+
+	return gpiochip_add(&priv->bgc.gc);
+}
+
+static int mmio_74xx_gpio_remove(struct platform_device *pdev)
+{
+	struct mmio_74xx_gpio_priv *priv = platform_get_drvdata(pdev);
+
+	return bgpio_remove(&priv->bgc);
+}
+
+static struct platform_driver mmio_74xx_gpio_driver = {
+	.driver	= {
+		.name		= "74xx-mmio-gpio",
+		.of_match_table	= mmio_74xx_gpio_ids,
+	},
+	.probe	= mmio_74xx_gpio_probe,
+	.remove	= mmio_74xx_gpio_remove,
+};
+module_platform_driver(mmio_74xx_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
+MODULE_DESCRIPTION("74xx MMIO GPIO driver");
-- 
2.0.4

