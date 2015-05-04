From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 09/23] gpio: sysfs: use DEVICE_ATTR macros
Date: Mon,  4 May 2015 17:10:34 +0200
Message-ID: <1430752248-15401-10-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:36752 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751896AbbEDPNo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:44 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Use DEVICE_ATTR_RO and DEVICE_ATTR_RW rather than specifying masks and
callbacks directly.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 9dcd346a20fb..a78dabd4035b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -38,7 +38,7 @@ static DEFINE_MUTEX(sysfs_lock);
  *        /edge configuration
  */
 
-static ssize_t gpio_direction_show(struct device *dev,
+static ssize_t direction_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -59,7 +59,7 @@ static ssize_t gpio_direction_show(struct device *dev,
 	return status;
 }
 
-static ssize_t gpio_direction_store(struct device *dev,
+static ssize_t direction_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
 	struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -81,11 +81,9 @@ static ssize_t gpio_direction_store(struct device *dev,
 	mutex_unlock(&sysfs_lock);
 	return status ? : size;
 }
+static DEVICE_ATTR_RW(direction);
 
-static /* const */ DEVICE_ATTR(direction, 0644,
-		gpio_direction_show, gpio_direction_store);
-
-static ssize_t gpio_value_show(struct device *dev,
+static ssize_t value_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -102,7 +100,7 @@ static ssize_t gpio_value_show(struct device *dev,
 	return status;
 }
 
-static ssize_t gpio_value_store(struct device *dev,
+static ssize_t value_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
 	struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -127,9 +125,7 @@ static ssize_t gpio_value_store(struct device *dev,
 	mutex_unlock(&sysfs_lock);
 	return status;
 }
-
-static DEVICE_ATTR(value, 0644,
-		gpio_value_show, gpio_value_store);
+static DEVICE_ATTR_RW(value);
 
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
@@ -237,7 +233,7 @@ static const struct {
 	{ "both",    BIT(FLAG_TRIG_FALL) | BIT(FLAG_TRIG_RISE) },
 };
 
-static ssize_t gpio_edge_show(struct device *dev,
+static ssize_t edge_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	const struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -264,7 +260,7 @@ static ssize_t gpio_edge_show(struct device *dev,
 	return status;
 }
 
-static ssize_t gpio_edge_store(struct device *dev,
+static ssize_t edge_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
 	struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -291,8 +287,7 @@ found:
 
 	return status;
 }
-
-static DEVICE_ATTR(edge, 0644, gpio_edge_show, gpio_edge_store);
+static DEVICE_ATTR_RW(edge);
 
 static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
 				int value)
@@ -319,7 +314,7 @@ static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
 	return status;
 }
 
-static ssize_t gpio_active_low_show(struct device *dev,
+static ssize_t active_low_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	const struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -338,7 +333,7 @@ static ssize_t gpio_active_low_show(struct device *dev,
 	return status;
 }
 
-static ssize_t gpio_active_low_store(struct device *dev,
+static ssize_t active_low_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
 	struct gpio_desc	*desc = dev_get_drvdata(dev);
@@ -360,9 +355,7 @@ static ssize_t gpio_active_low_store(struct device *dev,
 
 	return status ? : size;
 }
-
-static DEVICE_ATTR(active_low, 0644,
-		gpio_active_low_show, gpio_active_low_store);
+static DEVICE_ATTR_RW(active_low);
 
 static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			       int n)
@@ -410,32 +403,32 @@ static const struct attribute_group *gpio_groups[] = {
  *   /ngpio ... matching gpio_chip.ngpio
  */
 
-static ssize_t chip_base_show(struct device *dev,
+static ssize_t base_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	const struct gpio_chip	*chip = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%d\n", chip->base);
 }
-static DEVICE_ATTR(base, 0444, chip_base_show, NULL);
+static DEVICE_ATTR_RO(base);
 
-static ssize_t chip_label_show(struct device *dev,
+static ssize_t label_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	const struct gpio_chip	*chip = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%s\n", chip->label ? : "");
 }
-static DEVICE_ATTR(label, 0444, chip_label_show, NULL);
+static DEVICE_ATTR_RO(label);
 
-static ssize_t chip_ngpio_show(struct device *dev,
+static ssize_t ngpio_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	const struct gpio_chip	*chip = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%u\n", chip->ngpio);
 }
-static DEVICE_ATTR(ngpio, 0444, chip_ngpio_show, NULL);
+static DEVICE_ATTR_RO(ngpio);
 
 static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
-- 
2.0.5

