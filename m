From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mmio: Make pin2mask() a private business
Date: Fri, 20 Oct 2017 16:36:05 +0200
Message-ID: <20171020143605.18689-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44941 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752839AbdJTOiM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 10:38:12 -0400
Received: by mail-lf0-f66.google.com with SMTP id 75so13447829lfx.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 07:38:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Anton Vorontsov <anton@enomsg.org>

The vtable call pin2mask() was introducing a vtable function call
in every gpiochip callback for a generic MMIO GPIO chip. This was
not exactly efficient. (Maybe link-time optimization could get rid of
it, I don't know.)

After removing all external calls into this API we can make it a
boolean flag in the struct gpio_chip call and sink the function into
the gpio-mmio driver yielding encapsulation and potential speedups.

Cc: Anton Vorontsov <anton@enomsg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 45 +++++++++++++++++++--------------------------
 include/linux/gpio/driver.h |  8 ++++----
 2 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f7da40e46c55..63bb48878de1 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -126,20 +126,16 @@ static unsigned long bgpio_read32be(void __iomem *reg)
 	return ioread32be(reg);
 }
 
-static unsigned long bgpio_pin2mask(struct gpio_chip *gc, unsigned int pin)
+static unsigned long bgpio_line2mask(struct gpio_chip *gc, unsigned int line)
 {
-	return BIT(pin);
-}
-
-static unsigned long bgpio_pin2mask_be(struct gpio_chip *gc,
-				       unsigned int pin)
-{
-	return BIT(gc->bgpio_bits - 1 - pin);
+	if (gc->be_bits)
+		return BIT(gc->bgpio_bits - 1 - line);
+	return BIT(line);
 }
 
 static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 {
-	unsigned long pinmask = gc->pin2mask(gc, gpio);
+	unsigned long pinmask = bgpio_line2mask(gc, gpio);
 
 	if (gc->bgpio_dir & pinmask)
 		return !!(gc->read_reg(gc->reg_set) & pinmask);
@@ -149,7 +145,7 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	return !!(gc->read_reg(gc->reg_dat) & gc->pin2mask(gc, gpio));
+	return !!(gc->read_reg(gc->reg_dat) & bgpio_line2mask(gc, gpio));
 }
 
 static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -158,7 +154,7 @@ static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	unsigned long mask = gc->pin2mask(gc, gpio);
+	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
@@ -176,7 +172,7 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 				 int val)
 {
-	unsigned long mask = gc->pin2mask(gc, gpio);
+	unsigned long mask = bgpio_line2mask(gc, gpio);
 
 	if (val)
 		gc->write_reg(gc->reg_set, mask);
@@ -186,7 +182,7 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 
 static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	unsigned long mask = gc->pin2mask(gc, gpio);
+	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
@@ -216,9 +212,9 @@ static void bgpio_multiple_get_masks(struct gpio_chip *gc,
 			break;
 		if (__test_and_clear_bit(i, mask)) {
 			if (test_bit(i, bits))
-				*set_mask |= gc->pin2mask(gc, i);
+				*set_mask |= bgpio_line2mask(gc, i);
 			else
-				*clear_mask |= gc->pin2mask(gc, i);
+				*clear_mask |= bgpio_line2mask(gc, i);
 		}
 	}
 }
@@ -294,7 +290,7 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
-	gc->bgpio_dir &= ~gc->pin2mask(gc, gpio);
+	gc->bgpio_dir &= ~bgpio_line2mask(gc, gpio);
 	gc->write_reg(gc->reg_dir, gc->bgpio_dir);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
@@ -305,7 +301,7 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
 	/* Return 0 if output, 1 of input */
-	return !(gc->read_reg(gc->reg_dir) & gc->pin2mask(gc, gpio));
+	return !(gc->read_reg(gc->reg_dir) & bgpio_line2mask(gc, gpio));
 }
 
 static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -316,7 +312,7 @@ static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
-	gc->bgpio_dir |= gc->pin2mask(gc, gpio);
+	gc->bgpio_dir |= bgpio_line2mask(gc, gpio);
 	gc->write_reg(gc->reg_dir, gc->bgpio_dir);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
@@ -330,7 +326,7 @@ static int bgpio_dir_in_inv(struct gpio_chip *gc, unsigned int gpio)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
-	gc->bgpio_dir |= gc->pin2mask(gc, gpio);
+	gc->bgpio_dir |= bgpio_line2mask(gc, gpio);
 	gc->write_reg(gc->reg_dir, gc->bgpio_dir);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
@@ -346,7 +342,7 @@ static int bgpio_dir_out_inv(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
-	gc->bgpio_dir &= ~gc->pin2mask(gc, gpio);
+	gc->bgpio_dir &= ~bgpio_line2mask(gc, gpio);
 	gc->write_reg(gc->reg_dir, gc->bgpio_dir);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
@@ -357,12 +353,11 @@ static int bgpio_dir_out_inv(struct gpio_chip *gc, unsigned int gpio, int val)
 static int bgpio_get_dir_inv(struct gpio_chip *gc, unsigned int gpio)
 {
 	/* Return 0 if output, 1 if input */
-	return !!(gc->read_reg(gc->reg_dir) & gc->pin2mask(gc, gpio));
+	return !!(gc->read_reg(gc->reg_dir) & bgpio_line2mask(gc, gpio));
 }
 
 static int bgpio_setup_accessors(struct device *dev,
 				 struct gpio_chip *gc,
-				 bool bit_be,
 				 bool byte_be)
 {
 
@@ -406,8 +401,6 @@ static int bgpio_setup_accessors(struct device *dev,
 		return -EINVAL;
 	}
 
-	gc->pin2mask = bit_be ? bgpio_pin2mask_be : bgpio_pin2mask;
-
 	return 0;
 }
 
@@ -531,8 +524,8 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_accessors(dev, gc, flags & BGPIOF_BIG_ENDIAN,
-				    flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	gc->be_bits = !!(flags & BGPIOF_BIG_ENDIAN);
+	ret = bgpio_setup_accessors(dev, gc, flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index bda95a9b7b8c..ed04fa2a00a8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -67,9 +67,9 @@ struct module;
  *	registers.
  * @read_reg: reader function for generic GPIO
  * @write_reg: writer function for generic GPIO
- * @pin2mask: some generic GPIO controllers work with the big-endian bits
- *	notation, e.g. in a 8-bits register, GPIO7 is the least significant
- *	bit. This callback assigns the right bit mask.
+ * @be_bits: if the generic GPIO has big endian bit order (bit 31 is representing
+ *	line 0, bit 30 is line 1 ... bit 0 is line 31) this is set to true by the
+ *	generic GPIO core. It is for internal housekeeping only.
  * @reg_dat: data (in) register for generic GPIO
  * @reg_set: output set register (out=high) for generic GPIO
  * @reg_clr: output clear register (out=low) for generic GPIO
@@ -151,7 +151,7 @@ struct gpio_chip {
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
 	unsigned long (*read_reg)(void __iomem *reg);
 	void (*write_reg)(void __iomem *reg, unsigned long data);
-	unsigned long (*pin2mask)(struct gpio_chip *gc, unsigned int pin);
+	bool be_bits;
 	void __iomem *reg_dat;
 	void __iomem *reg_set;
 	void __iomem *reg_clr;
-- 
2.13.6

