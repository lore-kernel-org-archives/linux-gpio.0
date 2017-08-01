From: s.abhisit@gmail.com
Subject: [PATCH 4/5] gpio: Add support for LMP92001 GPIO
Date: Tue,  1 Aug 2017 16:15:47 +0700
Message-ID: <1501578947-4692-1-git-send-email-s.abhisit@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35218 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751101AbdHAJQD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 05:16:03 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Abhisit Sangjan <s.abhisit@gmail.com>

From: Abhisit Sangjan <s.abhisit@gmail.com>

---
 drivers/gpio/Kconfig         |   7 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-lmp92001.c | 235 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 243 insertions(+)
 create mode 100644 drivers/gpio/gpio-lmp92001.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f235eae..b9b5c97 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1119,6 +1119,13 @@ config GPIO_WM8994
 	  Say yes here to access the GPIO signals of WM8994 audio hub
 	  CODECs from Wolfson Microelectronics.
 
+config GPIO_LMP92001
+       tristate "LMP92001 GPIOs"
+       depends on MFD_LMP92001
+       help
+         Say yes here to access the GPIO signals of TI LMP92001 Analog System
+         Monitor and Controller.
+
 endmenu
 
 menu "PCI GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a9fda6c..153daea 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -148,3 +148,4 @@ obj-$(CONFIG_GPIO_ZEVIO)	+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)		+= gpio-zynq.o
 obj-$(CONFIG_GPIO_ZX)		+= gpio-zx.o
 obj-$(CONFIG_GPIO_LOONGSON1)	+= gpio-loongson1.o
+obj-$(CONFIG_GPIO_LMP92001)	+= gpio-lmp92001.o
diff --git a/drivers/gpio/gpio-lmp92001.c b/drivers/gpio/gpio-lmp92001.c
new file mode 100644
index 0000000..ac0eb4d5
--- /dev/null
+++ b/drivers/gpio/gpio-lmp92001.c
@@ -0,0 +1,235 @@
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
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/mfd/core.h>
+#include <linux/version.h>
+
+#include <linux/mfd/lmp92001/core.h>
+
+struct lmp92001_gpio {
+        struct lmp92001 *lmp92001;
+        struct gpio_chip gpio_chip;
+};
+
+static inline struct lmp92001_gpio *to_lmp92001_gpio(struct gpio_chip *chip)
+{
+        return container_of(chip, struct lmp92001_gpio, gpio_chip);
+}
+
+static int lmp92001_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);
+        struct lmp92001 *lmp92001 =  lmp92001_gpio->lmp92001;
+        unsigned int val;
+        int ret;
+
+        ret = regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
+        if (ret < 0)
+                return ret;
+
+        return (val >> offset) & 1;
+}
+
+static int lmp92001_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+{
+        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);
+        struct lmp92001 *lmp92001 =  lmp92001_gpio->lmp92001;
+
+        return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, 1 << offset,
+                        1 << offset);
+}
+
+static int lmp92001_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);
+        struct lmp92001 *lmp92001 =  lmp92001_gpio->lmp92001;
+        unsigned int val, sgen;
+
+        /*
+         * Does the GPIO input mode?
+         * Does the GPIO was set?
+         * Reading indicated logic level.
+         * Clear indicated logic level.
+         */
+        regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
+        if ((val >> offset) & 1)
+        {
+                regmap_read(lmp92001->regmap, LMP92001_SGEN, &sgen);
+                if (sgen & 1)
+                {
+                        regmap_read(lmp92001->regmap, LMP92001_SGPI, &val);
+                        regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
+                                                0xFF, val);
+                }
+        }
+
+        return (val >> offset) & 1;
+}
+
+static int lmp92001_gpio_direction_out(struct gpio_chip *chip, unsigned offset,
+                                        int value)
+{
+        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);
+        struct lmp92001 *lmp92001 =  lmp92001_gpio->lmp92001;
+
+        return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, 1 << offset,
+                                        0 << offset);
+}
+
+static void lmp92001_gpio_set(struct gpio_chip *chip, unsigned offset,
+                                int value)
+{
+        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);
+        struct lmp92001 *lmp92001 =  lmp92001_gpio->lmp92001;
+
+        regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, 1 << offset,
+                                value << offset);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void lmp92001_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);
+        struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+        int i, gpio;
+        unsigned int cgpo;
+        const char *label, *dir, *logic;
+
+        for (i = 0; i < chip->ngpio; i++)
+        {
+                gpio = i + chip->base;
+
+                label = gpiochip_is_requested(chip, i);
+                if (!label)
+                        continue;
+
+                regmap_read(lmp92001->regmap, LMP92001_CGPO, &cgpo);
+                if ((cgpo>>i) & 1)
+                        dir = "in";
+                else
+                        dir = "out";
+
+                if (lmp92001_gpio_get(chip, i))
+                        logic = "hi";
+                else
+                        logic = "lo";
+
+                seq_printf(s, " gpio-%-3d (%-20.20s) %-3.3s %-2.2s\n",
+                                gpio, label, dir, logic);
+        }
+}
+#else
+#define lmp92001_gpio_dbg_show NULL
+#endif
+
+static struct gpio_chip lmp92001_gpio_chip = {
+        .label                  = "lmp92001",
+        .owner                  = THIS_MODULE,
+        .get_direction          = lmp92001_gpio_get_direction,
+        .direction_input        = lmp92001_gpio_direction_in,
+        .get                    = lmp92001_gpio_get,
+        .direction_output       = lmp92001_gpio_direction_out,
+        .set                    = lmp92001_gpio_set,
+        .dbg_show               = lmp92001_gpio_dbg_show,
+};
+
+static int lmp92001_gpio_probe(struct platform_device *pdev)
+{
+        struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
+        struct lmp92001_gpio *lmp92001_gpio;
+        struct device_node *np = pdev->dev.of_node;
+        u8 dir;
+        int ret;
+
+        lmp92001_gpio = devm_kzalloc(&pdev->dev, sizeof(*lmp92001_gpio),
+                                        GFP_KERNEL);
+        if (!lmp92001_gpio)
+                return -ENOMEM;
+
+        lmp92001_gpio->lmp92001 = lmp92001;
+        lmp92001_gpio->gpio_chip = lmp92001_gpio_chip;
+        lmp92001_gpio->gpio_chip.ngpio = 8;
+
+#if LINUX_VERSION_CODE <= KERNEL_VERSION(4, 1, 15)
+        lmp92001_gpio->gpio_chip.dev = &pdev->dev;
+#else
+        lmp92001_gpio->gpio_chip.parent = &pdev->dev;
+#endif
+
+        lmp92001_gpio->gpio_chip.base = -1;
+
+        ret = of_property_read_u8(np, "ti,lmp92001-gpio-dir", &dir);
+        if (!ret)
+        {
+                ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
+                                                0xFF, dir);
+                if (ret < 0)
+                        dev_info(&pdev->dev, "could not initial direction\n");
+        }
+
+        ret = gpiochip_add(&lmp92001_gpio->gpio_chip);
+        if (ret < 0) {
+                dev_err(&pdev->dev, "could not register gpiochip, %d\n", ret);
+                return ret;
+        }
+
+        platform_set_drvdata(pdev, lmp92001_gpio);
+
+        return ret;
+}
+
+static int lmp92001_gpio_remove(struct platform_device *pdev)
+{
+        struct lmp92001_gpio *lmp92001_gpio = platform_get_drvdata(pdev);
+
+        gpiochip_remove(&lmp92001_gpio->gpio_chip);
+
+        return 0;
+}
+
+static struct platform_driver lmp92001_gpio_driver = {
+        .driver.name    = "lmp92001-gpio",
+        .driver.owner   = THIS_MODULE,
+        .probe          = lmp92001_gpio_probe,
+        .remove         = lmp92001_gpio_remove,
+};
+
+static int __init lmp92001_gpio_init(void)
+{
+        return platform_driver_register(&lmp92001_gpio_driver);
+}
+subsys_initcall(lmp92001_gpio_init);
+
+static void __exit lmp92001_gpio_exit(void)
+{
+        platform_driver_unregister(&lmp92001_gpio_driver);
+}
+module_exit(lmp92001_gpio_exit);
+
+MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
+MODULE_DESCRIPTION("GPIO interface for TI LMP92001");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lmp92001-gpio");
-- 
2.7.4

