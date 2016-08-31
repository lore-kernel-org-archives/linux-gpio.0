From: bamvor.zhangjian@linaro.org
Subject: [PATCH v3 3/5] gpio/mockup: add virtual gpio device
Date: Wed, 31 Aug 2016 11:45:46 +0200
Message-ID: <20160831094548.12574-4-bamvor.zhangjian@linaro.org>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:36031 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932779AbcHaJqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2016 05:46:15 -0400
Received: by mail-pf0-f179.google.com with SMTP id h186so17865911pfg.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2016 02:46:14 -0700 (PDT)
In-Reply-To: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Kamlakant Patel <kamlakant.patel@broadcom.com>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

This patch add basic structure of a virtual gpio device(gpio-mockup)
for testing gpio subsystem. The tester could manipulate such device
through userspace(sysfs or char device) and check the result from
debugfs.

Currently, it support one or more gpiochip(determined by module
parameters with base,ngpio pair). One could test the overlap of
different gpiochip and test the direction and/or output values of
these chips.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 Documentation/kernel-parameters.txt |   4 +
 drivers/gpio/Kconfig                |  12 ++
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-mockup.c          | 214 ++++++++++++++++++++++++++++++++++++
 4 files changed, 231 insertions(+)
 create mode 100644 drivers/gpio/gpio-mockup.c

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index 46c030a..61f4dbf 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -1364,6 +1364,10 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
 			Format: <unsigned int> such that (rxsize & ~0x1fffc0) == 0.
 			Default: 1024
 
+	gpio-mockup.gpio_mockup_ranges
+			[HW] Sets the ranges of gpiochip of for this device.
+			Format: <start1>,<end1>,<start2>,<end2>...
+
 	hardlockup_all_cpu_backtrace=
 			[KNL] Should the hard-lockup detector generate
 			backtraces on all cpus.
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5eb7c86..4393bdf 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -271,6 +271,18 @@ config GPIO_MM_LANTIQ
 	  (EBU) found on Lantiq SoCs. The gpios are output only as they are
 	  created by attaching a 16bit latch to the bus.
 
+config GPIO_MOCKUP
+	tristate "GPIO Testing Driver"
+	depends on GPIOLIB
+	select GPIO_SYSFS
+	help
+	  This enables GPIO Testing driver, which provides a way to test GPIO
+	  subsystem through sysfs(or char device) and debugfs. GPIO_SYSFS
+	  must be selected for this test.
+	  User could use it through the script in
+	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
+	  it.
+
 config GPIO_MOXART
 	bool "MOXART GPIO support"
 	depends on ARCH_MOXART || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 691fb3a..540d7ab 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
 obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
+obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
 obj-$(CONFIG_GPIO_MOXART)	+= gpio-moxart.o
 obj-$(CONFIG_GPIO_MPC5200)	+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)	+= gpio-mpc8xxx.o
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
new file mode 100644
index 0000000..1ef85b0
--- /dev/null
+++ b/drivers/gpio/gpio-mockup.c
@@ -0,0 +1,214 @@
+/*
+ * GPIO Testing Device Driver
+ *
+ * Copyright (C) 2014  Kamlakant Patel <kamlakant.patel@broadcom.com>
+ * Copyright (C) 2015-2016  Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/platform_device.h>
+
+#define GPIO_NAME	"gpio-mockup"
+#define	MAX_GC		10
+
+enum direction {
+	OUT,
+	IN
+};
+
+/*
+ * struct gpio_pin_status - structure describing a GPIO status
+ * @dir:       Configures direction of gpio as "in" or "out", 0=in, 1=out
+ * @value:     Configures status of the gpio as 0(low) or 1(high)
+ */
+struct gpio_pin_status {
+	enum direction dir;
+	bool value;
+};
+
+struct mockup_gpio_controller {
+	struct gpio_chip gc;
+	struct gpio_pin_status *stats;
+};
+
+static int gpio_mockup_ranges[MAX_GC << 1];
+static int gpio_mockup_params_nr;
+module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
+
+const char pins_name_start = 'A';
+
+static int mockup_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+
+	return cntr->stats[offset].value;
+}
+
+static void mockup_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
+{
+	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+
+	cntr->stats[offset].value = !!value;
+}
+
+static int mockup_gpio_dirout(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+
+	mockup_gpio_set(gc, offset, value);
+	cntr->stats[offset].dir = OUT;
+	return 0;
+}
+
+static int mockup_gpio_dirin(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+
+	cntr->stats[offset].dir = IN;
+	return 0;
+}
+
+static int mockup_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+
+	return cntr->stats[offset].dir;
+}
+
+static int mockup_gpio_add(struct device *dev,
+			   struct mockup_gpio_controller *cntr,
+			   const char *name, int base, int ngpio)
+{
+	int ret;
+
+	cntr->gc.base = base;
+	cntr->gc.ngpio = ngpio;
+	cntr->gc.label = name;
+	cntr->gc.owner = THIS_MODULE;
+	cntr->gc.parent = dev;
+	cntr->gc.get = mockup_gpio_get;
+	cntr->gc.set = mockup_gpio_set;
+	cntr->gc.direction_output = mockup_gpio_dirout;
+	cntr->gc.direction_input = mockup_gpio_dirin;
+	cntr->gc.get_direction = mockup_gpio_get_direction;
+	cntr->stats = devm_kzalloc(dev, sizeof(*cntr->stats) * cntr->gc.ngpio,
+				   GFP_KERNEL);
+	if (!cntr->stats) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	ret = devm_gpiochip_add_data(dev, &cntr->gc, cntr);
+	if (ret)
+		goto err;
+
+	dev_info(dev, "gpio<%d..%d> add successful!", base, base + ngpio);
+	return 0;
+err:
+	dev_err(dev, "gpio<%d..%d> add failed!", base, base + ngpio);
+	return ret;
+}
+
+static int mockup_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mockup_gpio_controller *cntr;
+	int ret;
+	int i;
+	int base;
+	int ngpio;
+	char chip_name[sizeof(GPIO_NAME) + 3];
+
+	if (gpio_mockup_params_nr < 2)
+		return -EINVAL;
+
+	cntr = devm_kzalloc(dev, sizeof(*cntr) * (gpio_mockup_params_nr >> 1),
+			    GFP_KERNEL);
+	if (!cntr)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, cntr);
+
+	for (i = 0; i < gpio_mockup_params_nr >> 1; i++) {
+		base = gpio_mockup_ranges[i * 2];
+		if (base == -1)
+			ngpio = gpio_mockup_ranges[i * 2 + 1];
+		else
+			ngpio = gpio_mockup_ranges[i * 2 + 1] - base;
+
+		if (ngpio >= 0) {
+			sprintf(chip_name, "%s-%c", GPIO_NAME,
+				pins_name_start + i);
+			ret = mockup_gpio_add(dev, &cntr[i],
+					      chip_name, base, ngpio);
+		} else {
+			ret = -1;
+		}
+		if (ret) {
+			if (base < 0)
+				dev_err(dev, "gpio<%d..%d> add failed\n",
+					base, ngpio);
+			else
+				dev_err(dev, "gpio<%d..%d> add failed\n",
+					base, base + ngpio);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver mockup_gpio_driver = {
+	.driver = {
+		   .name = GPIO_NAME,
+		   },
+	.probe = mockup_gpio_probe,
+};
+
+static struct platform_device *pdev;
+static int __init mock_device_init(void)
+{
+	int err;
+
+	pdev = platform_device_alloc(GPIO_NAME, -1);
+	if (!pdev)
+		return -ENOMEM;
+
+	err = platform_device_add(pdev);
+	if (err) {
+		platform_device_put(pdev);
+		return err;
+	}
+
+	err = platform_driver_register(&mockup_gpio_driver);
+	if (err) {
+		platform_device_unregister(pdev);
+		return err;
+	}
+
+	return 0;
+}
+
+static void __exit mock_device_exit(void)
+{
+	platform_driver_unregister(&mockup_gpio_driver);
+	platform_device_unregister(pdev);
+}
+
+module_init(mock_device_init);
+module_exit(mock_device_exit);
+
+MODULE_AUTHOR("Kamlakant Patel <kamlakant.patel@broadcom.com>");
+MODULE_AUTHOR("Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>");
+MODULE_DESCRIPTION("GPIO Testing driver");
+MODULE_LICENSE("GPL v2");
-- 
1.8.4.5

