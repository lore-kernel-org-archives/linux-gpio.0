From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2] gpio: driver for Xtensa GPIO32
Date: Mon,  9 Dec 2013 08:09:28 +0200
Message-ID: <6f32810c85dc02c551316a86645010b0b1dfaf0c.1386569368.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:55822 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754135Ab3LIGLM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 01:11:12 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org, Baruch Siach <baruch@tkos.co.il>

GPIO32 is a standard optional extension to the Xtensa architecture core that
provides preconfigured output and input ports for intra SoC signaling. The
GPIO32 option is implemented as 32bit Tensilica Instruction Extension (TIE)
output state called EXPSTATE, and 32bit input wire called IMPWIRE. This
driver treats input and output states as two distinct devices.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   * Address the comments of Linus Walleij:
      - Add a few comments
      - Expand commit log message
      - Use the BIT() macro for bit offsets
      - Rewrite CPENABLE handling as static inlines
      - Use device_initcall()

   * Depend on !SMP for reason explained in the comments (Marc Gauthier)

   * Use XCHAL_CP_ID_XTIOP to enable/disable GPIO32 only
---
 drivers/gpio/Kconfig       |   8 +++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-xtensa.c | 163 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/gpio/gpio-xtensa.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8c827eb..43c45ea 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -290,6 +290,14 @@ config GPIO_XILINX
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
+config GPIO_XTENSA
+	bool "Xtensa GPIO32 support"
+	depends on XTENSA
+	depends on !SMP
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
index 0000000..480ab08
--- /dev/null
+++ b/drivers/gpio/gpio-xtensa.c
@@ -0,0 +1,163 @@
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
+ *
+ * GPIO32 is a standard optional extension to the Xtensa architecture core that
+ * provides preconfigured output and input ports for intra SoC signaling. The
+ * GPIO32 option is implemented as 32bit Tensilica Instruction Extension (TIE)
+ * output state called EXPSTATE, and 32bit input wire called IMPWIRE. This
+ * driver treats input and output states as two distinct devices.
+ *
+ * Access to GPIO32 specific instructions is controlled by the CPENABLE
+ * (Coprocessor Enable Bits) register. By default Xtensa Linux startup code
+ * disables access to all coprocessors. This driver sets the CPENABLE bit
+ * corresponding to GPIO32 before any GPIO32 specific instruction, and restores
+ * CPENABLE state after that.
+ *
+ * This driver is currently incompatible with SMP. The GPIO32 extension is not
+ * guaranteed to be available in all cores. Moreover, each core controls a
+ * different set of IO wires. A theoretical SMP aware version of this driver
+ * would need to have a per core workqueue to do the actual GPIO manipulation.
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/bitops.h>
+#include <linux/platform_device.h>
+
+#include <asm/coprocessor.h> /* CPENABLE read/write macros */
+
+#ifndef XCHAL_CP_ID_XTIOP
+#error GPIO32 option is not enabled for your xtensa core variant
+#endif
+
+static inline unsigned long enable_cp(unsigned long *cpenable)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	RSR_CPENABLE(*cpenable);
+	WSR_CPENABLE(*cpenable | BIT(XCHAL_CP_ID_XTIOP));
+
+	return flags;
+}
+
+static inline void disable_cp(unsigned long flags, unsigned long cpenable)
+{
+	WSR_CPENABLE(cpenable);
+	local_irq_restore(flags);
+}
+
+static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	return 1; /* input only */
+}
+
+static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	unsigned long flags, saved_cpenable;
+	u32 impwire;
+
+	flags = enable_cp(&saved_cpenable);
+	__asm__ __volatile__("read_impwire %0" : "=a" (impwire));
+	disable_cp(flags, saved_cpenable);
+
+	return !!(impwire & BIT(offset));
+}
+
+static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
+				    int value)
+{
+	/* never called */
+}
+
+static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	return 0; /* output only */
+}
+
+static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	unsigned long flags, saved_cpenable;
+	u32 expstate;
+
+	flags = enable_cp(&saved_cpenable);
+	__asm__ __volatile__("rur.expstate %0" : "=a" (expstate));
+	disable_cp(flags, saved_cpenable);
+
+	return !!(expstate & BIT(offset));
+}
+
+static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
+				     int value)
+{
+	unsigned long flags, saved_cpenable;
+	u32 mask = BIT(offset);
+	u32 val = value ? BIT(offset) : 0;
+
+	flags = enable_cp(&saved_cpenable);
+	__asm__ __volatile__("wrmsk_expstate %0, %1"
+			     :: "a" (val), "a" (mask));
+	disable_cp(flags, saved_cpenable);
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
+device_initcall(xtensa_gpio_init);
+
+MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
+MODULE_DESCRIPTION("Xtensa LX4 GPIO32 driver");
+MODULE_LICENSE("GPL");
-- 
1.8.4.3

