From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 12/23] gpio: sysfs: add gpiod class-device data
Date: Mon,  4 May 2015 17:10:37 +0200
Message-ID: <1430752248-15401-13-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:36761 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752041AbbEDPNp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:45 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Add gpiod class-device data.

This is a first step in getting rid of the insane gpio-descriptor flag
overloading, backward irq-interface implementation, and course grained
sysfs-interface locking (a single static mutex for every operation on
all exported gpios in a system).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 62 ++++++++++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 10baf31efe74..097e7e539c9d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -6,9 +6,14 @@
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kdev_t.h>
+#include <linux/slab.h>
 
 #include "gpiolib.h"
 
+struct gpiod_data {
+	struct gpio_desc *desc;
+};
+
 static DEFINE_IDR(dirent_idr);
 
 
@@ -41,7 +46,8 @@ static DEFINE_MUTEX(sysfs_lock);
 static ssize_t direction_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -58,7 +64,8 @@ static ssize_t direction_show(struct device *dev,
 static ssize_t direction_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -80,7 +87,8 @@ static DEVICE_ATTR_RW(direction);
 static ssize_t value_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -94,7 +102,8 @@ static ssize_t value_show(struct device *dev,
 static ssize_t value_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -225,7 +234,8 @@ static const struct {
 static ssize_t edge_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	const struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	unsigned long mask;
 	ssize_t	status = 0;
 	int i;
@@ -247,7 +257,8 @@ static ssize_t edge_show(struct device *dev,
 static ssize_t edge_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 	int			i;
 
@@ -297,7 +308,8 @@ static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
 static ssize_t active_low_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	const struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -313,7 +325,8 @@ static ssize_t active_low_show(struct device *dev,
 static ssize_t active_low_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 	long			value;
 
@@ -333,7 +346,8 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			       int n)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
-	struct gpio_desc *desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	umode_t mode = attr->mode;
 	bool show_direction = test_bit(FLAG_SYSFS_DIR, &desc->flags);
 
@@ -525,6 +539,7 @@ static struct class gpio_class = {
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
 	struct gpio_chip	*chip;
+	struct gpiod_data	*data;
 	unsigned long		flags;
 	int			status;
 	const char		*ioname = NULL;
@@ -549,7 +564,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	/* check if chip is being removed */
 	if (!chip || !chip->cdev) {
 		status = -ENODEV;
-		goto fail_unlock;
+		goto err_unlock;
 	}
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -561,7 +576,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 				test_bit(FLAG_REQUESTED, &desc->flags),
 				test_bit(FLAG_EXPORT, &desc->flags));
 		status = -EPERM;
-		goto fail_unlock;
+		goto err_unlock;
 	}
 
 	if (chip->direction_input && chip->direction_output &&
@@ -571,33 +586,45 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		status = -ENOMEM;
+		goto err_unlock;
+	}
+
+	data->desc = desc;
+
 	offset = gpio_chip_hwgpio(desc);
 	if (chip->names && chip->names[offset])
 		ioname = chip->names[offset];
 
 	dev = device_create_with_groups(&gpio_class, chip->dev,
-					MKDEV(0, 0), desc, gpio_groups,
+					MKDEV(0, 0), data, gpio_groups,
 					ioname ? ioname : "gpio%u",
 					desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);
-		goto fail_unlock;
+		goto err_free_data;
 	}
 
 	set_bit(FLAG_EXPORT, &desc->flags);
 	mutex_unlock(&sysfs_lock);
 	return 0;
 
-fail_unlock:
+err_free_data:
+	kfree(data);
+err_unlock:
 	mutex_unlock(&sysfs_lock);
 	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	return status;
 }
 EXPORT_SYMBOL_GPL(gpiod_export);
 
-static int match_export(struct device *dev, const void *data)
+static int match_export(struct device *dev, const void *desc)
 {
-	return dev_get_drvdata(dev) == data;
+	struct gpiod_data *data = dev_get_drvdata(dev);
+
+	return data->desc == desc;
 }
 
 /**
@@ -653,6 +680,7 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
+	struct gpiod_data	*data;
 	int			status = 0;
 	struct device		*dev = NULL;
 
@@ -676,6 +704,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	mutex_unlock(&sysfs_lock);
 
 	if (dev) {
+		data = dev_get_drvdata(dev);
 		device_unregister(dev);
 		/*
 		 * Release irq after deregistration to prevent race with
@@ -683,6 +712,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 */
 		gpio_setup_irq(desc, dev, 0);
 		put_device(dev);
+		kfree(data);
 	}
 
 	if (status)
-- 
2.0.5

