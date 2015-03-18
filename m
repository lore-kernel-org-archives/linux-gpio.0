From: David Cohen <david.a.cohen@linux.intel.com>
Subject: [RFC] gpio: add set_active_low() function to gpio_chip
Date: Wed, 18 Mar 2015 13:16:22 -0700
Message-ID: <1426709782-2763-1-git-send-email-david.a.cohen@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:6444 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756992AbbCRUOa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 18 Mar 2015 16:14:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>

Some gpio controllers are capable of programming its pins' active-low
state. Let's add this new gpio_chip function for such cases and use it
in gpiolib.

When set_active_low() is implemented, we no longer need to do soft flips
on values from non-raw get functions.

Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
---

Hi,

This is a RFC, not meant for integration (yet).

We have a GPIO controller that is capable of inverting the GPIO logical value
on hardware using a register (and GPIO voltage level if configured for output):
- If GPIO pin is configured for input, only the logical value is affected: the
  GPIO level stays the same but the read values are inverted (it affects even
  interrupt event triggers).
- If GPIO pin is configured for output, the GPIO level is also inverted.

Is it acceptable to expose this functionality via new gpio chip operation
set_active_low()?

Comments are welcome.

Br, David
---

 drivers/gpio/gpiolib-sysfs.c | 4 ++++
 drivers/gpio/gpiolib.c       | 6 ++++--
 include/linux/gpio/driver.h  | 2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 7722ed53bd65..316a1d008cad 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -289,11 +289,15 @@ static DEVICE_ATTR(edge, 0644, gpio_edge_show, gpio_edge_store);
 static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
 				int value)
 {
+	struct gpio_chip	*chip = desc->chip;
 	int			status = 0;
 
 	if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
 		return 0;
 
+	if (chip->set_active_low)
+		chip->set_active_low(chip, gpio_chip_hwgpio(desc), value);
+
 	if (value)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
 	else
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1ca9295b2c10..028a0d34ddab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1196,7 +1196,8 @@ int gpiod_get_value(const struct gpio_desc *desc)
 	WARN_ON(desc->chip->can_sleep);
 
 	value = _gpiod_get_raw_value(desc);
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	if (!desc->chip->set_active_low &&
+	    test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 
 	return value;
@@ -1550,7 +1551,8 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 		return 0;
 
 	value = _gpiod_get_raw_value(desc);
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	if (!desc->chip->set_active_low &&
+	    test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 
 	return value;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c497c62889d1..2d665352fd69 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -90,6 +90,8 @@ struct gpio_chip {
 						unsigned offset);
 	void			(*set)(struct gpio_chip *chip,
 						unsigned offset, int value);
+	void			(*set_active_low)(struct gpio_chip *chip,
+						unsigned offset, int value);
 	void			(*set_multiple)(struct gpio_chip *chip,
 						unsigned long *mask,
 						unsigned long *bits);
-- 
2.1.4

