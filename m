From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 23/23] gpio: sysfs: move irq trigger flags to class-device data
Date: Tue, 21 Apr 2015 17:42:31 +0200
Message-ID: <1429630951-27082-24-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Move irq trigger flags, which as sysfs-interface specific, to the class
device data.

This avoids accessing the gpio-descriptor flags field using non-atomic
operations without any locking, and allows for a more clear separation
of the sysfs interface from gpiolib core.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 48 ++++++++++++++++++++++----------------------
 drivers/gpio/gpiolib.h       |  4 ----
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 27a8c84fc241..8786b8b79ce6 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -10,12 +10,18 @@
 
 #include "gpiolib.h"
 
+#define GPIO_IRQF_TRIGGER_FALLING	BIT(0)
+#define GPIO_IRQF_TRIGGER_RISING	BIT(1)
+#define GPIO_IRQF_TRIGGER_BOTH		(GPIO_IRQF_TRIGGER_FALLING | \
+					 GPIO_IRQF_TRIGGER_RISING)
+
 struct gpiod_data {
 	struct gpio_desc *desc;
 
 	struct mutex mutex;
 	struct kernfs_node *value_kn;
 	int irq;
+	unsigned char irq_flags;
 
 	bool direction_can_change;
 };
@@ -143,7 +149,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 }
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_request_irq(struct device *dev, unsigned long gpio_flags)
+static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 {
 	struct gpiod_data	*data = dev_get_drvdata(dev);
 	struct gpio_desc	*desc = data->desc;
@@ -159,10 +165,10 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned long gpio_flags)
 		return -ENODEV;
 
 	irq_flags = IRQF_SHARED;
-	if (test_bit(FLAG_TRIG_FALL, &gpio_flags))
+	if (flags & GPIO_IRQF_TRIGGER_FALLING)
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
-	if (test_bit(FLAG_TRIG_RISE, &gpio_flags))
+	if (flags & GPIO_IRQF_TRIGGER_RISING)
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 
@@ -171,7 +177,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned long gpio_flags)
 	if (ret < 0)
 		goto err_put_kn;
 
-	desc->flags |= gpio_flags;
+	data->irq_flags = flags;
 
 	return 0;
 
@@ -188,37 +194,33 @@ err_put_kn:
 static void gpio_sysfs_free_irq(struct device *dev)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
-	struct gpio_desc *desc = data->desc;
 
-	desc->flags &= ~GPIO_TRIGGER_MASK;
+	data->irq_flags = 0;
 	free_irq(data->irq, data);
 	sysfs_put(data->value_kn);
 }
 
 static const struct {
 	const char *name;
-	unsigned long flags;
+	unsigned char flags;
 } trigger_types[] = {
 	{ "none",    0 },
-	{ "falling", BIT(FLAG_TRIG_FALL) },
-	{ "rising",  BIT(FLAG_TRIG_RISE) },
-	{ "both",    BIT(FLAG_TRIG_FALL) | BIT(FLAG_TRIG_RISE) },
+	{ "falling", GPIO_IRQF_TRIGGER_FALLING },
+	{ "rising",  GPIO_IRQF_TRIGGER_RISING },
+	{ "both",    GPIO_IRQF_TRIGGER_BOTH },
 };
 
 static ssize_t edge_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
-	struct gpio_desc *desc = data->desc;
-	unsigned long mask;
 	ssize_t	status = 0;
 	int i;
 
 	mutex_lock(&data->mutex);
 
 	for (i = 0; i < ARRAY_SIZE(trigger_types); i++) {
-		mask = desc->flags & GPIO_TRIGGER_MASK;
-		if (mask == trigger_types[i].flags) {
+		if (data->irq_flags == trigger_types[i].flags) {
 			status = sprintf(buf, "%s\n", trigger_types[i].name);
 			break;
 		}
@@ -233,8 +235,7 @@ static ssize_t edge_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
-	struct gpio_desc *desc = data->desc;
-	unsigned long flags;
+	unsigned char flags;
 	ssize_t	status = size;
 	int i;
 
@@ -250,12 +251,12 @@ static ssize_t edge_store(struct device *dev,
 
 	mutex_lock(&data->mutex);
 
-	if ((desc->flags & GPIO_TRIGGER_MASK) == flags) {
+	if (flags == data->irq_flags) {
 		status = size;
 		goto out_unlock;
 	}
 
-	if (desc->flags & GPIO_TRIGGER_MASK)
+	if (data->irq_flags)
 		gpio_sysfs_free_irq(dev);
 
 	if (flags) {
@@ -277,6 +278,7 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	struct gpiod_data	*data = dev_get_drvdata(dev);
 	struct gpio_desc	*desc = data->desc;
 	int			status = 0;
+	unsigned int		flags = data->irq_flags;
 
 	if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
 		return 0;
@@ -287,12 +289,10 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
 
 	/* reconfigure poll(2) support if enabled on one edge only */
-	if (!!test_bit(FLAG_TRIG_RISE, &desc->flags) ^
-				!!test_bit(FLAG_TRIG_FALL, &desc->flags)) {
-		unsigned long trigger_flags = desc->flags & GPIO_TRIGGER_MASK;
-
+	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
+					flags == GPIO_IRQF_TRIGGER_RISING) {
 		gpio_sysfs_free_irq(dev);
-		status = gpio_sysfs_request_irq(dev, trigger_flags);
+		status = gpio_sysfs_request_irq(dev, flags);
 	}
 
 	return status;
@@ -685,7 +685,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	/*
 	 * Release irq after deregistration to prevent race with edge_store.
 	 */
-	if (desc->flags & GPIO_TRIGGER_MASK)
+	if (data->irq_flags)
 		gpio_sysfs_free_irq(dev);
 
 	mutex_unlock(&sysfs_lock);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 591257a4359a..e048be7d1f5e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -81,16 +81,12 @@ struct gpio_desc {
 #define FLAG_IS_OUT	1
 #define FLAG_EXPORT	2	/* protected by sysfs_lock */
 #define FLAG_SYSFS	3	/* exported via /sys/class/gpio/control */
-#define FLAG_TRIG_FALL	4	/* trigger on falling edge */
-#define FLAG_TRIG_RISE	5	/* trigger on rising edge */
 #define FLAG_ACTIVE_LOW	6	/* value has active low */
 #define FLAG_OPEN_DRAIN	7	/* Gpio is open drain type */
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
 
-#define GPIO_TRIGGER_MASK	(BIT(FLAG_TRIG_FALL) | BIT(FLAG_TRIG_RISE))
-
 	const char		*label;
 };
 
-- 
2.0.5
