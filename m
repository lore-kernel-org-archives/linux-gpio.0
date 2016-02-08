From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/6 v3] gpio: make the gpiochip a real device
Date: Mon,  8 Feb 2016 15:32:27 +0100
Message-ID: <1454941947-25415-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35804 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbcBHOci (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2016 09:32:38 -0500
Received: by mail-lb0-f172.google.com with SMTP id bc4so83708906lbc.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Feb 2016 06:32:37 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

GPIO chips have been around for years, but were never real devices,
instead they were piggy-backing on a parent device (such as a
platform_device or amba_device) but this was always optional.
GPIO chips could also exist without any device at all, with its
struct device *dev pointer being set to null.

When sysfs was in use, a mock device would be created, with the
optional parent assigned, or just floating orphaned with NULL
as parent.

For a proper userspace ABI we need gpiochips to *always have a
populated struct device, so add this in the gpio_chip struct.
The name "dev" is unfortunately already take so we use "device"
to name it.

If sysfs is active, it will use this device as parent, and the
former parent device "dev" will be set as parent of the new
"device" struct member.

>From this point on, gpiochips are devices.

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Implement the local state container struct gpio_device
  that can be left dangling around until userspace release
  us, as suggested by Dmitry.
- Since we already have a list for gpio_chips, repurpose
  this list to hold gpio_device:s instead of gpio_chip:s,
  and refactor accordingly.
- If no vocal protests emerge, I plan to merge this now.
ChangeLog v1->v2:
- Rebased on the patch that renames all .dev instances to
  .parent in the struct gpio_chip. The actual GPIO device
  is now the .dev member.
- Fixed up error handling of ida_simple_get().
- Fixed some indentation.
---
 drivers/gpio/gpiolib-sysfs.c |  12 ++-
 drivers/gpio/gpiolib.c       | 232 ++++++++++++++++++++++++++++++-------------
 drivers/gpio/gpiolib.h       |  27 ++++-
 include/linux/gpio/driver.h  |   7 +-
 4 files changed, 201 insertions(+), 77 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 405dfcaadc4c..28d3bf2328aa 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -547,6 +547,7 @@ static struct class gpio_class = {
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
 	struct gpio_chip	*chip;
+	struct gpio_device	*gdev;
 	struct gpiod_data	*data;
 	unsigned long		flags;
 	int			status;
@@ -566,6 +567,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	}
 
 	chip = desc->chip;
+	gdev = chip->gpiodev;
 
 	mutex_lock(&sysfs_lock);
 
@@ -605,7 +607,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	if (chip->names && chip->names[offset])
 		ioname = chip->names[offset];
 
-	dev = device_create_with_groups(&gpio_class, chip->parent,
+	dev = device_create_with_groups(&gpio_class, &gdev->dev,
 					MKDEV(0, 0), data, gpio_groups,
 					ioname ? ioname : "gpio%u",
 					desc_to_gpio(desc));
@@ -771,7 +773,7 @@ static int __init gpiolib_sysfs_init(void)
 {
 	int		status;
 	unsigned long	flags;
-	struct gpio_chip *chip;
+	struct gpio_device *gdev;
 
 	status = class_register(&gpio_class);
 	if (status < 0)
@@ -784,8 +786,8 @@ static int __init gpiolib_sysfs_init(void)
 	 * registered, and so arch_initcall() can always gpio_export().
 	 */
 	spin_lock_irqsave(&gpio_lock, flags);
-	list_for_each_entry(chip, &gpio_chips, list) {
-		if (chip->cdev)
+	list_for_each_entry(gdev, &gpio_devices, list) {
+		if (gdev->chip->cdev)
 			continue;
 
 		/*
@@ -798,7 +800,7 @@ static int __init gpiolib_sysfs_init(void)
 		 * gpio_lock prevents us from doing this.
 		 */
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		status = gpiochip_sysfs_register(chip);
+		status = gpiochip_sysfs_register(gdev->chip);
 		spin_lock_irqsave(&gpio_lock, flags);
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5c1ba879f889..3a073ab5e863 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/idr.h>
 
 #include "gpiolib.h"
 
@@ -42,6 +43,9 @@
 #define	extra_checks	0
 #endif
 
+/* Device and char device-related information */
+static DEFINE_IDA(gpio_ida);
+
 /* gpio_lock prevents conflicts during gpio_desc[] table updates.
  * While any GPIO is requested, its gpio_chip is not removable;
  * each GPIO's "requested" flag serves as a lock and refcount.
@@ -50,8 +54,7 @@ DEFINE_SPINLOCK(gpio_lock);
 
 static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
-LIST_HEAD(gpio_chips);
-
+LIST_HEAD(gpio_devices);
 
 static void gpiochip_free_hogs(struct gpio_chip *chip);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
@@ -67,15 +70,16 @@ static inline void desc_set_label(struct gpio_desc *d, const char *label)
  */
 struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
-	struct gpio_chip *chip;
+	struct gpio_device *gdev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	list_for_each_entry(chip, &gpio_chips, list) {
-		if (chip->base <= gpio && chip->base + chip->ngpio > gpio) {
+	list_for_each_entry(gdev, &gpio_devices, list) {
+		if (gdev->chip->base <= gpio &&
+		    gdev->chip->base + gdev->chip->ngpio > gpio) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			return &chip->desc[gpio - chip->base];
+			return &gdev->chip->desc[gpio - gdev->chip->base];
 		}
 	}
 
@@ -125,16 +129,16 @@ EXPORT_SYMBOL_GPL(gpiod_to_chip);
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
-	struct gpio_chip *chip;
+	struct gpio_device *gdev;
 	int base = ARCH_NR_GPIOS - ngpio;
 
-	list_for_each_entry_reverse(chip, &gpio_chips, list) {
+	list_for_each_entry_reverse(gdev, &gpio_devices, list) {
 		/* found a free space? */
-		if (chip->base + chip->ngpio <= base)
+		if (gdev->chip->base + gdev->chip->ngpio <= base)
 			break;
 		else
 			/* nope, check the space right before the chip */
-			base = chip->base - ngpio;
+			base = gdev->chip->base - ngpio;
 	}
 
 	if (gpio_is_valid(base)) {
@@ -187,18 +191,28 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  * Return -EBUSY if the new chip overlaps with some other chip's integer
  * space.
  */
-static int gpiochip_add_to_list(struct gpio_chip *chip)
+static int gpiodev_add_to_list(struct gpio_device *gdev)
 {
-	struct gpio_chip *iterator;
-	struct gpio_chip *previous = NULL;
+	struct gpio_device *iterator;
+	struct gpio_device *previous = NULL;
+
+	if (!gdev->chip)
+		return -EINVAL;
 
-	if (list_empty(&gpio_chips)) {
-		list_add_tail(&chip->list, &gpio_chips);
+	if (list_empty(&gpio_devices)) {
+		list_add_tail(&gdev->list, &gpio_devices);
 		return 0;
 	}
 
-	list_for_each_entry(iterator, &gpio_chips, list) {
-		if (iterator->base >= chip->base + chip->ngpio) {
+	list_for_each_entry(iterator, &gpio_devices, list) {
+		/*
+		 * The list may contain dangling GPIO devices with no
+		 * live chip assigned.
+		 */
+		if (!iterator->chip)
+			continue;
+		if (iterator->chip->base >=
+		    gdev->chip->base + gdev->chip->ngpio) {
 			/*
 			 * Iterator is the first GPIO chip so there is no
 			 * previous one
@@ -211,8 +225,8 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 				 * [base, base + ngpio - 1]) between previous
 				 * and iterator chip.
 				 */
-				if (previous->base + previous->ngpio
-						<= chip->base)
+				if (previous->chip->base + previous->chip->ngpio
+						<= gdev->chip->base)
 					goto found;
 			}
 		}
@@ -225,18 +239,18 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 	 * Let iterator point to the last chip in the list.
 	 */
 
-	iterator = list_last_entry(&gpio_chips, struct gpio_chip, list);
-	if (iterator->base + iterator->ngpio <= chip->base) {
-		list_add(&chip->list, &iterator->list);
+	iterator = list_last_entry(&gpio_devices, struct gpio_device, list);
+	if (iterator->chip->base + iterator->chip->ngpio <= gdev->chip->base) {
+		list_add(&gdev->list, &iterator->list);
 		return 0;
 	}
 
-	dev_err(chip->parent,
+	dev_err(&gdev->dev,
 	       "GPIO integer space overlap, cannot add chip\n");
 	return -EBUSY;
 
 found:
-	list_add_tail(&chip->list, &iterator->list);
+	list_add_tail(&gdev->list, &iterator->list);
 	return 0;
 }
 
@@ -245,16 +259,16 @@ found:
  */
 static struct gpio_desc *gpio_name_to_desc(const char * const name)
 {
-	struct gpio_chip *chip;
+	struct gpio_device *gdev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	list_for_each_entry(chip, &gpio_chips, list) {
+	list_for_each_entry(gdev, &gpio_devices, list) {
 		int i;
 
-		for (i = 0; i != chip->ngpio; ++i) {
-			struct gpio_desc *gpio = &chip->desc[i];
+		for (i = 0; i != gdev->chip->ngpio; ++i) {
+			struct gpio_desc *gpio = &gdev->chip->desc[i];
 
 			if (!gpio->name || !name)
 				continue;
@@ -302,6 +316,14 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 	return 0;
 }
 
+static void gpiodevice_release(struct device *dev)
+{
+	struct gpio_device *gdev = dev_get_drvdata(dev);
+
+	list_del(&gdev->list);
+	ida_simple_remove(&gpio_ida, gdev->id);
+}
+
 /**
  * gpiochip_add_data() - register a gpio_chip
  * @chip: the chip to register, with chip->base initialized
@@ -323,19 +345,60 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 {
 	unsigned long	flags;
 	int		status = 0;
-	unsigned	id;
+	unsigned	i;
 	int		base = chip->base;
 	struct gpio_desc *descs;
+	struct gpio_device *gdev;
 
-	descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
-	if (!descs)
+	/*
+	 * First: allocate and populate the internal stat container, and
+	 * set up the struct device.
+	 */
+	gdev = kmalloc(sizeof(*gdev), GFP_KERNEL);
+	if (!gdev)
 		return -ENOMEM;
+	gdev->chip = chip;
+	chip->gpiodev = gdev;
+	if (chip->parent) {
+		gdev->dev.parent = chip->parent;
+		gdev->dev.of_node = chip->parent->of_node;
+	} else {
+#ifdef CONFIG_OF_GPIO
+	/* If the gpiochip has an assigned OF node this takes precedence */
+		if (chip->of_node)
+			gdev->dev.of_node = chip->of_node;
+#endif
+	}
+	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
+	if (gdev->id < 0) {
+		status = gdev->id;
+		goto err_free_gdev;
+	}
+	dev_set_name(&gdev->dev, "gpiochip%d", gdev->id);
+	device_initialize(&gdev->dev);
+	dev_set_drvdata(&gdev->dev, gdev);
+	if (chip->parent && chip->parent->driver)
+		gdev->owner = chip->parent->driver->owner;
+	else if (chip->owner)
+		/* TODO: remove chip->owner */
+		gdev->owner = chip->owner;
+	else
+		gdev->owner = THIS_MODULE;
 
+	/* FIXME: devm_kcalloc() these and move to gpio_device */
+	descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
+	if (!descs) {
+		status = -ENOMEM;
+		goto err_free_gdev;
+	}
+
+	/* FIXME: move driver data into gpio_device dev_set_drvdata() */
 	chip->data = data;
 
 	if (chip->ngpio == 0) {
 		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
-		return -EINVAL;
+		status = -EINVAL;
+		goto err_free_descs;
 	}
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -350,15 +413,16 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		chip->base = base;
 	}
 
-	status = gpiochip_add_to_list(chip);
+	status = gpiodev_add_to_list(gdev);
 	if (status) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		goto err_free_descs;
 	}
 
-	for (id = 0; id < chip->ngpio; id++) {
-		struct gpio_desc *desc = &descs[id];
+	for (i = 0; i < chip->ngpio; i++) {
+		struct gpio_desc *desc = &descs[i];
 
+		/* REVISIT: maybe a pointer to gpio_device is better */
 		desc->chip = chip;
 
 		/* REVISIT: most hardware initializes GPIOs as inputs (often
@@ -369,18 +433,15 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		 */
 		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
 	}
-
 	chip->desc = descs;
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 #ifdef CONFIG_PINCTRL
+	/* FIXME: move pin ranges to gpio_device */
 	INIT_LIST_HEAD(&chip->pin_ranges);
 #endif
 
-	if (!chip->owner && chip->parent && chip->parent->driver)
-		chip->owner = chip->parent->driver->owner;
-
 	status = gpiochip_set_desc_names(chip);
 	if (status)
 		goto err_remove_from_list;
@@ -391,28 +452,39 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 
 	acpi_gpiochip_add(chip);
 
-	status = gpiochip_sysfs_register(chip);
+	status = device_add(&gdev->dev);
 	if (status)
 		goto err_remove_chip;
 
+	status = gpiochip_sysfs_register(chip);
+	if (status)
+		goto err_remove_device;
+
+	/* From this point, the .release() function cleans up gpio_device */
+	gdev->dev.release = gpiodevice_release;
+	get_device(&gdev->dev);
 	pr_debug("%s: registered GPIOs %d to %d on device: %s\n", __func__,
 		chip->base, chip->base + chip->ngpio - 1,
 		chip->label ? : "generic");
 
 	return 0;
 
+err_remove_device:
+	device_del(&gdev->dev);
 err_remove_chip:
 	acpi_gpiochip_remove(chip);
 	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
 err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
-	list_del(&chip->list);
+	list_del(&gdev->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	chip->desc = NULL;
 err_free_descs:
 	kfree(descs);
-
+err_free_gdev:
+	ida_simple_remove(&gpio_ida, gdev->id);
+	kfree(gdev);
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
 		chip->base, chip->base + chip->ngpio - 1,
@@ -429,15 +501,18 @@ EXPORT_SYMBOL_GPL(gpiochip_add_data);
  */
 void gpiochip_remove(struct gpio_chip *chip)
 {
+	struct gpio_device *gdev = chip->gpiodev;
 	struct gpio_desc *desc;
 	unsigned long	flags;
 	unsigned	id;
 	bool		requested = false;
 
-	gpiochip_sysfs_unregister(chip);
+	/* Numb the device, cancelling all outstanding operations */
+	gdev->chip = NULL;
 
+	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
+	gpiochip_sysfs_unregister(chip);
 	gpiochip_irqchip_remove(chip);
-
 	acpi_gpiochip_remove(chip);
 	gpiochip_remove_pin_ranges(chip);
 	gpiochip_free_hogs(chip);
@@ -450,15 +525,23 @@ void gpiochip_remove(struct gpio_chip *chip)
 		if (test_bit(FLAG_REQUESTED, &desc->flags))
 			requested = true;
 	}
-	list_del(&chip->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	if (requested)
 		dev_crit(chip->parent,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
+	/* FIXME: need to be moved to gpio_device and held there */
 	kfree(chip->desc);
 	chip->desc = NULL;
+
+	/*
+	 * The gpiochip side puts its use of the device to rest here:
+	 * if there are no userspace clients, the chardev and device will
+	 * be removed, else it will be dangling until the last user is
+	 * gone.
+	 */
+	put_device(&gdev->dev);
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
 
@@ -477,17 +560,21 @@ struct gpio_chip *gpiochip_find(void *data,
 				int (*match)(struct gpio_chip *chip,
 					     void *data))
 {
+	struct gpio_device *gdev;
 	struct gpio_chip *chip;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
-	list_for_each_entry(chip, &gpio_chips, list)
-		if (match(chip, data))
+	list_for_each_entry(gdev, &gpio_devices, list)
+		if (match(gdev->chip, data))
 			break;
 
 	/* No match? */
-	if (&chip->list == &gpio_chips)
+	if (&gdev->list == &gpio_devices)
 		chip = NULL;
+	else
+		chip = gdev->chip;
+
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	return chip;
@@ -617,14 +704,14 @@ static int gpiochip_irq_reqres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
-	if (!try_module_get(chip->owner))
+	if (!try_module_get(chip->gpiodev->owner))
 		return -ENODEV;
 
 	if (gpiochip_lock_as_irq(chip, d->hwirq)) {
 		chip_err(chip,
 			"unable to lock HW IRQ %lu for IRQ\n",
 			d->hwirq);
-		module_put(chip->owner);
+		module_put(chip->gpiodev->owner);
 		return -EINVAL;
 	}
 	return 0;
@@ -635,7 +722,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
 	gpiochip_unlock_as_irq(chip, d->hwirq);
-	module_put(chip->owner);
+	module_put(chip->gpiodev->owner);
 }
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -985,10 +1072,10 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 	if (!chip)
 		goto done;
 
-	if (try_module_get(chip->owner)) {
+	if (try_module_get(chip->gpiodev->owner)) {
 		status = __gpiod_request(desc, label);
 		if (status < 0)
-			module_put(chip->owner);
+			module_put(chip->gpiodev->owner);
 	}
 
 done:
@@ -1034,7 +1121,7 @@ static bool __gpiod_free(struct gpio_desc *desc)
 void gpiod_free(struct gpio_desc *desc)
 {
 	if (desc && __gpiod_free(desc))
-		module_put(desc->chip->owner);
+		module_put(desc->chip->gpiodev->owner);
 	else
 		WARN_ON(extra_checks);
 }
@@ -2492,16 +2579,16 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
 {
 	unsigned long flags;
-	struct gpio_chip *chip = NULL;
+	struct gpio_device *gdev = NULL;
 	loff_t index = *pos;
 
 	s->private = "";
 
 	spin_lock_irqsave(&gpio_lock, flags);
-	list_for_each_entry(chip, &gpio_chips, list)
+	list_for_each_entry(gdev, &gpio_devices, list)
 		if (index-- == 0) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			return chip;
+			return gdev;
 		}
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
@@ -2511,14 +2598,14 @@ static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
 static void *gpiolib_seq_next(struct seq_file *s, void *v, loff_t *pos)
 {
 	unsigned long flags;
-	struct gpio_chip *chip = v;
+	struct gpio_device *gdev = v;
 	void *ret = NULL;
 
 	spin_lock_irqsave(&gpio_lock, flags);
-	if (list_is_last(&chip->list, &gpio_chips))
+	if (list_is_last(&gdev->list, &gpio_devices))
 		ret = NULL;
 	else
-		ret = list_entry(chip->list.next, struct gpio_chip, list);
+		ret = list_entry(gdev->list.next, struct gpio_device, list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	s->private = "\n";
@@ -2533,15 +2620,24 @@ static void gpiolib_seq_stop(struct seq_file *s, void *v)
 
 static int gpiolib_seq_show(struct seq_file *s, void *v)
 {
-	struct gpio_chip *chip = v;
-	struct device *dev;
+	struct gpio_device *gdev = v;
+	struct gpio_chip *chip = gdev->chip;
+	struct device *parent;
+
+	if (!chip) {
+		seq_printf(s, "%s%s: (dangling chip)", (char *)s->private,
+			   dev_name(&gdev->dev));
+		return 0;
+	}
 
-	seq_printf(s, "%sGPIOs %d-%d", (char *)s->private,
-			chip->base, chip->base + chip->ngpio - 1);
-	dev = chip->parent;
-	if (dev)
-		seq_printf(s, ", %s/%s", dev->bus ? dev->bus->name : "no-bus",
-			dev_name(dev));
+	seq_printf(s, "%s%s: GPIOs %d-%d", (char *)s->private,
+		   dev_name(&gdev->dev),
+		   chip->base, chip->base + chip->ngpio - 1);
+	parent = chip->parent;
+	if (parent)
+		seq_printf(s, ", parent: %s/%s",
+			   parent->bus ? parent->bus->name : "no-bus",
+			   dev_name(parent));
 	if (chip->label)
 		seq_printf(s, ", %s", chip->label);
 	if (chip->can_sleep)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 99ed3b00ffe9..feea2c823e47 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -12,14 +12,39 @@
 #ifndef GPIOLIB_H
 #define GPIOLIB_H
 
+#include <linux/gpio/driver.h>
 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/module.h>
+#include <linux/cdev.h>
 
 enum of_gpio_flags;
 enum gpiod_flags;
 struct acpi_device;
 
 /**
+ * struct gpio_device - internal state container for GPIO devices
+ * @id: numerical ID number for the GPIO chip
+ * @dev: the GPIO device struct
+ * @owner: helps prevent removal of modules exporting active GPIOs
+ * @chip: pointer to the corresponding gpiochip, holding static
+ * data for this device
+ * @list: links gpio_device:s together for traversal
+ *
+ * This state container holds most of the runtime variable data
+ * for a GPIO device and can hold references and live on after the
+ * GPIO chip has been removed, if it is still being used from
+ * userspace.
+ */
+struct gpio_device {
+	int			id;
+	struct device		dev;
+	struct module		*owner;
+	struct gpio_chip	*chip;
+	struct list_head        list;
+};
+
+/**
  * struct acpi_gpio_info - ACPI GPIO specific information
  * @gpioint: if %true this GPIO is of type GpioInt otherwise type is GpioIo
  * @active_low: in case of @gpioint, the pin is active low
@@ -90,7 +115,7 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
 
 extern struct spinlock gpio_lock;
-extern struct list_head gpio_chips;
+extern struct list_head gpio_devices;
 
 struct gpio_desc {
 	struct gpio_chip	*chip;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 82fda487453f..f3f1dbd43c9b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -1,6 +1,7 @@
 #ifndef __LINUX_GPIO_DRIVER_H
 #define __LINUX_GPIO_DRIVER_H
 
+#include <linux/device.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/irq.h>
@@ -10,22 +11,22 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/kconfig.h>
 
-struct device;
 struct gpio_desc;
 struct of_phandle_args;
 struct device_node;
 struct seq_file;
+struct gpio_device;
 
 #ifdef CONFIG_GPIOLIB
 
 /**
  * struct gpio_chip - abstract a GPIO controller
  * @label: for diagnostics
+ * @gpiodev: the internal state holder, opaque struct
  * @parent: optional parent device providing the GPIOs
  * @cdev: class device used by sysfs interface (may be NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @data: per-instance data assigned by the driver
- * @list: links gpio_chips together for traversal
  * @request: optional hook for chip-specific activation, such as
  *	enabling module power and clock; may sleep
  * @free: optional hook for chip-specific deactivation, such as
@@ -107,11 +108,11 @@ struct seq_file;
  */
 struct gpio_chip {
 	const char		*label;
+	struct gpio_device	*gpiodev;
 	struct device		*parent;
 	struct device		*cdev;
 	struct module		*owner;
 	void			*data;
-	struct list_head        list;
 
 	int			(*request)(struct gpio_chip *chip,
 						unsigned offset);
-- 
2.4.3

