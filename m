From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 028/182] gpio: kempld: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:16:37 +0100
Message-ID: <1449666997-31075-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:36383 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINQm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:16:42 -0500
Received: by lfs39 with SMTP id 39so34142994lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:16:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brunner Michael <Michael.Brunner@kontron.com>, Guenter Roeck <linux@roeck-us.net>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Brunner Michael <Michael.Brunner@kontron.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-kempld.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 35dd1e0af364..90a3c4e3e4aa 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -65,8 +65,7 @@ static int kempld_gpio_get_bit(struct kempld_device_data *pld, u8 reg, u8 bit)
 
 static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct kempld_gpio_data *gpio
-		= container_of(chip, struct kempld_gpio_data, chip);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
 	return kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
@@ -74,8 +73,7 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct kempld_gpio_data *gpio
-		= container_of(chip, struct kempld_gpio_data, chip);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
@@ -85,8 +83,7 @@ static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct kempld_gpio_data *gpio
-		= container_of(chip, struct kempld_gpio_data, chip);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
@@ -99,8 +96,7 @@ static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 					int value)
 {
-	struct kempld_gpio_data *gpio
-		= container_of(chip, struct kempld_gpio_data, chip);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
@@ -113,8 +109,7 @@ static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int kempld_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct kempld_gpio_data *gpio
-		= container_of(chip, struct kempld_gpio_data, chip);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
 	return !kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset), offset);
@@ -183,7 +178,7 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = gpiochip_add(chip);
+	ret = gpiochip_add_data(chip, gpio);
 	if (ret) {
 		dev_err(dev, "Could not register GPIO chip\n");
 		return ret;
-- 
2.4.3

