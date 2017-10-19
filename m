From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio-mmio: Use the new .get_multiple() callback
Date: Fri, 20 Oct 2017 00:33:43 +0200
Message-ID: <20171019223343.13927-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:47137 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754445AbdJSWfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2017 18:35:51 -0400
Received: by mail-lf0-f66.google.com with SMTP id k40so11250226lfi.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2017 15:35:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Anton Vorontsov <anton@enomsg.org>, Lukas Wunner <lukas@wunner.de>

It is possible to read all lines of a generic MMIO GPIO chip
with a single register read so support this if we are in
native endianness.

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
ChangeLog v1->v2:
- Only assign the functions for multiple get if we are in
  native endianness. Else each bit needs to be processed
  differently after read and it will be a mess. Likely
  the old get functions are better in this case.
- Directly write into *bits in both functions.
---
 drivers/gpio/gpio-mmio.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f7da40e46c55..cdfe1192be1d 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -147,11 +147,49 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 		return !!(gc->read_reg(gc->reg_dat) & pinmask);
 }
 
+/*
+ * This only works if the bits in the GPIO register are in native endianness.
+ * We only assign it if we have that.
+ */
+static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				  unsigned long *bits)
+{
+	unsigned long get_mask = 0;
+	unsigned long set_mask = 0;
+	int bit = 0;
+
+	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio) {
+		if (gc->bgpio_dir & BIT(bit))
+			set_mask |= BIT(bit);
+		else
+			get_mask |= BIT(bit);
+	}
+
+	if (set_mask)
+		*bits |= gc->read_reg(gc->reg_set) & set_mask;
+	if (get_mask)
+		*bits |= gc->read_reg(gc->reg_dat) & get_mask;
+
+	return 0;
+}
+
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	return !!(gc->read_reg(gc->reg_dat) & gc->pin2mask(gc, gpio));
 }
 
+/*
+ * This only works if the bits in the GPIO register are in native endianness.
+ * We only assign it if we have that.
+ */
+static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
+			      unsigned long *bits)
+{
+	*bits = gc->read_reg(gc->reg_dat) & *mask;
+
+	return 0;
+}
+
 static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 }
@@ -462,10 +500,17 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 	}
 
 	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
-	    (flags & BGPIOF_READ_OUTPUT_REG_SET))
+	    (flags & BGPIOF_READ_OUTPUT_REG_SET)) {
 		gc->get = bgpio_get_set;
-	else
+		/* If we are in native endianness we can use the quick multiple read */
+		if (!(flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER))
+			gc->get_multiple = bgpio_get_set_multiple;
+	} else {
 		gc->get = bgpio_get;
+		/* If we are in native endianness we can use the quick multiple read */
+		if (!(flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER))
+			gc->get_multiple = bgpio_get_multiple;
+	}
 
 	return 0;
 }
-- 
2.13.6

