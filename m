From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: loongson1: fix bgpio usage
Date: Fri, 20 Oct 2017 14:44:05 +0200
Message-ID: <20171020124405.7394-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:47223 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751085AbdJTMvw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 08:51:52 -0400
Received: by mail-lf0-f65.google.com with SMTP id k40so13089204lfi.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 05:51:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Kelvin Cheung <keguang.zhang@gmail.com>

When no flags are given, the native endianness is used to access
the MMIO registers, and the pin2mask() call can simply be
converted to a BIT() call, as per the default pin2mask()
implementation in gpio-mmio.c.

Cc: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-loongson1.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.c
index 72b64039241a..fca84ccac35c 100644
--- a/drivers/gpio/gpio-loongson1.c
+++ b/drivers/gpio/gpio-loongson1.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
+#include <linux/bitops.h>
 
 /* Loongson 1 GPIO Register Definitions */
 #define GPIO_CFG		0x0
@@ -22,11 +23,10 @@ static void __iomem *gpio_reg_base;
 
 static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 {
-	unsigned long pinmask = gc->pin2mask(gc, offset);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
-	__raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) | pinmask,
+	__raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) | BIT(offset),
 		     gpio_reg_base + GPIO_CFG);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
@@ -35,11 +35,10 @@ static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 
 static void ls1x_gpio_free(struct gpio_chip *gc, unsigned int offset)
 {
-	unsigned long pinmask = gc->pin2mask(gc, offset);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
-	__raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) & ~pinmask,
+	__raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) & ~BIT(offset),
 		     gpio_reg_base + GPIO_CFG);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
-- 
2.13.6

