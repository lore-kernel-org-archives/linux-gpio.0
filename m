From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 3/3] GPIO: Add Loongson-3A/3B GPIO driver support
Date: Thu, 26 Mar 2015 10:34:48 +0800
Message-ID: <1427337288-8411-3-git-send-email-chenhc@lemote.com>
References: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtpbg303.qq.com ([184.105.206.26]:40304 "EHLO smtpbg303.qq.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750789AbbCZCgd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 Mar 2015 22:36:33 -0400
In-Reply-To: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhc@lemote.com>

Improve Loongson-2's GPIO driver to support Loongson-3A/3B, and update
Loongson-3's default config file.

Acked-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kconfig                     |    1 +
 arch/mips/configs/loongson3_defconfig |    1 +
 drivers/gpio/Kconfig                  |    6 ++--
 drivers/gpio/gpio-loongson.c          |   44 ++++++++++++++++++++------------
 4 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 915e689..b2a5827 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1245,6 +1245,7 @@ config CPU_LOONGSON3
 	select CPU_SUPPORTS_HUGEPAGES
 	select WEAK_ORDERING
 	select WEAK_REORDERING_BEYOND_LLSC
+	select ARCH_REQUIRE_GPIOLIB
 	help
 		The Loongson 3 processor implements the MIPS64R2 instruction
 		set with many extensions.
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 7eabcd2..c844299 100644
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
index 6454160..7e8227b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -500,10 +500,10 @@ config GPIO_GRGPIO
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
index b4e69e0..ccc65a1 100644
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
@@ -20,11 +22,19 @@
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
@@ -39,7 +49,7 @@ static int ls2f_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	return 0;
 }
 
-static int ls2f_gpio_direction_output(struct gpio_chip *chip,
+static int loongson_gpio_direction_output(struct gpio_chip *chip,
 		unsigned gpio, int level)
 {
 	u32 temp;
@@ -56,12 +66,12 @@ static int ls2f_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
+static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
 	u32 val;
 	u32 mask;
 
-	mask = 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
+	mask = 1 << (gpio + LOONGSON_GPIO_IN_OFFSET);
 	spin_lock(&gpio_lock);
 	val = LOONGSON_GPIODATA;
 	spin_unlock(&gpio_lock);
@@ -69,7 +79,7 @@ static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return (val & mask) != 0;
 }
 
-static void ls2f_gpio_set_value(struct gpio_chip *chip,
+static void loongson_gpio_set_value(struct gpio_chip *chip,
 		unsigned gpio, int value)
 {
 	u32 val;
@@ -87,19 +97,19 @@ static void ls2f_gpio_set_value(struct gpio_chip *chip,
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


