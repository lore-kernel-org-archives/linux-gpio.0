From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH] gpio-generic: add bgpio_set_multiple functions
Date: Tue, 13 Jan 2015 11:37:24 +0100
Message-ID: <1474325.ElrvNqxI5B@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:44946 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbbAMKh1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 05:37:27 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

Add set_multiple functions to the generic driver for memory-mapped GPIO
controllers to improve performance when setting multiple outputs
simultaneously.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
 drivers/gpio/gpio-generic.c |   79 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 16f6115..cb6d0b7 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -160,6 +160,31 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&bgc->lock, flags);
 }
 
+static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+			       unsigned long *bits)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&bgc->lock, flags);
+
+	for (i = 0; i < bgc->bits; i++) {
+		if (*mask == 0)
+			break;
+		if (__test_and_clear_bit(i, mask)) {
+			if (test_bit(i, bits))
+				bgc->data |= bgc->pin2mask(bgc, i);
+			else
+				bgc->data &= ~bgc->pin2mask(bgc, i);
+		}
+	}
+
+	bgc->write_reg(bgc->reg_dat, bgc->data);
+
+	spin_unlock_irqrestore(&bgc->lock, flags);
+}
+
 static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 				 int val)
 {
@@ -172,6 +197,32 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 		bgc->write_reg(bgc->reg_clr, mask);
 }
 
+static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
+					  unsigned long *mask,
+					  unsigned long *bits)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+	unsigned long set_mask = 0;
+	unsigned long clear_mask = 0;
+	int i;
+
+	for (i = 0; i < bgc->bits; i++) {
+		if (*mask == 0)
+			break;
+		if (__test_and_clear_bit(i, mask)) {
+			if (test_bit(i, bits))
+				set_mask |= bgc->pin2mask(bgc, i);
+			else
+				clear_mask |= bgc->pin2mask(bgc, i);
+		}
+	}
+
+	if (set_mask)
+		bgc->write_reg(bgc->reg_set, set_mask);
+	if (clear_mask)
+		bgc->write_reg(bgc->reg_clr, clear_mask);
+}
+
 static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
@@ -190,6 +241,31 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&bgc->lock, flags);
 }
 
+static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&bgc->lock, flags);
+
+	for (i = 0; i < bgc->bits; i++) {
+		if (*mask == 0)
+			break;
+		if (__test_and_clear_bit(i, mask)) {
+			if (test_bit(i, bits))
+				bgc->data |= bgc->pin2mask(bgc, i);
+			else
+				bgc->data &= ~bgc->pin2mask(bgc, i);
+		}
+	}
+
+	bgc->write_reg(bgc->reg_set, bgc->data);
+
+	spin_unlock_irqrestore(&bgc->lock, flags);
+}
+
 static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	return 0;
@@ -354,11 +430,14 @@ static int bgpio_setup_io(struct bgpio_chip *bgc,
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

