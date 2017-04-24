From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
Date: Mon, 24 Apr 2017 17:21:29 +0200
Message-ID: <20170424152130.32410-3-marek.vasut+renesas@gmail.com>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33243 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171909AbdDXPWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 11:22:14 -0400
In-Reply-To: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>

Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
This block is pretty trivial and supports setting GPIO direction
as Input/Output and in case of Output, supports setting value.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
V2: Use linux/gpio/driver.h instead of linux/gpio.h
---
 drivers/gpio/Kconfig          |  11 ++++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-bd9571mwv.c | 144 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/gpio/gpio-bd9571mwv.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 63ceed246b6f..62f810a8663c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -844,6 +844,17 @@ config GPIO_ARIZONA
 	help
 	  Support for GPIOs on Wolfson Arizona class devices.
 
+config GPIO_BD9571MWV
+	tristate "ROHM BD9571 GPIO support"
+	depends on MFD_BD9571MWV
+	help
+	  Support for GPIOs on ROHM BD9571 PMIC. There are two GPIOs
+	  available on the ROHM PMIC in total, both of which can also
+	  generate interrupts.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-bd9571mwv.
+
 config GPIO_CRYSTAL_COVE
 	tristate "GPIO support for Crystal Cove PMIC"
 	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 095598e856ca..68b96277d9fa 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_GPIO_ATH79)	+= gpio-ath79.o
 obj-$(CONFIG_GPIO_ASPEED)	+= gpio-aspeed.o
 obj-$(CONFIG_GPIO_AXP209)	+= gpio-axp209.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
+obj-$(CONFIG_GPIO_BD9571MWV)	+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CLPS711X)	+= gpio-clps711x.o
diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
new file mode 100644
index 000000000000..5224a946e8ab
--- /dev/null
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -0,0 +1,144 @@
+/*
+ * ROHM BD9571MWV-M GPIO driver
+ *
+ * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65086 driver
+ *
+ * NOTE: Interrupts are not supported yet.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/bd9571mwv.h>
+
+struct bd9571mwv_gpio {
+	struct gpio_chip chip;
+	struct bd9571mwv *bd;
+};
+
+static int bd9571mwv_gpio_get_direction(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
+	int ret, val;
+
+	ret = regmap_read(gpio->bd->regmap, BD9571MWV_GPIO_DIR, &val);
+	if (ret < 0)
+		return ret;
+
+	return val & BIT(offset);
+}
+
+static int bd9571mwv_gpio_direction_input(struct gpio_chip *chip,
+					 unsigned int offset)
+{
+	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
+
+	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_DIR,
+			   BIT(offset), 0);
+
+	return 0;
+}
+
+static int bd9571mwv_gpio_direction_output(struct gpio_chip *chip,
+					  unsigned int offset, int value)
+{
+	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
+
+	/* Set the initial value */
+	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_OUT,
+			   BIT(offset), value ? BIT(offset) : 0);
+	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_DIR,
+			   BIT(offset), BIT(offset));
+
+	return 0;
+}
+
+static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
+	int ret, val;
+
+	ret = regmap_read(gpio->bd->regmap, BD9571MWV_GPIO_IN, &val);
+	if (ret < 0)
+		return ret;
+
+	return val & BIT(offset);
+}
+
+static void bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int value)
+{
+	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
+
+	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_OUT,
+			   BIT(offset), value ? BIT(offset) : 0);
+}
+
+static const struct gpio_chip template_chip = {
+	.label			= "bd9571mwv-gpio",
+	.owner			= THIS_MODULE,
+	.get_direction		= bd9571mwv_gpio_get_direction,
+	.direction_input	= bd9571mwv_gpio_direction_input,
+	.direction_output	= bd9571mwv_gpio_direction_output,
+	.get			= bd9571mwv_gpio_get,
+	.set			= bd9571mwv_gpio_set,
+	.base			= -1,
+	.ngpio			= 2,
+	.can_sleep		= true,
+};
+
+static int bd9571mwv_gpio_probe(struct platform_device *pdev)
+{
+	struct bd9571mwv_gpio *gpio;
+	int ret;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, gpio);
+
+	gpio->bd = dev_get_drvdata(pdev->dev.parent);
+	gpio->chip = template_chip;
+	gpio->chip.parent = gpio->bd->dev;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id bd9571mwv_gpio_id_table[] = {
+	{ "bd9571mwv-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, bd9571mwv_gpio_id_table);
+
+static struct platform_driver bd9571mwv_gpio_driver = {
+	.driver = {
+		.name = "bd9571mwv-gpio",
+	},
+	.probe = bd9571mwv_gpio_probe,
+	.id_table = bd9571mwv_gpio_id_table,
+};
+module_platform_driver(bd9571mwv_gpio_driver);
+
+MODULE_AUTHOR("Marek Vasut <marek.vasut+renesas@gmail.com>");
+MODULE_DESCRIPTION("BD9571MWV GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

