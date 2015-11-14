From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH RFD 1/3] gpio/mockup: add virtual gpio device
Date: Sat, 14 Nov 2015 16:51:35 +0800
Message-ID: <1447491097-14799-2-git-send-email-bamvor.zhangjian@linaro.org>
References: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:34747 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751051AbbKNIwC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 03:52:02 -0500
Received: by padhx2 with SMTP id hx2so123674881pad.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 00:52:01 -0800 (PST)
In-Reply-To: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Kamlakant Patel <kamlakant.patel@linaro.org>

This patch add basic structure of a virtual gpio device(gpio-mockup)
for testing gpio subsystem. The tester could manipulate such device
through sysfs and check the result from debugfs.

Currently, it support one or more gpiochip(determined by module
parameters with base,ngpio pair). One could test the overlap of
different gpiochip and test the direction and/or output values of
these chips.

Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/Kconfig       |   9 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-mockup.c | 216 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 drivers/gpio/gpio-mockup.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b18bea0..41d8421 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -268,6 +268,15 @@ config GPIO_MM_LANTIQ
 	  (EBU) found on Lantiq SoCs. The gpios are output only as they are
 	  created by attaching a 16bit latch to the bus.
 
+config GPIO_MOCKUP
+	tristate "GPIO Testing Driver"
+	depends on GPIOLIB
+	select GPIO_SYSFS
+	help
+	  This enables GPIO Testing driver, which provides a way to test GPIO
+	  subsystem through sysfs and debugfs. GPIO_SYSFS must be selected for
+	  this test.
+
 config GPIO_MOXART
 	bool "MOXART GPIO support"
 	depends on ARCH_MOXART
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 986dbd8..b91b66c 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
 obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
+obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
 obj-$(CONFIG_GPIO_MOXART)	+= gpio-moxart.o
 obj-$(CONFIG_GPIO_MPC5200)	+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)	+= gpio-mpc8xxx.o
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
new file mode 100644
index 0000000..b689389
--- /dev/null
+++ b/drivers/gpio/gpio-mockup.c
@@ -0,0 +1,216 @@
+/*
+ * GPIO Testing Device Driver
+ *
+ * Copyright (C) 2014  Kamlakant Patel <kamlakant.patel@linaro.org>
+ * Copyright (C) 2015  Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
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
+#define	MAX_GC		5
+
+enum direction {
+	IN,
+	OUT
+};
+
+/*
+ * struct gpio_pin_status - structure describing a GPIO status
+ * @dir:       Configures direction of gpio as "in" or "out", 0=in, 1=out
+ * @value:     Configures status of the gpio as 0(low) or 1(high)
+ */
+struct gpio_pin_status {
+	enum direction	dir;
+	int		value;
+};
+
+struct mockup_gpio_controller {
+	struct gpio_chip	gc;
+	struct gpio_pin_status	*stats;
+};
+
+int conf[MAX_GC << 1];
+int params_nr;
+module_param_array(conf, int, &params_nr, 0400);
+
+const char *pins_name[MAX_GC] = {"A", "B", "C", "D", "E"};
+
+static int
+mockup_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct mockup_gpio_controller *cntr = container_of(gc,
+			struct mockup_gpio_controller, gc);
+
+	return cntr->stats[offset].value;
+}
+
+static void
+mockup_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct mockup_gpio_controller *cntr = container_of(gc,
+			struct mockup_gpio_controller, gc);
+
+	if (value)
+		cntr->stats[offset].value = 1;
+	else
+		cntr->stats[offset].value = 0;
+
+}
+
+static int mockup_gpio_dirout(struct gpio_chip *gc, unsigned offset,
+		int value)
+{
+	struct mockup_gpio_controller *cntr = container_of(gc,
+			struct mockup_gpio_controller, gc);
+
+	mockup_gpio_set(gc, offset, value);
+	cntr->stats[offset].dir = OUT;
+	return 0;
+}
+
+static int mockup_gpio_dirin(struct gpio_chip *gc, unsigned offset)
+{
+	struct mockup_gpio_controller *cntr = container_of(gc,
+			struct mockup_gpio_controller, gc);
+
+	cntr->stats[offset].dir = IN;
+	return 0;
+}
+
+int mockup_gpio_add(struct device *dev, struct mockup_gpio_controller *cntr,
+		const char *name, int base, int ngpio)
+{
+	int ret;
+
+	cntr->gc.base = base;
+	cntr->gc.ngpio = ngpio;
+	cntr->gc.label = name;
+	cntr->gc.owner = THIS_MODULE;
+	cntr->gc.dev = dev;
+	cntr->gc.get = mockup_gpio_get;
+	cntr->gc.set = mockup_gpio_set;
+	cntr->gc.direction_output = mockup_gpio_dirout;
+	cntr->gc.direction_input = mockup_gpio_dirin;
+	cntr->stats = devm_kzalloc(dev, sizeof(*cntr->stats) * cntr->gc.ngpio,
+			GFP_KERNEL);
+	if (!cntr->stats) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	ret = gpiochip_add(&cntr->gc);
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
+static int
+mockup_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mockup_gpio_controller *cntr;
+	int ret;
+	int i, j;
+	int base;
+	int ngpio;
+
+	if (params_nr == 0) {
+		params_nr = 2;
+		conf[0] = 0;
+		conf[1] = 32;
+	}
+
+	cntr = devm_kzalloc(dev, sizeof(*cntr) * params_nr, GFP_KERNEL);
+	if (!cntr)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, cntr);
+
+	for (i = 0; i < params_nr >> 1; i++) {
+		base = conf[i << 1];
+		ngpio = conf[(i << 1) + 1];
+		ret = mockup_gpio_add(dev, &cntr[i], pins_name[i], base, ngpio);
+		if (ret) {
+			dev_err(dev, "gpio<%d..%d> add failed, remove added gpio\n",
+					base, base + ngpio);
+			for (j = 0; j < i; j++)
+				gpiochip_remove(&cntr[j].gc);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int mockup_gpio_remove(struct platform_device *pdev)
+{
+	struct mockup_gpio_controller *cntr = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < params_nr >> 1; i++)
+		gpiochip_remove(&cntr[i].gc);
+
+	return 0;
+}
+
+static struct platform_driver mockup_gpio_driver = {
+	.driver = {
+		.name           = GPIO_NAME,
+	},
+	.probe = mockup_gpio_probe,
+	.remove = mockup_gpio_remove,
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
+static void __exit
+mock_device_exit(void)
+{
+	platform_driver_unregister(&mockup_gpio_driver);
+	platform_device_unregister(pdev);
+}
+
+module_init(mock_device_init);
+module_exit(mock_device_exit);
+
+MODULE_AUTHOR("Kamlakant Patel <kamlakant.patel@linaro.org>");
+MODULE_AUTHOR("Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>");
+MODULE_DESCRIPTION("GPIO Testing driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.4

