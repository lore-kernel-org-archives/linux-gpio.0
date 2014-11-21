From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V5 4/7] GPIO: Add Loongson-3A/3B GPIO driver support
Date: Fri, 21 Nov 2014 17:16:29 +0800
Message-ID: <1416561389-1046-3-git-send-email-chenhc@lemote.com>
References: <1416561389-1046-1-git-send-email-chenhc@lemote.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:54616 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758075AbaKUJSD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Nov 2014 04:18:03 -0500
Received: by mail-pd0-f169.google.com with SMTP id fp1so4900819pdb.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2014 01:18:01 -0800 (PST)
In-Reply-To: <1416561389-1046-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, linux-gpio@vger.kernel.org, Huacai Chen <chenhc@lemote.com>

Improve Loongson-2's GPIO driver to support Loongson-3A/3B, and update
Loongson-3's default config file.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kconfig                     |    1 +
 arch/mips/configs/loongson3_defconfig |    1 +
 drivers/gpio/Kconfig                  |    6 ++--
 drivers/gpio/gpio-loongson.c          |   52 +++++++++++++++++++-------------
 4 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9e909b9..c2c4674 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1235,6 +1235,7 @@ config CPU_LOONGSON3
 	select CPU_SUPPORTS_HUGEPAGES
 	select WEAK_ORDERING
 	select WEAK_REORDERING_BEYOND_LLSC
+	select ARCH_REQUIRE_GPIOLIB
 	help
 		The Loongson 3 processor implements the MIPS64R2 instruction
 		set with many extensions.
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
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bc5ffac..1ef82b2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -453,10 +453,10 @@ config GPIO_GRGPIO
 	  VHDL IP core library.
 
 config GPIO_LOONGSON
-	tristate "Loongson-2 GPIO support"
-	depends on CPU_LOONGSON2
+	tristate "Loongson-2/3 GPIO support"
+	depends on CPU_LOONGSON2 || CPU_LOONGSON3
 	help
-	  driver for GPIO functionality on Loongson-2F processors.
+	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
 
 config GPIO_TB10X
 	bool
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index 087aac3..dc28354 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -1,8 +1,10 @@
 /*
- *  STLS2F GPIO Support
+ *  Loongson-2F/3A/3B GPIO Support
  *
  *  Copyright (c) 2008 Richard Liu,  STMicroelectronics	 <richard.liu@st.com>
  *  Copyright (c) 2008-2010 Arnaud Patard <apatard@mandriva.com>
+ *  Copyright (c) 2013 Hongbing Hu <huhb@lemote.com>
+ *  Copyright (c) 2014 Huacai Chen <chenhc@lemote.com>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -20,16 +22,24 @@
 #include <linux/gpio.h>
 
 #define STLS2F_N_GPIO		4
-#define STLS2F_GPIO_IN_OFFSET	16
+#define STLS3A_N_GPIO		16
+
+#ifdef CONFIG_CPU_LOONGSON3
+#define LOONGSON_N_GPIO	STLS3A_N_GPIO
+#else
+#define LOONGSON_N_GPIO	STLS2F_N_GPIO
+#endif
+
+#define LOONGSON_GPIO_IN_OFFSET	16
 
 static DEFINE_SPINLOCK(gpio_lock);
 
-static int ls2f_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
 	u32 temp;
 	u32 mask;
 
-	if (gpio >= STLS2F_N_GPIO)
+	if (gpio >= LOONGSON_N_GPIO)
 		return -EINVAL;
 
 	spin_lock(&gpio_lock);
@@ -42,13 +52,13 @@ static int ls2f_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	return 0;
 }
 
-static int ls2f_gpio_direction_output(struct gpio_chip *chip,
+static int loongson_gpio_direction_output(struct gpio_chip *chip,
 		unsigned gpio, int level)
 {
 	u32 temp;
 	u32 mask;
 
-	if (gpio >= STLS2F_N_GPIO)
+	if (gpio >= LOONGSON_N_GPIO)
 		return -EINVAL;
 
 	gpio_set_value(gpio, level);
@@ -62,15 +72,15 @@ static int ls2f_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
+static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
 	u32 val;
 	u32 mask;
 
-	if (gpio >= STLS2F_N_GPIO)
+	if (gpio >= LOONGSON_N_GPIO)
 		return __gpio_get_value(gpio);
 
-	mask = 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
+	mask = 1 << (gpio + LOONGSON_GPIO_IN_OFFSET);
 	spin_lock(&gpio_lock);
 	val = LOONGSON_GPIODATA;
 	spin_unlock(&gpio_lock);
@@ -78,13 +88,13 @@ static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return (val & mask) != 0;
 }
 
-static void ls2f_gpio_set_value(struct gpio_chip *chip,
+static void loongson_gpio_set_value(struct gpio_chip *chip,
 		unsigned gpio, int value)
 {
 	u32 val;
 	u32 mask;
 
-	if (gpio >= STLS2F_N_GPIO) {
+	if (gpio >= LOONGSON_N_GPIO) {
 		__gpio_set_value(gpio, value);
 		return;
 	}
@@ -101,19 +111,19 @@ static void ls2f_gpio_set_value(struct gpio_chip *chip,
 	spin_unlock(&gpio_lock);
 }
 
-static struct gpio_chip ls2f_chip = {
-	.label			= "ls2f",
-	.direction_input	= ls2f_gpio_direction_input,
-	.get			= ls2f_gpio_get_value,
-	.direction_output	= ls2f_gpio_direction_output,
-	.set			= ls2f_gpio_set_value,
+static struct gpio_chip loongson_chip = {
+	.label                  = "Loongson-gpio-chip",
+	.direction_input        = loongson_gpio_direction_input,
+	.get                    = loongson_gpio_get_value,
+	.direction_output       = loongson_gpio_direction_output,
+	.set                    = loongson_gpio_set_value,
 	.base			= 0,
-	.ngpio			= STLS2F_N_GPIO,
+	.ngpio                  = LOONGSON_N_GPIO,
 	.can_sleep		= false,
 };
 
-static int __init ls2f_gpio_setup(void)
+static int __init loongson_gpio_setup(void)
 {
-	return gpiochip_add(&ls2f_chip);
+	return gpiochip_add(&loongson_chip);
 }
-arch_initcall(ls2f_gpio_setup);
+postcore_initcall(loongson_gpio_setup);
-- 
1.7.7.3

