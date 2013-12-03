From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] gpio: driver for Xtensa GPIO32
Date: Tue,  3 Dec 2013 10:04:34 +0200
Message-ID: <9b46369ab60c23a6bd9f1930c4ff6c2fec57e798.1386057874.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:38264 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751636Ab3LCIFX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 3 Dec 2013 03:05:23 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org, Baruch Siach <baruch@tkos.co.il>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/gpio/Kconfig       |   7 +++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-xtensa.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/gpio/gpio-xtensa.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8c827eb..488e07b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -290,6 +290,13 @@ config GPIO_XILINX
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
+config GPIO_XTENSA
+	bool "Xtensa GPIO32 support"
+	depends on XTENSA
+	help
+	  Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
+	  and EXPSTATE (output) ports
+
 config GPIO_VR41XX
 	tristate "NEC VR4100 series General-purpose I/O Uint support"
 	depends on CPU_VR41XX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b4f852e..d8ed654 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -96,3 +96,4 @@ obj-$(CONFIG_GPIO_WM831X)	+= gpio-wm831x.o
 obj-$(CONFIG_GPIO_WM8350)	+= gpio-wm8350.o
 obj-$(CONFIG_GPIO_WM8994)	+= gpio-wm8994.o
 obj-$(CONFIG_GPIO_XILINX)	+= gpio-xilinx.o
+obj-$(CONFIG_GPIO_XTENSA)	+= gpio-xtensa.o
diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
new file mode 100644
index 0000000..f5f74b2
--- /dev/null
+++ b/drivers/gpio/gpio-xtensa.c
@@ -0,0 +1,132 @@
+/*
+ * Copyright (C) 2013 TangoTec Ltd.
+ * Author: Baruch Siach <baruch@tkos.co.il>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Driver for the Xtensa LX4 GPIO32 Option
+ *
+ * Documentation: Xtensa LX4 Microprocessor Data Book, Section 2.22
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/platform_device.h>
+
+#include <asm/coprocessor.h>
+
+#define ENABLE_CP()					\
+{							\
+	unsigned long flags, cpenable;			\
+	local_irq_save(flags);				\
+	RSR_CPENABLE(cpenable);				\
+	WSR_CPENABLE(cpenable | XCHAL_CP_PORT_MASK);
+
+#define DISABLE_CP()					\
+	WSR_CPENABLE(cpenable);				\
+	local_irq_restore(flags);			\
+}
+
+static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	return 1;
+}
+
+static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	u32 impwire;
+
+	ENABLE_CP();
+	__asm__ __volatile__("read_impwire %0" : "=a" (impwire));
+	DISABLE_CP();
+
+	return !!(impwire & (1 << offset));
+}
+
+static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
+				    int value)
+{
+}
+
+static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	return 0;
+}
+
+static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	u32 expstate;
+
+	ENABLE_CP();
+	__asm__ __volatile__("rur.expstate %0" : "=a" (expstate));
+	DISABLE_CP();
+
+	return !!(expstate & (1 << offset));
+}
+
+static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
+				     int value)
+{
+	u32 mask = (1 << offset);
+	u32 val = value ? (1 << offset) : 0;
+
+	ENABLE_CP();
+	__asm__ __volatile__("wrmsk_expstate %0, %1"
+			     :: "a" (val), "a" (mask));
+	DISABLE_CP();
+}
+
+static struct gpio_chip impwire_chip = {
+	.label		= "impwire",
+	.base		= -1,
+	.ngpio		= 32,
+	.get_direction	= xtensa_impwire_get_direction,
+	.get		= xtensa_impwire_get_value,
+	.set		= xtensa_impwire_set_value,
+};
+
+static struct gpio_chip expstate_chip = {
+	.label		= "expstate",
+	.base		= -1,
+	.ngpio		= 32,
+	.get_direction	= xtensa_expstate_get_direction,
+	.get		= xtensa_expstate_get_value,
+	.set		= xtensa_expstate_set_value,
+};
+
+static int xtensa_gpio_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = gpiochip_add(&impwire_chip);
+	if (ret)
+		return ret;
+	return gpiochip_add(&expstate_chip);
+}
+
+static struct platform_driver xtensa_gpio_driver = {
+	.driver		= {
+		.name		= "xtensa-gpio",
+		.owner		= THIS_MODULE,
+	},
+	.probe		= xtensa_gpio_probe,
+};
+
+static int __init xtensa_gpio_init(void)
+{
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_simple("xtensa-gpio", 0, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return platform_driver_register(&xtensa_gpio_driver);
+}
+subsys_initcall(xtensa_gpio_init);
+
+MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
+MODULE_DESCRIPTION("Xtensa LX4 GPIO32 driver");
+MODULE_LICENSE("GPL");
-- 
1.8.4.3

