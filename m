From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: pl061: remove range check
Date: Thu, 28 Apr 2016 14:35:55 +0200
Message-ID: <1461846955-30803-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34226 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752049AbcD1MgA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2016 08:36:00 -0400
Received: by mail-lf0-f48.google.com with SMTP id j11so93327560lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2016 05:35:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

The gpiochip calls are already checking that the GPIO line
offsets are in range.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 9afb415a5d24..70eb9ada002e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -67,9 +67,6 @@ static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 	unsigned long flags;
 	unsigned char gpiodir;
 
-	if (offset >= gc->ngpio)
-		return -EINVAL;
-
 	spin_lock_irqsave(&chip->lock, flags);
 	gpiodir = readb(chip->base + GPIODIR);
 	gpiodir &= ~(BIT(offset));
@@ -86,9 +83,6 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 	unsigned long flags;
 	unsigned char gpiodir;
 
-	if (offset >= gc->ngpio)
-		return -EINVAL;
-
 	spin_lock_irqsave(&chip->lock, flags);
 	writeb(!!value << offset, chip->base + (BIT(offset + 2)));
 	gpiodir = readb(chip->base + GPIODIR);
-- 
2.4.11

