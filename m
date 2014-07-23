From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: drop retval check enforcing from gpiochip_remove()
Date: Wed, 23 Jul 2014 10:50:04 +0200
Message-ID: <1406105404-20110-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:36402 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756986AbaGWIuN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jul 2014 04:50:13 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so808081wgh.15
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2014 01:50:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Abdoulaye Berthe <berthe.ab@gmail.com>

As we start to decomission the return value from gpiochip_remove()
the compilers emit warnings due to the function being tagged
__must_check. So drop this until we remove the return value
altogether.

Cc: Abdoulaye Berthe <berthe.ab@gmail.com>
Suggested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 573e4f3243d0..ca3024554a2d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -141,7 +141,7 @@ extern const char *gpiochip_is_requested(struct gpio_chip *chip,
 
 /* add/remove chips */
 extern int gpiochip_add(struct gpio_chip *chip);
-extern int __must_check gpiochip_remove(struct gpio_chip *chip);
+extern int gpiochip_remove(struct gpio_chip *chip);
 extern struct gpio_chip *gpiochip_find(void *data,
 			      int (*match)(struct gpio_chip *chip, void *data));
 
-- 
1.9.3

