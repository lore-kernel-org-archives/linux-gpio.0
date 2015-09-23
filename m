From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: keep the GPIO line names internal
Date: Wed, 23 Sep 2015 16:27:33 -0700
Message-ID: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:33651 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756172AbbIWX1i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2015 19:27:38 -0400
Received: by pacex6 with SMTP id ex6so53599947pac.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2015 16:27:38 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>

This refactors the changes to the GPIO line naming mechanism to
not have so widespread effects, instead we conclude the patch series
by having created a name attribute in the GPIO descriptor, that need
not be globally unique, and it will be initialized from the old
.names array in struct gpio_chip if it exists, then used in the legacy
sysfs code like the array was used previously.

The associated changes to name lines from the device tree are
controversial and need to stand alone from this. Resulting changes:

1. Remove the export and the header for the gpio_name_to_desc() as so
far the only use is inside gpiolib.c. Staticize gpio_name_to_desc()
and move it above the only function using it.

2. Only print a warning if there are two GPIO lines with the same name.
The reason is to preserve current behaviour: before the previous
changes to the naming mechanism this would not reject probing the
driver, instead the error would occur when trying to export the line
in sysfs, so restore this behaviour, but print a friendly warning
if names collide.

Cc: Johan Hovold <johan@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c        | 72 +++++++++++++++++++++----------------------
 include/linux/gpio/consumer.h |  1 -
 2 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 764845c3a4b2..efe8a1072ed0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -90,38 +90,6 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 EXPORT_SYMBOL_GPL(gpio_to_desc);
 
 /**
- * Convert a GPIO name to its descriptor
- */
-struct gpio_desc *gpio_name_to_desc(const char * const name)
-{
-	struct gpio_chip *chip;
-	unsigned long flags;
-
-	spin_lock_irqsave(&gpio_lock, flags);
-
-	list_for_each_entry(chip, &gpio_chips, list) {
-		int i;
-
-		for (i = 0; i != chip->ngpio; ++i) {
-			struct gpio_desc *gpio = &chip->desc[i];
-
-			if (!gpio->name)
-				continue;
-
-			if (!strcmp(gpio->name, name)) {
-				spin_unlock_irqrestore(&gpio_lock, flags);
-				return gpio;
-			}
-		}
-	}
-
-	spin_unlock_irqrestore(&gpio_lock, flags);
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(gpio_name_to_desc);
-
-/**
  * Get the GPIO descriptor corresponding to the given hw number for this chip.
  */
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
@@ -250,6 +218,37 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 	return err;
 }
 
+/**
+ * Convert a GPIO name to its descriptor
+ */
+static struct gpio_desc *gpio_name_to_desc(const char * const name)
+{
+	struct gpio_chip *chip;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpio_lock, flags);
+
+	list_for_each_entry(chip, &gpio_chips, list) {
+		int i;
+
+		for (i = 0; i != chip->ngpio; ++i) {
+			struct gpio_desc *gpio = &chip->desc[i];
+
+			if (!gpio->name)
+				continue;
+
+			if (!strcmp(gpio->name, name)) {
+				spin_unlock_irqrestore(&gpio_lock, flags);
+				return gpio;
+			}
+		}
+	}
+
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
+	return NULL;
+}
+
 /*
  * Takes the names from gc->names and checks if they are all unique. If they
  * are, they are assigned to their gpio descriptors.
@@ -268,11 +267,10 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 		struct gpio_desc *gpio;
 
 		gpio = gpio_name_to_desc(gc->names[i]);
-		if (gpio) {
-			dev_err(gc->dev, "Detected name collision for GPIO name '%s'\n",
-				gc->names[i]);
-			return -EEXIST;
-		}
+		if (gpio)
+			dev_warn(gc->dev, "Detected name collision for "
+				 "GPIO name '%s'\n",
+				 gc->names[i]);
 	}
 
 	/* Then add all names to the GPIO descriptors */
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 366a3fdbdbea..a879e3e62379 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -130,7 +130,6 @@ int gpiod_to_irq(const struct gpio_desc *desc);
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
-struct gpio_desc *gpio_name_to_desc(const char *name);
 
 /* Child properties interface */
 struct fwnode_handle;
-- 
2.4.3

