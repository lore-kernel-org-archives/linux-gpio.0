From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 16/23] gpio: sysfs: split irq allocation and deallocation
Date: Mon,  4 May 2015 17:10:41 +0200
Message-ID: <1430752248-15401-17-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:36789 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752057AbbEDPNq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:46 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Add separate helper functions for irq request and free.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 74 ++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 201b757ad0db..d9b3faa01fee 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -13,6 +13,7 @@
 struct gpiod_data {
 	struct gpio_desc *desc;
 	struct kernfs_node *value_kn;
+	int irq;
 };
 
 /* lock protects against unexport_gpio() being called while
@@ -132,27 +133,20 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
+static int gpio_sysfs_request_irq(struct device *dev, unsigned long gpio_flags)
 {
 	struct gpiod_data	*data = dev_get_drvdata(dev);
 	struct gpio_desc	*desc = data->desc;
 	unsigned long		irq_flags;
-	int			ret, irq;
+	int			ret;
 
-	irq = gpiod_to_irq(desc);
-	if (irq < 0)
+	data->irq = gpiod_to_irq(desc);
+	if (data->irq < 0)
 		return -EIO;
 
-	if (data->value_kn)
-		free_irq(irq, data);
-
-	desc->flags &= ~GPIO_TRIGGER_MASK;
-
-	if (!gpio_flags) {
-		gpiochip_unlock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
-		ret = 0;
-		goto free_kn;
-	}
+	data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!data->value_kn)
+		return -ENODEV;
 
 	irq_flags = IRQF_SHARED;
 	if (test_bit(FLAG_TRIG_FALL, &gpio_flags))
@@ -162,14 +156,6 @@ static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 
-	if (!data->value_kn) {
-		data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
-		if (!data->value_kn) {
-			ret = -ENODEV;
-			goto err_out;
-		}
-	}
-
 	/*
 	 * FIXME: This should be done in the irq_request_resources callback
 	 *        when the irq is requested, but a few drivers currently fail
@@ -180,27 +166,36 @@ static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
 	 */
 	ret = gpiochip_lock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
 	if (ret < 0)
-		goto free_kn;
+		goto err_put_kn;
 
-	ret = request_any_context_irq(irq, gpio_sysfs_irq, irq_flags,
+	ret = request_any_context_irq(data->irq, gpio_sysfs_irq, irq_flags,
 				"gpiolib", data);
 	if (ret < 0)
 		goto err_unlock;
 
 	desc->flags |= gpio_flags;
+
 	return 0;
 
 err_unlock:
 	gpiochip_unlock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
-free_kn:
-	if (data->value_kn) {
-		sysfs_put(data->value_kn);
-		data->value_kn = NULL;
-	}
-err_out:
+err_put_kn:
+	sysfs_put(data->value_kn);
+
 	return ret;
 }
 
+static void gpio_sysfs_free_irq(struct device *dev)
+{
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
+
+	desc->flags &= ~GPIO_TRIGGER_MASK;
+	free_irq(data->irq, data);
+	gpiochip_unlock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
+	sysfs_put(data->value_kn);
+}
+
 static const struct {
 	const char *name;
 	unsigned long flags;
@@ -240,7 +235,7 @@ static ssize_t edge_store(struct device *dev,
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	unsigned long flags;
-	ssize_t			status;
+	ssize_t	status = size;
 	int			i;
 
 	for (i = 0; i < ARRAY_SIZE(trigger_types); i++)
@@ -258,9 +253,14 @@ found:
 		goto out_unlock;
 	}
 
-	status = gpio_setup_irq(dev, flags);
-	if (!status)
-		status = size;
+	if (desc->flags & GPIO_TRIGGER_MASK)
+		gpio_sysfs_free_irq(dev);
+
+	if (flags) {
+		status = gpio_sysfs_request_irq(dev, flags);
+		if (!status)
+			status = size;
+	}
 
 out_unlock:
 	mutex_unlock(&sysfs_lock);
@@ -288,8 +288,8 @@ static int sysfs_set_active_low(struct device *dev, int value)
 				!!test_bit(FLAG_TRIG_FALL, &desc->flags)) {
 		unsigned long trigger_flags = desc->flags & GPIO_TRIGGER_MASK;
 
-		gpio_setup_irq(dev, 0);
-		status = gpio_setup_irq(dev, trigger_flags);
+		gpio_sysfs_free_irq(dev);
+		status = gpio_sysfs_request_irq(dev, trigger_flags);
 	}
 
 	return status;
@@ -699,7 +699,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 * edge_store.
 		 */
 		if (desc->flags & GPIO_TRIGGER_MASK)
-			gpio_setup_irq(dev, 0);
+			gpio_sysfs_free_irq(dev);
 		put_device(dev);
 		kfree(data);
 	}
-- 
2.0.5

