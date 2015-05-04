From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 11/23] gpio: sysfs: remove redundant export tests
Date: Mon,  4 May 2015 17:10:36 +0200
Message-ID: <1430752248-15401-12-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

The attribute operations will never be called for an unregistered device
so remove redundant checks for FLAG_EXPORT.

Note that kernfs will also guarantee that any active sysfs operation has
finished before the attribute is removed during deregistration.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 74 ++++++++++++++------------------------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index e4b079eec9bc..10baf31efe74 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -46,14 +46,10 @@ static ssize_t direction_show(struct device *dev,
 
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags)) {
-		status = -EIO;
-	} else {
-		gpiod_get_direction(desc);
-		status = sprintf(buf, "%s\n",
+	gpiod_get_direction(desc);
+	status = sprintf(buf, "%s\n",
 			test_bit(FLAG_IS_OUT, &desc->flags)
 				? "out" : "in");
-	}
 
 	mutex_unlock(&sysfs_lock);
 	return status;
@@ -67,9 +63,7 @@ static ssize_t direction_store(struct device *dev,
 
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		status = -EIO;
-	else if (sysfs_streq(buf, "high"))
+	if (sysfs_streq(buf, "high"))
 		status = gpiod_direction_output_raw(desc, 1);
 	else if (sysfs_streq(buf, "out") || sysfs_streq(buf, "low"))
 		status = gpiod_direction_output_raw(desc, 0);
@@ -91,10 +85,7 @@ static ssize_t value_show(struct device *dev,
 
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		status = -EIO;
-	else
-		status = sprintf(buf, "%d\n", gpiod_get_value_cansleep(desc));
+	status = sprintf(buf, "%d\n", gpiod_get_value_cansleep(desc));
 
 	mutex_unlock(&sysfs_lock);
 	return status;
@@ -108,11 +99,9 @@ static ssize_t value_store(struct device *dev,
 
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		status = -EIO;
-	else if (!test_bit(FLAG_IS_OUT, &desc->flags))
+	if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
 		status = -EPERM;
-	else {
+	} else {
 		long		value;
 
 		status = kstrtol(buf, 0, &value);
@@ -237,23 +226,18 @@ static ssize_t edge_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	const struct gpio_desc	*desc = dev_get_drvdata(dev);
-	ssize_t			status;
+	unsigned long mask;
+	ssize_t	status = 0;
+	int i;
 
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		status = -EIO;
-	else {
-		int i;
-
-		status = 0;
-		for (i = 0; i < ARRAY_SIZE(trigger_types); i++)
-			if ((desc->flags & GPIO_TRIGGER_MASK)
-					== trigger_types[i].flags) {
-				status = sprintf(buf, "%s\n",
-						 trigger_types[i].name);
-				break;
-			}
+	for (i = 0; i < ARRAY_SIZE(trigger_types); i++) {
+		mask = desc->flags & GPIO_TRIGGER_MASK;
+		if (mask == trigger_types[i].flags) {
+			status = sprintf(buf, "%s\n", trigger_types[i].name);
+			break;
+		}
 	}
 
 	mutex_unlock(&sysfs_lock);
@@ -275,13 +259,9 @@ static ssize_t edge_store(struct device *dev,
 found:
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		status = -EIO;
-	else {
-		status = gpio_setup_irq(desc, dev, trigger_types[i].flags);
-		if (!status)
-			status = size;
-	}
+	status = gpio_setup_irq(desc, dev, trigger_types[i].flags);
+	if (!status)
+		status = size;
 
 	mutex_unlock(&sysfs_lock);
 
@@ -322,10 +302,7 @@ static ssize_t active_low_show(struct device *dev,
 
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		status = -EIO;
-	else
-		status = sprintf(buf, "%d\n",
+	status = sprintf(buf, "%d\n",
 				!!test_bit(FLAG_ACTIVE_LOW, &desc->flags));
 
 	mutex_unlock(&sysfs_lock);
@@ -338,18 +315,13 @@ static ssize_t active_low_store(struct device *dev,
 {
 	struct gpio_desc	*desc = dev_get_drvdata(dev);
 	ssize_t			status;
+	long			value;
 
 	mutex_lock(&sysfs_lock);
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags)) {
-		status = -EIO;
-	} else {
-		long		value;
-
-		status = kstrtol(buf, 0, &value);
-		if (status == 0)
-			status = sysfs_set_active_low(desc, dev, value != 0);
-	}
+	status = kstrtol(buf, 0, &value);
+	if (status == 0)
+		status = sysfs_set_active_low(desc, dev, value != 0);
 
 	mutex_unlock(&sysfs_lock);
 
-- 
2.0.5
