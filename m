From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH 1/2 v3] Documentation: gpio: board: add flags parameter to gpiod_get*() functions
Date: Wed,  2 Sep 2015 20:07:09 +0200
Message-ID: <1441217230-4530-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:33010 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755768AbbIBSHP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Sep 2015 14:07:15 -0400
Received: by wicmc4 with SMTP id mc4so74618550wic.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2015 11:07:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Dirk Behme <dirk.behme@gmail.com>

With commit 39b2bbe3d715 ("gpio: add flags argument to gpiod_get*()
functions") the gpiod_get*() functions got a 'flags' parameter. Reflect
this in the documentation, too.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
Changes in v3: Add a short note to mention the fact that the example will
               switch the LEDs on, similarly to the existing explanation
               for the "power" GPIO.

 Documentation/gpio/board.txt | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index b80606d..9edd5af 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -39,11 +39,11 @@ This property will make GPIOs 15, 16 and 17 available to the driver under the
 
 	struct gpio_desc *red, *green, *blue, *power;
 
-	red = gpiod_get_index(dev, "led", 0);
-	green = gpiod_get_index(dev, "led", 1);
-	blue = gpiod_get_index(dev, "led", 2);
+	red = gpiod_get_index(dev, "led", 0, GPIOD_OUT_HIGH);
+	green = gpiod_get_index(dev, "led", 1, GPIOD_OUT_HIGH);
+	blue = gpiod_get_index(dev, "led", 2, GPIOD_OUT_HIGH);
 
-	power = gpiod_get(dev, "power");
+	power = gpiod_get(dev, "power", GPIOD_OUT_HIGH);
 
 The led GPIOs will be active-high, while the power GPIO will be active-low (i.e.
 gpiod_is_active_low(power) will be true).
@@ -142,13 +142,14 @@ The driver controlling "foo.0" will then be able to obtain its GPIOs as follows:
 
 	struct gpio_desc *red, *green, *blue, *power;
 
-	red = gpiod_get_index(dev, "led", 0);
-	green = gpiod_get_index(dev, "led", 1);
-	blue = gpiod_get_index(dev, "led", 2);
+	red = gpiod_get_index(dev, "led", 0, GPIOD_OUT_HIGH);
+	green = gpiod_get_index(dev, "led", 1, GPIOD_OUT_HIGH);
+	blue = gpiod_get_index(dev, "led", 2, GPIOD_OUT_HIGH);
 
-	power = gpiod_get(dev, "power");
-	gpiod_direction_output(power, 1);
+	power = gpiod_get(dev, "power", GPIOD_OUT_HIGH);
 
-Since the "power" GPIO is mapped as active-low, its actual signal will be 0
-after this code. Contrary to the legacy integer GPIO interface, the active-low
-property is handled during mapping and is thus transparent to GPIO consumers.
+Since the "led" GPIOs are mapped as active-high, this example will switch their
+signals to 1, i.e. enabling the LEDs. And for the "power" GPIO, which is mapped
+as active-low, its actual signal will be 0 after this code. Contrary to the legacy
+integer GPIO interface, the active-low property is handled during mapping and is
+thus transparent to GPIO consumers.
-- 
2.5.1

