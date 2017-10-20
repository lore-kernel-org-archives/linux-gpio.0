From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3] gpio-mmio: Use the new .get_multiple() callback
Date: Fri, 20 Oct 2017 17:10:30 +0200
Message-ID: <20171020151030.25094-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:49105 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751618AbdJTPMh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 11:12:37 -0400
Received: by mail-lf0-f65.google.com with SMTP id a69so13566868lfe.5
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 08:12:37 -0700 (PDT)
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
ChangeLog v2->v3:
- Check the right big endianness flag: we want special handling
  for BE bitorder, not for BE byteorder.
- Implement a .get_multiple() solution for big-endian bit order
  if there is a single register to read all bits.
- Rebase on top of pin2mask() cleanups.
ChangeLog v1->v2:
- Only assign the functions for multiple get if we are in
  native endianness. Else each bit needs to be processed
  differently after read and it will be a mess. Likely
  the old get functions are better in this case.
- Directly write into *bits in both functions.
---
 drivers/gpio/gpio-mmio.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 63bb48878de1..f9042bcc27a4 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -143,11 +143,78 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 		return !!(gc->read_reg(gc->reg_dat) & pinmask);
 }
 
+/*
+ * This assumes that the bits in the GPIO register are in native endianness.
+ * We only assign the function pointer if we have that.
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
 	return !!(gc->read_reg(gc->reg_dat) & bgpio_line2mask(gc, gpio));
 }
 
+/*
+ * This only works if the bits in the GPIO register are in native endianness.
+ * It is dirt simple and fast in this case. (Also the most common case.)
+ */
+static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
+			      unsigned long *bits)
+{
+
+	*bits = gc->read_reg(gc->reg_dat) & *mask;
+	return 0;
+}
+
+/*
+ * With big endian mirrored bit order it becomes more tedious.
+ */
+static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
+				 unsigned long *bits)
+{
+	unsigned long readmask = 0;
+	unsigned long val;
+	int bit;
+
+	/* Create a mirrored mask */
+	bit = 0;
+	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio)
+		readmask |= bgpio_line2mask(gc, bit);
+
+	/* Read the register */
+	val = gc->read_reg(gc->reg_dat) & readmask;
+
+	/*
+	 * Mirror the result into the "bits" result, this will give line 0
+	 * in bit 0 ... line 31 in bit 31 for a 32bit register.
+	 */
+	bit = 0;
+	while ((bit = find_next_bit(&val, gc->ngpio, bit)) != gc->ngpio)
+		*bits |= bgpio_line2mask(gc, bit);
+
+	return 0;
+}
+
 static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 }
@@ -455,10 +522,24 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 	}
 
 	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
-	    (flags & BGPIOF_READ_OUTPUT_REG_SET))
+	    (flags & BGPIOF_READ_OUTPUT_REG_SET)) {
 		gc->get = bgpio_get_set;
-	else
+		if (!gc->be_bits)
+			gc->get_multiple = bgpio_get_set_multiple;
+		/*
+		 * We deliberately avoid assigning the ->get_multiple() call
+		 * for big endian mirrored registers which are ALSO reflecting
+		 * their value in the set register when used as output. It is
+		 * simply too much complexity, let the GPIO core fall back to
+		 * reading each line individually in that fringe case.
+		 */
+	} else {
 		gc->get = bgpio_get;
+		if (gc->be_bits)
+			gc->get_multiple = bgpio_get_multiple_be;
+		else
+			gc->get_multiple = bgpio_get_multiple;
+	}
 
 	return 0;
 }
@@ -519,12 +600,12 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	gc->base = -1;
 	gc->ngpio = gc->bgpio_bits;
 	gc->request = bgpio_request;
+	gc->be_bits = !!(flags & BGPIOF_BIG_ENDIAN);
 
 	ret = bgpio_setup_io(gc, dat, set, clr, flags);
 	if (ret)
 		return ret;
 
-	gc->be_bits = !!(flags & BGPIOF_BIG_ENDIAN);
 	ret = bgpio_setup_accessors(dev, gc, flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
-- 
2.13.6

