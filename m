From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/6] gpio: move sysfs mock device to the gpio_device
Date: Thu, 11 Feb 2016 11:26:19 +0100
Message-ID: <1455186383-28004-3-git-send-email-linus.walleij@linaro.org>
References: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36437 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbcBKK0i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:26:38 -0500
Received: by mail-wm0-f46.google.com with SMTP id p63so66004862wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:26:37 -0800 (PST)
In-Reply-To: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

Since gpio_device is the struct that survives if the backing
gpio_chip is removed, move the sysfs mock device to this state
container so it becomes part of the dangling state of the
GPIO device on removal.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 23 ++++++++++++-----------
 drivers/gpio/gpiolib.c       |  4 ++--
 drivers/gpio/gpiolib.h       | 11 +++++++----
 include/linux/gpio/driver.h  |  2 --
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 28d3bf2328aa..94ba4bb8b4f8 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -572,7 +572,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	mutex_lock(&sysfs_lock);
 
 	/* check if chip is being removed */
-	if (!chip || !chip->cdev) {
+	if (!chip || !gdev->mockdev) {
 		status = -ENODEV;
 		goto err_unlock;
 	}
@@ -718,9 +718,10 @@ err_unlock:
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
-int gpiochip_sysfs_register(struct gpio_chip *chip)
+int gpiochip_sysfs_register(struct gpio_device *gdev)
 {
 	struct device	*dev;
+	struct gpio_chip *chip = gdev->chip;
 
 	/*
 	 * Many systems add gpio chips for SOC support very early,
@@ -732,7 +733,7 @@ int gpiochip_sysfs_register(struct gpio_chip *chip)
 		return 0;
 
 	/* use chip->base for the ID; it's already known to be unique */
-	dev = device_create_with_groups(&gpio_class, chip->parent,
+	dev = device_create_with_groups(&gpio_class, &gdev->dev,
 					MKDEV(0, 0),
 					chip, gpiochip_groups,
 					"gpiochip%d", chip->base);
@@ -740,25 +741,26 @@ int gpiochip_sysfs_register(struct gpio_chip *chip)
 		return PTR_ERR(dev);
 
 	mutex_lock(&sysfs_lock);
-	chip->cdev = dev;
+	gdev->mockdev = dev;
 	mutex_unlock(&sysfs_lock);
 
 	return 0;
 }
 
-void gpiochip_sysfs_unregister(struct gpio_chip *chip)
+void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 {
 	struct gpio_desc *desc;
+	struct gpio_chip *chip = gdev->chip;
 	unsigned int i;
 
-	if (!chip->cdev)
+	if (!gdev->mockdev)
 		return;
 
-	device_unregister(chip->cdev);
+	device_unregister(gdev->mockdev);
 
 	/* prevent further gpiod exports */
 	mutex_lock(&sysfs_lock);
-	chip->cdev = NULL;
+	gdev->mockdev = NULL;
 	mutex_unlock(&sysfs_lock);
 
 	/* unregister gpiod class devices owned by sysfs */
@@ -787,7 +789,7 @@ static int __init gpiolib_sysfs_init(void)
 	 */
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_for_each_entry(gdev, &gpio_devices, list) {
-		if (gdev->chip->cdev)
+		if (gdev->mockdev)
 			continue;
 
 		/*
@@ -800,12 +802,11 @@ static int __init gpiolib_sysfs_init(void)
 		 * gpio_lock prevents us from doing this.
 		 */
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		status = gpiochip_sysfs_register(gdev->chip);
+		status = gpiochip_sysfs_register(gdev);
 		spin_lock_irqsave(&gpio_lock, flags);
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-
 	return status;
 }
 postcore_initcall(gpiolib_sysfs_init);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 36f8be3f910b..5763290f777c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -558,7 +558,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (status)
 		goto err_remove_chardev;
 
-	status = gpiochip_sysfs_register(chip);
+	status = gpiochip_sysfs_register(gdev);
 	if (status)
 		goto err_remove_device;
 
@@ -615,7 +615,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	gdev->chip = NULL;
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
-	gpiochip_sysfs_unregister(chip);
+	gpiochip_sysfs_unregister(gdev);
 	gpiochip_irqchip_remove(chip);
 	acpi_gpiochip_remove(chip);
 	gpiochip_remove_pin_ranges(chip);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 1524ba0ca99d..c5a5b57463c7 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -27,6 +27,8 @@ struct acpi_device;
  * @id: numerical ID number for the GPIO chip
  * @dev: the GPIO device struct
  * @chrdev: character device for the GPIO device
+ * @mockdev: class device used by the deprecated sysfs interface (may be
+ * NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
@@ -41,6 +43,7 @@ struct gpio_device {
 	int			id;
 	struct device		dev;
 	struct cdev		chrdev;
+	struct device		*mockdev;
 	struct module		*owner;
 	struct gpio_chip	*chip;
 	struct list_head        list;
@@ -190,17 +193,17 @@ static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
 
 #ifdef CONFIG_GPIO_SYSFS
 
-int gpiochip_sysfs_register(struct gpio_chip *chip);
-void gpiochip_sysfs_unregister(struct gpio_chip *chip);
+int gpiochip_sysfs_register(struct gpio_device *gdev);
+void gpiochip_sysfs_unregister(struct gpio_device *gdev);
 
 #else
 
-static inline int gpiochip_sysfs_register(struct gpio_chip *chip)
+static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
 {
 	return 0;
 }
 
-static inline void gpiochip_sysfs_unregister(struct gpio_chip *chip)
+static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 {
 }
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f3f1dbd43c9b..4db64ab534ef 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -24,7 +24,6 @@ struct gpio_device;
  * @label: for diagnostics
  * @gpiodev: the internal state holder, opaque struct
  * @parent: optional parent device providing the GPIOs
- * @cdev: class device used by sysfs interface (may be NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @data: per-instance data assigned by the driver
  * @request: optional hook for chip-specific activation, such as
@@ -110,7 +109,6 @@ struct gpio_chip {
 	const char		*label;
 	struct gpio_device	*gpiodev;
 	struct device		*parent;
-	struct device		*cdev;
 	struct module		*owner;
 	void			*data;
 
-- 
2.4.3

