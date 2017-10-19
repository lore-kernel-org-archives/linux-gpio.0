From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio-mmio: Use the new .get_multiple() callback
Date: Thu, 19 Oct 2017 23:58:45 +0200
Message-ID: <20171019215845.4012-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:49520 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752142AbdJSWAw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2017 18:00:52 -0400
Received: by mail-lf0-f66.google.com with SMTP id w21so11198403lfc.6
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2017 15:00:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Anton Vorontsov <anton@enomsg.org>, Lukas Wunner <lukas@wunner.de>

It is possible to read all lines of a generic MMIO GPIO chip
with a single register read so support this.

Add an especially quirky callback to read multiple lines for
the variants that require you to read values from the
output registers if and only if the line is set as output.
We managed to do that with a maximum of two register reads,
and just one read if the requested lines are all input or all
output.

Cc: Anton Vorontsov <anton@enomsg.org>
Cc: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f7da40e46c55..826e22725b29 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -147,11 +147,52 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 		return !!(gc->read_reg(gc->reg_dat) & pinmask);
 }
 
+static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				  unsigned long *bits)
+{
+	unsigned long get_mask = 0;
+	unsigned long set_mask = 0;
+	unsigned long retbits = 0;
+	unsigned long pinmask;
+	int bit = 0;
+
+	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio) {
+		pinmask = gc->pin2mask(gc, bit);
+
+		if (gc->bgpio_dir & pinmask)
+			set_mask |= pinmask;
+		else
+			get_mask |= pinmask;
+	}
+
+	if (set_mask)
+		retbits |= gc->read_reg(gc->reg_set) & set_mask;
+	if (get_mask)
+		retbits |= gc->read_reg(gc->reg_dat) & get_mask;
+
+	*bits = retbits;
+
+	return 0;
+}
+
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	return !!(gc->read_reg(gc->reg_dat) & gc->pin2mask(gc, gpio));
 }
 
+static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
+			      unsigned long *bits)
+{
+	unsigned long mapped_mask = 0;
+	int bit = 0;
+
+	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio)
+		mapped_mask |= gc->pin2mask(gc, bit);
+	*bits = gc->read_reg(gc->reg_dat) & mapped_mask;
+
+	return 0;
+}
+
 static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 }
@@ -462,10 +503,13 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 	}
 
 	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
-	    (flags & BGPIOF_READ_OUTPUT_REG_SET))
+	    (flags & BGPIOF_READ_OUTPUT_REG_SET)) {
 		gc->get = bgpio_get_set;
-	else
+		gc->get_multiple = bgpio_get_set_multiple;
+	} else {
 		gc->get = bgpio_get;
+		gc->get_multiple = bgpio_get_multiple;
+	}
 
 	return 0;
 }
-- 
2.13.6

