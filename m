From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] gpio: twl4030: Remove redundant assignment
Date: Sat, 22 Mar 2014 12:32:15 +0400
Message-ID: <1395477135-19867-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp11.mail.ru ([94.100.176.85]:39133 "EHLO smtp11.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750841AbaCVIcW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 22 Mar 2014 04:32:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

Variable "status" is never used, so remove it and add warning if
any error happen.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-twl4030.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 8b88ca2..3ebb1a5 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -139,7 +139,6 @@ static u8 cached_leden;
 static void twl4030_led_set_value(int led, int value)
 {
 	u8 mask = LEDEN_LEDAON | LEDEN_LEDAPWM;
-	int status;
 
 	if (led)
 		mask <<= 1;
@@ -148,8 +147,9 @@ static void twl4030_led_set_value(int led, int value)
 		cached_leden &= ~mask;
 	else
 		cached_leden |= mask;
-	status = twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
-				  TWL4030_LED_LEDEN_REG);
+
+	WARN_ON_ONCE(twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
+				      TWL4030_LED_LEDEN_REG));
 }
 
 static int twl4030_set_gpio_direction(int gpio, int is_input)
-- 
1.8.3.2

