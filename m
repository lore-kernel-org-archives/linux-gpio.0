From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/6] gpio: reflect base and ngpio into gpio_device
Date: Thu, 11 Feb 2016 11:26:21 +0100
Message-ID: <1455186383-28004-5-git-send-email-linus.walleij@linaro.org>
References: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36517 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbcBKK0m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:26:42 -0500
Received: by mail-wm0-f46.google.com with SMTP id p63so66007427wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:26:41 -0800 (PST)
In-Reply-To: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

Some information about the GPIO chip need to stay around also
after the gpio_chip has been removed and only the gpio_device
persist. The base and ngpio are such things, for example we
don't want a new chip arriving to overlap the number space
of a dangling gpio_device, and the chardev may still query
the device for the number of lines etc.

Note that the code that assigns base and insert gpio_device
into the global list no longer check for a missing gpio_chip:
we respect the number space allocated by any other gpio_device.

As a consequence of the gdev being referenced directly from
the gpio_desc, we need to verify it differently from all
in-kernel API calls that fall through to direct queries to
the gpio_chip vtable: we first check that desc is !NULL, then
that desc->gdev is !NULL, then, if desc->gdev->chip is NULL,
we *BAIL OUT* without any error, so as to manage the case
where operations are requested on a device that is gone.

These checks were non-uniform and partly missing in the past:
so to simplify: create the macros VALIDATE_DESC() that will
return -EINVAL if the desc or desc->gdev is missing and just
0 if the chip is gone, and conversely VALIDATE_DESC_VOID()
for the case where the function does not return an error.
By using these macros, we get warning messages about missing
gdev with reference to the right function in the kernel log.

Despite the macro business this simplifies the code and make
it more readable than if we copy/paste the same descriptor
checking code into all code ABI call sites (IMHO).

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c |  12 +-
 drivers/gpio/gpiolib.c       | 255 +++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib.h       |  10 +-
 3 files changed, 148 insertions(+), 129 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index de65633471af..c56309491e8b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -180,7 +180,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	 *        Remove this redundant call (along with the corresponding
 	 *        unlock) when those drivers have been fixed.
 	 */
-	ret = gpiochip_lock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
+	ret = gpiochip_lock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
 	if (ret < 0)
 		goto err_put_kn;
 
@@ -194,7 +194,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	return 0;
 
 err_unlock:
-	gpiochip_unlock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
 err_put_kn:
 	sysfs_put(data->value_kn);
 
@@ -212,7 +212,7 @@ static void gpio_sysfs_free_irq(struct device *dev)
 
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
-	gpiochip_unlock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
 	sysfs_put(data->value_kn);
 }
 
@@ -566,8 +566,8 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		return -EINVAL;
 	}
 
-	chip = desc->chip;
-	gdev = chip->gpiodev;
+	gdev = desc->gdev;
+	chip = gdev->chip;
 
 	mutex_lock(&sysfs_lock);
 
@@ -765,7 +765,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 
 	/* unregister gpiod class devices owned by sysfs */
 	for (i = 0; i < chip->ngpio; i++) {
-		desc = &chip->gpiodev->descs[i];
+		desc = &gdev->descs[i];
 		if (test_and_clear_bit(FLAG_SYSFS, &desc->flags))
 			gpiod_free(desc);
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f3fcd415a77b..cbc9c764a7fb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -85,10 +85,10 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
-		if (gdev->chip->base <= gpio &&
-		    gdev->chip->base + gdev->chip->ngpio > gpio) {
+		if (gdev->base <= gpio &&
+		    gdev->base + gdev->ngpio > gpio) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			return &gdev->descs[gpio - gdev->chip->base];
+			return &gdev->descs[gpio - gdev->base];
 		}
 	}
 
@@ -107,10 +107,12 @@ EXPORT_SYMBOL_GPL(gpio_to_desc);
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
 				    u16 hwnum)
 {
-	if (hwnum >= chip->ngpio)
+	struct gpio_device *gdev = chip->gpiodev;
+
+	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-	return &chip->gpiodev->descs[hwnum];
+	return &gdev->descs[hwnum];
 }
 
 /**
@@ -120,7 +122,7 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
  */
 int desc_to_gpio(const struct gpio_desc *desc)
 {
-	return desc->chip->base + (desc - &desc->chip->gpiodev->descs[0]);
+	return desc->gdev->base + (desc - &desc->gdev->descs[0]);
 }
 EXPORT_SYMBOL_GPL(desc_to_gpio);
 
@@ -131,7 +133,9 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
  */
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
-	return desc ? desc->chip : NULL;
+	if (!desc || !desc->gdev || !desc->gdev->chip)
+		return NULL;
+	return desc->gdev->chip;
 }
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
@@ -143,11 +147,11 @@ static int gpiochip_find_base(int ngpio)
 
 	list_for_each_entry_reverse(gdev, &gpio_devices, list) {
 		/* found a free space? */
-		if (gdev->chip->base + gdev->chip->ngpio <= base)
+		if (gdev->base + gdev->ngpio <= base)
 			break;
 		else
 			/* nope, check the space right before the chip */
-			base = gdev->chip->base - ngpio;
+			base = gdev->base - ngpio;
 	}
 
 	if (gpio_is_valid(base)) {
@@ -214,14 +218,7 @@ static int gpiodev_add_to_list(struct gpio_device *gdev)
 	}
 
 	list_for_each_entry(iterator, &gpio_devices, list) {
-		/*
-		 * The list may contain dangling GPIO devices with no
-		 * live chip assigned.
-		 */
-		if (!iterator->chip)
-			continue;
-		if (iterator->chip->base >=
-		    gdev->chip->base + gdev->chip->ngpio) {
+		if (iterator->base >= gdev->base + gdev->ngpio) {
 			/*
 			 * Iterator is the first GPIO chip so there is no
 			 * previous one
@@ -234,8 +231,8 @@ static int gpiodev_add_to_list(struct gpio_device *gdev)
 				 * [base, base + ngpio - 1]) between previous
 				 * and iterator chip.
 				 */
-				if (previous->chip->base + previous->chip->ngpio
-						<= gdev->chip->base)
+				if (previous->base + previous->ngpio
+				    <= gdev->base)
 					goto found;
 			}
 		}
@@ -249,7 +246,7 @@ static int gpiodev_add_to_list(struct gpio_device *gdev)
 	 */
 
 	iterator = list_last_entry(&gpio_devices, struct gpio_device, list);
-	if (iterator->chip->base + iterator->chip->ngpio <= gdev->chip->base) {
+	if (iterator->base + iterator->ngpio <= gdev->base) {
 		list_add(&gdev->list, &iterator->list);
 		return 0;
 	}
@@ -276,15 +273,15 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		int i;
 
-		for (i = 0; i != gdev->chip->ngpio; ++i) {
-			struct gpio_desc *gpio = &gdev->descs[i];
+		for (i = 0; i != gdev->ngpio; ++i) {
+			struct gpio_desc *desc = &gdev->descs[i];
 
-			if (!gpio->name || !name)
+			if (!desc->name || !name)
 				continue;
 
-			if (!strcmp(gpio->name, name)) {
+			if (!strcmp(desc->name, name)) {
 				spin_unlock_irqrestore(&gpio_lock, flags);
-				return gpio;
+				return desc;
 			}
 		}
 	}
@@ -302,6 +299,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
  */
 static int gpiochip_set_desc_names(struct gpio_chip *gc)
 {
+	struct gpio_device *gdev = gc->gpiodev;
 	int i;
 
 	if (!gc->names)
@@ -313,14 +311,14 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 
 		gpio = gpio_name_to_desc(gc->names[i]);
 		if (gpio)
-			dev_warn(&gc->gpiodev->dev,
+			dev_warn(&gdev->dev,
 				 "Detected name collision for GPIO name '%s'\n",
 				 gc->names[i]);
 	}
 
 	/* Then add all names to the GPIO descriptors */
 	for (i = 0; i != gc->ngpio; ++i)
-		gc->gpiodev->descs[i].name = gc->names[i];
+		gdev->descs[i].name = gc->names[i];
 
 	return 0;
 }
@@ -344,7 +342,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		strncpy(chipinfo.name, dev_name(&gdev->dev),
 			sizeof(chipinfo.name));
 		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
-		chipinfo.lines = chip->ngpio;
+		chipinfo.lines = gdev->ngpio;
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
@@ -476,17 +474,24 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		goto err_free_gdev;
 	}
 
-	/* FIXME: move driver data into gpio_device dev_set_drvdata() */
-	chip->data = data;
-
 	if (chip->ngpio == 0) {
 		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
 		status = -EINVAL;
 		goto err_free_gdev;
 	}
+	gdev->ngpio = chip->ngpio;
+	/* FIXME: move driver data into gpio_device dev_set_drvdata() */
+	chip->data = data;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
+	/*
+	 * TODO: this allocates a Linux GPIO number base in the global
+	 * GPIO numberspace for this chip. In the long run we want to
+	 * get *rid* of this numberspace and use only descriptors, but
+	 * it may be a pipe dream. It will not happen before we get rid
+	 * of the sysfs interface anyways.
+	 */
 	if (base < 0) {
 		base = gpiochip_find_base(chip->ngpio);
 		if (base < 0) {
@@ -494,8 +499,15 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 			spin_unlock_irqrestore(&gpio_lock, flags);
 			goto err_free_gdev;
 		}
+		/*
+		 * TODO: it should not be necessary to reflect the assigned
+		 * base outside of the GPIO subsystem. Go over drivers and
+		 * see if anyone makes use of this, else drop this and assign
+		 * a poison instead.
+		 */
 		chip->base = base;
 	}
+	gdev->base = base;
 
 	status = gpiodev_add_to_list(gdev);
 	if (status) {
@@ -506,8 +518,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	for (i = 0; i < chip->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
 
-		/* REVISIT: maybe a pointer to gpio_device is better */
-		desc->chip = chip;
+		desc->gdev = gdev;
 
 		/* REVISIT: most hardware initializes GPIOs as inputs (often
 		 * with pullups enabled) so power usage is minimized. Linux
@@ -563,9 +574,9 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	/* From this point, the .release() function cleans up gpio_device */
 	gdev->dev.release = gpiodevice_release;
 	get_device(&gdev->dev);
-	pr_debug("%s: registered GPIOs %d to %d on device: %s\n", __func__,
-		chip->base, chip->base + chip->ngpio - 1,
-		chip->label ? : "generic");
+	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
+		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
+		 dev_name(&gdev->dev), chip->label ? : "generic");
 
 	return 0;
 
@@ -586,8 +597,8 @@ err_free_gdev:
 	kfree(gdev);
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
-		chip->base, chip->base + chip->ngpio - 1,
-		chip->label ? : "generic");
+	       gdev->base, gdev->base + gdev->ngpio - 1,
+	       chip->label ? : "generic");
 	return status;
 }
 EXPORT_SYMBOL_GPL(gpiochip_add_data);
@@ -618,16 +629,15 @@ void gpiochip_remove(struct gpio_chip *chip)
 	of_gpiochip_remove(chip);
 
 	spin_lock_irqsave(&gpio_lock, flags);
-	for (i = 0; i < chip->ngpio; i++) {
+	for (i = 0; i < gdev->ngpio; i++) {
 		desc = &gdev->descs[i];
-		desc->chip = NULL;
 		if (test_bit(FLAG_REQUESTED, &desc->flags))
 			requested = true;
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	if (requested)
-		dev_crit(&chip->gpiodev->dev,
+		dev_crit(&gdev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
 	/*
@@ -967,7 +977,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
  */
 int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_request_gpio(chip->base + offset);
+	return pinctrl_request_gpio(chip->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
 
@@ -978,7 +988,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
  */
 void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_free_gpio(chip->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 
@@ -996,6 +1006,7 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 			unsigned int gpio_offset, const char *pin_group)
 {
 	struct gpio_pin_range *pin_range;
+	struct gpio_device *gdev = chip->gpiodev;
 	int ret;
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
@@ -1008,7 +1019,7 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 	pin_range->range.id = gpio_offset;
 	pin_range->range.gc = chip;
 	pin_range->range.name = chip->label;
-	pin_range->range.base = chip->base + gpio_offset;
+	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->pctldev = pctldev;
 
 	ret = pinctrl_get_group_pins(pctldev, pin_group,
@@ -1045,6 +1056,7 @@ int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 			   unsigned int npins)
 {
 	struct gpio_pin_range *pin_range;
+	struct gpio_device *gdev = chip->gpiodev;
 	int ret;
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
@@ -1057,7 +1069,7 @@ int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 	pin_range->range.id = gpio_offset;
 	pin_range->range.gc = chip;
 	pin_range->range.name = chip->label;
-	pin_range->range.base = chip->base + gpio_offset;
+	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->range.pin_base = pin_offset;
 	pin_range->range.npins = npins;
 	pin_range->pctldev = pinctrl_find_and_add_gpio_range(pinctl_name,
@@ -1104,7 +1116,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
  */
 static int __gpiod_request(struct gpio_desc *desc, const char *label)
 {
-	struct gpio_chip	*chip = desc->chip;
+	struct gpio_chip	*chip = desc->gdev->chip;
 	int			status;
 	unsigned long		flags;
 
@@ -1153,27 +1165,48 @@ done:
 	return status;
 }
 
+/*
+ * This descriptor validation needs to be inserted verbatim into each
+ * function taking a descriptor, so we need to use a preprocessor
+ * macro to avoid endless duplication.
+ */
+#define VALIDATE_DESC(desc) do { \
+	if (!desc || !desc->gdev) { \
+		pr_warn("%s: invalid GPIO\n", __func__); \
+		return -EINVAL; \
+	} \
+	if ( !desc->gdev->chip ) { \
+		dev_warn(&desc->gdev->dev, \
+			 "%s: backing chip is gone\n", __func__); \
+		return 0; \
+	} } while (0)
+
+#define VALIDATE_DESC_VOID(desc) do { \
+	if (!desc || !desc->gdev) { \
+		pr_warn("%s: invalid GPIO\n", __func__); \
+		return; \
+	} \
+	if (!desc->gdev->chip) { \
+		dev_warn(&desc->gdev->dev, \
+			 "%s: backing chip is gone\n", __func__); \
+		return; \
+	} } while (0)
+
+
 int gpiod_request(struct gpio_desc *desc, const char *label)
 {
 	int status = -EPROBE_DEFER;
-	struct gpio_chip *chip;
-
-	if (!desc) {
-		pr_warn("%s: invalid GPIO\n", __func__);
-		return -EINVAL;
-	}
+	struct gpio_device *gdev;
 
-	chip = desc->chip;
-	if (!chip)
-		goto done;
+	VALIDATE_DESC(desc);
+	gdev = desc->gdev;
 
-	if (try_module_get(chip->gpiodev->owner)) {
+	if (try_module_get(gdev->owner)) {
 		status = __gpiod_request(desc, label);
 		if (status < 0)
-			module_put(chip->gpiodev->owner);
+			module_put(gdev->owner);
 	}
 
-done:
 	if (status)
 		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 
@@ -1192,7 +1225,7 @@ static bool __gpiod_free(struct gpio_desc *desc)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	chip = desc->chip;
+	chip = desc->gdev->chip;
 	if (chip && test_bit(FLAG_REQUESTED, &desc->flags)) {
 		if (chip->free) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
@@ -1216,7 +1249,7 @@ static bool __gpiod_free(struct gpio_desc *desc)
 void gpiod_free(struct gpio_desc *desc)
 {
 	if (desc && __gpiod_free(desc))
-		module_put(desc->chip->gpiodev->owner);
+		module_put(desc->gdev->owner);
 	else
 		WARN_ON(extra_checks);
 }
@@ -1293,7 +1326,8 @@ void gpiochip_free_own_desc(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 
-/* Drivers MUST set GPIO direction before making get/set calls.  In
+/*
+ * Drivers MUST set GPIO direction before making get/set calls.  In
  * some cases this is done in early boot, before IRQs are enabled.
  *
  * As a rule these aren't called more than once (except for drivers
@@ -1316,12 +1350,9 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	struct gpio_chip	*chip;
 	int			status = -EINVAL;
 
-	if (!desc || !desc->chip) {
-		pr_warn("%s: invalid GPIO\n", __func__);
-		return -EINVAL;
-	}
+	VALIDATE_DESC(desc);
+	chip = desc->gdev->chip;
 
-	chip = desc->chip;
 	if (!chip->get || !chip->direction_input) {
 		gpiod_warn(desc,
 			"%s: missing get() or direction_input() operations\n",
@@ -1360,7 +1391,7 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	if (!value && test_bit(FLAG_OPEN_SOURCE,  &desc->flags))
 		return gpiod_direction_input(desc);
 
-	chip = desc->chip;
+	chip = desc->gdev->chip;
 	if (!chip->set || !chip->direction_output) {
 		gpiod_warn(desc,
 		       "%s: missing set() or direction_output() operations\n",
@@ -1389,10 +1420,7 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
  */
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
-	if (!desc || !desc->chip) {
-		pr_warn("%s: invalid GPIO\n", __func__);
-		return -EINVAL;
-	}
+	VALIDATE_DESC(desc);
 	return _gpiod_direction_output_raw(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
@@ -1411,10 +1439,7 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
  */
 int gpiod_direction_output(struct gpio_desc *desc, int value)
 {
-	if (!desc || !desc->chip) {
-		pr_warn("%s: invalid GPIO\n", __func__);
-		return -EINVAL;
-	}
+	VALIDATE_DESC(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 	return _gpiod_direction_output_raw(desc, value);
@@ -1433,12 +1458,8 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
 	struct gpio_chip	*chip;
 
-	if (!desc || !desc->chip) {
-		pr_warn("%s: invalid GPIO\n", __func__);
-		return -EINVAL;
-	}
-
-	chip = desc->chip;
+	VALIDATE_DESC(desc);
+	chip = desc->gdev->chip;
 	if (!chip->set || !chip->set_debounce) {
 		gpiod_dbg(desc,
 			  "%s: missing set() or set_debounce() operations\n",
@@ -1458,6 +1479,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_debounce);
  */
 int gpiod_is_active_low(const struct gpio_desc *desc)
 {
+	VALIDATE_DESC(desc);
 	return test_bit(FLAG_ACTIVE_LOW, &desc->flags);
 }
 EXPORT_SYMBOL_GPL(gpiod_is_active_low);
@@ -1490,7 +1512,7 @@ static int _gpiod_get_raw_value(const struct gpio_desc *desc)
 	int offset;
 	int value;
 
-	chip = desc->chip;
+	chip = desc->gdev->chip;
 	offset = gpio_chip_hwgpio(desc);
 	value = chip->get ? chip->get(chip, offset) : -EIO;
 	value = value < 0 ? value : !!value;
@@ -1510,10 +1532,9 @@ static int _gpiod_get_raw_value(const struct gpio_desc *desc)
  */
 int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
-	if (!desc)
-		return 0;
+	VALIDATE_DESC(desc);
 	/* Should be using gpio_get_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON(desc->gdev->chip->can_sleep);
 	return _gpiod_get_raw_value(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
@@ -1531,10 +1552,10 @@ EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
 int gpiod_get_value(const struct gpio_desc *desc)
 {
 	int value;
-	if (!desc)
-		return 0;
+
+	VALIDATE_DESC(desc);
 	/* Should be using gpio_get_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON(desc->gdev->chip->can_sleep);
 
 	value = _gpiod_get_raw_value(desc);
 	if (value < 0)
@@ -1555,7 +1576,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_value);
 static void _gpio_set_open_drain_value(struct gpio_desc *desc, bool value)
 {
 	int err = 0;
-	struct gpio_chip *chip = desc->chip;
+	struct gpio_chip *chip = desc->gdev->chip;
 	int offset = gpio_chip_hwgpio(desc);
 
 	if (value) {
@@ -1582,7 +1603,7 @@ static void _gpio_set_open_drain_value(struct gpio_desc *desc, bool value)
 static void _gpio_set_open_source_value(struct gpio_desc *desc, bool value)
 {
 	int err = 0;
-	struct gpio_chip *chip = desc->chip;
+	struct gpio_chip *chip = desc->gdev->chip;
 	int offset = gpio_chip_hwgpio(desc);
 
 	if (value) {
@@ -1605,7 +1626,7 @@ static void _gpiod_set_raw_value(struct gpio_desc *desc, bool value)
 {
 	struct gpio_chip	*chip;
 
-	chip = desc->chip;
+	chip = desc->gdev->chip;
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
 		_gpio_set_open_drain_value(desc, value);
@@ -1653,7 +1674,7 @@ static void gpiod_set_array_value_priv(bool raw, bool can_sleep,
 	int i = 0;
 
 	while (i < array_size) {
-		struct gpio_chip *chip = desc_array[i]->chip;
+		struct gpio_chip *chip = desc_array[i]->gdev->chip;
 		unsigned long mask[BITS_TO_LONGS(chip->ngpio)];
 		unsigned long bits[BITS_TO_LONGS(chip->ngpio)];
 		int count = 0;
@@ -1687,7 +1708,8 @@ static void gpiod_set_array_value_priv(bool raw, bool can_sleep,
 				count++;
 			}
 			i++;
-		} while ((i < array_size) && (desc_array[i]->chip == chip));
+		} while ((i < array_size) &&
+			 (desc_array[i]->gdev->chip == chip));
 		/* push collected bits to outputs */
 		if (count != 0)
 			gpio_chip_set_multiple(chip, mask, bits);
@@ -1707,10 +1729,9 @@ static void gpiod_set_array_value_priv(bool raw, bool can_sleep,
  */
 void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
-	if (!desc)
-		return;
+	VALIDATE_DESC_VOID(desc);
 	/* Should be using gpio_set_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON(desc->gdev->chip->can_sleep);
 	_gpiod_set_raw_value(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
@@ -1728,10 +1749,9 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
  */
 void gpiod_set_value(struct gpio_desc *desc, int value)
 {
-	if (!desc)
-		return;
+	VALIDATE_DESC_VOID(desc);
 	/* Should be using gpio_set_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON(desc->gdev->chip->can_sleep);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 	_gpiod_set_raw_value(desc, value);
@@ -1789,9 +1809,8 @@ EXPORT_SYMBOL_GPL(gpiod_set_array_value);
  */
 int gpiod_cansleep(const struct gpio_desc *desc)
 {
-	if (!desc)
-		return 0;
-	return desc->chip->can_sleep;
+	VALIDATE_DESC(desc);
+	return desc->gdev->chip->can_sleep;
 }
 EXPORT_SYMBOL_GPL(gpiod_cansleep);
 
@@ -1807,9 +1826,8 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	struct gpio_chip	*chip;
 	int			offset;
 
-	if (!desc)
-		return -EINVAL;
-	chip = desc->chip;
+	VALIDATE_DESC(desc);
+	chip = desc->gdev->chip;
 	offset = gpio_chip_hwgpio(desc);
 	return chip->to_irq ? chip->to_irq(chip, offset) : -ENXIO;
 }
@@ -1869,8 +1887,7 @@ EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
 	might_sleep_if(extra_checks);
-	if (!desc)
-		return 0;
+	VALIDATE_DESC(desc);
 	return _gpiod_get_raw_value(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value_cansleep);
@@ -1889,9 +1906,7 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 	int value;
 
 	might_sleep_if(extra_checks);
-	if (!desc)
-		return 0;
-
+	VALIDATE_DESC(desc);
 	value = _gpiod_get_raw_value(desc);
 	if (value < 0)
 		return value;
@@ -1916,8 +1931,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_value_cansleep);
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
 {
 	might_sleep_if(extra_checks);
-	if (!desc)
-		return;
+	VALIDATE_DESC_VOID(desc);
 	_gpiod_set_raw_value(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value_cansleep);
@@ -1935,9 +1949,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value_cansleep);
 void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 {
 	might_sleep_if(extra_checks);
-	if (!desc)
-		return;
-
+	VALIDATE_DESC_VOID(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 	_gpiod_set_raw_value(desc, value);
@@ -2660,15 +2672,16 @@ core_initcall(gpiolib_dev_init);
 
 #ifdef CONFIG_DEBUG_FS
 
-static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
 	unsigned		i;
-	unsigned		gpio = chip->base;
-	struct gpio_desc	*gdesc = &chip->gpiodev->descs[0];
+	struct gpio_chip	*chip = gdev->chip;
+	unsigned		gpio = gdev->base;
+	struct gpio_desc	*gdesc = &gdev->descs[0];
 	int			is_out;
 	int			is_irq;
 
-	for (i = 0; i < chip->ngpio; i++, gpio++, gdesc++) {
+	for (i = 0; i < gdev->ngpio; i++, gpio++, gdesc++) {
 		if (!test_bit(FLAG_REQUESTED, &gdesc->flags)) {
 			if (gdesc->name) {
 				seq_printf(s, " gpio-%-3d (%-20.20s)\n",
@@ -2747,7 +2760,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 
 	seq_printf(s, "%s%s: GPIOs %d-%d", (char *)s->private,
 		   dev_name(&gdev->dev),
-		   chip->base, chip->base + chip->ngpio - 1);
+		   gdev->base, gdev->base + gdev->ngpio - 1);
 	parent = chip->parent;
 	if (parent)
 		seq_printf(s, ", parent: %s/%s",
@@ -2762,7 +2775,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (chip->dbg_show)
 		chip->dbg_show(s, chip);
 	else
-		gpiolib_dbg_show(s, chip);
+		gpiolib_dbg_show(s, gdev);
 
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 39b8301c98b6..d154984c71d9 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -33,6 +33,10 @@ struct acpi_device;
  * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
  * @descs: array of ngpio descriptors.
+ * @ngpio: the number of GPIO lines on this GPIO device, equal to the size
+ * of the @descs array.
+ * @base: GPIO base in the DEPRECATED global Linux GPIO numberspace, assigned
+ * at device creation time.
  * @list: links gpio_device:s together for traversal
  *
  * This state container holds most of the runtime variable data
@@ -48,6 +52,8 @@ struct gpio_device {
 	struct module		*owner;
 	struct gpio_chip	*chip;
 	struct gpio_desc	*descs;
+	int			base;
+	u16			ngpio;
 	struct list_head        list;
 };
 
@@ -125,7 +131,7 @@ extern struct spinlock gpio_lock;
 extern struct list_head gpio_devices;
 
 struct gpio_desc {
-	struct gpio_chip	*chip;
+	struct gpio_device	*gdev;
 	unsigned long		flags;
 /* flag symbols are bit numbers */
 #define FLAG_REQUESTED	0
@@ -154,7 +160,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
  */
 static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
 {
-	return desc - &desc->chip->gpiodev->descs[0];
+	return desc - &desc->gdev->descs[0];
 }
 
 /* With descriptor prefix */
-- 
2.4.3

