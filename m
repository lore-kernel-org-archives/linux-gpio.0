From: Kun Yi <kunyi@google.com>
Subject: [PATCH 1/2] gpio: gpio-mmio: Allow volatile shadow regs
Date: Wed, 17 Oct 2018 14:30:11 -0700
Message-ID: <20181017213012.233957-2-kunyi@google.com>
References: <20181017213012.233957-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017213012.233957-1-kunyi@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, tmaimon77@gmail.com
Cc: linux-kernel@vger.kernel.org, avifishman70@gmail.com, openbmc@lists.ozlabs.org, Kun Yi <kunyi@google.com>
List-Id: linux-gpio@vger.kernel.org

Currently the generic GPIO driver stores the direction and data shadow register
when the driver probes. However, in embedded SOCs the GPIO pins are often
interleaved with pins muxed to other functions, and pinctrl driver might
toggle the direction/data register values for these pins. With GPIO
driver being not the only owner, it should read the shadow registers
before updating them, otherwise some pin states would be overwritten.

This patch adds a flag BGPIOF_VOLATILE_REG to allow a pinctrl driver that uses
the generic GPIO interface to indicate the need of read-before-update.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/gpio/gpio-mmio.c    | 50 +++++++++++++++++++++++++------------
 include/linux/gpio/driver.h |  2 ++
 2 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 935292a30c99..5e13e43a793d 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -136,7 +136,12 @@ static unsigned long bgpio_line2mask(struct gpio_chip *gc, unsigned int line)
 static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 {
 	unsigned long pinmask = bgpio_line2mask(gc, gpio);
-	bool dir = !!(gc->bgpio_dir & pinmask);
+	bool dir;
+
+	if (gc->bgpio_regs_are_volatile)
+		gc->bgpio_dir = gc->read_reg(gc->reg_dir);
+
+	dir = !!(gc->bgpio_dir & pinmask);
 
 	/*
 	 * If the direction is OUT we read the value from the SET
@@ -168,6 +173,9 @@ static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	/* Make sure we first clear any bits that are zero when we read the register */
 	*bits &= ~*mask;
 
+	if (gc->bgpio_regs_are_volatile)
+		gc->bgpio_dir = gc->read_reg(gc->reg_dir);
+
 	/* Exploit the fact that we know which directions are set */
 	if (gc->bgpio_dir_inverted) {
 		set_mask = *mask & ~gc->bgpio_dir;
@@ -238,21 +246,31 @@ static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 }
 
-static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static void bgpio_set_single_reg(struct gpio_chip *gc, unsigned int gpio,
+				 int val, void __iomem *reg)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
+	if (gc->bgpio_regs_are_volatile)
+		gc->bgpio_data = gc->read_reg(reg);
+
 	if (val)
 		gc->bgpio_data |= mask;
 	else
 		gc->bgpio_data &= ~mask;
 
-	gc->write_reg(gc->reg_dat, gc->bgpio_data);
+	gc->write_reg(reg, gc->bgpio_data);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+}
+
+static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	bgpio_set_single_reg(gc, gpio, val, gc->reg_dat);
 }
 
 static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
@@ -268,19 +286,7 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 
 static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	unsigned long mask = bgpio_line2mask(gc, gpio);
-	unsigned long flags;
-
-	spin_lock_irqsave(&gc->bgpio_lock, flags);
-
-	if (val)
-		gc->bgpio_data |= mask;
-	else
-		gc->bgpio_data &= ~mask;
-
-	gc->write_reg(gc->reg_set, gc->bgpio_data);
-
-	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	bgpio_set_single_reg(gc, gpio, val, gc->reg_set);
 }
 
 static void bgpio_multiple_get_masks(struct gpio_chip *gc,
@@ -317,6 +323,9 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
 
 	bgpio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
+	if (gc->bgpio_regs_are_volatile)
+		gc->bgpio_data = gc->read_reg(reg);
+
 	gc->bgpio_data |= set_mask;
 	gc->bgpio_data &= ~clear_mask;
 
@@ -376,6 +385,9 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
+	if (gc->bgpio_regs_are_volatile)
+		gc->bgpio_dir = gc->read_reg(gc->reg_dir);
+
 	if (gc->bgpio_dir_inverted)
 		gc->bgpio_dir |= bgpio_line2mask(gc, gpio);
 	else
@@ -404,6 +416,9 @@ static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
+	if (gc->bgpio_regs_are_volatile)
+		gc->bgpio_dir = gc->read_reg(gc->reg_dir);
+
 	if (gc->bgpio_dir_inverted)
 		gc->bgpio_dir &= ~bgpio_line2mask(gc, gpio);
 	else
@@ -641,6 +656,9 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	if (gc->reg_dir && !(flags & BGPIOF_UNREADABLE_REG_DIR))
 		gc->bgpio_dir = gc->read_reg(gc->reg_dir);
 
+	if (flags & BGPIOF_VOLATILE_REG)
+		gc->bgpio_regs_are_volatile = true;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(bgpio_init);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0ea328e71ec9..a889037daf20 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -274,6 +274,7 @@ struct gpio_chip {
 	spinlock_t bgpio_lock;
 	unsigned long bgpio_data;
 	unsigned long bgpio_dir;
+	bool bgpio_regs_are_volatile;
 #endif
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
@@ -428,6 +429,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_BIG_ENDIAN_BYTE_ORDER	BIT(3)
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
+#define BGPIOF_VOLATILE_REG		BIT(6) /* update shadow before writing*/
 
 #endif
 
-- 
2.19.1.331.ge82ca0e54c-goog
