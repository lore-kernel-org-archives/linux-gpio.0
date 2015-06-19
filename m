From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: [PATCH 2/2] gpio: moxart-gpio: Use generic-gpio pinctrl integration
Date: Fri, 19 Jun 2015 14:58:17 +0200
Message-ID: <1434718697-31335-3-git-send-email-michael@smart-africa.com>
References: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:34033 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757AbbFSM6f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2015 08:58:35 -0400
Received: by wicnd19 with SMTP id nd19so18368203wic.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2015 05:58:34 -0700 (PDT)
In-Reply-To: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>, Michael van der Westhuizen <michael@smart-africa.com>

Now that the generic MMIO GPIO driver is integrated to pinctrl
there is no need to do pinctrl integration in drivers based on
the generic driver.

Signed-off-by: Michael van der Westhuizen <michael@smart-africa.com>
---
 drivers/gpio/gpio-moxart.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index c3ab46e..d281d05 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_gpio.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/bitops.h>
@@ -29,16 +28,6 @@
 #define GPIO_DATA_IN		0x04
 #define GPIO_PIN_DIRECTION	0x08
 
-static int moxart_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_request_gpio(offset);
-}
-
-static void moxart_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_free_gpio(offset);
-}
-
 static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(chip);
@@ -76,8 +65,6 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 	}
 
 	bgc->gc.label = "moxart-gpio";
-	bgc->gc.request = moxart_gpio_request;
-	bgc->gc.free = moxart_gpio_free;
 	bgc->gc.get = moxart_gpio_get;
 	bgc->data = bgc->read_reg(bgc->reg_set);
 	bgc->gc.base = 0;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
