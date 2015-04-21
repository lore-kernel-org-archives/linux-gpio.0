From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 15/23] gpio: sysfs: only call irq helper if needed
Date: Tue, 21 Apr 2015 17:42:23 +0200
Message-ID: <1429630951-27082-16-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Only call irq helper if actually reconfiguring interrupt state.

This is a preparatory step in introducing separate gpio-irq request and
free functions.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 8041c1728231..bd22de806182 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -139,9 +139,6 @@ static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
 	unsigned long		irq_flags;
 	int			ret, irq;
 
-	if ((desc->flags & GPIO_TRIGGER_MASK) == gpio_flags)
-		return 0;
-
 	irq = gpiod_to_irq(desc);
 	if (irq < 0)
 		return -EIO;
@@ -225,6 +222,9 @@ static ssize_t edge_show(struct device *dev,
 static ssize_t edge_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
+	unsigned long flags;
 	ssize_t			status;
 	int			i;
 
@@ -234,12 +234,20 @@ static ssize_t edge_store(struct device *dev,
 	return -EINVAL;
 
 found:
+	flags = trigger_types[i].flags;
+
 	mutex_lock(&sysfs_lock);
 
-	status = gpio_setup_irq(dev, trigger_types[i].flags);
+	if ((desc->flags & GPIO_TRIGGER_MASK) == flags) {
+		status = size;
+		goto out_unlock;
+	}
+
+	status = gpio_setup_irq(dev, flags);
 	if (!status)
 		status = size;
 
+out_unlock:
 	mutex_unlock(&sysfs_lock);
 
 	return status;
@@ -675,7 +683,8 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 * Release irq after deregistration to prevent race with
 		 * edge_store.
 		 */
-		gpio_setup_irq(dev, 0);
+		if (desc->flags & GPIO_TRIGGER_MASK)
+			gpio_setup_irq(dev, 0);
 		put_device(dev);
 		kfree(data);
 	}
-- 
2.0.5
