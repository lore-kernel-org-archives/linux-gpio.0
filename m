From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: return -ENOTSUPP if debounce cannot be set
Date: Wed,  4 Sep 2013 14:23:49 +0200
Message-ID: <1378297429-9299-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:45640 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756543Ab3IDMX7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2013 08:23:59 -0400
Received: by mail-ee0-f50.google.com with SMTP id d51so135629eek.23
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2013 05:23:58 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

It appears some drivers are using gpio_set_debounce()
opportunistically, i.e. without knowing whether it works or
not. (Example: input/keyboard/gpio_keys.c) to account for
this use case, return -ENOTSUPP and do not print any
warnings in this case.

Took a round over the other gpio_set_debounce() consumers
to make sure that none of them are relying on the returned
error code to be something specific.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0cbddda..86ef346 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1763,6 +1763,9 @@ EXPORT_SYMBOL_GPL(gpio_direction_output);
  * gpio_set_debounce - sets @debounce time for a @gpio
  * @gpio: the gpio to set debounce time
  * @debounce: debounce time is microseconds
+ *
+ * returns -ENOTSUPP if the controller does not support setting
+ * debounce.
  */
 static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
@@ -1778,9 +1781,9 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 
 	chip = desc->chip;
 	if (!chip->set || !chip->set_debounce) {
-		pr_warn("%s: missing set() or set_debounce() operations\n",
+		pr_debug("%s: missing set() or set_debounce() operations\n",
 			__func__);
-		return -EIO;
+		return -ENOTSUPP;
 	}
 
 	spin_lock_irqsave(&gpio_lock, flags);
-- 
1.8.3.1

