From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: add API to be strict about GPIO IRQ usage
Date: Fri, 11 Oct 2013 11:32:15 +0200
Message-ID: <1381483935-12165-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:64472 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756666Ab3JKJc0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 05:32:26 -0400
Received: by mail-wi0-f172.google.com with SMTP id hj8so802674wib.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 02:32:25 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Stephen Warren <swarren@wwwdotorg.org>

It is currently often possible in many GPIO drivers to request
a GPIO line to be used as IRQ after calling gpio_to_irq() and,
as the gpiolib is not aware of this, set the same line to
output and start driving it, with undesired side effects.

As it is a bogus usage scenario to request a line flagged as
output to used as IRQ, we introduce APIs to let gpiolib track
the use of a line as IRQ, and also set this flag from the
userspace ABI.

The API is symmetric so that lines can also be flagged from
.irq_enable() and unflagged from IRQ by .irq_disable().
The debugfs file is altered so that we see if a line is
reserved for IRQ.

Cc: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c     | 88 ++++++++++++++++++++++++++++++++++++++++++++--
 include/asm-generic/gpio.h |  3 ++
 include/linux/gpio.h       | 12 +++++++
 3 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4fc2860..1014cb5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -60,6 +60,7 @@ struct gpio_desc {
 #define FLAG_ACTIVE_LOW	6	/* sysfs value has active low */
 #define FLAG_OPEN_DRAIN	7	/* Gpio is open drain type */
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
+#define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 
 #define ID_SHIFT	16	/* add new flags before this one */
 
@@ -96,6 +97,8 @@ static int gpiod_get_value(const struct gpio_desc *desc);
 static void gpiod_set_value(struct gpio_desc *desc, int value);
 static int gpiod_cansleep(const struct gpio_desc *desc);
 static int gpiod_to_irq(const struct gpio_desc *desc);
+static int gpiod_lock_as_irq(struct gpio_desc *desc);
+static void gpiod_unlock_as_irq(struct gpio_desc *desc);
 static int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
 static int gpiod_export_link(struct device *dev, const char *name,
 			     struct gpio_desc *desc);
@@ -163,6 +166,17 @@ static struct gpio_desc *gpio_to_desc(unsigned gpio)
 }
 
 /**
+ * Convert an offset on a certain chip to a corresponding descriptor
+ */
+static struct gpio_desc *gpiochip_offset_to_desc(struct gpio_chip *chip,
+						 unsigned int offset)
+{
+	unsigned int gpio = chip->base + offset;
+
+	return gpio_to_desc(gpio);
+}
+
+/**
  * Convert a GPIO descriptor to the integer namespace.
  * This should disappear in the future but is needed since we still
  * use GPIO numbers for error messages and sysfs nodes
@@ -428,6 +442,7 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 	desc->flags &= ~GPIO_TRIGGER_MASK;
 
 	if (!gpio_flags) {
+		gpiod_unlock_as_irq(desc);
 		ret = 0;
 		goto free_id;
 	}
@@ -466,6 +481,12 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 	if (ret < 0)
 		goto free_id;
 
+	ret = gpiod_lock_as_irq(desc);
+	if (ret < 0) {
+		gpiod_warn(desc, "failed to flag the GPIO for IRQ\n");
+		goto free_id;
+	}
+
 	desc->flags |= gpio_flags;
 	return 0;
 
@@ -1730,6 +1751,14 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
 		return -EINVAL;
 	}
 
+	/* GPIOs used for IRQs shall not be set as output */
+	if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
+		gpiod_err(desc,
+			  "%s: tried to set a GPIO tied to an IRQ as output\n",
+			  __func__);
+		return -EIO;
+	}
+
 	/* Open drain pin should not be driven to 1 */
 	if (value && test_bit(FLAG_OPEN_DRAIN,  &desc->flags))
 		return gpiod_direction_input(desc);
@@ -2050,6 +2079,58 @@ int __gpio_to_irq(unsigned gpio)
 }
 EXPORT_SYMBOL_GPL(__gpio_to_irq);
 
+/**
+ * gpiod_lock_as_irq() - lock a GPIO to be used as IRQ
+ * @gpio: the GPIO line to lock as used for IRQ
+ *
+ * This is used directly by GPIO drivers that want to lock down
+ * a certain GPIO line to be used as IRQs, for example in the
+ * .to_irq() callback of their gpio_chip, or in the .irq_enable()
+ * of its irq_chip implementation if the GPIO is known from that
+ * code.
+ */
+static int gpiod_lock_as_irq(struct gpio_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	if (test_bit(FLAG_IS_OUT, &desc->flags)) {
+		gpiod_err(desc,
+			  "%s: tried to flag a GPIO set as output for IRQ\n",
+			  __func__);
+		return -EIO;
+	}
+
+	set_bit(FLAG_USED_AS_IRQ, &desc->flags);
+	return 0;
+}
+
+int gpio_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	return gpiod_lock_as_irq(gpiochip_offset_to_desc(chip, offset));
+}
+EXPORT_SYMBOL_GPL(gpio_lock_as_irq);
+
+/**
+ * gpiod_unlock_as_irq() - unlock a GPIO used as IRQ
+ * @gpio: the GPIO line to unlock from IRQ usage
+ *
+ * This is used directly by GPIO drivers that want to indicate
+ * that a certain GPIO is no longer used exclusively for IRQ.
+ */
+static void gpiod_unlock_as_irq(struct gpio_desc *desc)
+{
+	if (!desc)
+		return;
+
+	clear_bit(FLAG_USED_AS_IRQ, &desc->flags);
+}
+
+void gpio_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	return gpiod_unlock_as_irq(gpiochip_offset_to_desc(chip, offset));
+}
+EXPORT_SYMBOL_GPL(gpio_unlock_as_irq);
 
 /* There's no value in making it easy to inline GPIO calls that may sleep.
  * Common examples include ones connected to I2C or SPI chips.
@@ -2091,6 +2172,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	unsigned		gpio = chip->base;
 	struct gpio_desc	*gdesc = &chip->desc[0];
 	int			is_out;
+	int			is_irq;
 
 	for (i = 0; i < chip->ngpio; i++, gpio++, gdesc++) {
 		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
@@ -2098,12 +2180,14 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		gpiod_get_direction(gdesc);
 		is_out = test_bit(FLAG_IS_OUT, &gdesc->flags);
-		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s",
+		is_irq = test_bit(FLAG_USED_AS_IRQ, &gdesc->flags);
+		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s %s",
 			gpio, gdesc->label,
 			is_out ? "out" : "in ",
 			chip->get
 				? (chip->get(chip, i) ? "hi" : "lo")
-				: "?  ");
+				: "?  ",
+			is_irq ? "IRQ" : "   ");
 		seq_printf(s, "\n");
 	}
 }
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index bde6469..b309a5c 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -192,6 +192,9 @@ extern int __gpio_cansleep(unsigned gpio);
 
 extern int __gpio_to_irq(unsigned gpio);
 
+extern int gpio_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
+extern void gpio_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
+
 extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
 extern int gpio_request_array(const struct gpio *array, size_t num);
 extern void gpio_free_array(const struct gpio *array, size_t num);
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 552e3f4..a06ec3e 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -204,6 +204,18 @@ static inline int gpio_to_irq(unsigned gpio)
 	return -EINVAL;
 }
 
+static inline int gpio_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
+
+static inline void gpio_unlock_as_irq(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	WARN_ON(1);
+}
+
 static inline int irq_to_gpio(unsigned irq)
 {
 	/* irq can never have been returned from gpio_to_irq() */
-- 
1.8.3.1

