From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 5/9] gpiolib: Implement gpio_name_to_desc()
Date: Fri, 17 Jul 2015 11:32:46 +0200
Message-ID: <1437125570-28623-6-git-send-email-mpa@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42234 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757538AbbGQJdl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 05:33:41 -0400
In-Reply-To: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

Implement a function to translate a gpio name to a descriptor.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h |  7 +++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9f402b159cbe..dcac3bcf21dd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -90,6 +90,38 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 EXPORT_SYMBOL_GPL(gpio_to_desc);
 
 /**
+ * Convert a GPIO name to its descriptor
+ */
+struct gpio_desc *gpio_name_to_desc(const char *name)
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
+EXPORT_SYMBOL_GPL(gpio_name_to_desc);
+
+/**
  * Get the GPIO descriptor corresponding to the given hw number for this chip.
  */
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index adac255aee86..a873b8b47ab3 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -130,6 +130,7 @@ int gpiod_to_irq(const struct gpio_desc *desc);
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
+struct gpio_desc *gpio_name_to_desc(const char *name);
 
 /* Child properties interface */
 struct fwnode_handle;
@@ -400,6 +401,12 @@ static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	return ERR_PTR(-EINVAL);
 }
+
+static inline struct gpio_desc *gpio_name_to_desc(const char *name)
+{
+	return ERR_PTR(-EINVAL);
+}
+
 static inline int desc_to_gpio(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-- 
2.1.4

