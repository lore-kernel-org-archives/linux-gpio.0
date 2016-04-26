From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: move gpiod_set_array_value_priv()
Date: Tue, 26 Apr 2016 10:51:03 +0200
Message-ID: <1461660663-17207-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36605 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490AbcDZIvJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 04:51:09 -0400
Received: by mail-lf0-f50.google.com with SMTP id u64so8329766lff.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 01:51:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This renames gpiod_set_array_value_priv() to
gpiod_set_array_value_complex() and moves it to the gpiolib.h
private header file so we can reuse it in the subsystem.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 24 ++++++++++++------------
 drivers/gpio/gpiolib.h |  4 ++++
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59a0d8e98a04..bb3195d5e3af 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1825,10 +1825,10 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
 	}
 }
 
-static void gpiod_set_array_value_priv(bool raw, bool can_sleep,
-				       unsigned int array_size,
-				       struct gpio_desc **desc_array,
-				       int *value_array)
+void gpiod_set_array_value_complex(bool raw, bool can_sleep,
+				   unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array)
 {
 	int i = 0;
 
@@ -1934,8 +1934,8 @@ void gpiod_set_raw_array_value(unsigned int array_size,
 {
 	if (!desc_array)
 		return;
-	gpiod_set_array_value_priv(true, false, array_size, desc_array,
-				   value_array);
+	gpiod_set_array_value_complex(true, false, array_size, desc_array,
+				      value_array);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_array_value);
 
@@ -1956,8 +1956,8 @@ void gpiod_set_array_value(unsigned int array_size,
 {
 	if (!desc_array)
 		return;
-	gpiod_set_array_value_priv(false, false, array_size, desc_array,
-				   value_array);
+	gpiod_set_array_value_complex(false, false, array_size, desc_array,
+				      value_array);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_array_value);
 
@@ -2160,8 +2160,8 @@ void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 	might_sleep_if(extra_checks);
 	if (!desc_array)
 		return;
-	gpiod_set_array_value_priv(true, true, array_size, desc_array,
-				   value_array);
+	gpiod_set_array_value_complex(true, true, array_size, desc_array,
+				      value_array);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_array_value_cansleep);
 
@@ -2183,8 +2183,8 @@ void gpiod_set_array_value_cansleep(unsigned int array_size,
 	might_sleep_if(extra_checks);
 	if (!desc_array)
 		return;
-	gpiod_set_array_value_priv(false, true, array_size, desc_array,
-				   value_array);
+	gpiod_set_array_value_complex(false, true, array_size, desc_array,
+				      value_array);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index e30e5fdb1214..2d9ea5e0cab3 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -141,6 +141,10 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		   const char *list_name, int index, enum of_gpio_flags *flags);
 
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
+void gpiod_set_array_value_complex(bool raw, bool can_sleep,
+				   unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array);
 
 extern struct spinlock gpio_lock;
 extern struct list_head gpio_devices;
-- 
2.4.11

