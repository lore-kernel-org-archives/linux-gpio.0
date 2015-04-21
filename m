From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 22/23] gpio: sysfs: remove FLAG_SYSFS_DIR
Date: Tue, 21 Apr 2015 17:42:30 +0200
Message-ID: <1429630951-27082-23-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Remove FLAG_SYSFS_DIR, which is sysfs-interface specific, and store it
in the class-device data instead.

Note that the flag is only used during export.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 15 +++++++--------
 drivers/gpio/gpiolib.h       |  1 -
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 00609e197f50..27a8c84fc241 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -16,6 +16,8 @@ struct gpiod_data {
 	struct mutex mutex;
 	struct kernfs_node *value_kn;
 	int irq;
+
+	bool direction_can_change;
 };
 
 /*
@@ -339,7 +341,7 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	umode_t mode = attr->mode;
-	bool show_direction = test_bit(FLAG_SYSFS_DIR, &desc->flags);
+	bool show_direction = data->direction_can_change;
 
 	if (attr == &dev_attr_direction.attr) {
 		if (!show_direction)
@@ -568,12 +570,6 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		status = -EPERM;
 		goto err_unlock;
 	}
-
-	if (chip->direction_input && chip->direction_output &&
-			direction_may_change) {
-		set_bit(FLAG_SYSFS_DIR, &desc->flags);
-	}
-
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
@@ -584,6 +580,10 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	data->desc = desc;
 	mutex_init(&data->mutex);
+	if (chip->direction_input && chip->direction_output)
+		data->direction_can_change = direction_may_change;
+	else
+		data->direction_can_change = false;
 
 	offset = gpio_chip_hwgpio(desc);
 	if (chip->names && chip->names[offset])
@@ -678,7 +678,6 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 	data = dev_get_drvdata(dev);
 
-	clear_bit(FLAG_SYSFS_DIR, &desc->flags);
 	clear_bit(FLAG_EXPORT, &desc->flags);
 
 	device_unregister(dev);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 4deb71d2bd01..591257a4359a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -87,7 +87,6 @@ struct gpio_desc {
 #define FLAG_OPEN_DRAIN	7	/* Gpio is open drain type */
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
-#define FLAG_SYSFS_DIR	10	/* show sysfs direction attribute */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
 
 #define GPIO_TRIGGER_MASK	(BIT(FLAG_TRIG_FALL) | BIT(FLAG_TRIG_RISE))
-- 
2.0.5
