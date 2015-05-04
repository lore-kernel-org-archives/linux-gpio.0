From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 13/23] gpio: sysfs: remove redundant gpio-descriptor parameters
Date: Mon,  4 May 2015 17:10:38 +0200
Message-ID: <1430752248-15401-14-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:35690 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050AbbEDPNp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:45 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Remove redundant gpio-descriptor parameters from sysfs_set_active_low and
gpio_setup_irq.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 097e7e539c9d..0bc959fbcf23 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -133,9 +133,10 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
-		unsigned long gpio_flags)
+static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
 {
+	struct gpiod_data	*data = dev_get_drvdata(dev);
+	struct gpio_desc	*desc = data->desc;
 	struct kernfs_node	*value_sd;
 	unsigned long		irq_flags;
 	int			ret, irq, id;
@@ -257,8 +258,6 @@ static ssize_t edge_show(struct device *dev,
 static ssize_t edge_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
-	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 	int			i;
 
@@ -270,7 +269,7 @@ static ssize_t edge_store(struct device *dev,
 found:
 	mutex_lock(&sysfs_lock);
 
-	status = gpio_setup_irq(desc, dev, trigger_types[i].flags);
+	status = gpio_setup_irq(dev, trigger_types[i].flags);
 	if (!status)
 		status = size;
 
@@ -280,9 +279,10 @@ found:
 }
 static DEVICE_ATTR_RW(edge);
 
-static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
-				int value)
+static int sysfs_set_active_low(struct device *dev, int value)
 {
+	struct gpiod_data	*data = dev_get_drvdata(dev);
+	struct gpio_desc	*desc = data->desc;
 	int			status = 0;
 
 	if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
@@ -298,8 +298,8 @@ static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
 				!!test_bit(FLAG_TRIG_FALL, &desc->flags)) {
 		unsigned long trigger_flags = desc->flags & GPIO_TRIGGER_MASK;
 
-		gpio_setup_irq(desc, dev, 0);
-		status = gpio_setup_irq(desc, dev, trigger_flags);
+		gpio_setup_irq(dev, 0);
+		status = gpio_setup_irq(dev, trigger_flags);
 	}
 
 	return status;
@@ -325,8 +325,6 @@ static ssize_t active_low_show(struct device *dev,
 static ssize_t active_low_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
-	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 	long			value;
 
@@ -334,7 +332,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	status = kstrtol(buf, 0, &value);
 	if (status == 0)
-		status = sysfs_set_active_low(desc, dev, value != 0);
+		status = sysfs_set_active_low(dev, value != 0);
 
 	mutex_unlock(&sysfs_lock);
 
@@ -710,7 +708,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 * Release irq after deregistration to prevent race with
 		 * edge_store.
 		 */
-		gpio_setup_irq(desc, dev, 0);
+		gpio_setup_irq(dev, 0);
 		put_device(dev);
 		kfree(data);
 	}
-- 
2.0.5

