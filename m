From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH][v2] gpio-generic: add bgpio_set_multiple functions
Date: Wed, 14 Jan 2015 15:46:38 +0100
Message-ID: <3218650.3Kg56DKAcg@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:54079 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753192AbbANOqk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 09:46:40 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

Add set_multiple functions to the generic driver for memory-mapped GPIO
controllers to improve performance when setting multiple outputs
simultaneously.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
v2: refactor to reduce duplicate code

 drivers/gpio/gpio-generic.c |   76 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 16f6115..b92a690 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -190,6 +190,79 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&bgc->lock, flags);
 }
 
+static void bgpio_multiple_get_masks(struct bgpio_chip *bgc,
+				     unsigned long *mask, unsigned long *bits,
+				     unsigned long *set_mask,
+				     unsigned long *clear_mask)
+{
+	int i;
+
+	*set_mask = 0;
+	*clear_mask = 0;
+
+	for (i = 0; i < bgc->bits; i++) {
+		if (*mask == 0)
+			break;
+		if (__test_and_clear_bit(i, mask)) {
+			if (test_bit(i, bits))
+				*set_mask |= bgc->pin2mask(bgc, i);
+			else
+				*clear_mask |= bgc->pin2mask(bgc, i);
+		}
+	}
+}
+
+static void bgpio_set_multiple_single_reg(struct bgpio_chip *bgc,
+					  unsigned long *mask,
+					  unsigned long *bits,
+					  void __iomem *reg)
+{
+	unsigned long flags;
+	unsigned long set_mask, clear_mask;
+
+	spin_lock_irqsave(&bgc->lock, flags);
+
+	bgpio_multiple_get_masks(bgc, mask, bits, &set_mask, &clear_mask);
+
+	bgc->data |= set_mask;
+	bgc->data &= ~clear_mask;
+
+	bgc->write_reg(reg, bgc->data);
+
+	spin_unlock_irqrestore(&bgc->lock, flags);
+}
+
+static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+			       unsigned long *bits)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+
+	bgpio_set_multiple_single_reg(bgc, mask, bits, bgc->reg_dat);
+}
+
+static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+
+	bgpio_set_multiple_single_reg(bgc, mask, bits, bgc->reg_set);
+}
+
+static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
+					  unsigned long *mask,
+					  unsigned long *bits)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+	unsigned long set_mask, clear_mask;
+
+	bgpio_multiple_get_masks(bgc, mask, bits, &set_mask, &clear_mask);
+
+	if (set_mask)
+		bgc->write_reg(bgc->reg_set, set_mask);
+	if (clear_mask)
+		bgc->write_reg(bgc->reg_clr, clear_mask);
+}
+
 static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	return 0;
@@ -354,11 +427,14 @@ static int bgpio_setup_io(struct bgpio_chip *bgc,
 		bgc->reg_set = set;
 		bgc->reg_clr = clr;
 		bgc->gc.set = bgpio_set_with_clear;
+		bgc->gc.set_multiple = bgpio_set_multiple_with_clear;
 	} else if (set && !clr) {
 		bgc->reg_set = set;
 		bgc->gc.set = bgpio_set_set;
+		bgc->gc.set_multiple = bgpio_set_multiple_set;
 	} else {
 		bgc->gc.set = bgpio_set;
+		bgc->gc.set_multiple = bgpio_set_multiple;
 	}
 
 	bgc->gc.get = bgpio_get;

--
2.0.5

