From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH 1/2] Documentation: gpio: board: add flags parameter to gpiod_get*() functions
Date: Sat, 25 Jul 2015 09:11:57 +0200
Message-ID: <1437808318-4453-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:35816 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbbGYHMF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2015 03:12:05 -0400
Received: by wibxm9 with SMTP id xm9so51593442wib.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2015 00:12:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Dirk Behme <dirk.behme@gmail.com>

With commit 39b2bbe3d715 ("gpio: add flags argument to gpiod_get*()
functions") the gpiod_get*() functions got a 'flags' parameter. Reflect
this in the documentation, too.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 Documentation/gpio/board.txt | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index b80606d..7605773 100644
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
@@ -142,12 +142,11 @@ The driver controlling "foo.0" will then be able to obtain its GPIOs as follows:
 
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
 
 Since the "power" GPIO is mapped as active-low, its actual signal will be 0
 after this code. Contrary to the legacy integer GPIO interface, the active-low
-- 
2.4.6

