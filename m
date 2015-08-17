From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] gpio/grgpio: fix deadlock in grgpio_irq_unmap()
Date: Mon, 17 Aug 2015 17:23:52 +0900
Message-ID: <1439799832-13402-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3205 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbbHQIYI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2015 04:24:08 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>, Andreas Larsson <andreas@gaisler.com>

As reported by Alexey Khoroshilov:

    grgpio_irq_unmap() code looks quite suspicious regarding usage of
    priv->bgc.lock spinlock.

    It locks the spinlock in line 310:

	spin_lock_irqsave(&priv->bgc.lock, flags);

    and then it can call grgpio_set_imask() in line 317:

	grgpio_set_imask(priv, i, 0);

    But grgpio_set_imask() unconditionally locks the spinlock by itself.

Fix this by moving the spinlock acquisition outside of
grgpio_set_imask().

Found by Linux Driver Verification project (linuxtesting.org).

Reported-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
CC: Alexey Khoroshilov <khoroshilov@ispras.ru>
CC: Andreas Larsson <andreas@gaisler.com>
---
 drivers/gpio/gpio-grgpio.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 77053d61466e..801423fe8143 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -104,17 +104,12 @@ static void grgpio_set_imask(struct grgpio_priv *priv, unsigned int offset,
 {
 	struct bgpio_chip *bgc = &priv->bgc;
 	unsigned long mask = bgc->pin2mask(bgc, offset);
-	unsigned long flags;
-
-	spin_lock_irqsave(&bgc->lock, flags);
 
 	if (val)
 		priv->imask |= mask;
 	else
 		priv->imask &= ~mask;
 	bgc->write_reg(priv->regs + GRGPIO_IMASK, priv->imask);
-
-	spin_unlock_irqrestore(&bgc->lock, flags);
 }
 
 static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -180,16 +175,26 @@ static void grgpio_irq_mask(struct irq_data *d)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
 	int offset = d->hwirq;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->bgc.lock, flags);
 
 	grgpio_set_imask(priv, offset, 0);
+
+	spin_unlock_irqrestore(&priv->bgc.lock, flags);
 }
 
 static void grgpio_irq_unmask(struct irq_data *d)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
 	int offset = d->hwirq;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->bgc.lock, flags);
 
 	grgpio_set_imask(priv, offset, 1);
+
+	spin_unlock_irqrestore(&priv->bgc.lock, flags);
 }
 
 static struct irq_chip grgpio_irq_chip = {
-- 
2.5.0

