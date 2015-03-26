From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/3] MIPS: Cleanup Loongson-2F's gpio driver
Date: Thu, 26 Mar 2015 10:34:46 +0800
Message-ID: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtpbg302.qq.com ([184.105.206.27]:51411 "EHLO smtpbg302.qq.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750866AbbCZCgd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 Mar 2015 22:36:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhc@lemote.com>

This cleanup is prepare to move the driver to drivers/gpio. Custom
definitions of gpio_get_value()/gpio_set_value() are dropped.

Acked-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/mach-loongson/gpio.h |   15 +++---
 arch/mips/loongson/common/gpio.c           |   80 ++++++++--------------------
 2 files changed, 31 insertions(+), 64 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson/gpio.h b/arch/mips/include/asm/mach-loongson/gpio.h
index 211a7b7..b3b2169 100644
--- a/arch/mips/include/asm/mach-loongson/gpio.h
+++ b/arch/mips/include/asm/mach-loongson/gpio.h
@@ -1,8 +1,9 @@
 /*
- * STLS2F GPIO Support
+ * Loongson GPIO Support
  *
  * Copyright (c) 2008  Richard Liu, STMicroelectronics <richard.liu@st.com>
  * Copyright (c) 2008-2010  Arnaud Patard <apatard@mandriva.com>
+ * Copyright (c) 2014  Huacai Chen <chenhc@lemote.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -10,14 +11,14 @@
  * (at your option) any later version.
  */
 
-#ifndef __STLS2F_GPIO_H
-#define __STLS2F_GPIO_H
+#ifndef __LOONGSON_GPIO_H
+#define __LOONGSON_GPIO_H
 
 #include <asm-generic/gpio.h>
 
-extern void gpio_set_value(unsigned gpio, int value);
-extern int gpio_get_value(unsigned gpio);
-extern int gpio_cansleep(unsigned gpio);
+#define gpio_get_value __gpio_get_value
+#define gpio_set_value __gpio_set_value
+#define gpio_cansleep __gpio_cansleep
 
 /* The chip can do interrupt
  * but it has not been tested and doc not clear
@@ -32,4 +33,4 @@ static inline int irq_to_gpio(int gpio)
 	return -EINVAL;
 }
 
-#endif				/* __STLS2F_GPIO_H */
+#endif	/* __LOONGSON_GPIO_H */
diff --git a/arch/mips/loongson/common/gpio.c b/arch/mips/loongson/common/gpio.c
index 29dbaa2..b4e69e0 100644
--- a/arch/mips/loongson/common/gpio.c
+++ b/arch/mips/loongson/common/gpio.c
@@ -24,63 +24,11 @@
 
 static DEFINE_SPINLOCK(gpio_lock);
 
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
 static int ls2f_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
 	u32 temp;
 	u32 mask;
 
-	if (gpio >= STLS2F_N_GPIO)
-		return -EINVAL;
-
 	spin_lock(&gpio_lock);
 	mask = 1 << gpio;
 	temp = LOONGSON_GPIOIE;
@@ -97,9 +45,6 @@ static int ls2f_gpio_direction_output(struct gpio_chip *chip,
 	u32 temp;
 	u32 mask;
 
-	if (gpio >= STLS2F_N_GPIO)
-		return -EINVAL;
-
 	gpio_set_value(gpio, level);
 	spin_lock(&gpio_lock);
 	mask = 1 << gpio;
@@ -113,13 +58,33 @@ static int ls2f_gpio_direction_output(struct gpio_chip *chip,
 
 static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	return gpio_get_value(gpio);
+	u32 val;
+	u32 mask;
+
+	mask = 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
+	spin_lock(&gpio_lock);
+	val = LOONGSON_GPIODATA;
+	spin_unlock(&gpio_lock);
+
+	return (val & mask) != 0;
 }
 
 static void ls2f_gpio_set_value(struct gpio_chip *chip,
 		unsigned gpio, int value)
 {
-	gpio_set_value(gpio, value);
+	u32 val;
+	u32 mask;
+
+	mask = 1 << gpio;
+
+	spin_lock(&gpio_lock);
+	val = LOONGSON_GPIODATA;
+	if (value)
+		val |= mask;
+	else
+		val &= (~mask);
+	LOONGSON_GPIODATA = val;
+	spin_unlock(&gpio_lock);
 }
 
 static struct gpio_chip ls2f_chip = {
@@ -130,6 +95,7 @@ static struct gpio_chip ls2f_chip = {
 	.set			= ls2f_gpio_set_value,
 	.base			= 0,
 	.ngpio			= STLS2F_N_GPIO,
+	.can_sleep		= false,
 };
 
 static int __init ls2f_gpio_setup(void)
-- 
1.7.7.3

