From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 07/12] gpio: bcm-kona: Include proper header
Date: Fri, 19 Jan 2018 07:40:38 +0100
Message-ID: <20180119064043.18241-7-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:38963 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753773AbeASGnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:15 -0500
Received: by mail-lf0-f65.google.com with SMTP id m8so803898lfc.6
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:14 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

GPIOF_DIR_IN/GPIOF_DIR_OUT are for consumers and should not be
used in drivers to use just 1/0 instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index dfcf56ee3c61..f4c793e9a92b 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -17,7 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/init.h>
@@ -127,7 +127,7 @@ static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
 	u32 val;
 
 	val = readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK;
-	return val ? GPIOF_DIR_IN : GPIOF_DIR_OUT;
+	return !!val;
 }
 
 static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
@@ -144,7 +144,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	/* this function only applies to output pin */
-	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
+	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
 		goto out;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
@@ -170,7 +170,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	reg_base = kona_gpio->reg_base;
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
-	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
+	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
 		reg_offset = GPIO_IN_STATUS(bank_id);
 	else
 		reg_offset = GPIO_OUT_STATUS(bank_id);
-- 
2.14.3

