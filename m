From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: pl061: returning with lock held in pl061_irq_type()
Date: Thu, 8 Oct 2015 10:12:01 +0300
Message-ID: <20151008064001.GA25441@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:41288 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752986AbbJHHMO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2015 03:12:14 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We were returning with "chip->lock" held by mistake.  It's safe to
move the return to before we take the spinlock.

Fixes: 1dbf7f299f90 ('gpio: pl061: detail IRQ trigger handling')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 5b1461f..1793397 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -152,12 +152,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	spin_lock_irqsave(&chip->lock, flags);
-
-	gpioiev = readb(chip->base + GPIOIEV);
-	gpiois = readb(chip->base + GPIOIS);
-	gpioibe = readb(chip->base + GPIOIBE);
-
 	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
 	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
 	{
@@ -168,6 +162,13 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		return -EINVAL;
 	}
 
+
+	spin_lock_irqsave(&chip->lock, flags);
+
+	gpioiev = readb(chip->base + GPIOIEV);
+	gpiois = readb(chip->base + GPIOIS);
+	gpioibe = readb(chip->base + GPIOIBE);
+
 	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
