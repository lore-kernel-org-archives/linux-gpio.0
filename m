From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: [RFC 1/2] gpio: make the GPIOs shareable
Date: Wed, 29 Jan 2014 17:11:15 +0100
Message-ID: <1391011876-7207-2-git-send-email-jjhiblot@traphandler.com>
References: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:56078 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998AbaA2QO4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2014 11:14:56 -0500
Received: by mail-wg0-f43.google.com with SMTP id y10so4018594wgg.22
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2014 08:14:54 -0800 (PST)
In-Reply-To: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>

The patch implements a new requesting scheme for GPIOs that allow a gpio to be
requested more than once.

This new request scheme is:
* only 1 user can request a GPIO with a full control over the direction of the
  GPIO. Full control means being able to configure the gpio as an input or as
  an ouput.
* several users can request a GPIO with a limited control over the direction.
  Limited control means: the gpio can be configured as an input if someone
  doesn't have a full control of the direction. It can't be never be configured
  as an output.
* a GPIO used as an interrupt source can't be configured as an output.

To achieve this, a unique gpio_desc is returned by gpiod_request. The old
gpio_desc is replaced by a gpio_hw_desc. Integer name space is still supported
and a gpio requested by its number is requested with full direction control.

This patch is for RFC only. I feel that the API change need to be discussed
before going further. Also there are probably some race conditions that are
more important to fix now than when a gpio was an exclusive property.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
---
 drivers/gpio/gpiolib-acpi.c   |   8 +-
 drivers/gpio/gpiolib-of.c     |   8 +-
 drivers/gpio/gpiolib.c        | 844 +++++++++++++++++++++++++-----------------
 include/asm-generic/gpio.h    |  30 +-
 include/linux/acpi_gpio.h     |   8 +-
 include/linux/gpio.h          |   6 +
 include/linux/gpio/consumer.h |  40 +-
 include/linux/gpio/driver.h   |   8 +-
 include/linux/of_gpio.h       |  13 +-
 9 files changed, 584 insertions(+), 381 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index ae0ffdc..034c1d8 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -41,7 +41,7 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
  * error value
  */
 
-static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
+static struct gpio_hw_desc *acpi_get_gpiod(char *path, int pin)
 {
 	struct gpio_chip *chip;
 	acpi_handle handle;
@@ -58,7 +58,7 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 	if (pin < 0 || pin > chip->ngpio)
 		return ERR_PTR(-EINVAL);
 
-	return gpio_to_desc(chip->base + pin);
+	return gpio_to_hw_desc(chip->base + pin);
 }
 
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
@@ -235,7 +235,7 @@ EXPORT_SYMBOL(acpi_gpiochip_free_interrupts);
 struct acpi_gpio_lookup {
 	struct acpi_gpio_info info;
 	int index;
-	struct gpio_desc *desc;
+	struct gpio_hw_desc *desc;
 	int n;
 };
 
@@ -277,7 +277,7 @@ static int acpi_find_gpio(struct acpi_resource *ares, void *data)
  * Note: if the GPIO resource has multiple entries in the pin list, this
  * function only returns the first.
  */
-struct gpio_desc *acpi_get_gpiod_by_index(struct device *dev, int index,
+struct gpio_hw_desc *acpi_get_gpiod_by_index(struct device *dev, int index,
 					  struct acpi_gpio_info *info)
 {
 	struct acpi_gpio_lookup lookup;
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e0a98f5..42d68be 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -22,14 +22,14 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/slab.h>
 
-struct gpio_desc;
+struct gpio_hw_desc;
 
 /* Private data structure for of_gpiochip_find_and_xlate */
 struct gg_data {
 	enum of_gpio_flags *flags;
 	struct of_phandle_args gpiospec;
 
-	struct gpio_desc *out_gpio;
+	struct gpio_hw_desc *out_gpio;
 };
 
 /* Private function for resolving node pointer to gpio_chip */
@@ -47,7 +47,7 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
 	if (ret < 0)
 		return false;
 
-	gg_data->out_gpio = gpio_to_desc(ret + gc->base);
+	gg_data->out_gpio = gpio_to_hw_desc(ret + gc->base);
 	return true;
 }
 
@@ -62,7 +62,7 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
  * value on the error condition. If @flags is not NULL the function also fills
  * in flags for the GPIO.
  */
-struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+struct gpio_hw_desc *of_get_named_gpiod_flags(struct device_node *np,
 		     const char *propname, int index, enum of_gpio_flags *flags)
 {
 	/* Return -EPROBE_DEFER to support probe() functions to be called
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 85f772c..a45cdc3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -39,17 +39,18 @@
 #define	extra_checks	0
 #endif
 
-/* gpio_lock prevents conflicts during gpio_desc[] table updates.
+/* gpio_lock prevents conflicts during gpio_hw_desc[] table updates.
  * While any GPIO is requested, its gpio_chip is not removable;
  * each GPIO's "requested" flag serves as a lock and refcount.
  */
 static DEFINE_SPINLOCK(gpio_lock);
 
-struct gpio_desc {
+struct gpio_desc;
+
+struct gpio_hw_desc {
 	struct gpio_chip	*chip;
 	unsigned long		flags;
 /* flag symbols are bit numbers */
-#define FLAG_REQUESTED	0
 #define FLAG_IS_OUT	1
 #define FLAG_EXPORT	2	/* protected by sysfs_lock */
 #define FLAG_SYSFS	3	/* exported via /sys/class/gpio/control */
@@ -59,7 +60,6 @@ struct gpio_desc {
 #define FLAG_OPEN_DRAIN	7	/* Gpio is open drain type */
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
-
 #define ID_SHIFT	16	/* add new flags before this one */
 
 #define GPIO_FLAGS_MASK		((1 << ID_SHIFT) - 1)
@@ -68,9 +68,25 @@ struct gpio_desc {
 #ifdef CONFIG_DEBUG_FS
 	const char		*label;
 #endif
+	struct list_head	list;
+	struct gpio_desc	*integer_based_owner;
+	struct gpio_desc	*sysfs_owner;
 };
-static struct gpio_desc gpio_desc[ARCH_NR_GPIOS];
+static struct gpio_hw_desc gpio_hw_desc[ARCH_NR_GPIOS];
 
+struct gpio_desc {
+	struct gpio_hw_desc *hw;
+	struct list_head list;
+#ifdef CONFIG_DEBUG_FS
+	const char		*label;
+#endif
+	unsigned long flags;
+};
+
+static struct gpio_hw_desc *desc_to_hw_desc(const struct gpio_desc *desc)
+{
+	return desc ? desc->hw : NULL;
+}
 #define GPIO_OFFSET_VALID(chip, offset) (offset >= 0 && offset < chip->ngpio)
 
 static DEFINE_MUTEX(gpio_lookup_lock);
@@ -81,54 +97,93 @@ static LIST_HEAD(gpio_chips);
 static DEFINE_IDR(dirent_idr);
 #endif
 
-static int gpiod_request(struct gpio_desc *desc, const char *label);
+static struct gpio_desc *__gpiod_request(struct gpio_hw_desc *hw_desc,
+					  const char *label,
+					  int is_integer_based,
+					  unsigned long gpio_flags);
 static void gpiod_free(struct gpio_desc *desc);
 
+static int hw_gpiod_direction_output(struct gpio_hw_desc *hw, int value);
+static int hw_gpiod_direction_input(struct gpio_hw_desc *hw);
+static int hw_gpiod_get_value_cansleep(const struct gpio_hw_desc *hw);
+static void hw_gpiod_set_value_cansleep(struct gpio_hw_desc *hw, int value);
+
 #ifdef CONFIG_DEBUG_FS
 #define gpiod_emerg(desc, fmt, ...)			                \
-	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label, \
+	pr_emerg("gpio-%d (%s): " fmt, hw_desc_to_gpio(desc), desc->label, \
                  ##__VA_ARGS__)
 #define gpiod_crit(desc, fmt, ...)			                \
-	pr_crit("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+	pr_crit("gpio-%d (%s): " fmt, hw_desc_to_gpio(desc), desc->label,  \
                  ##__VA_ARGS__)
 #define gpiod_err(desc, fmt, ...)				        \
-	pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,   \
+	pr_err("gpio-%d (%s): " fmt, hw_desc_to_gpio(desc), desc->label,   \
                  ##__VA_ARGS__)
 #define gpiod_warn(desc, fmt, ...)				        \
-	pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+	pr_warn("gpio-%d (%s): " fmt, hw_desc_to_gpio(desc), desc->label,  \
                  ##__VA_ARGS__)
 #define gpiod_info(desc, fmt, ...)				        \
-	pr_info("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+	pr_info("gpio-%d (%s): " fmt, hw_desc_to_gpio(desc), desc->label,  \
                 ##__VA_ARGS__)
 #define gpiod_dbg(desc, fmt, ...)				   \
-	pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label, \
+	pr_debug("gpio-%d (%s): " fmt, hw_desc_to_gpio(desc), desc->label, \
                  ##__VA_ARGS__)
 #else
 #define gpiod_emerg(desc, fmt, ...)			           \
-	pr_emerg("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+	pr_emerg("gpio-%d: " fmt, hw_desc_to_gpio(desc), ##__VA_ARGS__)
 #define gpiod_crit(desc, fmt, ...)			           \
-	pr_crit("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+	pr_crit("gpio-%d: " fmt, hw_desc_to_gpio(desc), ##__VA_ARGS__)
 #define gpiod_err(desc, fmt, ...)				   \
-	pr_err("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+	pr_err("gpio-%d: " fmt, hw_desc_to_gpio(desc), ##__VA_ARGS__)
 #define gpiod_warn(desc, fmt, ...)				   \
-	pr_warn("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+	pr_warn("gpio-%d: " fmt, hw_desc_to_gpio(desc), ##__VA_ARGS__)
 #define gpiod_info(desc, fmt, ...)				   \
-	pr_info("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+	pr_info("gpio-%d: " fmt, hw_desc_to_gpio(desc), ##__VA_ARGS__)
 #define gpiod_dbg(desc, fmt, ...)				   \
-	pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+	pr_debug("gpio-%d: " fmt, hw_desc_to_gpio(desc), ##__VA_ARGS__)
 #endif
 
+#ifdef CONFIG_DEBUG_FS
+static inline const char *desc_to_str(struct gpio_desc *d)
+{
+	return d->label;
+}
+static inline void hw_desc_construct_label(struct gpio_hw_desc *hw)
+{
+	struct gpio_desc *d;
+	char *str;
+	int sz = 0;
+	int first = 1;
+	list_for_each_entry(d, &hw->list, list) {
+		sz += strlen(desc_to_str(d)) + 2;
+	}
+	str = kzalloc(sz, GFP_KERNEL);
+	list_for_each_entry(d, &hw->list, list) {
+		if (!first)
+			strcat(str, ", ");
+		else
+			first = 0;
+		strcat(str, desc_to_str(d));
+	}
+	kfree(hw->label);
+	hw->label = str;
+}
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
-#ifdef CONFIG_DEBUG_FS
 	d->label = label;
-#endif
 }
+#else
+static inline void hw_desc_construct_label(struct gpio_hw_desc *hw)
+{
+}
+static inline void desc_set_label(struct gpio_desc *d, const char *label)
+{
+}
+#endif
 
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
  */
-static int gpio_chip_hwgpio(const struct gpio_desc *desc)
+static int gpio_chip_hwgpio(const struct gpio_hw_desc *desc)
 {
 	return desc - &desc->chip->desc[0];
 }
@@ -136,24 +191,24 @@ static int gpio_chip_hwgpio(const struct gpio_desc *desc)
 /**
  * Convert a GPIO number to its descriptor
  */
-struct gpio_desc *gpio_to_desc(unsigned gpio)
+struct gpio_hw_desc *gpio_to_hw_desc(unsigned gpio)
 {
 	if (WARN(!gpio_is_valid(gpio), "invalid GPIO %d\n", gpio))
 		return NULL;
 	else
-		return &gpio_desc[gpio];
+		return &gpio_hw_desc[gpio];
 }
-EXPORT_SYMBOL_GPL(gpio_to_desc);
+EXPORT_SYMBOL_GPL(gpio_to_hw_desc);
 
 /**
  * Convert an offset on a certain chip to a corresponding descriptor
  */
-static struct gpio_desc *gpiochip_offset_to_desc(struct gpio_chip *chip,
+static struct gpio_hw_desc *gpiochip_offset_to_desc(struct gpio_chip *chip,
 						 unsigned int offset)
 {
 	unsigned int gpio = chip->base + offset;
 
-	return gpio_to_desc(gpio);
+	return gpio_to_hw_desc(gpio);
 }
 
 /**
@@ -161,11 +216,12 @@ static struct gpio_desc *gpiochip_offset_to_desc(struct gpio_chip *chip,
  * This should disappear in the future but is needed since we still
  * use GPIO numbers for error messages and sysfs nodes
  */
-int desc_to_gpio(const struct gpio_desc *desc)
+int hw_desc_to_gpio(const struct gpio_hw_desc *desc)
 {
-	return desc - &gpio_desc[0];
+	return desc - &gpio_hw_desc[0];
 }
-EXPORT_SYMBOL_GPL(desc_to_gpio);
+EXPORT_SYMBOL_GPL(hw_desc_to_gpio);
+
 
 
 /* Warn when drivers omit gpio_request() calls -- legal but ill-advised
@@ -179,36 +235,31 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
  * only "legal" in the sense that (old) code using it won't break yet,
  * but instead only triggers a WARN() stack dump.
  */
-static int gpio_ensure_requested(struct gpio_desc *desc)
-{
-	const struct gpio_chip *chip = desc->chip;
-	const int gpio = desc_to_gpio(desc);
-
-	if (WARN(test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0,
-			"autorequest GPIO-%d\n", gpio)) {
-		if (!try_module_get(chip->owner)) {
-			pr_err("GPIO-%d: module can't be gotten \n", gpio);
-			clear_bit(FLAG_REQUESTED, &desc->flags);
-			/* lose */
-			return -EIO;
-		}
-		desc_set_label(desc, "[auto]");
-		/* caller must chip->request() w/o spinlock */
-		if (chip->request)
-			return 1;
+
+struct gpio_desc *gpio_to_desc(unsigned gpio, int auto_request)
+{
+	struct gpio_hw_desc *hw = gpio_to_hw_desc(gpio);
+	if (!hw)
+		return NULL;
+
+	if (auto_request &&  !hw->integer_based_owner) {
+		WARN(1, "auto requesting gpio %d\n", gpio);
+		__gpiod_request(gpio_to_hw_desc(gpio), "[auto]", 1,
+				DESC_FLAG_FULL_CONTROL);
 	}
-	return 0;
+
+	return hw->integer_based_owner;
 }
 
 /**
  * gpiod_to_chip - Return the GPIO chip to which a GPIO descriptor belongs
  * @desc:	descriptor to return the chip of
  */
-struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
+struct gpio_chip *hw_gpiod_to_chip(const struct gpio_hw_desc *desc)
 {
 	return desc ? desc->chip : NULL;
 }
-EXPORT_SYMBOL_GPL(gpiod_to_chip);
+EXPORT_SYMBOL_GPL(hw_gpiod_to_chip);
 
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
@@ -242,14 +293,14 @@ static int gpiochip_find_base(int ngpio)
  *
  * This function may sleep if gpiod_cansleep() is true.
  */
-int gpiod_get_direction(const struct gpio_desc *desc)
+int hw_gpiod_get_direction(const struct gpio_hw_desc *hw)
 {
 	struct gpio_chip	*chip;
 	unsigned		offset;
 	int			status = -EINVAL;
 
-	chip = gpiod_to_chip(desc);
-	offset = gpio_chip_hwgpio(desc);
+	chip = hw_gpiod_to_chip(hw);
+	offset = gpio_chip_hwgpio(hw);
 
 	if (!chip->get_direction)
 		return status;
@@ -260,14 +311,21 @@ int gpiod_get_direction(const struct gpio_desc *desc)
 		status = 1;
 		/* FLAG_IS_OUT is just a cache of the result of get_direction(),
 		 * so it does not affect constness per se */
-		clear_bit(FLAG_IS_OUT, &((struct gpio_desc *)desc)->flags);
+		clear_bit(FLAG_IS_OUT, &((struct gpio_hw_desc *)hw)->flags);
 	}
 	if (status == 0) {
 		/* GPIOF_DIR_OUT */
-		set_bit(FLAG_IS_OUT, &((struct gpio_desc *)desc)->flags);
+		set_bit(FLAG_IS_OUT, &((struct gpio_hw_desc *)hw)->flags);
 	}
 	return status;
 }
+int gpiod_get_direction(const struct gpio_desc *desc)
+{
+	struct gpio_hw_desc	*hw = desc_to_hw_desc(desc);
+	if (hw)
+		return hw_gpiod_get_direction(hw);
+	return -EINVAL;
+}
 EXPORT_SYMBOL_GPL(gpiod_get_direction);
 
 #ifdef CONFIG_GPIO_SYSFS
@@ -301,7 +359,7 @@ static DEFINE_MUTEX(sysfs_lock);
 static ssize_t gpio_direction_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	const struct gpio_desc	*desc = dev_get_drvdata(dev);
+	const struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -309,7 +367,7 @@ static ssize_t gpio_direction_show(struct device *dev,
 	if (!test_bit(FLAG_EXPORT, &desc->flags)) {
 		status = -EIO;
 	} else {
-		gpiod_get_direction(desc);
+		hw_gpiod_get_direction(desc);
 		status = sprintf(buf, "%s\n",
 			test_bit(FLAG_IS_OUT, &desc->flags)
 				? "out" : "in");
@@ -322,7 +380,7 @@ static ssize_t gpio_direction_show(struct device *dev,
 static ssize_t gpio_direction_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -330,11 +388,11 @@ static ssize_t gpio_direction_store(struct device *dev,
 	if (!test_bit(FLAG_EXPORT, &desc->flags))
 		status = -EIO;
 	else if (sysfs_streq(buf, "high"))
-		status = gpiod_direction_output(desc, 1);
+		status = hw_gpiod_direction_output(desc, 1);
 	else if (sysfs_streq(buf, "out") || sysfs_streq(buf, "low"))
-		status = gpiod_direction_output(desc, 0);
+		status = hw_gpiod_direction_output(desc, 0);
 	else if (sysfs_streq(buf, "in"))
-		status = gpiod_direction_input(desc);
+		status = hw_gpiod_direction_input(desc);
 	else
 		status = -EINVAL;
 
@@ -348,7 +406,7 @@ static /* const */ DEVICE_ATTR(direction, 0644,
 static ssize_t gpio_value_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -356,7 +414,8 @@ static ssize_t gpio_value_show(struct device *dev,
 	if (!test_bit(FLAG_EXPORT, &desc->flags))
 		status = -EIO;
 	else
-		status = sprintf(buf, "%d\n", gpiod_get_value_cansleep(desc));
+		status = sprintf(buf, "%d\n",
+				 hw_gpiod_get_value_cansleep(desc));
 
 	mutex_unlock(&sysfs_lock);
 	return status;
@@ -365,7 +424,7 @@ static ssize_t gpio_value_show(struct device *dev,
 static ssize_t gpio_value_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -379,7 +438,7 @@ static ssize_t gpio_value_store(struct device *dev,
 
 		status = kstrtol(buf, 0, &value);
 		if (status == 0) {
-			gpiod_set_value_cansleep(desc, value);
+			hw_gpiod_set_value_cansleep(desc, value);
 			status = size;
 		}
 	}
@@ -399,7 +458,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
+static int gpio_setup_irq(struct gpio_hw_desc *desc, struct device *dev,
 		unsigned long gpio_flags)
 {
 	struct sysfs_dirent	*value_sd;
@@ -409,7 +468,7 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 	if ((desc->flags & GPIO_TRIGGER_MASK) == gpio_flags)
 		return 0;
 
-	irq = gpiod_to_irq(desc);
+	irq = hw_gpiod_to_irq(desc);
 	if (irq < 0)
 		return -EIO;
 
@@ -492,7 +551,7 @@ static const struct {
 static ssize_t gpio_edge_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	const struct gpio_desc	*desc = dev_get_drvdata(dev);
+	const struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -519,7 +578,7 @@ static ssize_t gpio_edge_show(struct device *dev,
 static ssize_t gpio_edge_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 	int			i;
 
@@ -546,7 +605,7 @@ found:
 
 static DEVICE_ATTR(edge, 0644, gpio_edge_show, gpio_edge_store);
 
-static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
+static int sysfs_set_active_low(struct gpio_hw_desc *desc, struct device *dev,
 				int value)
 {
 	int			status = 0;
@@ -574,7 +633,7 @@ static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
 static ssize_t gpio_active_low_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	const struct gpio_desc	*desc = dev_get_drvdata(dev);
+	const struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -593,7 +652,7 @@ static ssize_t gpio_active_low_show(struct device *dev,
 static ssize_t gpio_active_low_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpio_hw_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -682,40 +741,51 @@ static ssize_t export_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
 	int			status;
+	struct gpio_hw_desc	*hw;
+	struct gpio_desc	*desc;
+	int direction_may_change = true;
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	hw = gpio_to_hw_desc(gpio);
 	/* reject invalid GPIOs */
-	if (!desc) {
+	if (!hw) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
 		return -EINVAL;
 	}
 
+	if (test_and_set_bit(FLAG_SYSFS, &hw->flags))
+		return -EBUSY;
+
 	/* No extra locking here; FLAG_SYSFS just signifies that the
 	 * request and export were done by on behalf of userspace, so
 	 * they may be undone on its behalf too.
 	 */
 
-	status = gpiod_request(desc, "sysfs");
-	if (status < 0) {
+	desc = __gpiod_request(hw, "sysfs", 0, DESC_FLAG_FULL_CONTROL);
+	if (PTR_ERR(desc) == -EBUSY) {
+		direction_may_change = false;
+		desc = __gpiod_request(hw, "sysfs", 0, 0);
+	}
+	if (IS_ERR(desc)) {
+		status = PTR_ERR(desc);
 		if (status == -EPROBE_DEFER)
 			status = -ENODEV;
 		goto done;
 	}
-	status = gpiod_export(desc, true);
+
+	status = gpiod_export(desc, direction_may_change);
 	if (status < 0)
 		gpiod_free(desc);
-	else
-		set_bit(FLAG_SYSFS, &desc->flags);
 
 done:
-	if (status)
+	if (status) {
+		clear_bit(FLAG_SYSFS, &hw->flags);
 		pr_debug("%s: status %d\n", __func__, status);
+	}
 	return status ? : len;
 }
 
@@ -724,16 +794,16 @@ static ssize_t unexport_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
+	struct gpio_hw_desc	*hw;
 	int			status;
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	hw = gpio_to_hw_desc(gpio);
 	/* reject bogus commands (gpio_unexport ignores them) */
-	if (!desc) {
+	if (!hw) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
 		return -EINVAL;
 	}
@@ -744,9 +814,11 @@ static ssize_t unexport_store(struct class *class,
 	 * request and export were done by on behalf of userspace, so
 	 * they may be undone on its behalf too.
 	 */
-	if (test_and_clear_bit(FLAG_SYSFS, &desc->flags)) {
+
+	if (test_bit(FLAG_SYSFS, &hw->flags)) {
 		status = 0;
-		gpiod_free(desc);
+		gpiod_free(hw->sysfs_owner);
+		clear_bit(FLAG_SYSFS, &hw->flags);
 	}
 done:
 	if (status)
@@ -790,6 +862,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	const char		*ioname = NULL;
 	struct device		*dev;
 	int			offset;
+	struct gpio_hw_desc	*hw = desc_to_hw_desc(desc);
 
 	/* can't export until sysfs is available ... */
 	if (!gpio_class.p) {
@@ -797,36 +870,37 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		return -ENOENT;
 	}
 
-	if (!desc) {
+	if (!hw) {
 		pr_debug("%s: invalid gpio descriptor\n", __func__);
 		return -EINVAL;
 	}
 
+
 	mutex_lock(&sysfs_lock);
 
 	spin_lock_irqsave(&gpio_lock, flags);
-	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
-	     test_bit(FLAG_EXPORT, &desc->flags)) {
+	if (list_empty(&hw->list) ||
+	     test_bit(FLAG_EXPORT, &hw->flags)) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		pr_debug("%s: gpio %d unavailable (requested=%d, exported=%d)\n",
-				__func__, desc_to_gpio(desc),
-				test_bit(FLAG_REQUESTED, &desc->flags),
-				test_bit(FLAG_EXPORT, &desc->flags));
+				__func__, hw_desc_to_gpio(hw),
+				(list_empty(&hw->list) ? 0 : 1),
+				test_bit(FLAG_EXPORT, &hw->flags));
 		status = -EPERM;
 		goto fail_unlock;
 	}
 
-	if (!desc->chip->direction_input || !desc->chip->direction_output)
+	if (!hw->chip->direction_input || !hw->chip->direction_output)
 		direction_may_change = false;
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	offset = gpio_chip_hwgpio(desc);
-	if (desc->chip->names && desc->chip->names[offset])
-		ioname = desc->chip->names[offset];
+	offset = gpio_chip_hwgpio(hw);
+	if (hw->chip->names && hw->chip->names[offset])
+		ioname = hw->chip->names[offset];
 
-	dev = device_create(&gpio_class, desc->chip->dev, MKDEV(0, 0),
-			    desc, ioname ? ioname : "gpio%u",
-			    desc_to_gpio(desc));
+	dev = device_create(&gpio_class, hw->chip->dev, MKDEV(0, 0),
+			    hw, ioname ? ioname : "gpio%u",
+			    hw_desc_to_gpio(hw));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);
 		goto fail_unlock;
@@ -842,14 +916,15 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 			goto fail_unregister_device;
 	}
 
-	if (gpiod_to_irq(desc) >= 0 && (direction_may_change ||
-				       !test_bit(FLAG_IS_OUT, &desc->flags))) {
+	if (hw_gpiod_to_irq(hw) >= 0 && (direction_may_change ||
+				       !test_bit(FLAG_IS_OUT, &hw->flags))) {
 		status = device_create_file(dev, &dev_attr_edge);
 		if (status)
 			goto fail_unregister_device;
 	}
 
-	set_bit(FLAG_EXPORT, &desc->flags);
+	hw->sysfs_owner = desc;
+	set_bit(FLAG_EXPORT, &hw->flags);
 	mutex_unlock(&sysfs_lock);
 	return 0;
 
@@ -857,7 +932,7 @@ fail_unregister_device:
 	device_unregister(dev);
 fail_unlock:
 	mutex_unlock(&sysfs_lock);
-	pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
+	pr_debug("%s: gpio%d status %d\n", __func__, hw_desc_to_gpio(hw),
 		 status);
 	return status;
 }
@@ -880,7 +955,7 @@ static int match_export(struct device *dev, const void *data)
  * Returns zero on success, else an error.
  */
 int gpiod_export_link(struct device *dev, const char *name,
-		      struct gpio_desc *desc)
+		      struct gpio_hw_desc *desc)
 {
 	int			status = -EINVAL;
 
@@ -906,8 +981,8 @@ int gpiod_export_link(struct device *dev, const char *name,
 	mutex_unlock(&sysfs_lock);
 
 	if (status)
-		pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
-			 status);
+		pr_debug("%s: gpio%d status %d\n", __func__,
+			 hw_desc_to_gpio(desc), status);
 
 	return status;
 }
@@ -925,7 +1000,7 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  *
  * Returns zero on success, else an error.
  */
-int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value)
+int gpiod_sysfs_set_active_low(struct gpio_hw_desc *desc, int value)
 {
 	struct device		*dev = NULL;
 	int			status = -EINVAL;
@@ -951,8 +1026,8 @@ unlock:
 	mutex_unlock(&sysfs_lock);
 
 	if (status)
-		pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
-			 status);
+		pr_debug("%s: gpio%d status %d\n", __func__,
+			 hw_desc_to_gpio(desc), status);
 
 	return status;
 }
@@ -968,22 +1043,30 @@ void gpiod_unexport(struct gpio_desc *desc)
 {
 	int			status = 0;
 	struct device		*dev = NULL;
+	struct gpio_hw_desc	*hw = desc_to_hw_desc(desc);
 
-	if (!desc) {
+	if (!hw) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return;
 	}
-
 	mutex_lock(&sysfs_lock);
 
-	if (test_bit(FLAG_EXPORT, &desc->flags)) {
+	if (desc != hw->sysfs_owner) {
+		mutex_unlock(&sysfs_lock);
+		pr_warn("%s: GPIO %s doesn't own the export for gpio %d\n",
+			__func__, desc->label, hw_desc_to_gpio(hw));
+		return;
+	}
 
-		dev = class_find_device(&gpio_class, NULL, desc, match_export);
+	if (test_bit(FLAG_EXPORT, &hw->flags)) {
+
+		dev = class_find_device(&gpio_class, NULL, hw, match_export);
 		if (dev) {
-			gpio_setup_irq(desc, dev, 0);
-			clear_bit(FLAG_EXPORT, &desc->flags);
+			gpio_setup_irq(hw, dev, 0);
+			clear_bit(FLAG_EXPORT, &hw->flags);
 		} else
 			status = -ENODEV;
+		hw->sysfs_owner = NULL;
 	}
 
 	mutex_unlock(&sysfs_lock);
@@ -994,8 +1077,8 @@ void gpiod_unexport(struct gpio_desc *desc)
 	}
 
 	if (status)
-		pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
-			 status);
+		pr_debug("%s: gpio%d status %d\n", __func__,
+			 hw_desc_to_gpio(hw), status);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
@@ -1187,11 +1270,12 @@ int gpiochip_add(struct gpio_chip *chip)
 	status = gpiochip_add_to_list(chip);
 
 	if (status == 0) {
-		chip->desc = &gpio_desc[chip->base];
+		chip->desc = &gpio_hw_desc[chip->base];
 
 		for (id = 0; id < chip->ngpio; id++) {
-			struct gpio_desc *desc = &chip->desc[id];
+			struct gpio_hw_desc *desc = &chip->desc[id];
 			desc->chip = chip;
+			INIT_LIST_HEAD(&desc->list);
 
 			/* REVISIT:  most hardware initializes GPIOs as
 			 * inputs (often with pullups enabled) so power
@@ -1256,7 +1340,7 @@ int gpiochip_remove(struct gpio_chip *chip)
 	of_gpiochip_remove(chip);
 
 	for (id = 0; id < chip->ngpio; id++) {
-		if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags)) {
+		if (list_empty(&chip->desc[id].list)) {
 			status = -EBUSY;
 			break;
 		}
@@ -1441,78 +1525,160 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
 
 #endif /* CONFIG_PINCTRL */
 
+static struct gpio_desc *get_full_control_owner(struct gpio_hw_desc *hw)
+{
+	struct gpio_desc *d;
+	list_for_each_entry(d, &hw->list, list) {
+		if (d->flags & DESC_FLAG_FULL_CONTROL)
+			return d;
+	}
+	return NULL;
+}
+
 /* These "optional" allocation calls help prevent drivers from stomping
  * on each other, and help provide better diagnostics in debugfs.
  * They're called even less than the "set direction" calls.
  */
-static int gpiod_request(struct gpio_desc *desc, const char *label)
+static struct gpio_desc *__gpiod_request(struct gpio_hw_desc *hw_desc,
+					  const char *label,
+					  int is_integer_based,
+					  unsigned long gpio_flags)
 {
+	struct gpio_desc	*desc;
 	struct gpio_chip	*chip;
 	int			status = -EPROBE_DEFER;
-	unsigned long		flags;
+	unsigned long flags;
+	int first_in_list;
 
-	if (!desc) {
+	pr_debug("%s: gpio %d label %s (%s based) with %s direction control\n",
+	       __func__, hw_desc_to_gpio(hw_desc), label,
+	       (is_integer_based ? "integer" : "descriptor"),
+		(gpio_flags & DESC_FLAG_FULL_CONTROL) ? "full" : "limited"
+	);
+
+	if (!hw_desc) {
 		pr_warn("%s: invalid GPIO\n", __func__);
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
+	desc = kzalloc(sizeof(struct gpio_desc), GFP_KERNEL);
+	if (!desc)
+		return ERR_PTR(-ENOMEM);
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	chip = desc->chip;
+	if (is_integer_based && hw_desc->integer_based_owner) {
+		status = -EBUSY;
+		goto done;
+	}
+
+	chip = hw_desc->chip;
 	if (chip == NULL)
 		goto done;
 
 	if (!try_module_get(chip->owner))
 		goto done;
 
+
+	if ((gpio_flags & DESC_FLAG_FULL_CONTROL) &&
+		get_full_control_owner(hw_desc)) {
+		module_put(chip->owner);
+		status = -EBUSY;
+		pr_debug("%s: full control already owned by %s\n", __func__,
+			 get_full_control_owner(hw_desc)->label);
+		goto done;
+	}
+
+	status = 0;
+	desc_set_label(desc, label ? : "?");
+
+#if 0
 	/* NOTE:  gpio_request() can be called in early boot,
 	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
 	 */
 
-	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0) {
-		desc_set_label(desc, label ? : "?");
+	if (test_and_set_bit(FLAG_REQUESTED, &hw_desc->flags) == 0) {
+		desc_set_label(hw_desc, label ? : "?");
 		status = 0;
 	} else {
 		status = -EBUSY;
 		module_put(chip->owner);
 		goto done;
 	}
+#endif
+	first_in_list = list_empty(&hw_desc->list);
 
-	if (chip->request) {
-		/* chip->request may sleep */
-		spin_unlock_irqrestore(&gpio_lock, flags);
-		status = chip->request(chip, gpio_chip_hwgpio(desc));
-		spin_lock_irqsave(&gpio_lock, flags);
+	list_add_tail(&desc->list, &hw_desc->list);
+	desc->hw = hw_desc;
+	desc->flags = gpio_flags;
 
-		if (status < 0) {
-			desc_set_label(desc, NULL);
-			module_put(chip->owner);
-			clear_bit(FLAG_REQUESTED, &desc->flags);
-			goto done;
+	if (is_integer_based)
+		hw_desc->integer_based_owner = desc;
+
+	if (first_in_list) {
+		if (chip->request) {
+			/* chip->request may sleep */
+			spin_unlock_irqrestore(&gpio_lock, flags);
+			status = chip->request(chip, gpio_chip_hwgpio(hw_desc));
+			spin_lock_irqsave(&gpio_lock, flags);
+
+			if (status < 0) {
+				desc_set_label(desc, NULL);
+				module_put(chip->owner);
+				goto done;
+			}
+		}
+		if (chip->get_direction) {
+			/* chip->get_direction may sleep */
+			spin_unlock_irqrestore(&gpio_lock, flags);
+			hw_gpiod_get_direction(hw_desc);
+			spin_lock_irqsave(&gpio_lock, flags);
 		}
 	}
-	if (chip->get_direction) {
-		/* chip->get_direction may sleep */
-		spin_unlock_irqrestore(&gpio_lock, flags);
-		gpiod_get_direction(desc);
-		spin_lock_irqsave(&gpio_lock, flags);
-	}
+
+
 done:
+	hw_desc_construct_label(hw_desc);
+
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
 	if (status)
 		pr_debug("_gpio_request: gpio-%d (%s) status %d\n",
-			 desc_to_gpio(desc), label ? : "?", status);
-	spin_unlock_irqrestore(&gpio_lock, flags);
-	return status;
+			 hw_desc_to_gpio(hw_desc), label ? : "?", status);
+
+	if (status) {
+		kfree(desc);
+		return ERR_PTR(status);
+	}
+
+	return desc;
+}
+
+struct gpio_desc *gpiod_request(struct gpio_hw_desc *hw_desc, const char *label,
+				unsigned long flags)
+{
+	struct gpio_desc	*d;
+	d = __gpiod_request(hw_desc, label, 0, flags);
+	return d;
 }
 
 int gpio_request(unsigned gpio, const char *label)
 {
-	return gpiod_request(gpio_to_desc(gpio), label);
+	struct gpio_desc	*d;
+	int status = 0;
+	d = __gpiod_request(gpio_to_hw_desc(gpio), label, 1,
+			    DESC_FLAG_FULL_CONTROL);
+
+	if (IS_ERR(d))
+		status = PTR_ERR(d);
+
+	return status;
 }
 EXPORT_SYMBOL_GPL(gpio_request);
 
 static void gpiod_free(struct gpio_desc *desc)
 {
+	struct gpio_hw_desc	*hw;
 	unsigned long		flags;
 	struct gpio_chip	*chip;
 
@@ -1523,33 +1689,50 @@ static void gpiod_free(struct gpio_desc *desc)
 		return;
 	}
 
+	hw = desc_to_hw_desc(desc);
+	if (!hw) {
+		WARN_ON(extra_checks);
+		return;
+	}
+
 	gpiod_unexport(desc);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	chip = desc->chip;
-	if (chip && test_bit(FLAG_REQUESTED, &desc->flags)) {
+	if (list_empty(&hw->list))
+		WARN_ON(extra_checks);
+
+	list_del(&desc->list);
+	desc_set_label(desc, NULL);
+
+	if (desc == hw->integer_based_owner)
+		hw->integer_based_owner = NULL;
+
+	if (list_empty(&hw->list)) {
+		chip = hw->chip;
+
 		if (chip->free) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
 			might_sleep_if(chip->can_sleep);
-			chip->free(chip, gpio_chip_hwgpio(desc));
+			chip->free(chip, gpio_chip_hwgpio(hw));
 			spin_lock_irqsave(&gpio_lock, flags);
 		}
-		desc_set_label(desc, NULL);
-		module_put(desc->chip->owner);
-		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
-		clear_bit(FLAG_REQUESTED, &desc->flags);
-		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
-		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
-	} else
-		WARN_ON(extra_checks);
+		clear_bit(FLAG_ACTIVE_LOW, &hw->flags);
+		clear_bit(FLAG_OPEN_DRAIN, &hw->flags);
+		clear_bit(FLAG_OPEN_SOURCE, &hw->flags);
+	}
+
+	hw_desc_construct_label(hw);
+
+	module_put(hw->chip->owner);
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	kfree(desc);
 }
 
 void gpio_free(unsigned gpio)
 {
-	gpiod_free(gpio_to_desc(gpio));
+	gpiod_free(gpio_to_desc(gpio, 0));
 }
 EXPORT_SYMBOL_GPL(gpio_free);
 
@@ -1561,27 +1744,29 @@ EXPORT_SYMBOL_GPL(gpio_free);
  */
 int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 {
-	struct gpio_desc *desc;
+	struct gpio_hw_desc	*hw = gpio_to_hw_desc(gpio);
+	struct gpio_desc	*desc;
 	int err;
 
-	desc = gpio_to_desc(gpio);
+	if (!hw)
+		return -EINVAL;
 
-	err = gpiod_request(desc, label);
-	if (err)
-		return err;
+	desc = __gpiod_request(hw, label, 1, DESC_FLAG_FULL_CONTROL);
+
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 
 	if (flags & GPIOF_OPEN_DRAIN)
-		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+		set_bit(FLAG_OPEN_DRAIN, &hw->flags);
 
 	if (flags & GPIOF_OPEN_SOURCE)
-		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		set_bit(FLAG_OPEN_SOURCE, &hw->flags);
 
 	if (flags & GPIOF_DIR_IN)
 		err = gpiod_direction_input(desc);
 	else
 		err = gpiod_direction_output(desc,
 				(flags & GPIOF_INIT_HIGH) ? 1 : 0);
-
 	if (err)
 		goto free_gpio;
 
@@ -1597,6 +1782,7 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	gpiod_free(desc);
 	return err;
 }
+
 EXPORT_SYMBOL_GPL(gpio_request_one);
 
 /**
@@ -1649,14 +1835,14 @@ EXPORT_SYMBOL_GPL(gpio_free_array);
  */
 const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_desc *desc;
+	struct gpio_hw_desc *desc;
 
 	if (!GPIO_OFFSET_VALID(chip, offset))
 		return NULL;
 
 	desc = &chip->desc[offset];
 
-	if (test_bit(FLAG_REQUESTED, &desc->flags) == 0)
+	if (list_empty(&desc->list))
 		return NULL;
 #ifdef CONFIG_DEBUG_FS
 	return desc->label;
@@ -1685,63 +1871,65 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
  *
  * Return 0 in case of success, else an error code.
  */
-int gpiod_direction_input(struct gpio_desc *desc)
+int hw_gpiod_direction_input(struct gpio_hw_desc *hw)
 {
-	unsigned long		flags;
 	struct gpio_chip	*chip;
 	int			status = -EINVAL;
 	int			offset;
 
-	if (!desc || !desc->chip) {
+	if (!hw || !hw->chip) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
 
-	chip = desc->chip;
+	chip = hw->chip;
 	if (!chip->get || !chip->direction_input) {
-		gpiod_warn(desc,
+		gpiod_warn(hw,
 			"%s: missing get() or direction_input() operations\n",
 			 __func__);
 		return -EIO;
 	}
 
-	spin_lock_irqsave(&gpio_lock, flags);
-
-	status = gpio_ensure_requested(desc);
-	if (status < 0)
-		goto fail;
-
-	/* now we know the gpio is valid and chip won't vanish */
-
-	spin_unlock_irqrestore(&gpio_lock, flags);
-
 	might_sleep_if(chip->can_sleep);
 
-	offset = gpio_chip_hwgpio(desc);
-	if (status) {
-		status = chip->request(chip, offset);
-		if (status < 0) {
-			gpiod_dbg(desc, "chip request fail, %d\n", status);
-			/* and it's not available to anyone else ...
-			 * gpio_request() is the fully clean solution.
-			 */
-			goto lose;
-		}
-	}
+	offset = gpio_chip_hwgpio(hw);
 
 	status = chip->direction_input(chip, offset);
 	if (status == 0)
-		clear_bit(FLAG_IS_OUT, &desc->flags);
+		clear_bit(FLAG_IS_OUT, &hw->flags);
+
+	trace_gpio_direction(hw_desc_to_gpio(hw), 1, status);
 
-	trace_gpio_direction(desc_to_gpio(desc), 1, status);
-lose:
-	return status;
-fail:
-	spin_unlock_irqrestore(&gpio_lock, flags);
-	if (status)
-		gpiod_dbg(desc, "%s status %d\n", __func__, status);
 	return status;
 }
+int gpiod_direction_input(struct gpio_desc *desc)
+{
+	struct gpio_desc *ouput_owner;
+	struct gpio_hw_desc *hw;
+
+	if (!desc)
+		return -EINVAL;
+
+	hw = desc_to_hw_desc(desc);
+
+	if (desc->flags & DESC_FLAG_FULL_CONTROL)
+		return hw_gpiod_direction_input(desc_to_hw_desc(desc));
+
+	/*
+	 * the descriptor doesn't have a full direction control.
+	 * BUT if no one has the full control then we allow to fallback to the
+	 * input direction
+	 */
+	ouput_owner = get_full_control_owner(hw);
+	if (!ouput_owner && test_bit(FLAG_IS_OUT, &hw->flags))
+		return hw_gpiod_direction_input(desc_to_hw_desc(desc));
+
+	/*
+	 * at this point we should return -EPERM. But since we assumed that
+	 * even an output GPIO is readable, we can safely report a success
+	 */
+	return 0;
+}
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 /**
@@ -1754,79 +1942,61 @@ EXPORT_SYMBOL_GPL(gpiod_direction_input);
  *
  * Return 0 in case of success, else an error code.
  */
-int gpiod_direction_output(struct gpio_desc *desc, int value)
+static int hw_gpiod_direction_output(struct gpio_hw_desc *hw, int value)
 {
-	unsigned long		flags;
 	struct gpio_chip	*chip;
 	int			status = -EINVAL;
 	int offset;
 
-	if (!desc || !desc->chip) {
+	if (!hw || !hw->chip) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
 
 	/* GPIOs used for IRQs shall not be set as output */
-	if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
-		gpiod_err(desc,
+	if (test_bit(FLAG_USED_AS_IRQ, &hw->flags)) {
+		gpiod_err(hw,
 			  "%s: tried to set a GPIO tied to an IRQ as output\n",
 			  __func__);
 		return -EIO;
 	}
 
 	/* Open drain pin should not be driven to 1 */
-	if (value && test_bit(FLAG_OPEN_DRAIN,  &desc->flags))
-		return gpiod_direction_input(desc);
+	if (value && test_bit(FLAG_OPEN_DRAIN,  &hw->flags))
+		return hw_gpiod_direction_input(hw);
 
 	/* Open source pin should not be driven to 0 */
-	if (!value && test_bit(FLAG_OPEN_SOURCE,  &desc->flags))
-		return gpiod_direction_input(desc);
+	if (!value && test_bit(FLAG_OPEN_SOURCE,  &hw->flags))
+		return hw_gpiod_direction_input(hw);
 
-	chip = desc->chip;
+	chip = hw->chip;
 	if (!chip->set || !chip->direction_output) {
-		gpiod_warn(desc,
+		gpiod_warn(hw,
 		       "%s: missing set() or direction_output() operations\n",
 		       __func__);
 		return -EIO;
 	}
 
-	spin_lock_irqsave(&gpio_lock, flags);
-
-	status = gpio_ensure_requested(desc);
-	if (status < 0)
-		goto fail;
-
-	/* now we know the gpio is valid and chip won't vanish */
-
-	spin_unlock_irqrestore(&gpio_lock, flags);
-
 	might_sleep_if(chip->can_sleep);
 
-	offset = gpio_chip_hwgpio(desc);
-	if (status) {
-		status = chip->request(chip, offset);
-		if (status < 0) {
-			gpiod_dbg(desc, "chip request fail, %d\n", status);
-			/* and it's not available to anyone else ...
-			 * gpio_request() is the fully clean solution.
-			 */
-			goto lose;
-		}
-	}
+	offset = gpio_chip_hwgpio(hw);
 
 	status = chip->direction_output(chip, offset, value);
 	if (status == 0)
-		set_bit(FLAG_IS_OUT, &desc->flags);
-	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	trace_gpio_direction(desc_to_gpio(desc), 0, status);
-lose:
-	return status;
-fail:
-	spin_unlock_irqrestore(&gpio_lock, flags);
-	if (status)
-		gpiod_dbg(desc, "%s: gpio status %d\n", __func__, status);
+		set_bit(FLAG_IS_OUT, &hw->flags);
+	trace_gpio_value(hw_desc_to_gpio(hw), 0, value);
+	trace_gpio_direction(hw_desc_to_gpio(hw), 0, status);
+
 	return status;
 }
+int gpiod_direction_output(struct gpio_desc *desc, int value)
+{
+	if (!desc)
+		return -EINVAL;
+	if (!(desc->flags & DESC_FLAG_FULL_CONTROL))
+		return -EPERM;
+	return hw_gpiod_direction_output(desc_to_hw_desc(desc), value);
+}
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
 /**
@@ -1839,45 +2009,27 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output);
  */
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
-	unsigned long		flags;
 	struct gpio_chip	*chip;
-	int			status = -EINVAL;
 	int			offset;
+	struct gpio_hw_desc	*hw = desc_to_hw_desc(desc);
 
-	if (!desc || !desc->chip) {
+	if (!hw || !hw->chip) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
 
-	chip = desc->chip;
+	chip = hw->chip;
 	if (!chip->set || !chip->set_debounce) {
-		gpiod_dbg(desc,
+		gpiod_dbg(hw,
 			  "%s: missing set() or set_debounce() operations\n",
 			  __func__);
 		return -ENOTSUPP;
 	}
 
-	spin_lock_irqsave(&gpio_lock, flags);
-
-	status = gpio_ensure_requested(desc);
-	if (status < 0)
-		goto fail;
-
-	/* now we know the gpio is valid and chip won't vanish */
-
-	spin_unlock_irqrestore(&gpio_lock, flags);
-
 	might_sleep_if(chip->can_sleep);
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpio_chip_hwgpio(hw);
 	return chip->set_debounce(chip, offset, debounce);
-
-fail:
-	spin_unlock_irqrestore(&gpio_lock, flags);
-	if (status)
-		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
-
-	return status;
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
@@ -1889,7 +2041,10 @@ EXPORT_SYMBOL_GPL(gpiod_set_debounce);
  */
 int gpiod_is_active_low(const struct gpio_desc *desc)
 {
-	return test_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	struct gpio_hw_desc	*hw = desc_to_hw_desc(desc);
+	if (hw)
+		return test_bit(FLAG_ACTIVE_LOW, &hw->flags);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiod_is_active_low);
 
@@ -1915,7 +2070,7 @@ EXPORT_SYMBOL_GPL(gpiod_is_active_low);
  * that the GPIO was actually requested.
  */
 
-static int _gpiod_get_raw_value(const struct gpio_desc *desc)
+static int _gpiod_get_raw_value(const struct gpio_hw_desc *desc)
 {
 	struct gpio_chip	*chip;
 	int value;
@@ -1924,7 +2079,7 @@ static int _gpiod_get_raw_value(const struct gpio_desc *desc)
 	chip = desc->chip;
 	offset = gpio_chip_hwgpio(desc);
 	value = chip->get ? chip->get(chip, offset) : 0;
-	trace_gpio_value(desc_to_gpio(desc), 1, value);
+	trace_gpio_value(hw_desc_to_gpio(desc), 1, value);
 	return value;
 }
 
@@ -1940,11 +2095,12 @@ static int _gpiod_get_raw_value(const struct gpio_desc *desc)
  */
 int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
-	if (!desc)
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
+	if (!hw)
 		return 0;
 	/* Should be using gpio_get_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
-	return _gpiod_get_raw_value(desc);
+	WARN_ON(hw->chip->can_sleep);
+	return _gpiod_get_raw_value(hw);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
 
@@ -1960,14 +2116,15 @@ EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
  */
 int gpiod_get_value(const struct gpio_desc *desc)
 {
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
 	int value;
-	if (!desc)
+	if (!hw)
 		return 0;
 	/* Should be using gpio_get_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON(hw->chip->can_sleep);
 
-	value = _gpiod_get_raw_value(desc);
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	value = _gpiod_get_raw_value(hw);
+	if (test_bit(FLAG_ACTIVE_LOW, &hw->flags))
 		value = !value;
 
 	return value;
@@ -1979,7 +2136,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_value);
  * @desc: gpio descriptor whose state need to be set.
  * @value: Non-zero for setting it HIGH otherise it will set to LOW.
  */
-static void _gpio_set_open_drain_value(struct gpio_desc *desc, int value)
+static void _gpio_set_open_drain_value(struct gpio_hw_desc *desc, int value)
 {
 	int err = 0;
 	struct gpio_chip *chip = desc->chip;
@@ -1994,7 +2151,7 @@ static void _gpio_set_open_drain_value(struct gpio_desc *desc, int value)
 		if (!err)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	}
-	trace_gpio_direction(desc_to_gpio(desc), value, err);
+	trace_gpio_direction(hw_desc_to_gpio(desc), value, err);
 	if (err < 0)
 		gpiod_err(desc,
 			  "%s: Error in set_value for open drain err %d\n",
@@ -2006,7 +2163,7 @@ static void _gpio_set_open_drain_value(struct gpio_desc *desc, int value)
  * @desc: gpio descriptor whose state need to be set.
  * @value: Non-zero for setting it HIGH otherise it will set to LOW.
  */
-static void _gpio_set_open_source_value(struct gpio_desc *desc, int value)
+static void _gpio_set_open_source_value(struct gpio_hw_desc *desc, int value)
 {
 	int err = 0;
 	struct gpio_chip *chip = desc->chip;
@@ -2021,19 +2178,19 @@ static void _gpio_set_open_source_value(struct gpio_desc *desc, int value)
 		if (!err)
 			clear_bit(FLAG_IS_OUT, &desc->flags);
 	}
-	trace_gpio_direction(desc_to_gpio(desc), !value, err);
+	trace_gpio_direction(hw_desc_to_gpio(desc), !value, err);
 	if (err < 0)
 		gpiod_err(desc,
 			  "%s: Error in set_value for open source err %d\n",
 			  __func__, err);
 }
 
-static void _gpiod_set_raw_value(struct gpio_desc *desc, int value)
+static void _gpiod_set_raw_value(struct gpio_hw_desc *desc, int value)
 {
 	struct gpio_chip	*chip;
 
 	chip = desc->chip;
-	trace_gpio_value(desc_to_gpio(desc), 0, value);
+	trace_gpio_value(hw_desc_to_gpio(desc), 0, value);
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
 		_gpio_set_open_drain_value(desc, value);
 	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
@@ -2055,11 +2212,13 @@ static void _gpiod_set_raw_value(struct gpio_desc *desc, int value)
  */
 void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
-	if (!desc)
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
+	if (!hw)
 		return;
+
 	/* Should be using gpio_set_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
-	_gpiod_set_raw_value(desc, value);
+	WARN_ON(hw->chip->can_sleep);
+	_gpiod_set_raw_value(hw, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
 
@@ -2076,13 +2235,15 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
  */
 void gpiod_set_value(struct gpio_desc *desc, int value)
 {
-	if (!desc)
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
+	if (!hw)
 		return;
+
 	/* Should be using gpio_set_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	WARN_ON(hw->chip->can_sleep);
+	if (test_bit(FLAG_ACTIVE_LOW, &hw->flags))
 		value = !value;
-	_gpiod_set_raw_value(desc, value);
+	_gpiod_set_raw_value(hw, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_value);
 
@@ -2095,7 +2256,8 @@ int gpiod_cansleep(const struct gpio_desc *desc)
 {
 	if (!desc)
 		return 0;
-	return desc->chip->can_sleep;
+
+	return desc_to_hw_desc(desc)->chip->can_sleep;
 }
 EXPORT_SYMBOL_GPL(gpiod_cansleep);
 
@@ -2106,7 +2268,7 @@ EXPORT_SYMBOL_GPL(gpiod_cansleep);
  * Return the IRQ corresponding to the passed GPIO, or an error code in case of
  * error.
  */
-int gpiod_to_irq(const struct gpio_desc *desc)
+int hw_gpiod_to_irq(const struct gpio_hw_desc *desc)
 {
 	struct gpio_chip	*chip;
 	int			offset;
@@ -2117,7 +2279,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	offset = gpio_chip_hwgpio(desc);
 	return chip->to_irq ? chip->to_irq(chip, offset) : -ENXIO;
 }
-EXPORT_SYMBOL_GPL(gpiod_to_irq);
+EXPORT_SYMBOL_GPL(hw_gpiod_to_irq);
 
 /**
  * gpiod_lock_as_irq() - lock a GPIO to be used as IRQ
@@ -2129,7 +2291,7 @@ EXPORT_SYMBOL_GPL(gpiod_to_irq);
  * of its irq_chip implementation if the GPIO is known from that
  * code.
  */
-int gpiod_lock_as_irq(struct gpio_desc *desc)
+int gpiod_lock_as_irq(struct gpio_hw_desc *desc)
 {
 	if (!desc)
 		return -EINVAL;
@@ -2159,7 +2321,7 @@ EXPORT_SYMBOL_GPL(gpio_lock_as_irq);
  * This is used directly by GPIO drivers that want to indicate
  * that a certain GPIO is no longer used exclusively for IRQ.
  */
-void gpiod_unlock_as_irq(struct gpio_desc *desc)
+void gpiod_unlock_as_irq(struct gpio_hw_desc *desc)
 {
 	if (!desc)
 		return;
@@ -2185,10 +2347,11 @@ EXPORT_SYMBOL_GPL(gpio_unlock_as_irq);
  */
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
 	might_sleep_if(extra_checks);
-	if (!desc)
+	if (!hw)
 		return 0;
-	return _gpiod_get_raw_value(desc);
+	return _gpiod_get_raw_value(hw);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value_cansleep);
 
@@ -2201,20 +2364,25 @@ EXPORT_SYMBOL_GPL(gpiod_get_raw_value_cansleep);
  *
  * This function is to be called from contexts that can sleep.
  */
-int gpiod_get_value_cansleep(const struct gpio_desc *desc)
+static int hw_gpiod_get_value_cansleep(const struct gpio_hw_desc *hw)
 {
 	int value;
 
 	might_sleep_if(extra_checks);
-	if (!desc)
+	if (!hw)
 		return 0;
 
-	value = _gpiod_get_raw_value(desc);
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	value = _gpiod_get_raw_value(hw);
+	if (test_bit(FLAG_ACTIVE_LOW, &hw->flags))
 		value = !value;
 
 	return value;
 }
+int gpiod_get_value_cansleep(const struct gpio_desc *desc)
+{
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
+	return hw_gpiod_get_value_cansleep(hw);
+}
 EXPORT_SYMBOL_GPL(gpiod_get_value_cansleep);
 
 /**
@@ -2229,10 +2397,11 @@ EXPORT_SYMBOL_GPL(gpiod_get_value_cansleep);
  */
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
 {
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
 	might_sleep_if(extra_checks);
-	if (!desc)
+	if (!hw)
 		return;
-	_gpiod_set_raw_value(desc, value);
+	_gpiod_set_raw_value(hw, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value_cansleep);
 
@@ -2246,15 +2415,20 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value_cansleep);
  *
  * This function is to be called from contexts that can sleep.
  */
-void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
+static void hw_gpiod_set_value_cansleep(struct gpio_hw_desc *hw, int value)
 {
 	might_sleep_if(extra_checks);
-	if (!desc)
+	if (!hw)
 		return;
 
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	if (test_bit(FLAG_ACTIVE_LOW, &hw->flags))
 		value = !value;
-	_gpiod_set_raw_value(desc, value);
+	_gpiod_set_raw_value(hw, value);
+}
+void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
+{
+	struct gpio_hw_desc *hw = desc_to_hw_desc(desc);
+	return hw_gpiod_set_value_cansleep(hw, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
 
@@ -2276,13 +2450,13 @@ void gpiod_add_table(struct gpiod_lookup *table, size_t size)
 }
 
 #ifdef CONFIG_OF
-static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
+static struct gpio_hw_desc *of_find_gpio(struct device *dev, const char *con_id,
 				      unsigned int idx,
 				      enum gpio_lookup_flags *flags)
 {
 	char prop_name[32]; /* 32 is max size of property name */
 	enum of_gpio_flags of_flags;
-	struct gpio_desc *desc;
+	struct gpio_hw_desc *desc;
 
 	if (con_id)
 		snprintf(prop_name, 32, "%s-gpios", con_id);
@@ -2301,7 +2475,7 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	return desc;
 }
 #else
-static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
+static struct gpio_hw_desc *of_find_gpio(struct device *dev, const char *con_id,
 				      unsigned int idx,
 				      enum gpio_lookup_flags *flags)
 {
@@ -2309,12 +2483,13 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 }
 #endif
 
-static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
-					unsigned int idx,
-					enum gpio_lookup_flags *flags)
+static struct gpio_hw_desc *acpi_find_gpio(struct device *dev,
+					   const char *con_id,
+					   unsigned int idx,
+					   enum gpio_lookup_flags *flags)
 {
 	struct acpi_gpio_info info;
-	struct gpio_desc *desc;
+	struct gpio_hw_desc *desc;
 
 	desc = acpi_get_gpiod_by_index(dev, idx, &info);
 	if (IS_ERR(desc))
@@ -2326,12 +2501,12 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
 	return desc;
 }
 
-static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
+static struct gpio_hw_desc *gpiod_find(struct device *dev, const char *con_id,
 				    unsigned int idx,
 				    enum gpio_lookup_flags *flags)
 {
 	const char *dev_id = dev ? dev_name(dev) : NULL;
-	struct gpio_desc *desc = ERR_PTR(-ENODEV);
+	struct gpio_hw_desc *desc = ERR_PTR(-ENODEV);
 	unsigned int match, best = 0;
 	struct gpiod_lookup *p;
 
@@ -2374,7 +2549,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 				continue;
 			}
 
-			desc = gpio_to_desc(chip->base + p->chip_hwnum);
+			desc = gpio_to_hw_desc(chip->base + p->chip_hwnum);
 			*flags = p->flags;
 
 			if (match != 3)
@@ -2418,8 +2593,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 					       const char *con_id,
 					       unsigned int idx)
 {
-	struct gpio_desc *desc = NULL;
-	int status;
+	struct gpio_hw_desc *hw = NULL;
+	struct gpio_desc *desc;
 	enum gpio_lookup_flags flags = 0;
 
 	dev_dbg(dev, "GPIO lookup for consumer %s\n", con_id);
@@ -2427,37 +2602,38 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	/* Using device tree? */
 	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node) {
 		dev_dbg(dev, "using device tree for GPIO lookup\n");
-		desc = of_find_gpio(dev, con_id, idx, &flags);
+		hw = of_find_gpio(dev, con_id, idx, &flags);
 	} else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev)) {
 		dev_dbg(dev, "using ACPI for GPIO lookup\n");
-		desc = acpi_find_gpio(dev, con_id, idx, &flags);
+		hw = acpi_find_gpio(dev, con_id, idx, &flags);
 	}
 
 	/*
 	 * Either we are not using DT or ACPI, or their lookup did not return
 	 * a result. In that case, use platform lookup as a fallback.
 	 */
-	if (!desc || IS_ERR(desc)) {
-		struct gpio_desc *pdesc;
+	if (!hw || IS_ERR(hw)) {
+		struct gpio_hw_desc *tmp;
 		dev_dbg(dev, "using lookup tables for GPIO lookup");
-		pdesc = gpiod_find(dev, con_id, idx, &flags);
+		tmp = gpiod_find(dev, con_id, idx, &flags);
 		/* If used as fallback, do not replace the previous error */
-		if (!IS_ERR(pdesc) || !desc)
-			desc = pdesc;
+		if (!IS_ERR(tmp) || !hw)
+			hw = tmp;
 	}
 
-	if (IS_ERR(desc)) {
+	if (IS_ERR(hw)) {
+		int status = PTR_ERR(hw);
 		dev_dbg(dev, "lookup for GPIO %s failed\n", con_id);
-		return desc;
+		return ERR_PTR(status);
 	}
 
-	status = gpiod_request(desc, con_id);
+	desc = gpiod_request(hw, con_id, DESC_FLAG_FULL_CONTROL);
 
-	if (status < 0)
-		return ERR_PTR(status);
+	if (IS_ERR(desc))
+		return desc;
 
 	if (flags & GPIO_ACTIVE_LOW)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+		set_bit(FLAG_ACTIVE_LOW, &hw->flags);
 	if (flags & GPIO_OPEN_DRAIN)
 		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 	if (flags & GPIO_OPEN_SOURCE)
@@ -2485,15 +2661,15 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	unsigned		i;
 	unsigned		gpio = chip->base;
-	struct gpio_desc	*gdesc = &chip->desc[0];
+	struct gpio_hw_desc	*gdesc = &chip->desc[0];
 	int			is_out;
 	int			is_irq;
 
 	for (i = 0; i < chip->ngpio; i++, gpio++, gdesc++) {
-		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
+		if (list_empty(&gdesc->list))
 			continue;
 
-		gpiod_get_direction(gdesc);
+		hw_gpiod_get_direction(gdesc);
 		is_out = test_bit(FLAG_IS_OUT, &gdesc->flags);
 		is_irq = test_bit(FLAG_USED_AS_IRQ, &gdesc->flags);
 		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s %s",
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index a5f56a0..d7ea9aa 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -49,12 +49,12 @@ struct gpio;
 struct seq_file;
 struct module;
 struct device_node;
-struct gpio_desc;
+struct gpio_hw_desc;
 
 /* caller holds gpio_lock *OR* gpio is marked as requested */
 static inline struct gpio_chip *gpio_to_chip(unsigned gpio)
 {
-	return gpiod_to_chip(gpio_to_desc(gpio));
+	return hw_gpiod_to_chip(gpio_to_hw_desc(gpio));
 }
 
 /* Always use the library code for GPIO management calls,
@@ -65,25 +65,25 @@ extern void gpio_free(unsigned gpio);
 
 static inline int gpio_direction_input(unsigned gpio)
 {
-	return gpiod_direction_input(gpio_to_desc(gpio));
+	return gpiod_direction_input(gpio_to_desc(gpio, 1));
 }
 static inline int gpio_direction_output(unsigned gpio, int value)
 {
-	return gpiod_direction_output(gpio_to_desc(gpio), value);
+	return gpiod_direction_output(gpio_to_desc(gpio, 1), value);
 }
 
 static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
 {
-	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
+	return gpiod_set_debounce(gpio_to_desc(gpio, 1), debounce);
 }
 
 static inline int gpio_get_value_cansleep(unsigned gpio)
 {
-	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
+	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio, 0));
 }
 static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 {
-	return gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
+	return gpiod_set_raw_value_cansleep(gpio_to_desc(gpio, 0), value);
 }
 
 
@@ -93,21 +93,21 @@ static inline void gpio_set_value_cansleep(unsigned gpio, int value)
  */
 static inline int __gpio_get_value(unsigned gpio)
 {
-	return gpiod_get_raw_value(gpio_to_desc(gpio));
+	return gpiod_get_raw_value(gpio_to_desc(gpio, 0));
 }
 static inline void __gpio_set_value(unsigned gpio, int value)
 {
-	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
+	return gpiod_set_raw_value(gpio_to_desc(gpio, 0), value);
 }
 
 static inline int __gpio_cansleep(unsigned gpio)
 {
-	return gpiod_cansleep(gpio_to_desc(gpio));
+	return gpiod_cansleep(gpio_to_desc(gpio, 0));
 }
 
 static inline int __gpio_to_irq(unsigned gpio)
 {
-	return gpiod_to_irq(gpio_to_desc(gpio));
+	return hw_gpiod_to_irq(gpio_to_hw_desc(gpio));
 }
 
 extern int gpio_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
@@ -123,23 +123,23 @@ extern void gpio_free_array(const struct gpio *array, size_t num);
  */
 static inline int gpio_export(unsigned gpio, bool direction_may_change)
 {
-	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
+	return gpiod_export(gpio_to_desc(gpio, 0), direction_may_change);
 }
 
 static inline int gpio_export_link(struct device *dev, const char *name,
 				   unsigned gpio)
 {
-	return gpiod_export_link(dev, name, gpio_to_desc(gpio));
+	return gpiod_export_link(dev, name, gpio_to_hw_desc(gpio));
 }
 
 static inline int gpio_sysfs_set_active_low(unsigned gpio, int value)
 {
-	return gpiod_sysfs_set_active_low(gpio_to_desc(gpio), value);
+	return gpiod_sysfs_set_active_low(gpio_to_hw_desc(gpio), value);
 }
 
 static inline void gpio_unexport(unsigned gpio)
 {
-	gpiod_unexport(gpio_to_desc(gpio));
+	gpiod_unexport(gpio_to_desc(gpio, 0));
 }
 
 #ifdef CONFIG_PINCTRL
diff --git a/include/linux/acpi_gpio.h b/include/linux/acpi_gpio.h
index d875bc3..ee52e9b 100644
--- a/include/linux/acpi_gpio.h
+++ b/include/linux/acpi_gpio.h
@@ -19,14 +19,14 @@ struct acpi_gpio_info {
 
 #ifdef CONFIG_GPIO_ACPI
 
-struct gpio_desc *acpi_get_gpiod_by_index(struct device *dev, int index,
+struct gpio_hw_desc *acpi_get_gpiod_by_index(struct device *dev, int index,
 					  struct acpi_gpio_info *info);
 void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
 void acpi_gpiochip_free_interrupts(struct gpio_chip *chip);
 
 #else /* CONFIG_GPIO_ACPI */
 
-static inline struct gpio_desc *
+static inline struct gpio_hw_desc *
 acpi_get_gpiod_by_index(struct device *dev, int index,
 			struct acpi_gpio_info *info)
 {
@@ -41,11 +41,11 @@ static inline void acpi_gpiochip_free_interrupts(struct gpio_chip *chip) { }
 static inline int acpi_get_gpio_by_index(struct device *dev, int index,
 					 struct acpi_gpio_info *info)
 {
-	struct gpio_desc *desc = acpi_get_gpiod_by_index(dev, index, info);
+	struct gpio_hw_desc *desc = acpi_get_gpiod_by_index(dev, index, info);
 
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
-	return desc_to_gpio(desc);
+	return hw_desc_to_gpio(desc);
 }
 
 #endif /* _LINUX_ACPI_GPIO_H_ */
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 13dfd24..81f1aab 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -30,6 +30,9 @@
 #define GPIOF_EXPORT_DIR_FIXED	(GPIOF_EXPORT)
 #define GPIOF_EXPORT_DIR_CHANGEABLE (GPIOF_EXPORT | GPIOF_EXPORT_CHANGEABLE)
 
+/* Request full control of the gpio (ie: exclusive direction control) */
+#define DESC_FLAG_FULL_CONTROL	(1 << 0)
+
 /**
  * struct gpio - a structure describing a GPIO with configuration
  * @gpio:	the GPIO number
@@ -86,6 +89,9 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
 void devm_gpio_free(struct device *dev, unsigned int gpio);
 
+struct gpio_desc *gpiod_request(struct gpio_hw_desc *desc, const char *label,
+				 unsigned long flags);
+
 #else /* ! CONFIG_GPIOLIB */
 
 #include <linux/kernel.h>
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 4d34dbb..a168790 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -13,9 +13,10 @@ struct gpio_chip;
  * Opaque descriptor for a GPIO. These are obtained using gpiod_get() and are
  * preferable to the old integer-based handles.
  *
- * Contrary to integers, a pointer to a gpio_desc is guaranteed to be valid
+ * Contrary to integers, a pointer to a gpio_hw_desc is guaranteed to be valid
  * until the GPIO is released.
  */
+struct gpio_hw_desc;
 struct gpio_desc;
 
 /* Acquire and dispose GPIOs */
@@ -54,13 +55,19 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 int gpiod_is_active_low(const struct gpio_desc *desc);
 int gpiod_cansleep(const struct gpio_desc *desc);
 
-int gpiod_to_irq(const struct gpio_desc *desc);
+int hw_gpiod_to_irq(const struct gpio_hw_desc *hw);
 
 /* Convert between the old gpio_ and new gpiod_ interfaces */
-struct gpio_desc *gpio_to_desc(unsigned gpio);
+struct gpio_hw_desc *gpio_to_hw_desc(unsigned gpio);
+struct gpio_desc *gpio_to_desc(unsigned gpio, int auto_request);
+
+int hw_desc_to_gpio(const struct gpio_hw_desc *desc);
 int desc_to_gpio(const struct gpio_desc *desc);
+
+struct gpio_chip *hw_gpiod_to_chip(const struct gpio_hw_desc *desc);
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
+
 #else /* CONFIG_GPIOLIB */
 
 static inline struct gpio_desc *__must_check gpiod_get(struct device *dev,
@@ -190,23 +197,35 @@ static inline int gpiod_cansleep(const struct gpio_desc *desc)
 	return 0;
 }
 
-static inline int gpiod_to_irq(const struct gpio_desc *desc)
+static inline int hw_gpiod_to_irq(const struct gpio_hw_desc *desc)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 	return -EINVAL;
 }
 
-static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
+static inline struct gpio_hw_desc *gpio_to_desc(unsigned gpio, int auto_request)
 {
 	return ERR_PTR(-EINVAL);
 }
+static inline int hw_desc_to_gpio(const struct gpio_hw_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return -EINVAL;
+}
 static inline int desc_to_gpio(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 	return -EINVAL;
 }
+static inline struct gpio_chip *hw_gpiod_to_chip(const struct gpio_hw_desc *hw)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return ERR_PTR(-ENODEV);
+}
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -221,8 +240,8 @@ static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
 int gpiod_export_link(struct device *dev, const char *name,
-		      struct gpio_desc *desc);
-int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value);
+		      struct gpio_hw_desc *desc);
+int gpiod_sysfs_set_active_low(struct gpio_hw_desc *desc, int value);
 void gpiod_unexport(struct gpio_desc *desc);
 
 #else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
@@ -234,17 +253,18 @@ static inline int gpiod_export(struct gpio_desc *desc,
 }
 
 static inline int gpiod_export_link(struct device *dev, const char *name,
-				    struct gpio_desc *desc)
+				    struct gpio_hw_desc *desc)
 {
 	return -ENOSYS;
 }
 
-static inline int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value)
+static inline int gpiod_sysfs_set_active_low(struct gpio_hw_desc *desc,
+					     int value)
 {
 	return -ENOSYS;
 }
 
-static inline void gpiod_unexport(struct gpio_desc *desc)
+static inline void gpiod_unexport(struct gpio_hw_desc *desc)
 {
 }
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3ea2cf6..728aab0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -5,7 +5,7 @@
 #include <linux/module.h>
 
 struct device;
-struct gpio_desc;
+struct gpio_hw_desc;
 struct of_phandle_args;
 struct device_node;
 struct seq_file;
@@ -89,7 +89,7 @@ struct gpio_chip {
 						struct gpio_chip *chip);
 	int			base;
 	u16			ngpio;
-	struct gpio_desc	*desc;
+	struct gpio_hw_desc	*desc;
 	const char		*const *names;
 	unsigned		can_sleep:1;
 	unsigned		exported:1;
@@ -125,8 +125,8 @@ extern struct gpio_chip *gpiochip_find(void *data,
 			      int (*match)(struct gpio_chip *chip, void *data));
 
 /* lock/unlock as IRQ */
-int gpiod_lock_as_irq(struct gpio_desc *desc);
-void gpiod_unlock_as_irq(struct gpio_desc *desc);
+int gpiod_lock_as_irq(struct gpio_hw_desc *desc);
+void gpiod_unlock_as_irq(struct gpio_hw_desc *desc);
 
 enum gpio_lookup_flags {
 	GPIO_ACTIVE_HIGH = (0 << 0),
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index f14123a..8dc4d14 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -48,7 +48,7 @@ static inline struct of_mm_gpio_chip *to_of_mm_gpio_chip(struct gpio_chip *gc)
 	return container_of(gc, struct of_mm_gpio_chip, gc);
 }
 
-extern struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+extern struct gpio_hw_desc *of_get_named_gpiod_flags(struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags);
 
 extern int of_mm_gpiochip_add(struct device_node *np,
@@ -63,8 +63,9 @@ extern int of_gpio_simple_xlate(struct gpio_chip *gc,
 #else /* CONFIG_OF_GPIO */
 
 /* Drivers may not strictly depend on the GPIO support, so let them link. */
-static inline struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
-		const char *list_name, int index, enum of_gpio_flags *flags)
+static inline struct gpio_hw_desc *of_get_named_gpiod_flags(
+		struct device_node *np,	const char *list_name, int index,
+		enum of_gpio_flags *flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
@@ -84,13 +85,13 @@ static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
 static inline int of_get_named_gpio_flags(struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags)
 {
-	struct gpio_desc *desc;
+	struct gpio_hw_desc *desc;
 	desc = of_get_named_gpiod_flags(np, list_name, index, flags);
 
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 	else
-		return desc_to_gpio(desc);
+		return hw_desc_to_gpio(desc);
 }
 
 /**
@@ -139,7 +140,7 @@ static inline int of_gpio_count(struct device_node *np)
  * value on the error condition. If @flags is not NULL the function also fills
  * in flags for the GPIO.
  */
-static inline struct gpio_desc *of_get_gpiod_flags(struct device_node *np,
+static inline struct gpio_hw_desc *of_get_gpiod_flags(struct device_node *np,
 					int index, enum of_gpio_flags *flags)
 {
 	return of_get_named_gpiod_flags(np, "gpios", index, flags);
-- 
1.8.5.2

