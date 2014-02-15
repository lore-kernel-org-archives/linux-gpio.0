From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] gpio: twl4030: Remove redundant assignment
Date: Sat, 15 Feb 2014 17:34:37 +0400
Message-ID: <1392471277-16981-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp50.i.mail.ru ([94.100.177.110]:53544 "EHLO smtp50.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752468AbaBONem (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 15 Feb 2014 08:34:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

Variable "status" is never used, so remove it.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-twl4030.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 8b88ca2..fa15beb 100644
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
+	twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
+			 TWL4030_LED_LEDEN_REG);
 }
 
 static int twl4030_set_gpio_direction(int gpio, int is_input)
-- 
1.8.3.2

