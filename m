From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] gpio: OF: separation of concerns
Date: Mon,  3 Oct 2016 11:02:38 +0200
Message-ID: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35611 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751469AbcJCJCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 05:02:46 -0400
Received: by mail-lf0-f54.google.com with SMTP id l131so149109488lfl.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 02:02:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

The generic GPIO library directly implement code for of_find_gpio()
which is only used with CONFIG_OF and causes compilation problems
on archs that do not even have stubs for OF functions, especially
on UM that does not implement any IO remap functions.

Move the function to gpiolib-of.c, implement a static inline stub
in gpiolib.h returning PTR_ERR(-ENOENT) if CONFIG_OF_GPIO is not
set and be done with it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c    | 39 ---------------------------------------
 drivers/gpio/gpiolib.h    | 16 ++++++++++++++++
 3 files changed, 55 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 75e7b3919ea7..33b05c8de42f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -114,6 +114,45 @@ int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 }
 EXPORT_SYMBOL(of_get_named_gpio_flags);
 
+struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
+			       unsigned int idx,
+			       enum gpio_lookup_flags *flags)
+{
+	char prop_name[32]; /* 32 is max size of property name */
+	enum of_gpio_flags of_flags;
+	struct gpio_desc *desc;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
+		if (con_id)
+			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
+				 gpio_suffixes[i]);
+		else
+			snprintf(prop_name, sizeof(prop_name), "%s",
+				 gpio_suffixes[i]);
+
+		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
+						&of_flags);
+		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
+			break;
+	}
+
+	if (IS_ERR(desc))
+		return desc;
+
+	if (of_flags & OF_GPIO_ACTIVE_LOW)
+		*flags |= GPIO_ACTIVE_LOW;
+
+	if (of_flags & OF_GPIO_SINGLE_ENDED) {
+		if (of_flags & OF_GPIO_ACTIVE_LOW)
+			*flags |= GPIO_OPEN_DRAIN;
+		else
+			*flags |= GPIO_OPEN_SOURCE;
+	}
+
+	return desc;
+}
+
 /**
  * of_parse_own_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API
  * @np:		device node to get GPIO from
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 19a665f8d455..5404cdcfed19 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2883,45 +2883,6 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 	mutex_unlock(&gpio_lookup_lock);
 }
 
-static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
-				      unsigned int idx,
-				      enum gpio_lookup_flags *flags)
-{
-	char prop_name[32]; /* 32 is max size of property name */
-	enum of_gpio_flags of_flags;
-	struct gpio_desc *desc;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
-		if (con_id)
-			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
-				 gpio_suffixes[i]);
-		else
-			snprintf(prop_name, sizeof(prop_name), "%s",
-				 gpio_suffixes[i]);
-
-		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
-						&of_flags);
-		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
-			break;
-	}
-
-	if (IS_ERR(desc))
-		return desc;
-
-	if (of_flags & OF_GPIO_ACTIVE_LOW)
-		*flags |= GPIO_ACTIVE_LOW;
-
-	if (of_flags & OF_GPIO_SINGLE_ENDED) {
-		if (of_flags & OF_GPIO_ACTIVE_LOW)
-			*flags |= GPIO_OPEN_DRAIN;
-		else
-			*flags |= GPIO_OPEN_SOURCE;
-	}
-
-	return desc;
-}
-
 static struct gpio_desc *acpi_find_gpio(struct device *dev,
 					const char *con_id,
 					unsigned int idx,
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2d9ea5e0cab3..cc7fd56d7c9b 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -13,6 +13,7 @@
 #define GPIOLIB_H
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -86,6 +87,21 @@ struct acpi_gpio_info {
 /* gpio suffixes used for ACPI and device tree lookup */
 static const char * const gpio_suffixes[] = { "gpios", "gpio" };
 
+#ifdef CONFIG_OF_GPIO
+struct gpio_desc *of_find_gpio(struct device *dev,
+			       const char *con_id,
+			       unsigned int idx,
+			       enum gpio_lookup_flags *flags);
+#else
+static inline struct gpio_desc *of_find_gpio(struct device *dev,
+					     const char *con_id,
+					     unsigned int idx,
+					     enum gpio_lookup_flags *flags)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif /* CONFIG_OF_GPIO */
+
 #ifdef CONFIG_ACPI
 void acpi_gpiochip_add(struct gpio_chip *chip);
 void acpi_gpiochip_remove(struct gpio_chip *chip);
-- 
2.7.4

