From: Alexey Ignatov <lexszero@gmail.com>
Subject: [PATCH] gpiolib: allow exporting gpios with custom names
Date: Sat, 11 Oct 2014 21:45:16 +0400
Message-ID: <1413049516-27021-1-git-send-email-lexszero@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:46431 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752677AbaJKRq1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Oct 2014 13:46:27 -0400
Received: by mail-la0-f50.google.com with SMTP id s18so4939864lam.9
        for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2014 10:46:25 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexey Ignatov <lexszero@gmail.com>

This allows exporting gpio pins to sysfs with custom names. Before
this patch only gpiochip-supplied names was used, or generic gpio%d.
Added gpiod_export_name() and gpio_export_name() functions.
gpio_request_one() now uses new behaviour with 'label' as gpio name.

Signed-off-by: Alexey Ignatov <lexszero@gmail.com>
---
 drivers/gpio/gpiolib-sysfs.c  | 16 +++++++++++++++-
 drivers/gpio/gpiolib.h        |  1 +
 include/asm-generic/gpio.h    |  6 ++++++
 include/linux/gpio/consumer.h |  2 ++
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 5f2150b..7c56a50 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -561,7 +561,9 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	offset = gpio_chip_hwgpio(desc);
-	if (desc->chip->names && desc->chip->names[offset])
+	if (desc->ioname)
+		ioname = desc->ioname;
+	else if (desc->chip->names && desc->chip->names[offset])
 		ioname = desc->chip->names[offset];
 
 	dev = device_create(&gpio_class, desc->chip->dev, MKDEV(0, 0),
@@ -602,6 +604,18 @@ fail_unlock:
 }
 EXPORT_SYMBOL_GPL(gpiod_export);
 
+int gpiod_export_name(struct gpio_desc *desc, bool direction_may_change,
+		const char *name)
+{
+	if (!desc) {
+		pr_debug("%s: invalid gpio descriptor\n", __func__);
+		return -EINVAL;
+	}
+	desc->ioname = name;
+	return gpiod_export(desc, direction_may_change);
+}
+EXPORT_SYMBOL_GPL(gpiod_export_name);
+
 static int match_export(struct device *dev, const void *data)
 {
 	return dev_get_drvdata(dev) == data;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 9db2b6a..9df4bcf 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -64,6 +64,7 @@ extern struct list_head gpio_chips;
 
 struct gpio_desc {
 	struct gpio_chip	*chip;
+	const char			*ioname;
 	unsigned long		flags;
 /* flag symbols are bit numbers */
 #define FLAG_REQUESTED	0
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index c1d4105..7957b22 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -123,6 +123,12 @@ static inline int gpio_export(unsigned gpio, bool direction_may_change)
 	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
 }
 
+static inline int gpio_export_name(unsigned gpio, bool direction_may_change,
+		const char *name)
+{
+	return gpiod_export_name(gpio_to_desc(gpio), direction_may_change, name);
+}
+
 static inline int gpio_export_link(struct device *dev, const char *name,
 				   unsigned gpio)
 {
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 12f146f..2f4c129 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -324,6 +324,8 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_GPIO_SYSFS)
 
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
+int gpiod_export_name(struct gpio_desc *desc, bool direction_may_change,
+		const char *name);
 int gpiod_export_link(struct device *dev, const char *name,
 		      struct gpio_desc *desc);
 int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value);
-- 
1.8.5.3

