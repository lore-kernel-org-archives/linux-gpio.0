From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pl061: detail IRQ trigger handling
Date: Thu, 17 Sep 2015 14:21:25 +0200
Message-ID: <1442492485-5879-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35174 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681AbbIQMVb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2015 08:21:31 -0400
Received: by lbpo4 with SMTP id o4so8224044lbp.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2015 05:21:30 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

I couldn't follow this code flow. Make it dirt simple to figure
out what is going on and get proper debug prints. Warn if we
set up an IRQ without any trigger. Should make no semantic
difference.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 55 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 04756130437f..3868d5b32156 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -158,24 +158,63 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	gpiois = readb(chip->base + GPIOIS);
 	gpioibe = readb(chip->base + GPIOIBE);
 
+	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
+	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
+	{
+		dev_err(gc->dev,
+			"trying to configure line %d for both level and edge "
+			"detection, choose one!\n",
+			offset);
+		return -EINVAL;
+	}
+
 	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
+
+		/* Disable edge detection */
+		gpioibe &= ~bit;
+		/* Enable level detection */
 		gpiois |= bit;
-		if (trigger & IRQ_TYPE_LEVEL_HIGH)
+		/* Select polarity */
+		if (polarity)
 			gpioiev |= bit;
 		else
 			gpioiev &= ~bit;
-	} else
-		gpiois &= ~bit;
 
-	if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH)
-		/* Setting this makes GPIOEV be ignored */
+		dev_dbg(gc->dev, "line %d: IRQ on %s level\n",
+			offset,
+			polarity ? "HIGH" : "LOW");
+	} else if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
+		/* Disable level detection */
+		gpiois &= ~bit;
+		/* Select both edges, setting this makes GPIOEV be ignored */
 		gpioibe |= bit;
-	else {
+
+		dev_dbg(gc->dev, "line %d: IRQ on both edges\n", offset);
+	} else if ((trigger & IRQ_TYPE_EDGE_RISING) ||
+		   (trigger & IRQ_TYPE_EDGE_FALLING)) {
+		bool rising = trigger & IRQ_TYPE_EDGE_RISING;
+
+		/* Disable level detection */
+		gpiois &= ~bit;
+		/* Clear detection on both edges */
 		gpioibe &= ~bit;
-		if (trigger & IRQ_TYPE_EDGE_RISING)
+		/* Select edge */
+		if (rising)
 			gpioiev |= bit;
-		else if (trigger & IRQ_TYPE_EDGE_FALLING)
+		else
 			gpioiev &= ~bit;
+
+		dev_dbg(gc->dev, "line %d: IRQ on %s edge\n",
+			offset,
+			rising ? "RISING" : "FALLING");
+	} else {
+		/* No trigger: disable everything */
+		gpiois &= ~bit;
+		gpioibe &= ~bit;
+		gpioiev &= ~bit;
+		dev_warn(gc->dev, "no trigger selected for line %d\n",
+			 offset);
 	}
 
 	writeb(gpiois, chip->base + GPIOIS);
-- 
2.4.3

