From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 22/23] gpio: sysfs: remove FLAG_SYSFS_DIR
Date: Mon,  4 May 2015 17:10:47 +0200
Message-ID: <1430752248-15401-23-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:35673 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbbEDPNo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:44 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Remove FLAG_SYSFS_DIR, which is sysfs-interface specific, and store it
in the class-device data instead.

Note that the flag is only used during export.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 15 +++++++--------
 drivers/gpio/gpiolib.h       |  1 -
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 06372c7c822c..9047b2d556a0 100644
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
@@ -354,7 +356,7 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	umode_t mode = attr->mode;
-	bool show_direction = test_bit(FLAG_SYSFS_DIR, &desc->flags);
+	bool show_direction = data->direction_can_change;
 
 	if (attr == &dev_attr_direction.attr) {
 		if (!show_direction)
@@ -583,12 +585,6 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
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
@@ -599,6 +595,10 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	data->desc = desc;
 	mutex_init(&data->mutex);
+	if (chip->direction_input && chip->direction_output)
+		data->direction_can_change = direction_may_change;
+	else
+		data->direction_can_change = false;
 
 	offset = gpio_chip_hwgpio(desc);
 	if (chip->names && chip->names[offset])
@@ -693,7 +693,6 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 	data = dev_get_drvdata(dev);
 
-	clear_bit(FLAG_SYSFS_DIR, &desc->flags);
 	clear_bit(FLAG_EXPORT, &desc->flags);
 
 	device_unregister(dev);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 4a857da698b2..34eea33e482c 100644
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

