From: Florian Lobmaier <florian.lobmaier@ams.com>
Subject: [PATCH] added ams AS3722 gpio support
Date: Wed, 14 Aug 2013 16:59:18 +0200
Message-ID: <1376492358-16005-1-git-send-email-florian.lobmaier@ams.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.ams.com ([212.166.112.31]:21145 "EHLO mail1.ams.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758061Ab3HNPKZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 14 Aug 2013 11:10:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, Florian Lobmaier <florian.lobmaier@ams.com>


Signed-off-by: Florian Lobmaier <florian.lobmaier@ams.com>
---
 drivers/gpio/Kconfig       |    9 ++
 drivers/gpio/Makefile      |    1 +
 drivers/gpio/gpio-as3722.c |  320 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 330 insertions(+), 0 deletions(-)
 create mode 100644 drivers/gpio/gpio-as3722.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b2450ba..1dd5391 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -335,6 +335,15 @@ config GPIO_ARIZONA
 	help
 	  Support for GPIOs on Wolfson Arizona class devices.
 
+config GPIO_AS3722
+        tristate "ams AS3722 GPIO support"
+        depends on MFD_AS3722
+        help
+          This option enables support for on-chip GPIOs found on
+          AS3722 PMIC from ams.
+          To compile this driver as a module, choose M here: the module will
+          be called as3722-gpio.
+
 config GPIO_MAX7300
 	tristate "Maxim MAX7300 GPIO expander"
 	depends on I2C
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ef3e983..9accc07 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
+obj-$(CONFIG_GPIO_AS3722)       += gpio-as3722.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CLPS711X)	+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_CS5535)	+= gpio-cs5535.o
diff --git a/drivers/gpio/gpio-as3722.c b/drivers/gpio/gpio-as3722.c
new file mode 100644
index 0000000..d57bc5c
--- /dev/null
+++ b/drivers/gpio/gpio-as3722.c
@@ -0,0 +1,320 @@
+/*
+ * as3722-gpio.c - gpiolib support for ams AS3722 PMICs
+ *
+ * Copyright (C) 2013 ams AG
+ *
+ * Author: Florian Lobmaier <florian.lobmaier@ams.com>
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
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/mfd/core.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+
+#include <linux/mfd/as3722-reg.h>
+#include <linux/mfd/as3722-plat.h>
+
+struct as3722_gpio {
+	struct as3722 *as3722;
+	struct gpio_chip gpio_chip;
+};
+
+static inline struct as3722_gpio *to_as3722_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct as3722_gpio, gpio_chip);
+}
+
+static int as3722_gpio_direction_in(struct gpio_chip *chip, unsigned
+		offset)
+{
+	struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
+	struct as3722 *as3722 = as3722_gpio->as3722;
+
+	return as3722_set_bits(as3722, AS3722_GPIO0_CONTROL_REG + offset,
+			       AS3722_GPIO_MODE_MASK,
+			       AS3722_GPIO_MODE_INPUT);
+}
+
+static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
+	struct as3722 *as3722 = as3722_gpio->as3722;
+	int ret;
+	u32 val;
+
+	ret = as3722_reg_read(as3722, AS3722_GPIO_SIGNAL_IN_REG, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val & (AS3722_GPIO1_SIGNAL_MASK << offset))
+		return 1;
+	else
+		return 0;
+}
+
+static int as3722_gpio_direction_out(struct gpio_chip *chip,
+		unsigned offset, int value)
+{
+	struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
+	struct as3722 *as3722 = as3722_gpio->as3722;
+
+	return as3722_set_bits(as3722, AS3722_GPIO0_CONTROL_REG + offset,
+			       AS3722_GPIO_MODE_MASK,
+			       AS3722_GPIO_MODE_OUTPUT_VDDH);
+}
+
+static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
+		int value)
+{
+	struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
+	struct as3722 *as3722 = as3722_gpio->as3722;
+
+	as3722_set_bits(as3722, AS3722_GPIO_SIGNAL_OUT_REG, 1 << offset,
+			value << offset);
+}
+
+static int as3722_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+{
+	struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
+	struct as3722 *as3722 = as3722_gpio->as3722;
+
+	return regmap_irq_get_virq(as3722->irq_data, AS3722_IRQ_GPIO1 + offset);
+}
+
+static int as3722_gpio_set_config(struct as3722_gpio *as3722_gpio,
+		struct as3722_gpio_config *gpio_cfg)
+{
+	int ret = 0;
+	u8 val = 0;
+	int gpio = gpio_cfg->gpio;
+	struct as3722 *as3722 = as3722_gpio->as3722;
+	if ((gpio < AS3722_GPIO0) || (gpio > AS3722_GPIO7))
+		return -EINVAL;
+
+	/* .invert + .iosf + .mode */
+	/* set up write of the GPIOX control register */
+	val = (gpio_cfg->iosf & AS3722_GPIO_IOSF_MASK) +
+		(gpio_cfg->mode & AS3722_GPIO_MODE_MASK);
+	if (gpio_cfg->invert)
+		val += (AS3722_GPIO_INV & AS3722_GPIO_INV_MASK);
+
+	ret = as3722_reg_write(as3722, AS3722_GPIO0_CONTROL_REG + gpio, val);
+	if (ret != 0) {
+		dev_err(as3722->dev,
+			"AS3722_GPIO%d_CTRL_REG write err, ret: %d\n",
+			gpio, ret);
+		return ret;
+	}
+
+	/* if GPIO is configured as an output, set initial output state */
+	if ((gpio_cfg->mode == AS3722_GPIO_MODE_OUTPUT_VDDH) ||
+			(gpio_cfg->mode == AS3722_GPIO_MODE_OUTPUT_VDDL)) {
+		/*
+		 * GPIO0 -> bit 0, ..., GPIO7 -> bit 7,
+		 * output_state = 0 or 1
+		 */
+		val = (gpio_cfg->output_state ^ gpio_cfg->invert) << gpio;
+		ret = as3722_set_bits(as3722, AS3722_GPIO_SIGNAL_OUT_REG,
+				      1 << gpio, val);
+	}
+
+	return ret;
+}
+
+static int as3722_gpio_init_regs(struct as3722_gpio *as3722_gpio,
+		struct as3722_platform_data *pdata)
+{
+	int ret;
+	int i;
+	for (i = 0; i < pdata->num_gpio_cfgs; i++) {
+		ret = as3722_gpio_set_config(as3722_gpio,
+					     &pdata->gpio_cfgs[i]);
+		if (ret < 0) {
+			dev_err(as3722_gpio->as3722->dev,
+				"Failed to set gpio config\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void as3722_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
+	struct as3722 *as3722 = as3722_gpio->as3722;
+	int i;
+
+	for (i = 0; i < chip->ngpio; i++) {
+		int gpio = i + chip->base;
+		u32 reg;
+		int ret;
+		const char *label, *pull, *direction;
+
+		/* We report the GPIO even if it's not requested since
+		 * we're also reporting things like alternate
+		 * functions which apply even when the GPIO is not in
+		 * use as a GPIO.
+		 */
+		label = gpiochip_is_requested(chip, i);
+		if (!label)
+			label = "Unrequested";
+
+		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio, label);
+
+		ret = as3722_reg_read(as3722,
+				      AS3722_GPIO0_CONTROL_REG + i, &reg);
+		if (ret < 0) {
+			dev_err(as3722->dev,
+				"GPIO control %d read failed: %d\n",
+				gpio, ret);
+			seq_printf(s, "\n");
+			continue;
+		}
+
+		switch (reg & AS3722_GPIO_MODE_MASK) {
+		case AS3722_GPIO_MODE_INPUT:
+			direction = "in";
+			pull = "nopull";
+			break;
+		case AS3722_GPIO_MODE_OUTPUT_VDDH:
+			direction = "out";
+			pull = "push and pull";
+			break;
+		case AS3722_GPIO_MODE_IO_OPEN_DRAIN:
+			direction = "io";
+			pull = "nopull";
+			break;
+		case AS3722_GPIO_MODE_INPUT_W_PULLUP:
+			direction = "in";
+			pull = "pullup";
+			break;
+		case AS3722_GPIO_MODE_INPUT_W_PULLDOWN:
+			direction = "in";
+			pull = "pulldown";
+			break;
+		case AS3722_GPIO_MODE_IO_OPEN_DRAIN_PULLUP:
+			direction = "io";
+			pull = "pullup";
+			break;
+		case AS3722_GPIO_MODE_OUTPUT_VDDL:
+			direction = "out";
+			pull = "push and pull";
+			break;
+		default:
+			direction = "INVALID DIRECTION/MODE";
+			pull = "INVALID PULL";
+			break;
+		}
+
+		seq_printf(s, " %s %s %s\n"
+			   "                                  %s (0x%4x)\n",
+			   direction,
+			   as3722_gpio_get(chip, i) ? "high" : "low",
+			   pull,
+			   reg & AS3722_GPIO_INV_MASK ? " inverted" : "",
+			   reg);
+	}
+}
+#else
+#define as3722_gpio_dbg_show NULL
+#endif
+
+static struct gpio_chip as3722_gpio_chip = {
+	.label                  = "as3722",
+	.owner                  = THIS_MODULE,
+	.direction_input        = as3722_gpio_direction_in,
+	.get                    = as3722_gpio_get,
+	.direction_output       = as3722_gpio_direction_out,
+	.set                    = as3722_gpio_set,
+	.to_irq                 = as3722_gpio_to_irq,
+	.dbg_show               = as3722_gpio_dbg_show,
+	.can_sleep              = 1,
+};
+
+static int as3722_gpio_probe(struct platform_device *pdev)
+{
+	struct as3722 *as3722 =  dev_get_drvdata(pdev->dev.parent);
+	struct as3722_platform_data *pdata = dev_get_platdata(pdev->dev.parent);
+	struct as3722_gpio *as3722_gpio;
+	int ret;
+
+	as3722_gpio = devm_kzalloc(&pdev->dev,
+				   sizeof(*as3722_gpio), GFP_KERNEL);
+	if (as3722_gpio == NULL)
+		return -ENOMEM;
+
+	as3722_gpio->as3722 = as3722;
+	as3722_gpio->gpio_chip = as3722_gpio_chip;
+	as3722_gpio->gpio_chip.ngpio = AS3722_NUM_GPIO;
+	as3722_gpio->gpio_chip.dev = &pdev->dev;
+	if (pdata && pdata->gpio_base)
+		as3722_gpio->gpio_chip.base = pdata->gpio_base;
+	else
+		as3722_gpio->gpio_chip.base = -1;
+
+	platform_set_drvdata(pdev, as3722_gpio);
+
+	ret = as3722_gpio_init_regs(as3722_gpio, pdata);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "gpio_init_regs failed\n");
+		return ret;
+	}
+
+	ret = gpiochip_add(&as3722_gpio->gpio_chip);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int as3722_gpio_remove(struct platform_device *pdev)
+{
+	struct as3722_gpio *as3722_gpio = platform_get_drvdata(pdev);
+
+	return gpiochip_remove(&as3722_gpio->gpio_chip);
+}
+
+static struct platform_driver as3722_gpio_driver = {
+	.driver.name    = "as3722-gpio",
+	.driver.owner   = THIS_MODULE,
+	.probe          = as3722_gpio_probe,
+	.remove         = as3722_gpio_remove,
+};
+
+static int __init as3722_gpio_init(void)
+{
+	return platform_driver_register(&as3722_gpio_driver);
+}
+subsys_initcall(as3722_gpio_init);
+
+static void __exit as3722_gpio_exit(void)
+{
+	platform_driver_unregister(&as3722_gpio_driver);
+}
+module_exit(as3722_gpio_exit);
+
+MODULE_AUTHOR("Florian Lobmaier <florian.lobmaier@ams.com>");
+MODULE_DESCRIPTION("GPIO interface for AS3722 PMICs");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:as3722-gpio");
-- 
1.7.2.5

