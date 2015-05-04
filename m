From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 19/23] gpio: sysfs: use per-gpio locking
Date: Mon,  4 May 2015 17:10:44 +0200
Message-ID: <1430752248-15401-20-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:34313 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752072AbbEDPNr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:47 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Add a per-gpio mutex to serialise attribute operations rather than use
one global mutex for all gpios and chips.

Having a single global lock for all gpios in a system adds unnecessary
latency to the sysfs interface, and especially when having gpio
controllers connected over slow buses.

Now that the global gpio-sysfs interrupt table is gone and with per-gpio
data in place, we can easily switch to using a more fine-grained locking
scheme.

Keep the global mutex to serialise the global (class) operations of gpio
export and unexport and chip removal.

Also document the locking assumptions made.

Note that this is also needed to fix a race between gpiod_export and
gpiod_unexport.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 52 +++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 682e4d34999c..1bb05aa33a84 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -12,12 +12,15 @@
 
 struct gpiod_data {
 	struct gpio_desc *desc;
+
+	struct mutex mutex;
 	struct kernfs_node *value_kn;
 	int irq;
 };
 
-/* lock protects against unexport_gpio() being called while
- * sysfs files are active.
+/*
+ * Lock to serialise gpiod export and unexport, and prevent re-export of
+ * gpiod whose chip is being unregistered.
  */
 static DEFINE_MUTEX(sysfs_lock);
 
@@ -49,14 +52,15 @@ static ssize_t direction_show(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	gpiod_get_direction(desc);
 	status = sprintf(buf, "%s\n",
 			test_bit(FLAG_IS_OUT, &desc->flags)
 				? "out" : "in");
 
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
+
 	return status;
 }
 
@@ -67,7 +71,7 @@ static ssize_t direction_store(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	if (sysfs_streq(buf, "high"))
 		status = gpiod_direction_output_raw(desc, 1);
@@ -78,7 +82,8 @@ static ssize_t direction_store(struct device *dev,
 	else
 		status = -EINVAL;
 
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
+
 	return status ? : size;
 }
 static DEVICE_ATTR_RW(direction);
@@ -90,11 +95,12 @@ static ssize_t value_show(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	status = sprintf(buf, "%d\n", gpiod_get_value_cansleep(desc));
 
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
+
 	return status;
 }
 
@@ -105,7 +111,7 @@ static ssize_t value_store(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
 		status = -EPERM;
@@ -119,7 +125,8 @@ static ssize_t value_store(struct device *dev,
 		}
 	}
 
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
+
 	return status;
 }
 static DEVICE_ATTR_RW(value);
@@ -133,6 +140,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+/* Caller holds gpiod-data mutex. */
 static int gpio_sysfs_request_irq(struct device *dev, unsigned long gpio_flags)
 {
 	struct gpiod_data	*data = dev_get_drvdata(dev);
@@ -185,6 +193,10 @@ err_put_kn:
 	return ret;
 }
 
+/*
+ * Caller holds gpiod-data mutex (unless called after class-device
+ * deregistration).
+ */
 static void gpio_sysfs_free_irq(struct device *dev)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
@@ -215,7 +227,7 @@ static ssize_t edge_show(struct device *dev,
 	ssize_t	status = 0;
 	int i;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	for (i = 0; i < ARRAY_SIZE(trigger_types); i++) {
 		mask = desc->flags & GPIO_TRIGGER_MASK;
@@ -225,7 +237,8 @@ static ssize_t edge_show(struct device *dev,
 		}
 	}
 
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
+
 	return status;
 }
 
@@ -248,7 +261,7 @@ static ssize_t edge_store(struct device *dev,
 
 	flags = trigger_types[i].flags;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	if ((desc->flags & GPIO_TRIGGER_MASK) == flags) {
 		status = size;
@@ -265,12 +278,13 @@ static ssize_t edge_store(struct device *dev,
 	}
 
 out_unlock:
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
 
 	return status;
 }
 static DEVICE_ATTR_RW(edge);
 
+/* Caller holds gpiod-data mutex. */
 static int sysfs_set_active_low(struct device *dev, int value)
 {
 	struct gpiod_data	*data = dev_get_drvdata(dev);
@@ -304,12 +318,12 @@ static ssize_t active_low_show(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	status = sprintf(buf, "%d\n",
 				!!test_bit(FLAG_ACTIVE_LOW, &desc->flags));
 
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
 
 	return status;
 }
@@ -317,16 +331,17 @@ static ssize_t active_low_show(struct device *dev,
 static ssize_t active_low_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
+	struct gpiod_data	*data = dev_get_drvdata(dev);
 	ssize_t			status;
 	long			value;
 
-	mutex_lock(&sysfs_lock);
+	mutex_lock(&data->mutex);
 
 	status = kstrtol(buf, 0, &value);
 	if (status == 0)
 		status = sysfs_set_active_low(dev, value != 0);
 
-	mutex_unlock(&sysfs_lock);
+	mutex_unlock(&data->mutex);
 
 	return status ? : size;
 }
@@ -583,6 +598,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	}
 
 	data->desc = desc;
+	mutex_init(&data->mutex);
 
 	offset = gpio_chip_hwgpio(desc);
 	if (chip->names && chip->names[offset])
-- 
2.0.5

