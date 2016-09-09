From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: gpiolib: fix an incorrect use of WARN_ON()
Date: Fri,  9 Sep 2016 11:19:29 +0200
Message-ID: <1473412769-17428-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:38159 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752452AbcIIJTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 05:19:37 -0400
Received: by mail-wm0-f46.google.com with SMTP id 1so21515972wmz.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Sep 2016 02:19:36 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

This breaks the build due to the format string being passed as
argument. Fix it by using WARN().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
NOTE This patch applies on top of linux-gpio devel branch.

 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 95effec..384ed0a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1618,8 +1618,8 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	 * used to configure the interrupts, as you may end-up with
 	 * conflicting triggers. Tell the user, and reset to NONE.
 	 */
-	if (WARN_ON(of_node && type != IRQ_TYPE_NONE,
-		    "%s: Ignoring %d default trigger\n", of_node->full_name))
+	if (WARN(of_node && type != IRQ_TYPE_NONE,
+		 "%s: Ignoring default trigger\n", of_node->full_name))
 		type = IRQ_TYPE_NONE;
 
 	gpiochip->irqchip = irqchip;
-- 
2.7.4

