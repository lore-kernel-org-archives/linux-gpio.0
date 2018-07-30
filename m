From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/1] gpio: mmio: add inverted direction get_set io support
Date: Mon, 30 Jul 2018 12:34:18 +0300
Message-ID: <20180730093418.124648-2-tmaimon77@gmail.com>
References: <20180730093418.124648-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730093418.124648-1-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Add get_set_inv_dir and get_set_multiple_inv_dir I/O functions
to call the data register when the dirction is input and
set register when the direction is output.
the functions will linked to the I/O get functions if the user set
BGPIOF_INVERTED_REG_DIR flag in the bgpio initialization.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/gpio/gpio-mmio.c    | 48 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/gpio/driver.h |  1 +
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7b14d6280e44..46f664459853 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -168,6 +168,40 @@ static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
+/* get set function when the direction is inverted */
+static int bgpio_get_set_inv_dir(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long pinmask = bgpio_line2mask(gc, gpio);
+
+	if (gc->bgpio_dir & pinmask)
+		return !!(gc->read_reg(gc->reg_dat) & pinmask);
+	else
+		return !!(gc->read_reg(gc->reg_set) & pinmask);
+}
+
+/* get set multiple function when the direction is inverted */
+static int bgpio_get_set_multiple_inv_dir(struct gpio_chip *gc,
+					  unsigned long *mask,
+					  unsigned long *bits)
+{
+	unsigned long get_mask = 0;
+	unsigned long set_mask = 0;
+
+	/* Make sure we first clear any bits that are zero when we read the register */
+	*bits &= ~*mask;
+
+	/* Exploit the fact that we know which directions are set */
+	set_mask = *mask & ~gc->bgpio_dir;
+	get_mask = *mask & gc->bgpio_dir;
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
@@ -525,9 +559,17 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 
 	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
 	    (flags & BGPIOF_READ_OUTPUT_REG_SET)) {
-		gc->get = bgpio_get_set;
-		if (!gc->be_bits)
-			gc->get_multiple = bgpio_get_set_multiple;
+		/* if the direction inverted */
+		if (flags & BGPIOF_INVERTED_REG_DIR) {
+			gc->get = bgpio_get_set_inv_dir;
+			if (!gc->be_bits)
+				gc->get_multiple =
+				bgpio_get_set_multiple_inv_dir;
+		} else {
+			gc->get = bgpio_get_set;
+			if (!gc->be_bits)
+				gc->get_multiple = bgpio_get_set_multiple;
+		}
 		/*
 		 * We deliberately avoid assigning the ->get_multiple() call
 		 * for big endian mirrored registers which are ALSO reflecting
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5382b5183b7e..63570580707c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -425,6 +425,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_BIG_ENDIAN_BYTE_ORDER	BIT(3)
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
+#define BGPIOF_INVERTED_REG_DIR		BIT(6) /* reg_dir inverted */
 
 #endif
 
-- 
2.14.1
