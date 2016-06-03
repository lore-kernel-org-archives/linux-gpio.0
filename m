From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 1/2] gpiolib: Fix NULL pointer deference
Date: Fri,  3 Jun 2016 19:10:01 +0200
Message-ID: <1464973802-9286-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35831 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932905AbcFCRKI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2016 13:10:08 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Under some circumstances, a gpiochip might be half cleaned from the
gpio_device list.

This patch makes sure that the chip pointer is still valid, before
calling the match function.

[  104.088296] BUG: unable to handle kernel NULL pointer dereference at
0000000000000090
[  104.089772] IP: [<ffffffff813d2045>] of_gpiochip_find_and_xlate+0x15/0x80
[  104.128273] Call Trace:
[  104.129802]  [<ffffffff813d2030>] ? of_parse_own_gpio+0x1f0/0x1f0
[  104.131353]  [<ffffffff813cd910>] gpiochip_find+0x60/0x90
[  104.132868]  [<ffffffff813d21ba>] of_get_named_gpiod_flags+0x9a/0x120
...
[  104.141586]  [<ffffffff8163d12b>] gpio_led_probe+0x11b/0x360

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

We might want to cc: stable on these two patches

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d407f904a31c..0626cc96744b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -858,7 +858,7 @@ struct gpio_chip *gpiochip_find(void *data,
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_for_each_entry(gdev, &gpio_devices, list)
-		if (match(gdev->chip, data))
+		if (gdev->chip && match(gdev->chip, data))
 			break;
 
 	/* No match? */
-- 
2.8.1

