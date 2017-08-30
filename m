From: s.abhisit@gmail.com
Subject: [PATCH 4/5] lmp92001: mfd: gpio: Add support LMP92001
Date: Thu, 31 Aug 2017 01:21:00 +0700
Message-ID: <20170830182100.9311-1-s.abhisit@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, pmeerw@pmeerw.net, Jonathan.Cameron@huawei.com, jacopo@jmondi.org, lars@metafoo.de, Abhisit Sangjan <s.abhisit@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Abhisit Sangjan <s.abhisit@gmail.com>

TI LMP92001 Analog System Monitor and Controller

8-bit GPIOs.
12 DACs with 12-bit resolution.

The GPIOs and DACs are shared port function with Cy function pin to
take control the pin suddenly from external hardware.
DAC's referance voltage selectable for Internal/External.

16 + 1 ADCs with 12-bit resolution.

Built-in internal Temperature Sensor on channel 17.
Window Comparator Function is supported on channel 1-3 and 9-11 for
monitoring with interrupt signal (pending to implement for interrupt).
ADC's referance voltage selectable for Internal/External.

Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>
---
 drivers/gpio/Kconfig         |   7 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-lmp92001.c | 202 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 210 insertions(+)
 create mode 100644 drivers/gpio/gpio-lmp92001.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 461d6fc3688b..5962ea0d6745 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -948,6 +948,13 @@ config GPIO_KEMPLD
 	  This driver can also be built as a module. If so, the module will be
 	  called gpio-kempld.
 
+config GPIO_LMP92001
+       tristate "LMP92001 GPIOs"
+       depends on MFD_LMP92001
+       help
+         Say yes here to access the GPIO signals of TI LMP92001 Analog System
+         Monitor and Controller.
+
 config GPIO_LP3943
 	tristate "TI/National Semiconductor LP3943 GPIO expander"
 	depends on MFD_LP3943
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a9fda6c55113..560d59c67758 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)	+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)	+= gpio-kempld.o
 obj-$(CONFIG_ARCH_KS8695)	+= gpio-ks8695.o
 obj-$(CONFIG_GPIO_INTEL_MID)	+= gpio-intel-mid.o
+obj-$(CONFIG_GPIO_LMP92001)	+= gpio-lmp92001.o
 obj-$(CONFIG_GPIO_LOONGSON)	+= gpio-loongson.o
 obj-$(CONFIG_GPIO_LP3943)	+= gpio-lp3943.o
 obj-$(CONFIG_GPIO_LPC18XX)	+= gpio-lpc18xx.o
diff --git a/drivers/gpio/gpio-lmp92001.c b/drivers/gpio/gpio-lmp92001.c
new file mode 100644
index 000000000000..4079e362e9b3
--- /dev/null
+++ b/drivers/gpio/gpio-lmp92001.c
@@ -0,0 +1,202 @@
+/*
+ * gpio-lmp92001.c - Support for TI LMP92001 GPIOs
+ *
+ * Copyright 2016-2017 Celestica Ltd.
+ *
+ * Author: Abhisit Sangjan <s.abhisit@gmail.com>
+ *
+ * Inspired by wm831x driver.
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
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include <linux/mfd/lmp92001/core.h>
+
+struct lmp92001_gpio {
+	struct lmp92001 *lmp92001;
+	struct gpio_chip gpio_chip;
+};
+
+static int lmp92001_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+	struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & BIT(offset));
+}
+
+static int lmp92001_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+{
+	struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+	struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+
+	return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, BIT(offset),
+					BIT(offset));
+}
+
+static int lmp92001_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+	struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+	unsigned int val, sgen;
+
+	/*
+	 * Does the GPIO input mode?
+	 * Does the GPIO set?
+	 * Reading indicated logic level.
+	 * Clear indicated logic level.
+	 */
+	regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
+	if ((val >> offset) & BIT(0)) {
+		regmap_read(lmp92001->regmap, LMP92001_SGEN, &sgen);
+		if (sgen & SGEN_GPI) {
+			regmap_read(lmp92001->regmap, LMP92001_SGPI, &val);
+			regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
+						0xFF, val);
+		}
+	}
+
+	return !!(val & BIT(offset));
+}
+
+static int lmp92001_gpio_direction_out(struct gpio_chip *chip, unsigned offset,
+	int value)
+{
+	struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+	struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+
+	return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, BIT(offset),
+					0 /* 0 << offset */);
+}
+
+static void lmp92001_gpio_set(struct gpio_chip *chip, unsigned offset,
+	int value)
+{
+	struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+	struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+
+	regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, BIT(offset),
+				value << offset);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void lmp92001_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+	struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+	int i, gpio;
+	unsigned int cgpo;
+	const char *label, *dir, *logic;
+
+	for (i = 0; i < chip->ngpio; i++) {
+		gpio = i + chip->base;
+
+		label = gpiochip_is_requested(chip, i);
+		if (!label)
+			continue;
+
+		regmap_read(lmp92001->regmap, LMP92001_CGPO, &cgpo);
+		if ((cgpo >> i) & BIT(0))
+			dir = "in";
+		else
+			dir = "out";
+
+		if (lmp92001_gpio_get(chip, i))
+			logic = "hi";
+		else
+			logic = "lo";
+
+		seq_printf(s, " gpio-%-3d (%-20.20s) %-3.3s %-2.2s\n",
+				gpio, label, dir, logic);
+	}
+}
+#else
+#define lmp92001_gpio_dbg_show NULL
+#endif
+
+static struct gpio_chip lmp92001_gpio_chip = {
+	.label			= "lmp92001",
+	.owner			= THIS_MODULE,
+	.get_direction		= lmp92001_gpio_get_direction,
+	.direction_input	= lmp92001_gpio_direction_in,
+	.get			= lmp92001_gpio_get,
+	.direction_output	= lmp92001_gpio_direction_out,
+	.set			= lmp92001_gpio_set,
+	.dbg_show		= lmp92001_gpio_dbg_show,
+};
+
+static int lmp92001_gpio_probe(struct platform_device *pdev)
+{
+	struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
+	struct lmp92001_gpio *lmp92001_gpio;
+	int ret;
+
+	lmp92001_gpio = devm_kzalloc(&pdev->dev, sizeof(*lmp92001_gpio),
+					GFP_KERNEL);
+	if (!lmp92001_gpio)
+		return -ENOMEM;
+
+	lmp92001_gpio->lmp92001 = lmp92001;
+	lmp92001_gpio->gpio_chip = lmp92001_gpio_chip;
+	lmp92001_gpio->gpio_chip.ngpio = 8;
+	lmp92001_gpio->gpio_chip.parent = &pdev->dev;
+	lmp92001_gpio->gpio_chip.base = -1;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &lmp92001_gpio->gpio_chip,
+					lmp92001_gpio);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, lmp92001_gpio);
+
+	return ret;
+}
+
+static int lmp92001_gpio_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver lmp92001_gpio_driver = {
+	.driver.name	= "lmp92001-gpio",
+	.probe		= lmp92001_gpio_probe,
+	.remove		= lmp92001_gpio_remove,
+};
+
+static int __init lmp92001_gpio_init(void)
+{
+	return platform_driver_register(&lmp92001_gpio_driver);
+}
+subsys_initcall(lmp92001_gpio_init);
+
+static void __exit lmp92001_gpio_exit(void)
+{
+	platform_driver_unregister(&lmp92001_gpio_driver);
+}
+module_exit(lmp92001_gpio_exit);
+
+MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
+MODULE_DESCRIPTION("GPIO interface for TI LMP92001");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lmp92001-gpio");
-- 
2.13.0
