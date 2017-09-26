From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: Get rid of _prefix and __prefixes
Date: Tue, 26 Sep 2017 21:35:52 +0200
Message-ID: <20170926193552.21809-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:44654 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030327AbdIZTgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2017 15:36:00 -0400
Received: by mail-pf0-f175.google.com with SMTP id e1so6037166pfk.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2017 12:36:00 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

The arbitrarily marking of a function with _ or __ is taking to mean
"perform some inner core of the caller" or something like that. At other
times, this syntax has a totally different meaning.

I don't like this since it is unambious and unhelpful to people reading
the code, so replace it with _commit() suffixes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 52 +++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c952ef1b2f46..3c2065d0aed1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2013,7 +2013,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
  * on each other, and help provide better diagnostics in debugfs.
  * They're called even less than the "set direction" calls.
  */
-static int __gpiod_request(struct gpio_desc *desc, const char *label)
+static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
 	struct gpio_chip	*chip = desc->gdev->chip;
 	int			status;
@@ -2106,7 +2106,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 	gdev = desc->gdev;
 
 	if (try_module_get(gdev->owner)) {
-		status = __gpiod_request(desc, label);
+		status = gpiod_request_commit(desc, label);
 		if (status < 0)
 			module_put(gdev->owner);
 		else
@@ -2119,7 +2119,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 	return status;
 }
 
-static bool __gpiod_free(struct gpio_desc *desc)
+static bool gpiod_free_commit(struct gpio_desc *desc)
 {
 	bool			ret = false;
 	unsigned long		flags;
@@ -2154,7 +2154,7 @@ static bool __gpiod_free(struct gpio_desc *desc)
 
 void gpiod_free(struct gpio_desc *desc)
 {
-	if (desc && desc->gdev && __gpiod_free(desc)) {
+	if (desc && desc->gdev && gpiod_free_commit(desc)) {
 		module_put(desc->gdev->owner);
 		put_device(&desc->gdev->dev);
 	} else {
@@ -2217,7 +2217,7 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
 		return desc;
 	}
 
-	err = __gpiod_request(desc, label);
+	err = gpiod_request_commit(desc, label);
 	if (err < 0)
 		return ERR_PTR(err);
 
@@ -2235,7 +2235,7 @@ EXPORT_SYMBOL_GPL(gpiochip_request_own_desc);
 void gpiochip_free_own_desc(struct gpio_desc *desc)
 {
 	if (desc)
-		__gpiod_free(desc);
+		gpiod_free_commit(desc);
 }
 EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 
@@ -2291,7 +2291,7 @@ static int gpio_set_drive_single_ended(struct gpio_chip *gc, unsigned offset,
 	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
 }
 
-static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
+static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	int val = !!value;
@@ -2358,7 +2358,7 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
 	VALIDATE_DESC(desc);
-	return _gpiod_direction_output_raw(desc, value);
+	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
 
@@ -2381,7 +2381,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		value = !value;
 	else
 		value = !!value;
-	return _gpiod_direction_output_raw(desc, value);
+	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
@@ -2448,7 +2448,7 @@ EXPORT_SYMBOL_GPL(gpiod_is_active_low);
  * that the GPIO was actually requested.
  */
 
-static int _gpiod_get_raw_value(const struct gpio_desc *desc)
+static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
 	struct gpio_chip	*chip;
 	int offset;
@@ -2477,7 +2477,7 @@ int gpiod_get_raw_value(const struct gpio_desc *desc)
 	VALIDATE_DESC(desc);
 	/* Should be using gpio_get_value_cansleep() */
 	WARN_ON(desc->gdev->chip->can_sleep);
-	return _gpiod_get_raw_value(desc);
+	return gpiod_get_raw_value_commit(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
 
@@ -2499,7 +2499,7 @@ int gpiod_get_value(const struct gpio_desc *desc)
 	/* Should be using gpio_get_value_cansleep() */
 	WARN_ON(desc->gdev->chip->can_sleep);
 
-	value = _gpiod_get_raw_value(desc);
+	value = gpiod_get_raw_value_commit(desc);
 	if (value < 0)
 		return value;
 
@@ -2511,11 +2511,11 @@ int gpiod_get_value(const struct gpio_desc *desc)
 EXPORT_SYMBOL_GPL(gpiod_get_value);
 
 /*
- *  _gpio_set_open_drain_value() - Set the open drain gpio's value.
+ *  gpio_set_open_drain_value_commit() - Set the open drain gpio's value.
  * @desc: gpio descriptor whose state need to be set.
  * @value: Non-zero for setting it HIGH otherwise it will set to LOW.
  */
-static void _gpio_set_open_drain_value(struct gpio_desc *desc, bool value)
+static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
 	int err = 0;
 	struct gpio_chip *chip = desc->gdev->chip;
@@ -2542,7 +2542,7 @@ static void _gpio_set_open_drain_value(struct gpio_desc *desc, bool value)
  * @desc: gpio descriptor whose state need to be set.
  * @value: Non-zero for setting it HIGH otherwise it will set to LOW.
  */
-static void _gpio_set_open_source_value(struct gpio_desc *desc, bool value)
+static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
 	int err = 0;
 	struct gpio_chip *chip = desc->gdev->chip;
@@ -2564,16 +2564,16 @@ static void _gpio_set_open_source_value(struct gpio_desc *desc, bool value)
 			  __func__, err);
 }
 
-static void _gpiod_set_raw_value(struct gpio_desc *desc, bool value)
+static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
 	struct gpio_chip	*chip;
 
 	chip = desc->gdev->chip;
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
-		_gpio_set_open_drain_value(desc, value);
+		gpio_set_open_drain_value_commit(desc, value);
 	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
-		_gpio_set_open_source_value(desc, value);
+		gpio_set_open_source_value_commit(desc, value);
 	else
 		chip->set(chip, gpio_chip_hwgpio(desc), value);
 }
@@ -2631,9 +2631,9 @@ void gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			 * open drain and open source outputs are set individually
 			 */
 			if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
-				_gpio_set_open_drain_value(desc, value);
+				gpio_set_open_drain_value_commit(desc, value);
 			} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
-				_gpio_set_open_source_value(desc, value);
+				gpio_set_open_source_value_commit(desc, value);
 			} else {
 				__set_bit(hwgpio, mask);
 				if (value)
@@ -2667,7 +2667,7 @@ void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 	VALIDATE_DESC_VOID(desc);
 	/* Should be using gpiod_set_value_cansleep() */
 	WARN_ON(desc->gdev->chip->can_sleep);
-	_gpiod_set_raw_value(desc, value);
+	gpiod_set_raw_value_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
 
@@ -2689,7 +2689,7 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
 	WARN_ON(desc->gdev->chip->can_sleep);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
-	_gpiod_set_raw_value(desc, value);
+	gpiod_set_raw_value_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_value);
 
@@ -2908,7 +2908,7 @@ int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
 	might_sleep_if(extra_checks);
 	VALIDATE_DESC(desc);
-	return _gpiod_get_raw_value(desc);
+	return gpiod_get_raw_value_commit(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value_cansleep);
 
@@ -2927,7 +2927,7 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 
 	might_sleep_if(extra_checks);
 	VALIDATE_DESC(desc);
-	value = _gpiod_get_raw_value(desc);
+	value = gpiod_get_raw_value_commit(desc);
 	if (value < 0)
 		return value;
 
@@ -2952,7 +2952,7 @@ void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
 {
 	might_sleep_if(extra_checks);
 	VALIDATE_DESC_VOID(desc);
-	_gpiod_set_raw_value(desc, value);
+	gpiod_set_raw_value_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value_cansleep);
 
@@ -2972,7 +2972,7 @@ void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 	VALIDATE_DESC_VOID(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
-	_gpiod_set_raw_value(desc, value);
+	gpiod_set_raw_value_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
 
-- 
2.13.5

