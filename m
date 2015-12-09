From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 080/182] gpio: wm8350: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:53 +0100
Message-ID: <1449667673-1207-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34294 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251AbbLIN16 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:58 -0500
Received: by lbbcs9 with SMTP id cs9so29883462lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@kernel.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: patches@opensource.wolfsonmicro.com
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-wm8350.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 1e3d8da61ff3..0a306b4baa73 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -28,14 +28,9 @@ struct wm8350_gpio_data {
 	struct gpio_chip gpio_chip;
 };
 
-static inline struct wm8350_gpio_data *to_wm8350_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct wm8350_gpio_data, gpio_chip);
-}
-
 static int wm8350_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm8350_gpio_data *wm8350_gpio = to_wm8350_gpio(chip);
+	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
 
 	return wm8350_set_bits(wm8350, WM8350_GPIO_CONFIGURATION_I_O,
@@ -44,7 +39,7 @@ static int wm8350_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 
 static int wm8350_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm8350_gpio_data *wm8350_gpio = to_wm8350_gpio(chip);
+	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
 	int ret;
 
@@ -60,7 +55,7 @@ static int wm8350_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void wm8350_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct wm8350_gpio_data *wm8350_gpio = to_wm8350_gpio(chip);
+	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
 
 	if (value)
@@ -72,7 +67,7 @@ static void wm8350_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int wm8350_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
-	struct wm8350_gpio_data *wm8350_gpio = to_wm8350_gpio(chip);
+	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
 	int ret;
 
@@ -89,7 +84,7 @@ static int wm8350_gpio_direction_out(struct gpio_chip *chip,
 
 static int wm8350_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm8350_gpio_data *wm8350_gpio = to_wm8350_gpio(chip);
+	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
 
 	if (!wm8350->irq_base)
@@ -130,7 +125,7 @@ static int wm8350_gpio_probe(struct platform_device *pdev)
 	else
 		wm8350_gpio->gpio_chip.base = -1;
 
-	ret = gpiochip_add(&wm8350_gpio->gpio_chip);
+	ret = gpiochip_add_data(&wm8350_gpio->gpio_chip, wm8350_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

