From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: grgpio: Do not use gc->pin2mask()
Date: Fri, 20 Oct 2017 15:03:47 +0200
Message-ID: <20171020130347.26722-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:53536 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751497AbdJTNFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 09:05:51 -0400
Received: by mail-lf0-f67.google.com with SMTP id l23so13129318lfk.10
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 06:05:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Andreas Larsson <andreas@gaisler.com>

The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
bit 15 or bit 31 or so.

The grgpio only uses big endian BYTE ORDER which will be taken car of
by the ->write_reg() callback.

Just use BIT(offset) to assign the bit.

Cc: Andreas Larsson <andreas@gaisler.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-grgpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 6544a16ab02e..e2fc561f4315 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -35,6 +35,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/bitops.h>
 
 #define GRGPIO_MAX_NGPIO 32
 
@@ -96,12 +97,11 @@ static void grgpio_set_imask(struct grgpio_priv *priv, unsigned int offset,
 			     int val)
 {
 	struct gpio_chip *gc = &priv->gc;
-	unsigned long mask = gc->pin2mask(gc, offset);
 
 	if (val)
-		priv->imask |= mask;
+		priv->imask |= BIT(offset);
 	else
-		priv->imask &= ~mask;
+		priv->imask &= ~BIT(offset);
 	gc->write_reg(priv->regs + GRGPIO_IMASK, priv->imask);
 }
 
-- 
2.13.6

