From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/1] gpio: pisosr: Don't use magic numbers
Date: Mon, 15 Feb 2016 10:14:00 +0100
Message-ID: <1455527640-10446-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:57103 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751481AbcBOJXE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 15 Feb 2016 04:23:04 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

At first view I thought this function returned an error, but actually
it is the input direction. Use the define for input which makes reading
the code much easier.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-pisosr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 58ea08d..068de54 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
@@ -65,7 +66,7 @@ static int pisosr_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned offset)
 {
 	/* This device always input */
-	return 1;
+	return GPIOF_DIR_IN;
 }
 
 static int pisosr_gpio_direction_input(struct gpio_chip *chip,
-- 
2.4.10

