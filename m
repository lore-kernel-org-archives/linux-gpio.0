From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 06/23] gpio: sysfs: clean up chip class-device handling
Date: Tue, 21 Apr 2015 17:42:14 +0200
Message-ID: <1429630951-27082-7-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Clean gpio-chip class device registration and deregistration.

The class device is registered when a gpio-chip is added (or from
gpiolib_sysfs_init post-core init call), and deregistered when the chip
is removed.

Store the class device in struct gpio_chip directly rather than do a
class-device lookup on deregistration. This also removes the need for
the exported flag.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 39 +++++++++++++--------------------------
 include/linux/gpio/driver.h  |  4 ++--
 2 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c433f075f349..2f8bdce792f6 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -567,7 +567,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	mutex_lock(&sysfs_lock);
 
 	/* check if chip is being removed */
-	if (!chip || !chip->exported) {
+	if (!chip || !chip->cdev) {
 		status = -ENODEV;
 		goto fail_unlock;
 	}
@@ -752,7 +752,6 @@ EXPORT_SYMBOL_GPL(gpiod_unexport);
 
 int gpiochip_export(struct gpio_chip *chip)
 {
-	int		status;
 	struct device	*dev;
 
 	/* Many systems register gpio chips for SOC support very early,
@@ -768,41 +767,29 @@ int gpiochip_export(struct gpio_chip *chip)
 					chip, gpiochip_groups,
 					"gpiochip%d", chip->base);
 	if (IS_ERR(dev))
-		status = PTR_ERR(dev);
-	else
-		status = 0;
+		return PTR_ERR(dev);
 
 	mutex_lock(&sysfs_lock);
-	chip->exported = (status == 0);
+	chip->cdev = dev;
 	mutex_unlock(&sysfs_lock);
 
-	if (status)
-		chip_dbg(chip, "%s: status %d\n", __func__, status);
-
-	return status;
+	return 0;
 }
 
 void gpiochip_unexport(struct gpio_chip *chip)
 {
-	int			status;
-	struct device		*dev;
 	struct gpio_desc *desc;
 	unsigned int i;
 
-	dev = class_find_device(&gpio_class, NULL, chip, match_export);
-	if (dev) {
-		put_device(dev);
-		device_unregister(dev);
-		/* prevent further gpiod exports */
-		mutex_lock(&sysfs_lock);
-		chip->exported = false;
-		mutex_unlock(&sysfs_lock);
-		status = 0;
-	} else
-		status = -ENODEV;
+	if (!chip->cdev)
+		return;
 
-	if (status)
-		chip_dbg(chip, "%s: status %d\n", __func__, status);
+	device_unregister(chip->cdev);
+
+	/* prevent further gpiod exports */
+	mutex_lock(&sysfs_lock);
+	chip->cdev = NULL;
+	mutex_unlock(&sysfs_lock);
 
 	/* unregister gpiod class devices owned by sysfs */
 	for (i = 0; i < chip->ngpio; i++) {
@@ -830,7 +817,7 @@ static int __init gpiolib_sysfs_init(void)
 	 */
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_for_each_entry(chip, &gpio_chips, list) {
-		if (chip->exported)
+		if (chip->cdev)
 			continue;
 
 		/*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f1b36593ec9f..8c26855fc6ec 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -20,6 +20,7 @@ struct seq_file;
  * struct gpio_chip - abstract a GPIO controller
  * @label: for diagnostics
  * @dev: optional device providing the GPIOs
+ * @cdev: class device (may be NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @list: links gpio_chips together for traversal
  * @request: optional hook for chip-specific activation, such as
@@ -57,7 +58,6 @@ struct seq_file;
  *	implies that if the chip supports IRQs, these IRQs need to be threaded
  *	as the chip access may sleep when e.g. reading out the IRQ status
  *	registers.
- * @exported: flags if the gpiochip is exported for use from sysfs. Private.
  * @irq_not_threaded: flag must be set if @can_sleep is set but the
  *	IRQs don't need to be threaded
  *
@@ -74,6 +74,7 @@ struct seq_file;
 struct gpio_chip {
 	const char		*label;
 	struct device		*dev;
+	struct device		*cdev;
 	struct module		*owner;
 	struct list_head        list;
 
@@ -109,7 +110,6 @@ struct gpio_chip {
 	const char		*const *names;
 	bool			can_sleep;
 	bool			irq_not_threaded;
-	bool			exported;
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 	/*
-- 
2.0.5
