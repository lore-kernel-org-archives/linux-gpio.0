From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/6] gpio: move descriptors into gpio_device
Date: Thu, 11 Feb 2016 11:26:20 +0100
Message-ID: <1455186383-28004-4-git-send-email-linus.walleij@linaro.org>
References: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:38384 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374AbcBKK0k (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:26:40 -0500
Received: by mail-wm0-f50.google.com with SMTP id p63so61845004wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:26:39 -0800 (PST)
In-Reply-To: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

We need gpio_device to hold the descriptors so that they can
be lifecycled with the struct gpio_device held from userspace.
Move the descriptor array into gpio_device. Also rename it from
"desc" (singularis) to "descs" (pluralis) to reflect the fact
that it is an array.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c |  2 +-
 drivers/gpio/gpiolib.c       | 53 ++++++++++++++++++--------------------------
 drivers/gpio/gpiolib.h       |  4 +++-
 include/linux/gpio/driver.h  |  2 --
 4 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 94ba4bb8b4f8..de65633471af 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -765,7 +765,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 
 	/* unregister gpiod class devices owned by sysfs */
 	for (i = 0; i < chip->ngpio; i++) {
-		desc = &chip->desc[i];
+		desc = &chip->gpiodev->descs[i];
 		if (test_and_clear_bit(FLAG_SYSFS, &desc->flags))
 			gpiod_free(desc);
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5763290f777c..f3fcd415a77b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -88,7 +88,7 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 		if (gdev->chip->base <= gpio &&
 		    gdev->chip->base + gdev->chip->ngpio > gpio) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			return &gdev->chip->desc[gpio - gdev->chip->base];
+			return &gdev->descs[gpio - gdev->chip->base];
 		}
 	}
 
@@ -110,7 +110,7 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
 	if (hwnum >= chip->ngpio)
 		return ERR_PTR(-EINVAL);
 
-	return &chip->desc[hwnum];
+	return &chip->gpiodev->descs[hwnum];
 }
 
 /**
@@ -120,7 +120,7 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
  */
 int desc_to_gpio(const struct gpio_desc *desc)
 {
-	return desc->chip->base + (desc - &desc->chip->desc[0]);
+	return desc->chip->base + (desc - &desc->chip->gpiodev->descs[0]);
 }
 EXPORT_SYMBOL_GPL(desc_to_gpio);
 
@@ -277,7 +277,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 		int i;
 
 		for (i = 0; i != gdev->chip->ngpio; ++i) {
-			struct gpio_desc *gpio = &gdev->chip->desc[i];
+			struct gpio_desc *gpio = &gdev->descs[i];
 
 			if (!gpio->name || !name)
 				continue;
@@ -320,7 +320,7 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 
 	/* Then add all names to the GPIO descriptors */
 	for (i = 0; i != gc->ngpio; ++i)
-		gc->desc[i].name = gc->names[i];
+		gc->gpiodev->descs[i].name = gc->names[i];
 
 	return 0;
 }
@@ -431,7 +431,6 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	int		status = 0;
 	unsigned	i;
 	int		base = chip->base;
-	struct gpio_desc *descs;
 	struct gpio_device *gdev;
 
 	/*
@@ -470,9 +469,9 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	else
 		gdev->owner = THIS_MODULE;
 
-	/* FIXME: devm_kcalloc() these and move to gpio_device */
-	descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
-	if (!descs) {
+	gdev->descs = devm_kcalloc(&gdev->dev, chip->ngpio,
+				   sizeof(gdev->descs[0]), GFP_KERNEL);
+	if (!gdev->descs) {
 		status = -ENOMEM;
 		goto err_free_gdev;
 	}
@@ -483,7 +482,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (chip->ngpio == 0) {
 		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
 		status = -EINVAL;
-		goto err_free_descs;
+		goto err_free_gdev;
 	}
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -493,7 +492,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		if (base < 0) {
 			status = base;
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			goto err_free_descs;
+			goto err_free_gdev;
 		}
 		chip->base = base;
 	}
@@ -501,11 +500,11 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	status = gpiodev_add_to_list(gdev);
 	if (status) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		goto err_free_descs;
+		goto err_free_gdev;
 	}
 
 	for (i = 0; i < chip->ngpio; i++) {
-		struct gpio_desc *desc = &descs[i];
+		struct gpio_desc *desc = &gdev->descs[i];
 
 		/* REVISIT: maybe a pointer to gpio_device is better */
 		desc->chip = chip;
@@ -518,7 +517,6 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		 */
 		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
 	}
-	chip->desc = descs;
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
@@ -583,9 +581,6 @@ err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&gdev->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
-	chip->desc = NULL;
-err_free_descs:
-	kfree(descs);
 err_free_gdev:
 	ida_simple_remove(&gpio_ida, gdev->id);
 	kfree(gdev);
@@ -608,7 +603,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	struct gpio_device *gdev = chip->gpiodev;
 	struct gpio_desc *desc;
 	unsigned long	flags;
-	unsigned	id;
+	unsigned	i;
 	bool		requested = false;
 
 	/* Numb the device, cancelling all outstanding operations */
@@ -623,8 +618,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 	of_gpiochip_remove(chip);
 
 	spin_lock_irqsave(&gpio_lock, flags);
-	for (id = 0; id < chip->ngpio; id++) {
-		desc = &chip->desc[id];
+	for (i = 0; i < chip->ngpio; i++) {
+		desc = &gdev->descs[i];
 		desc->chip = NULL;
 		if (test_bit(FLAG_REQUESTED, &desc->flags))
 			requested = true;
@@ -635,10 +630,6 @@ void gpiochip_remove(struct gpio_chip *chip)
 		dev_crit(&chip->gpiodev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
-	/* FIXME: need to be moved to gpio_device and held there */
-	kfree(chip->desc);
-	chip->desc = NULL;
-
 	/*
 	 * The gpiochip side puts its use of the device to rest here:
 	 * if there are no userspace clients, the chardev and device will
@@ -1250,7 +1241,7 @@ const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned offset)
 	if (offset >= chip->ngpio)
 		return NULL;
 
-	desc = &chip->desc[offset];
+	desc = &chip->gpiodev->descs[offset];
 
 	if (test_bit(FLAG_REQUESTED, &desc->flags) == 0)
 		return NULL;
@@ -1837,14 +1828,14 @@ int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= chip->ngpio)
 		return -EINVAL;
 
-	if (test_bit(FLAG_IS_OUT, &chip->desc[offset].flags)) {
+	if (test_bit(FLAG_IS_OUT, &chip->gpiodev->descs[offset].flags)) {
 		chip_err(chip,
 			  "%s: tried to flag a GPIO set as output for IRQ\n",
 			  __func__);
 		return -EIO;
 	}
 
-	set_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
+	set_bit(FLAG_USED_AS_IRQ, &chip->gpiodev->descs[offset].flags);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiochip_lock_as_irq);
@@ -1862,7 +1853,7 @@ void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= chip->ngpio)
 		return;
 
-	clear_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
+	clear_bit(FLAG_USED_AS_IRQ, &chip->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 
@@ -2549,8 +2540,8 @@ static void gpiochip_free_hogs(struct gpio_chip *chip)
 	int id;
 
 	for (id = 0; id < chip->ngpio; id++) {
-		if (test_bit(FLAG_IS_HOGGED, &chip->desc[id].flags))
-			gpiochip_free_own_desc(&chip->desc[id]);
+		if (test_bit(FLAG_IS_HOGGED, &chip->gpiodev->descs[id].flags))
+			gpiochip_free_own_desc(&chip->gpiodev->descs[id]);
 	}
 }
 
@@ -2673,7 +2664,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	unsigned		i;
 	unsigned		gpio = chip->base;
-	struct gpio_desc	*gdesc = &chip->desc[0];
+	struct gpio_desc	*gdesc = &chip->gpiodev->descs[0];
 	int			is_out;
 	int			is_irq;
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index c5a5b57463c7..39b8301c98b6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -32,6 +32,7 @@ struct acpi_device;
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
+ * @descs: array of ngpio descriptors.
  * @list: links gpio_device:s together for traversal
  *
  * This state container holds most of the runtime variable data
@@ -46,6 +47,7 @@ struct gpio_device {
 	struct device		*mockdev;
 	struct module		*owner;
 	struct gpio_chip	*chip;
+	struct gpio_desc	*descs;
 	struct list_head        list;
 };
 
@@ -152,7 +154,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
  */
 static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
 {
-	return desc - &desc->chip->desc[0];
+	return desc - &desc->chip->gpiodev->descs[0];
 }
 
 /* With descriptor prefix */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4db64ab534ef..bfc842c2fc57 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -52,7 +52,6 @@ struct gpio_device;
  *	get rid of the static GPIO number space in the long run.
  * @ngpio: the number of GPIOs handled by this controller; the last GPIO
  *	handled is (base + ngpio - 1).
- * @desc: array of ngpio descriptors. Private.
  * @names: if set, must be an array of strings to use as alternative
  *      names for the GPIOs in this chip. Any entry in the array
  *      may be NULL if there is no alias for the GPIO, however the
@@ -140,7 +139,6 @@ struct gpio_chip {
 						struct gpio_chip *chip);
 	int			base;
 	u16			ngpio;
-	struct gpio_desc	*desc;
 	const char		*const *names;
 	bool			can_sleep;
 	bool			irq_not_threaded;
-- 
2.4.3

