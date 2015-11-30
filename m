From: Jose Diaz de Grenu de Pedro <Jose.DiazdeGrenudePedro@digi.com>
Subject: [PATCH v2] gpiolib: return 0 or 1 in gpiod_get_value*() functions
Date: Mon, 30 Nov 2015 18:30:31 +0100
Message-ID: <1448904631-30230-1-git-send-email-Jose.DiazdeGrenudePedro@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.bemta12.messagelabs.com ([216.82.251.3]:19267 "EHLO
	mail1.bemta12.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752541AbbK3Ral (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 30 Nov 2015 12:30:41 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, jose.diazdegrenudepedro@digi.com, hector.palacios@digi.com

Commit 79a9becda894 moved the awareness of active low state
into the gpiod_get_value*() functions, but it only inverts the
GPIO's raw value when it is active low. If the GPIO is active
high, the gpiod_get_value*() functions return the raw value of
the register, which can be any positive value.

This patch does a double inversion when the GPIO is active high
to make sure either 0 or 1 is returned by these functions.

Signed-off-by: Jose Diaz de Grenu de Pedro <Jose.DiazdeGrenudePedro@digi.com>
Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
change in v2:
 - add missing semicolon
---
 drivers/gpio/gpiolib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 50c4922fe53a..bd96f0457ba8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1981,9 +1981,9 @@ int gpiod_get_value(const struct gpio_desc *desc)
 
 	value = _gpiod_get_raw_value(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
-		value = !value;
-
-	return value;
+		return !value;
+	else
+		return !!value;
 }
 EXPORT_SYMBOL_GPL(gpiod_get_value);
 
@@ -2224,9 +2224,9 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 
 	value = _gpiod_get_raw_value(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
-		value = !value;
-
-	return value;
+		return !value;
+	else
+		return !!value;
 }
 EXPORT_SYMBOL_GPL(gpiod_get_value_cansleep);
 
-- 
2.6.3

