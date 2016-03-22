From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: support native single-ended hardware drivers
Date: Tue, 22 Mar 2016 10:57:06 +0100
Message-ID: <1458640626-2669-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:35759 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758252AbcCVJ5P (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 05:57:15 -0400
Received: by mail-lb0-f180.google.com with SMTP id bc4so153797191lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 02:57:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael Hennerich <michael.hennerich@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Some GPIO controllers has a special hardware bit we can flip
to support open drain / source. This means that on these hardwares
we do not need to emulate OD/OS by setting the line to input
instead of actively driving it high/low. Add an optional vtable
callback to the driver set_single_ended() so that driver can
implement this in hardware if they have it.

We may need a pinctrl_gpio_set_config() call at some point to
propagate this down to a backing pin control device on systems
with split GPIO/pin control.

Reported-by: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Michael, please have a look at this and consider testing it with
your hardware and adding a .set_single_ended() callback in your
driver to see if it does what you want. I'm ready to merge this
if at least one driver make use of it.
---
 drivers/gpio/gpiolib.c      | 52 ++++++++++++++++++++++++++++++++-------------
 include/linux/gpio/driver.h | 25 +++++++++++++++++++++-
 2 files changed, 61 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 72065532c1c7..1edc830a1b51 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1509,8 +1509,8 @@ EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
-	struct gpio_chip	*chip;
-	int			status = -EINVAL;
+	struct gpio_chip *gc = desc->gdev->chip;
+	int ret;
 
 	/* GPIOs used for IRQs shall not be set as output */
 	if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
@@ -1520,28 +1520,50 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 		return -EIO;
 	}
 
-	/* Open drain pin should not be driven to 1 */
-	if (value && test_bit(FLAG_OPEN_DRAIN,  &desc->flags))
-		return gpiod_direction_input(desc);
-
-	/* Open source pin should not be driven to 0 */
-	if (!value && test_bit(FLAG_OPEN_SOURCE,  &desc->flags))
-		return gpiod_direction_input(desc);
+	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
+		/* First see if we can enable open drain in hardware */
+		if (gc->set_single_ended) {
+			ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
+						   LINE_MODE_OPEN_DRAIN);
+			if (!ret)
+				goto set_output_value;
+		}
+		/* Emulate open drain by not actively driving the line high */
+		if (value)
+			return gpiod_direction_input(desc);
+	}
+	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
+		if (gc->set_single_ended) {
+			ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
+						   LINE_MODE_OPEN_SOURCE);
+			if (!ret)
+				goto set_output_value;
+		}
+		/* Emulate open source by not actively driving the line low */
+		if (!value)
+			return gpiod_direction_input(desc);
+	} else {
+		/* Make sure to disable open drain/source hardware, if any */
+		if (gc->set_single_ended)
+			gc->set_single_ended(gc,
+					     gpio_chip_hwgpio(desc),
+					     LINE_MODE_PUSH_PULL);
+	}
 
-	chip = desc->gdev->chip;
-	if (!chip->set || !chip->direction_output) {
+set_output_value:
+	if (!gc->set || !gc->direction_output) {
 		gpiod_warn(desc,
 		       "%s: missing set() or direction_output() operations\n",
 		       __func__);
 		return -EIO;
 	}
 
-	status = chip->direction_output(chip, gpio_chip_hwgpio(desc), value);
-	if (status == 0)
+	ret = gc->direction_output(gc, gpio_chip_hwgpio(desc), value);
+	if (!ret)
 		set_bit(FLAG_IS_OUT, &desc->flags);
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	trace_gpio_direction(desc_to_gpio(desc), 0, status);
-	return status;
+	trace_gpio_direction(desc_to_gpio(desc), 0, ret);
+	return ret;
 }
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index bee976f82788..50882e09289b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -20,6 +20,18 @@ struct gpio_device;
 #ifdef CONFIG_GPIOLIB
 
 /**
+ * enum single_ended_mode - mode for single ended operation
+ * @LINE_MODE_PUSH_PULL: normal mode for a GPIO line, drive actively high/low
+ * @LINE_MODE_OPEN_DRAIN: set line to be open drain
+ * @LINE_MODE_OPEN_SOURCE: set line to be open source
+ */
+enum single_ended_mode {
+	LINE_MODE_PUSH_PULL,
+	LINE_MODE_OPEN_DRAIN,
+	LINE_MODE_OPEN_SOURCE,
+};
+
+/**
  * struct gpio_chip - abstract a GPIO controller
  * @label: a functional name for the GPIO device, such as a part
  *	number or the name of the SoC IP-block implementing it.
@@ -38,7 +50,15 @@ struct gpio_device;
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
  * @set_debounce: optional hook for setting debounce time for specified gpio in
- *      interrupt triggered gpio chips
+ *	interrupt triggered gpio chips
+ * @set_single_ended: optional hook for setting a line as open drain, open
+ *	source, or non-single ended (restore from open drain/source to normal
+ *	push-pull mode) this should be implemented if the hardware supports
+ *	open drain or open source settings. The GPIOlib will otherwise try
+ *	to emulate open drain/source by not actively driving lines high/low
+ *	if a consumer request this. The driver may return -ENOTSUPP if e.g.
+ *	it supports just open drain but not open source and is called
+ *	with LINE_MODE_OPEN_SOURCE as mode argument.
  * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code
@@ -130,6 +150,9 @@ struct gpio_chip {
 	int			(*set_debounce)(struct gpio_chip *chip,
 						unsigned offset,
 						unsigned debounce);
+	int			(*set_single_ended)(struct gpio_chip *chip,
+						unsigned offset,
+						enum single_ended_mode mode);
 
 	int			(*to_irq)(struct gpio_chip *chip,
 						unsigned offset);
-- 
2.4.3

