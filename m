From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: Alter semantics of *raw* operations to actually be raw
Date: Tue, 26 Sep 2017 21:36:03 +0200
Message-ID: <20170926193603.21859-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:46448 "EHLO
        mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030327AbdIZTgJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2017 15:36:09 -0400
Received: by mail-pf0-f177.google.com with SMTP id r68so6031318pfj.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2017 12:36:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

Currently calls to:
gpiod_direction_output_raw()
gpiod_set_raw_value()
gpiod_set_raw_array_value()
gpiod_set_raw_value_cansleep()
gpiod_set_raw_array_value_cansleep()

Respect that we do not want to invert the value written, but will
still apply special open drain/open source semantics if the line has
an open drain/open source flag.

It also forbids us from driving an output marked as an interrupt
line.

This does not fit with the function name and expected semantics. In
the w1 host driver (for example) we need to handle a line as open drain
but sometimes force it to pull up, which means we should be able to
use the gpiod_set_raw_value() for this, but it currently does not
work.

There are also use cases where users actually want to drive a line
used by an interrupt. This is what they should be expected to use
the *raw* accessors for.

I have looked over the current users of this API and they do not seem
to be using the *raw* accessors with open drain or open source so let's
augment this behaviour before we have users expecting the inconsistent
semantic.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 90 ++++++++++++++++++++++++++------------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3c2065d0aed1..f50518d61c81 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2297,38 +2297,6 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	int val = !!value;
 	int ret;
 
-	/* GPIOs used for IRQs shall not be set as output */
-	if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
-		gpiod_err(desc,
-			  "%s: tried to set a GPIO tied to an IRQ as output\n",
-			  __func__);
-		return -EIO;
-	}
-
-	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
-		/* First see if we can enable open drain in hardware */
-		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
-						  PIN_CONFIG_DRIVE_OPEN_DRAIN);
-		if (!ret)
-			goto set_output_value;
-		/* Emulate open drain by not actively driving the line high */
-		if (val)
-			return gpiod_direction_input(desc);
-	}
-	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
-		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
-						  PIN_CONFIG_DRIVE_OPEN_SOURCE);
-		if (!ret)
-			goto set_output_value;
-		/* Emulate open source by not actively driving the line low */
-		if (!val)
-			return gpiod_direction_input(desc);
-	} else {
-		gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
-					    PIN_CONFIG_DRIVE_PUSH_PULL);
-	}
-
-set_output_value:
 	if (!gc->set || !gc->direction_output) {
 		gpiod_warn(desc,
 		       "%s: missing set() or direction_output() operations\n",
@@ -2376,11 +2344,47 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
  */
 int gpiod_direction_output(struct gpio_desc *desc, int value)
 {
+	struct gpio_chip *gc = desc->gdev->chip;
+	int ret;
+
 	VALIDATE_DESC(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 	else
 		value = !!value;
+
+	/* GPIOs used for IRQs shall not be set as output */
+	if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
+		gpiod_err(desc,
+			  "%s: tried to set a GPIO tied to an IRQ as output\n",
+			  __func__);
+		return -EIO;
+	}
+
+	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
+		/* First see if we can enable open drain in hardware */
+		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
+						  PIN_CONFIG_DRIVE_OPEN_DRAIN);
+		if (!ret)
+			goto set_output_value;
+		/* Emulate open drain by not actively driving the line high */
+		if (value)
+			return gpiod_direction_input(desc);
+	}
+	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
+		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
+						  PIN_CONFIG_DRIVE_OPEN_SOURCE);
+		if (!ret)
+			goto set_output_value;
+		/* Emulate open source by not actively driving the line low */
+		if (!value)
+			return gpiod_direction_input(desc);
+	} else {
+		gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
+					    PIN_CONFIG_DRIVE_PUSH_PULL);
+	}
+
+set_output_value:
 	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
@@ -2570,12 +2574,7 @@ static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 
 	chip = desc->gdev->chip;
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
-		gpio_set_open_drain_value_commit(desc, value);
-	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
-		gpio_set_open_source_value_commit(desc, value);
-	else
-		chip->set(chip, gpio_chip_hwgpio(desc), value);
+	chip->set(chip, gpio_chip_hwgpio(desc), value);
 }
 
 /*
@@ -2630,9 +2629,9 @@ void gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			 * collect all normal outputs belonging to the same chip
 			 * open drain and open source outputs are set individually
 			 */
-			if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
+			if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) && !raw) {
 				gpio_set_open_drain_value_commit(desc, value);
-			} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
+			} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags) && !raw) {
 				gpio_set_open_source_value_commit(desc, value);
 			} else {
 				__set_bit(hwgpio, mask);
@@ -2676,8 +2675,8 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
  * @desc: gpio whose value will be assigned
  * @value: value to assign
  *
- * Set the logical value of the GPIO, i.e. taking its ACTIVE_LOW status into
- * account
+ * Set the logical value of the GPIO, i.e. taking its ACTIVE_LOW,
+ * OPEN_DRAIN and OPEN_SOURCE flags into account.
  *
  * This function should be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
@@ -2689,7 +2688,12 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
 	WARN_ON(desc->gdev->chip->can_sleep);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
-	gpiod_set_raw_value_commit(desc, value);
+	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
+		gpio_set_open_drain_value_commit(desc, value);
+	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
+		gpio_set_open_source_value_commit(desc, value);
+	else
+		gpiod_set_raw_value_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_value);
 
-- 
2.13.5

