From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 16/23] gpio: sysfs: split irq allocation and deallocation
Date: Tue, 21 Apr 2015 17:42:24 +0200
Message-ID: <1429630951-27082-17-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Add separate helper functions for irq request and free.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 72 ++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index bd22de806182..323272569292 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -13,6 +13,7 @@
 struct gpiod_data {
 	struct gpio_desc *desc;
 	struct kernfs_node *value_kn;
+	int irq;
 };
 
 /* lock protects against unexport_gpio() being called while
@@ -132,26 +133,20 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
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
-		ret = 0;
-		goto free_kn;
-	}
+	data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!data->value_kn)
+		return -ENODEV;
 
 	irq_flags = IRQF_SHARED;
 	if (test_bit(FLAG_TRIG_FALL, &gpio_flags))
@@ -161,31 +156,31 @@ static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
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
-	ret = request_any_context_irq(irq, gpio_sysfs_irq, irq_flags,
+	ret = request_any_context_irq(data->irq, gpio_sysfs_irq, irq_flags,
 				"gpiolib", data);
 	if (ret < 0)
-		goto free_kn;
+		goto err_put_kn;
 
 	desc->flags |= gpio_flags;
+
 	return 0;
 
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
+	sysfs_put(data->value_kn);
+}
+
 static const struct {
 	const char *name;
 	unsigned long flags;
@@ -225,7 +220,7 @@ static ssize_t edge_store(struct device *dev,
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	unsigned long flags;
-	ssize_t			status;
+	ssize_t	status = size;
 	int			i;
 
 	for (i = 0; i < ARRAY_SIZE(trigger_types); i++)
@@ -243,9 +238,14 @@ found:
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
@@ -273,8 +273,8 @@ static int sysfs_set_active_low(struct device *dev, int value)
 				!!test_bit(FLAG_TRIG_FALL, &desc->flags)) {
 		unsigned long trigger_flags = desc->flags & GPIO_TRIGGER_MASK;
 
-		gpio_setup_irq(dev, 0);
-		status = gpio_setup_irq(dev, trigger_flags);
+		gpio_sysfs_free_irq(dev);
+		status = gpio_sysfs_request_irq(dev, trigger_flags);
 	}
 
 	return status;
@@ -684,7 +684,7 @@ void gpiod_unexport(struct gpio_desc *desc)
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
