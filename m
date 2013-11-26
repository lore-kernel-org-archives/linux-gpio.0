From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] gpio: pl061: refactor type setting
Date: Tue, 26 Nov 2013 14:23:58 +0100
Message-ID: <1385472238-26001-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:42326 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753683Ab3KZNYF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 08:24:05 -0500
Received: by mail-la0-f48.google.com with SMTP id n7so4240059lam.35
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 05:24:03 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Baruch Siach <baruch@tkos.co.il>, Deepak Sikri <deepak.sikri@st.com>

Refactor this function so that I can understand it, do one
big read/modify/write operation and have the bitmask in a
variable instead of recalculating it every time it's needed.

Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Deepak Sikri <deepak.sikri@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 1c37c97acc76..c3935c58185d 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -150,6 +150,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	int offset = irqd_to_hwirq(d);
 	unsigned long flags;
 	u8 gpiois, gpioibe, gpioiev;
+	u8 bit = BIT(offset);
 
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
@@ -157,30 +158,31 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	spin_lock_irqsave(&chip->lock, flags);
 
 	gpioiev = readb(chip->base + GPIOIEV);
-
 	gpiois = readb(chip->base + GPIOIS);
+	gpioibe = readb(chip->base + GPIOIBE);
+
 	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
-		gpiois |= 1 << offset;
+		gpiois |= bit;
 		if (trigger & IRQ_TYPE_LEVEL_HIGH)
-			gpioiev |= 1 << offset;
+			gpioiev |= bit;
 		else
-			gpioiev &= ~(1 << offset);
+			gpioiev &= ~bit;
 	} else
-		gpiois &= ~(1 << offset);
-	writeb(gpiois, chip->base + GPIOIS);
+		gpiois &= ~bit;
 
-	gpioibe = readb(chip->base + GPIOIBE);
 	if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH)
-		gpioibe |= 1 << offset;
+		/* Setting this makes GPIOEV be ignored */
+		gpioibe |= bit;
 	else {
-		gpioibe &= ~(1 << offset);
+		gpioibe &= ~bit;
 		if (trigger & IRQ_TYPE_EDGE_RISING)
-			gpioiev |= 1 << offset;
+			gpioiev |= bit;
 		else if (trigger & IRQ_TYPE_EDGE_FALLING)
-			gpioiev &= ~(1 << offset);
+			gpioiev &= ~bit;
 	}
-	writeb(gpioibe, chip->base + GPIOIBE);
 
+	writeb(gpiois, chip->base + GPIOIS);
+	writeb(gpioibe, chip->base + GPIOIBE);
 	writeb(gpioiev, chip->base + GPIOIEV);
 
 	spin_unlock_irqrestore(&chip->lock, flags);
-- 
1.8.3.1

