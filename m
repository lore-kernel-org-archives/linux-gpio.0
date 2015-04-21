From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 12/23] gpio: sysfs: add gpiod class-device data
Date: Tue, 21 Apr 2015 17:42:20 +0200
Message-ID: <1429630951-27082-13-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

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
index b77f29cd1603..4cc90f7ce14b 100644
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
@@ -210,7 +219,8 @@ static const struct {
 static ssize_t edge_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	const struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	unsigned long mask;
 	ssize_t	status = 0;
 	int i;
@@ -232,7 +242,8 @@ static ssize_t edge_show(struct device *dev,
 static ssize_t edge_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 	int			i;
 
@@ -282,7 +293,8 @@ static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
 static ssize_t active_low_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	const struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
 	mutex_lock(&sysfs_lock);
@@ -298,7 +310,8 @@ static ssize_t active_low_show(struct device *dev,
 static ssize_t active_low_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 	long			value;
 
@@ -318,7 +331,8 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			       int n)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
-	struct gpio_desc *desc = dev_get_drvdata(dev);
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
 	umode_t mode = attr->mode;
 	bool show_direction = test_bit(FLAG_SYSFS_DIR, &desc->flags);
 
@@ -510,6 +524,7 @@ static struct class gpio_class = {
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
 	struct gpio_chip	*chip;
+	struct gpiod_data	*data;
 	unsigned long		flags;
 	int			status;
 	const char		*ioname = NULL;
@@ -534,7 +549,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	/* check if chip is being removed */
 	if (!chip || !chip->cdev) {
 		status = -ENODEV;
-		goto fail_unlock;
+		goto err_unlock;
 	}
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -546,7 +561,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 				test_bit(FLAG_REQUESTED, &desc->flags),
 				test_bit(FLAG_EXPORT, &desc->flags));
 		status = -EPERM;
-		goto fail_unlock;
+		goto err_unlock;
 	}
 
 	if (chip->direction_input && chip->direction_output &&
@@ -556,33 +571,45 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
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
@@ -638,6 +665,7 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
+	struct gpiod_data	*data;
 	int			status = 0;
 	struct device		*dev = NULL;
 
@@ -661,6 +689,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	mutex_unlock(&sysfs_lock);
 
 	if (dev) {
+		data = dev_get_drvdata(dev);
 		device_unregister(dev);
 		/*
 		 * Release irq after deregistration to prevent race with
@@ -668,6 +697,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 */
 		gpio_setup_irq(desc, dev, 0);
 		put_device(dev);
+		kfree(data);
 	}
 
 	if (status)
-- 
2.0.5
