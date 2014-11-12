From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 2/5] MIPS: Loongson: Add Loongson-3A/3B GPIO support
Date: Wed, 12 Nov 2014 20:18:20 +0800
Message-ID: <1415794700-7579-1-git-send-email-chenhc@lemote.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:54196 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751983AbaKLMSb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Nov 2014 07:18:31 -0500
Received: by mail-pd0-f179.google.com with SMTP id g10so12216715pdj.10
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2014 04:18:31 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, linux-gpio@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Hongbing Hu <huhb@lemote.com>

Improve Loongson-2's GPIO driver to support Loongson-3A/3B, and move it
to drivers/gpio directory.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Hongbing Hu <huhb@lemote.com>
---
 arch/mips/Kconfig                     |    1 +
 arch/mips/configs/lemote2f_defconfig  |    1 +
 arch/mips/configs/loongson3_defconfig |    1 +
 arch/mips/loongson/common/Makefile    |    1 -
 arch/mips/loongson/common/gpio.c      |  139 -------------------------------
 drivers/gpio/Kconfig                  |    6 ++
 drivers/gpio/Makefile                 |    1 +
 drivers/gpio/gpio-loongson.c          |  148 +++++++++++++++++++++++++++++++++
 8 files changed, 158 insertions(+), 140 deletions(-)
 delete mode 100644 arch/mips/loongson/common/gpio.c
 create mode 100644 drivers/gpio/gpio-loongson.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e10d704..7541a0e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1199,6 +1199,7 @@ config CPU_LOONGSON3
 	select CPU_SUPPORTS_HUGEPAGES
 	select WEAK_ORDERING
 	select WEAK_REORDERING_BEYOND_LLSC
+	select ARCH_REQUIRE_GPIOLIB
 	help
 		The Loongson 3 processor implements the MIPS64R2 instruction
 		set with many extensions.
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index 227a9de..0549b01 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -172,6 +172,7 @@ CONFIG_SERIAL_8250_FOURPORT=y
 CONFIG_LEGACY_PTY_COUNT=16
 CONFIG_HW_RANDOM=y
 CONFIG_RTC=y
+CONFIG_GPIO_LOONGSON=y
 CONFIG_THERMAL=y
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_VIDEO_DEV=m
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 1c6191e..e7a9bb4 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -243,6 +243,7 @@ CONFIG_HW_RANDOM=y
 CONFIG_RAW_DRIVER=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_PIIX4=y
+CONFIG_GPIO_LOONGSON=y
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM93=m
 CONFIG_SENSORS_W83627HF=m
diff --git a/arch/mips/loongson/common/Makefile b/arch/mips/loongson/common/Makefile
index 0bb9cc9..15fef59 100644
--- a/arch/mips/loongson/common/Makefile
+++ b/arch/mips/loongson/common/Makefile
@@ -4,7 +4,6 @@
 
 obj-y += setup.o init.o cmdline.o env.o time.o reset.o irq.o \
     bonito-irq.o mem.o machtype.o platform.o
-obj-$(CONFIG_GPIOLIB) += gpio.o
 obj-$(CONFIG_PCI) += pci.o
 
 #
diff --git a/arch/mips/loongson/common/gpio.c b/arch/mips/loongson/common/gpio.c
deleted file mode 100644
index 29dbaa2..0000000
--- a/arch/mips/loongson/common/gpio.c
+++ /dev/null
@@ -1,139 +0,0 @@
-/*
- *  STLS2F GPIO Support
- *
- *  Copyright (c) 2008 Richard Liu,  STMicroelectronics	 <richard.liu@st.com>
- *  Copyright (c) 2008-2010 Arnaud Patard <apatard@mandriva.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/spinlock.h>
-#include <linux/err.h>
-#include <asm/types.h>
-#include <loongson.h>
-#include <linux/gpio.h>
-
-#define STLS2F_N_GPIO		4
-#define STLS2F_GPIO_IN_OFFSET	16
-
-static DEFINE_SPINLOCK(gpio_lock);
-
-int gpio_get_value(unsigned gpio)
-{
-	u32 val;
-	u32 mask;
-
-	if (gpio >= STLS2F_N_GPIO)
-		return __gpio_get_value(gpio);
-
-	mask = 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
-	spin_lock(&gpio_lock);
-	val = LOONGSON_GPIODATA;
-	spin_unlock(&gpio_lock);
-
-	return (val & mask) != 0;
-}
-EXPORT_SYMBOL(gpio_get_value);
-
-void gpio_set_value(unsigned gpio, int state)
-{
-	u32 val;
-	u32 mask;
-
-	if (gpio >= STLS2F_N_GPIO) {
-		__gpio_set_value(gpio, state);
-		return ;
-	}
-
-	mask = 1 << gpio;
-
-	spin_lock(&gpio_lock);
-	val = LOONGSON_GPIODATA;
-	if (state)
-		val |= mask;
-	else
-		val &= (~mask);
-	LOONGSON_GPIODATA = val;
-	spin_unlock(&gpio_lock);
-}
-EXPORT_SYMBOL(gpio_set_value);
-
-int gpio_cansleep(unsigned gpio)
-{
-	if (gpio < STLS2F_N_GPIO)
-		return 0;
-	else
-		return __gpio_cansleep(gpio);
-}
-EXPORT_SYMBOL(gpio_cansleep);
-
-static int ls2f_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
-{
-	u32 temp;
-	u32 mask;
-
-	if (gpio >= STLS2F_N_GPIO)
-		return -EINVAL;
-
-	spin_lock(&gpio_lock);
-	mask = 1 << gpio;
-	temp = LOONGSON_GPIOIE;
-	temp |= mask;
-	LOONGSON_GPIOIE = temp;
-	spin_unlock(&gpio_lock);
-
-	return 0;
-}
-
-static int ls2f_gpio_direction_output(struct gpio_chip *chip,
-		unsigned gpio, int level)
-{
-	u32 temp;
-	u32 mask;
-
-	if (gpio >= STLS2F_N_GPIO)
-		return -EINVAL;
-
-	gpio_set_value(gpio, level);
-	spin_lock(&gpio_lock);
-	mask = 1 << gpio;
-	temp = LOONGSON_GPIOIE;
-	temp &= (~mask);
-	LOONGSON_GPIOIE = temp;
-	spin_unlock(&gpio_lock);
-
-	return 0;
-}
-
-static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
-{
-	return gpio_get_value(gpio);
-}
-
-static void ls2f_gpio_set_value(struct gpio_chip *chip,
-		unsigned gpio, int value)
-{
-	gpio_set_value(gpio, value);
-}
-
-static struct gpio_chip ls2f_chip = {
-	.label			= "ls2f",
-	.direction_input	= ls2f_gpio_direction_input,
-	.get			= ls2f_gpio_get_value,
-	.direction_output	= ls2f_gpio_direction_output,
-	.set			= ls2f_gpio_set_value,
-	.base			= 0,
-	.ngpio			= STLS2F_N_GPIO,
-};
-
-static int __init ls2f_gpio_setup(void)
-{
-	return gpiochip_add(&ls2f_chip);
-}
-arch_initcall(ls2f_gpio_setup);
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0959ca9..1ef82b2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -452,6 +452,12 @@ config GPIO_GRGPIO
 	  Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
 	  VHDL IP core library.
 
+config GPIO_LOONGSON
+	tristate "Loongson-2/3 GPIO support"
+	depends on CPU_LOONGSON2 || CPU_LOONGSON3
+	help
+	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
+
 config GPIO_TB10X
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e5d346c..2153a71 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)	+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)	+= gpio-kempld.o
 obj-$(CONFIG_ARCH_KS8695)	+= gpio-ks8695.o
 obj-$(CONFIG_GPIO_INTEL_MID)	+= gpio-intel-mid.o
+obj-$(CONFIG_GPIO_LOONGSON)	+= gpio-loongson.o
 obj-$(CONFIG_GPIO_LP3943)	+= gpio-lp3943.o
 obj-$(CONFIG_ARCH_LPC32XX)	+= gpio-lpc32xx.o
 obj-$(CONFIG_GPIO_LYNXPOINT)	+= gpio-lynxpoint.o
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
new file mode 100644
index 0000000..394fb1d
--- /dev/null
+++ b/drivers/gpio/gpio-loongson.c
@@ -0,0 +1,148 @@
+/*
+ *  Loongson-2F/3A/3B GPIO Support
+ *
+ *  Copyright (c) 2008 Richard Liu,  STMicroelectronics	 <richard.liu@st.com>
+ *  Copyright (c) 2008-2010 Arnaud Patard <apatard@mandriva.com>
+ *  Copyright (c) 2014 Huacai Chen <chenhc@lemote.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/err.h>
+#include <asm/types.h>
+#include <loongson.h>
+#include <linux/gpio.h>
+
+#define STLS2F_N_GPIO		4
+#define STLS3A_N_GPIO		16
+
+#ifdef CONFIG_CPU_LOONGSON3
+#define LOONGSON_N_GPIO	STLS3A_N_GPIO
+#else
+#define LOONGSON_N_GPIO	STLS2F_N_GPIO
+#endif
+
+#define LOONGSON_GPIO_IN_OFFSET	16
+
+static DEFINE_SPINLOCK(gpio_lock);
+
+int gpio_get_value(unsigned gpio)
+{
+	u32 val;
+	u32 mask;
+
+	if (gpio >= LOONGSON_N_GPIO)
+		return __gpio_get_value(gpio);
+
+	mask = 1 << (gpio + LOONGSON_GPIO_IN_OFFSET);
+	spin_lock(&gpio_lock);
+	val = LOONGSON_GPIODATA;
+	spin_unlock(&gpio_lock);
+
+	return (val & mask) != 0;
+}
+EXPORT_SYMBOL(gpio_get_value);
+
+void gpio_set_value(unsigned gpio, int state)
+{
+	u32 val;
+	u32 mask;
+
+	if (gpio >= LOONGSON_N_GPIO) {
+		__gpio_set_value(gpio, state);
+		return ;
+	}
+
+	mask = 1 << gpio;
+
+	spin_lock(&gpio_lock);
+	val = LOONGSON_GPIODATA;
+	if (state)
+		val |= mask;
+	else
+		val &= (~mask);
+	LOONGSON_GPIODATA = val;
+	spin_unlock(&gpio_lock);
+}
+EXPORT_SYMBOL(gpio_set_value);
+
+int gpio_cansleep(unsigned gpio)
+{
+	if (gpio < LOONGSON_N_GPIO)
+		return 0;
+	else
+		return __gpio_cansleep(gpio);
+}
+EXPORT_SYMBOL(gpio_cansleep);
+
+static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+{
+	u32 temp;
+	u32 mask;
+
+	if (gpio >= LOONGSON_N_GPIO)
+		return -EINVAL;
+
+	spin_lock(&gpio_lock);
+	mask = 1 << gpio;
+	temp = LOONGSON_GPIOIE;
+	temp |= mask;
+	LOONGSON_GPIOIE = temp;
+	spin_unlock(&gpio_lock);
+
+	return 0;
+}
+
+static int loongson_gpio_direction_output(struct gpio_chip *chip,
+		unsigned gpio, int level)
+{
+	u32 temp;
+	u32 mask;
+
+	if (gpio >= LOONGSON_N_GPIO)
+		return -EINVAL;
+
+	gpio_set_value(gpio, level);
+	spin_lock(&gpio_lock);
+	mask = 1 << gpio;
+	temp = LOONGSON_GPIOIE;
+	temp &= (~mask);
+	LOONGSON_GPIOIE = temp;
+	spin_unlock(&gpio_lock);
+
+	return 0;
+}
+
+static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
+{
+	return gpio_get_value(gpio);
+}
+
+static void loongson_gpio_set_value(struct gpio_chip *chip,
+		unsigned gpio, int value)
+{
+	gpio_set_value(gpio, value);
+}
+
+static struct gpio_chip loongson_chip = {
+	.label                  = "Loongson-gpio-chip",
+	.direction_input        = loongson_gpio_direction_input,
+	.get                    = loongson_gpio_get_value,
+	.direction_output       = loongson_gpio_direction_output,
+	.set                    = loongson_gpio_set_value,
+	.base			= 0,
+	.ngpio                  = LOONGSON_N_GPIO,
+};
+
+static int __init loongson_gpio_setup(void)
+{
+	return gpiochip_add(&loongson_chip);
+}
+postcore_initcall(loongson_gpio_setup);
-- 
1.7.7.3

