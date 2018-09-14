From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [RFC] gpiolib: Fix gpio_direction_* for single direction GPIOs
Date: Fri, 14 Sep 2018 09:08:38 +0200
Message-ID: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

GPIOs with no programmable direction are not required to implement
direction_output nor direction_input.

If we try to set an output direction on an output-only GPIO or input
direction on an input-only GPIO simply return 0.

This allows this single direction GPIO to be used by libgpiod.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpiolib.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index af853749e0bb..3c09bf70e7ab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2517,19 +2517,27 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 int gpiod_direction_input(struct gpio_desc *desc)
 {
 	struct gpio_chip	*chip;
-	int			status = -EINVAL;
+	int			status = 0;
 
 	VALIDATE_DESC(desc);
 	chip = desc->gdev->chip;
 
-	if (!chip->get || !chip->direction_input) {
+	if (!chip->get && chip->direction_input) {
 		gpiod_warn(desc,
-			"%s: missing get() or direction_input() operations\n",
+			"%s: missing get() and direction_input() operations\n",
 			__func__);
 		return -EIO;
 	}
 
-	status = chip->direction_input(chip, gpio_chip_hwgpio(desc));
+	if (chip->direction_input) {
+		status = chip->direction_input(chip, gpio_chip_hwgpio(desc));
+	} else if (chip->get_direction &&
+		  (chip->get_direction(chip, gpio_chip_hwgpio(desc)) != 1)) {
+		gpiod_warn(desc,
+			"%s: missing direction_input() operation\n",
+			__func__);
+		return -EIO;
+	}
 	if (status == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
@@ -2551,16 +2559,28 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	int val = !!value;
-	int ret;
+	int ret = 0;
 
-	if (!gc->set || !gc->direction_output) {
+	if (!gc->set && !gc->direction_output) {
 		gpiod_warn(desc,
-		       "%s: missing set() or direction_output() operations\n",
+		       "%s: missing set() and direction_output() operations\n",
 		       __func__);
 		return -EIO;
 	}
 
-	ret = gc->direction_output(gc, gpio_chip_hwgpio(desc), val);
+	if (gc->direction_output) {
+		ret = gc->direction_output(gc, gpio_chip_hwgpio(desc), val);
+	} else {
+		if (gc->get_direction &&
+		    gc->get_direction(gc, gpio_chip_hwgpio(desc))) {
+			gpiod_warn(desc,
+				"%s: missing direction_output() operation\n",
+				__func__);
+			return -EIO;
+		}
+		gc->set(gc, gpio_chip_hwgpio(desc), val);
+	}
+
 	if (!ret)
 		set_bit(FLAG_IS_OUT, &desc->flags);
 	trace_gpio_value(desc_to_gpio(desc), 0, val);
-- 
2.18.0
