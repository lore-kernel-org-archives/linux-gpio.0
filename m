From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: add missing static inline
Date: Mon,  3 Oct 2016 11:38:41 +0200
Message-ID: <1475487521-3342-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35883 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753117AbcJCJiq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 05:38:46 -0400
Received: by mail-lf0-f50.google.com with SMTP id b75so17161784lfg.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 02:38:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

of_get_named_gpiod_flags() was missing a static inline version
when compiling without OF_GPIO. Add this.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index ba1e383079a3..7599796d32e1 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -92,6 +92,8 @@ struct gpio_desc *of_find_gpio(struct device *dev,
 			       const char *con_id,
 			       unsigned int idx,
 			       enum gpio_lookup_flags *flags);
+struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+		   const char *list_name, int index, enum of_gpio_flags *flags);
 int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
 #else
@@ -102,6 +104,11 @@ static inline struct gpio_desc *of_find_gpio(struct device *dev,
 {
 	return ERR_PTR(-ENOENT);
 }
+static inline struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+		   const char *list_name, int index, enum of_gpio_flags *flags)
+{
+	return ERR_PTR(-ENOENT);
+}
 static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
 static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
 #endif /* CONFIG_OF_GPIO */
@@ -160,9 +167,6 @@ static inline bool acpi_can_fallback_to_crs(struct acpi_device *adev,
 }
 #endif
 
-struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
-		   const char *list_name, int index, enum of_gpio_flags *flags);
-
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
 void gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				   unsigned int array_size,
-- 
2.7.4

