From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 2/3] gpio: generic: support input-only chips
Date: Wed, 22 Jul 2015 15:05:18 +0200
Message-ID: <1437570319-25297-2-git-send-email-rabin@rab.in>
References: <1437570319-25297-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437570319-25297-1-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: linux-gpio@vger.kernel.org

Allow chips to indicates that they are input-only and thus cannot set
the output value.  This will be used by the gpio-etraxfs driver.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 drivers/gpio/gpio-generic.c     | 23 ++++++++++++++++++++---
 include/linux/basic_mmio_gpio.h |  1 +
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 9bda372..b3debbf 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -153,6 +153,10 @@ static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio));
 }
 
+static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+}
+
 static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
@@ -279,6 +283,12 @@ static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	return 0;
 }
 
+static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
+				int val)
+{
+	return -EINVAL;
+}
+
 static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
@@ -444,6 +454,9 @@ static int bgpio_setup_io(struct bgpio_chip *bgc,
 		bgc->reg_set = set;
 		bgc->gc.set = bgpio_set_set;
 		bgc->gc.set_multiple = bgpio_set_multiple_set;
+	} else if (flags & BGPIOF_NO_OUTPUT) {
+		bgc->gc.set = bgpio_set_none;
+		bgc->gc.set_multiple = NULL;
 	} else {
 		bgc->gc.set = bgpio_set;
 		bgc->gc.set_multiple = bgpio_set_multiple;
@@ -460,7 +473,8 @@ static int bgpio_setup_io(struct bgpio_chip *bgc,
 
 static int bgpio_setup_direction(struct bgpio_chip *bgc,
 				 void __iomem *dirout,
-				 void __iomem *dirin)
+				 void __iomem *dirin,
+				 unsigned long flags)
 {
 	if (dirout && dirin) {
 		return -EINVAL;
@@ -473,7 +487,10 @@ static int bgpio_setup_direction(struct bgpio_chip *bgc,
 		bgc->gc.direction_output = bgpio_dir_out_inv;
 		bgc->gc.direction_input = bgpio_dir_in_inv;
 	} else {
-		bgc->gc.direction_output = bgpio_simple_dir_out;
+		if (flags & BGPIOF_NO_OUTPUT)
+			bgc->gc.direction_output = bgpio_dir_out_err;
+		else
+			bgc->gc.direction_output = bgpio_simple_dir_out;
 		bgc->gc.direction_input = bgpio_simple_dir_in;
 	}
 
@@ -525,7 +542,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_direction(bgc, dirout, dirin);
+	ret = bgpio_setup_direction(bgc, dirout, dirin, flags);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio_gpio.h
index 14eea94..ed3768f 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -75,5 +75,6 @@ int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
 #define BGPIOF_UNREADABLE_REG_DIR	BIT(2) /* reg_dir is unreadable */
 #define BGPIOF_BIG_ENDIAN_BYTE_ORDER	BIT(3)
 #define BGPIOF_READ_OUTPUT_REG_SET     BIT(4) /* reg_set stores output value */
+#define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 
 #endif /* __BASIC_MMIO_GPIO_H */
-- 
2.1.4
