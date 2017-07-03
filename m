From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2] gpio: lp87565: Set proper output level and direction for direction_output
Date: Mon,  3 Jul 2017 16:28:12 +0800
Message-ID: <20170703082812.23444-1-axel.lin@ingics.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35390 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752272AbdGCI2Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 04:28:25 -0400
Received: by mail-pf0-f193.google.com with SMTP id s66so25032881pfs.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2017 01:28:25 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>, linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

The value argument of lp87565_gpio_direction_output() means output level
rather than gpio direction.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Reviewed-by: Keerthy <j-keerthy@ti.com>
Tested-by: Keerthy <j-keerthy@ti.com>
---
v2: Call lp87565_gpio_set() instead of open-coded.
I move lp87565_gpio_get/lp87565_gpio_set functions up to avoid forward
declaration. It's fine to only move lp87565_gpio_set() but it looks better
for me to move lp87565_gpio_get/lp87565_gpio_set together.
Hope this change is fine.

 drivers/gpio/gpio-lp87565.c | 46 +++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index 6313c50..a121c8f 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -26,6 +26,27 @@ struct lp87565_gpio {
 	struct regmap *map;
 };
 
+static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
+	int ret, val;
+
+	ret = regmap_read(gpio->map, LP87565_REG_GPIO_IN, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & BIT(offset));
+}
+
+static void lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int value)
+{
+	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
+
+	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
+			   BIT(offset), value ? BIT(offset) : 0);
+}
+
 static int lp87565_gpio_get_direction(struct gpio_chip *chip,
 				      unsigned int offset)
 {
@@ -54,30 +75,11 @@ static int lp87565_gpio_direction_output(struct gpio_chip *chip,
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
 
+	lp87565_gpio_set(chip, offset, value);
+
 	return regmap_update_bits(gpio->map,
 				  LP87565_REG_GPIO_CONFIG,
-				  BIT(offset), !value ? BIT(offset) : 0);
-}
-
-static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
-{
-	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
-	int ret, val;
-
-	ret = regmap_read(gpio->map, LP87565_REG_GPIO_IN, &val);
-	if (ret < 0)
-		return ret;
-
-	return !!(val & BIT(offset));
-}
-
-static void lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
-{
-	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
-
-	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
-			   BIT(offset), value ? BIT(offset) : 0);
+				  BIT(offset), BIT(offset));
 }
 
 static int lp87565_gpio_request(struct gpio_chip *gc, unsigned int offset)
-- 
2.9.3

