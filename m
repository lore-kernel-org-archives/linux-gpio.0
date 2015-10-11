From: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Subject: [PATCH] gpio: add tps65218 gpio driver
Date: Sun, 11 Oct 2015 17:41:03 +0100
Message-ID: <1444581663-31066-1-git-send-email-nicolassaenzj@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Driver for the GPIO block found in ti's tps65218 pmics.

The device has two GPIOs and one GPO pin which can be configured as follows:
GPIO1:
	-general-purpose, open-drain output controlled by GPO1 user bit and/or
	 sequencer
	-DDR3 reset input signal from SOC. Signal is either latched or
	 passed-trough to GPO2 pin. See below for details.
GPO2:
	-general-purpose output controlled by GPO2 user bit
	-DDR3 reset output signal. Signal is controlled by GPIO1 and PGOOD.
	 See below for details.
	-Output buffer can be configured as open-drain or push-pull.
GPIO3:
	-general-purpose, open-drain output controlled by GPO3 user bit and/or
	 sequencer
	-reset input-signal for DCDC1 and DCDC2.

The input configurations are not meant to be used by the user so the driver
only offers GPOs. Also GPO2 is set-up as open drain by default.

Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
---
 drivers/gpio/Kconfig         |   7 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-tps65218.c | 165 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/gpio/gpio-tps65218.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 63000b1..1669898 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -822,6 +822,13 @@ config GPIO_TIMBERDALE
 	---help---
 	Add support for the GPIO IP in the timberdale FPGA.
 
+config GPIO_TPS65218
+	tristate "TPS65218 GPIO"
+	depends on MFD_TPS65218
+	help
+	  Select this option to enable GPIO driver for the TPS65218
+	  chip family.
+
 config GPIO_TPS6586X
 	bool "TPS6586X GPIO"
 	depends on MFD_TPS6586X
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 77a07e9..d4bd2f9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= gpio-tegra.o
 obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
 obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
+obj-$(CONFIG_GPIO_TPS65218)	+= gpio-tps65218.o
 obj-$(CONFIG_GPIO_TPS6586X)	+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)	+= gpio-tps65910.o
 obj-$(CONFIG_GPIO_TPS65912)	+= gpio-tps65912.o
diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
new file mode 100644
index 0000000..a0b3d52
--- /dev/null
+++ b/drivers/gpio/gpio-tps65218.c
@@ -0,0 +1,165 @@
+/*
+ * Copyright 2015 Verifone Int.
+ *
+ * Author: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify i t
+ * under  the terms of the GNU General  Public License as published by th e
+ * Free Software Foundation;  either version 2 of the License, or (at you r
+ * option) any later version.
+ *
+ * This driver is based on the gpio-tps65912 implementation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/gpio.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/tps65218.h>
+
+struct tps65218_gpio {
+	struct tps65218 *tps65218;
+	struct gpio_chip gpio_chip;
+};
+
+#define to_tg(gc)	container_of(gc, struct tps65218_gpio, gpio_chip)
+
+static int tps65218_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct tps65218_gpio *tps65218_gpio = to_tg(gc);
+	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
+	unsigned int val;
+	int ret;
+
+	ret = tps65218_reg_read(tps65218, TPS65218_REG_ENABLE2, &val);
+	if (ret)
+		return ret;
+
+	return val & (TPS65218_ENABLE2_GPIO1 << offset);
+}
+
+static void tps65218_gpio_set(struct gpio_chip *gc, unsigned offset,
+			      int value)
+{
+	struct tps65218_gpio *tps65218_gpio = to_tg(gc);
+	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
+
+	if (value)
+		tps65218_set_bits(tps65218, TPS65218_REG_ENABLE2,
+				  TPS65218_ENABLE2_GPIO1 << offset,
+				  TPS65218_ENABLE2_GPIO1 << offset,
+				  TPS65218_PROTECT_L1);
+	else
+		tps65218_clear_bits(tps65218, TPS65218_REG_ENABLE2,
+				    TPS65218_ENABLE2_GPIO1 << offset,
+				    TPS65218_PROTECT_L1);
+}
+
+static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
+				int value)
+{
+	/* Only drives GPOs */
+	return 0;
+}
+
+static struct gpio_chip template_chip = {
+	.label			= "gpio-tps65218",
+	.owner			= THIS_MODULE,
+	.direction_output	= tps65218_gpio_output,
+	.get			= tps65218_gpio_get,
+	.set			= tps65218_gpio_set,
+	.can_sleep		= true,
+	.ngpio			= 3,
+	.base			= -1,
+};
+
+static int tps65218_setup_gpos(struct tps65218_gpio *tps65218_gpio)
+{
+	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
+	int ret;
+
+	/* Disable sequencer for GPO1 and GP03 */
+	ret = tps65218_clear_bits(tps65218, TPS65218_REG_SEQ7, 0xFF,
+				  TPS65218_PROTECT_L1);
+	if (ret)
+		return ret;
+
+	/* Setup GPO1 and GPO2 */
+	ret = tps65218_clear_bits(tps65218, TPS65218_REG_CONFIG1,
+				  TPS65218_CONFIG1_IO1_SEL |
+				  TPS65218_CONFIG1_GPO2_BUF,
+				  TPS65218_PROTECT_L1);
+	if (ret)
+		return ret;
+
+	/* Setup GPO3 */
+	return tps65218_clear_bits(tps65218, TPS65218_REG_CONFIG2,
+				   TPS65218_CONFIG2_DC12_RST,
+				   TPS65218_PROTECT_L1);
+}
+
+static int tps65218_gpio_probe(struct platform_device *pdev)
+{
+	struct tps65218 *tps65218 = dev_get_drvdata(pdev->dev.parent);
+	struct tps65218_gpio *tps65218_gpio;
+	int ret;
+
+	tps65218_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps65218_gpio),
+				     GFP_KERNEL);
+	if (!tps65218_gpio)
+		return -ENOMEM;
+
+	tps65218_gpio->tps65218 = tps65218;
+	tps65218_gpio->gpio_chip = template_chip;
+	tps65218_gpio->gpio_chip.dev = &pdev->dev;
+	tps65218_gpio->gpio_chip.of_node = pdev->dev.of_node;
+
+	ret = tps65218_setup_gpos(tps65218_gpio);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to setup gpos, %d\n", ret);
+		return ret;
+	}
+
+	ret = gpiochip_add(&tps65218_gpio->gpio_chip);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, tps65218_gpio);
+
+	return ret;
+}
+
+static int tps65218_gpio_remove(struct platform_device *pdev)
+{
+	struct tps65218_gpio *tps65218_gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&tps65218_gpio->gpio_chip);
+
+	return 0;
+}
+
+static const struct of_device_id tps65218_dt_match[] = {
+	{ .compatible = "ti,tps65218-gpio" },
+	{  }
+};
+MODULE_DEVICE_TABLE(of, tps65218_dt_match);
+
+static struct platform_driver tps65218_gpio_driver = {
+	.driver = {
+		.name = "tps65218-gpio",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(tps65218_dt_match)
+	},
+	.probe = tps65218_gpio_probe,
+	.remove = tps65218_gpio_remove,
+};
+
+module_platform_driver(tps65218_gpio_driver);
+
+MODULE_ALIAS("platform:tps65218-gpio");
+MODULE_AUTHOR("Nicolas Saenz Julienne <nicolassaenzj@gmail.com>");
+MODULE_DESCRIPTION("GPO interface for TPS65218 PMICs");
+MODULE_LICENSE("GPL v2");
-- 
2.5.0
