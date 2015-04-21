From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 14/23] gpio: sysfs: clean up interrupt-interface implementation
Date: Tue, 21 Apr 2015 17:42:22 +0200
Message-ID: <1429630951-27082-15-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Store the value sysfs entry in the gpiod data rather than in a global
table accessed through an index stored in the overloaded gpio-descriptor
flag field.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 54 +++++++++++++++-----------------------------
 drivers/gpio/gpiolib.h       |  3 ---
 2 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index bc4f192c0aa3..8041c1728231 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -12,11 +12,9 @@
 
 struct gpiod_data {
 	struct gpio_desc *desc;
+	struct kernfs_node *value_kn;
 };
 
-static DEFINE_IDR(dirent_idr);
-
-
 /* lock protects against unexport_gpio() being called while
  * sysfs files are active.
  */
@@ -127,9 +125,10 @@ static DEVICE_ATTR_RW(value);
 
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
-	struct kernfs_node	*value_sd = priv;
+	struct gpiod_data *data = priv;
+
+	sysfs_notify_dirent(data->value_kn);
 
-	sysfs_notify_dirent(value_sd);
 	return IRQ_HANDLED;
 }
 
@@ -137,9 +136,8 @@ static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
 {
 	struct gpiod_data	*data = dev_get_drvdata(dev);
 	struct gpio_desc	*desc = data->desc;
-	struct kernfs_node	*value_sd;
 	unsigned long		irq_flags;
-	int			ret, irq, id;
+	int			ret, irq;
 
 	if ((desc->flags & GPIO_TRIGGER_MASK) == gpio_flags)
 		return 0;
@@ -148,16 +146,14 @@ static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
 	if (irq < 0)
 		return -EIO;
 
-	id = desc->flags >> ID_SHIFT;
-	value_sd = idr_find(&dirent_idr, id);
-	if (value_sd)
-		free_irq(irq, value_sd);
+	if (data->value_kn)
+		free_irq(irq, data);
 
 	desc->flags &= ~GPIO_TRIGGER_MASK;
 
 	if (!gpio_flags) {
 		ret = 0;
-		goto free_id;
+		goto free_kn;
 	}
 
 	irq_flags = IRQF_SHARED;
@@ -168,41 +164,27 @@ static int gpio_setup_irq(struct device *dev, unsigned long gpio_flags)
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 
-	if (!value_sd) {
-		value_sd = sysfs_get_dirent(dev->kobj.sd, "value");
-		if (!value_sd) {
+	if (!data->value_kn) {
+		data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
+		if (!data->value_kn) {
 			ret = -ENODEV;
 			goto err_out;
 		}
-
-		ret = idr_alloc(&dirent_idr, value_sd, 1, 0, GFP_KERNEL);
-		if (ret < 0)
-			goto free_sd;
-		id = ret;
-
-		desc->flags &= GPIO_FLAGS_MASK;
-		desc->flags |= (unsigned long)id << ID_SHIFT;
-
-		if (desc->flags >> ID_SHIFT != id) {
-			ret = -ERANGE;
-			goto free_id;
-		}
 	}
 
 	ret = request_any_context_irq(irq, gpio_sysfs_irq, irq_flags,
-				"gpiolib", value_sd);
+				"gpiolib", data);
 	if (ret < 0)
-		goto free_id;
+		goto free_kn;
 
 	desc->flags |= gpio_flags;
 	return 0;
 
-free_id:
-	idr_remove(&dirent_idr, id);
-	desc->flags &= GPIO_FLAGS_MASK;
-free_sd:
-	if (value_sd)
-		sysfs_put(value_sd);
+free_kn:
+	if (data->value_kn) {
+		sysfs_put(data->value_kn);
+		data->value_kn = NULL;
+	}
 err_out:
 	return ret;
 }
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 69458a022c90..4deb71d2bd01 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -90,9 +90,6 @@ struct gpio_desc {
 #define FLAG_SYSFS_DIR	10	/* show sysfs direction attribute */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
 
-#define ID_SHIFT	16	/* add new flags before this one */
-
-#define GPIO_FLAGS_MASK		((1 << ID_SHIFT) - 1)
 #define GPIO_TRIGGER_MASK	(BIT(FLAG_TRIG_FALL) | BIT(FLAG_TRIG_RISE))
 
 	const char		*label;
-- 
2.0.5
