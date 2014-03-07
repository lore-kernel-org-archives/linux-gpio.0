From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: remove misleading documentation
Date: Fri,  7 Mar 2014 10:15:55 +0800
Message-ID: <1394158555-22114-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:38087 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003AbaCGCQF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Mar 2014 21:16:05 -0500
Received: by mail-pd0-f174.google.com with SMTP id y13so3342336pdi.5
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2014 18:16:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>

It is currently debated where the functions to lock a certain
GPIO line as used for IRQs should be called. Delete all
misleading documentation.

Reported-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9cd7082cca08..aa6a11b452e2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2167,10 +2167,7 @@ EXPORT_SYMBOL_GPL(gpiod_to_irq);
  * @gpio: the GPIO line to lock as used for IRQ
  *
  * This is used directly by GPIO drivers that want to lock down
- * a certain GPIO line to be used as IRQs, for example in the
- * .to_irq() callback of their gpio_chip, or in the .irq_enable()
- * of its irq_chip implementation if the GPIO is known from that
- * code.
+ * a certain GPIO line to be used for IRQs.
  */
 int gpiod_lock_as_irq(struct gpio_desc *desc)
 {
-- 
1.8.5.3

