From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 079/182] gpio: wm831x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:45 +0100
Message-ID: <1449667665-1156-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34482 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754AbbLIN1t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:49 -0500
Received: by lffu14 with SMTP id u14so34224887lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:48 -0800 (PST)
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
 drivers/gpio/gpio-wm831x.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 2e73e4b52c69..98390070fb64 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -30,14 +30,9 @@ struct wm831x_gpio {
 	struct gpio_chip gpio_chip;
 };
 
-static inline struct wm831x_gpio *to_wm831x_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct wm831x_gpio, gpio_chip);
-}
-
 static int wm831x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm831x_gpio *wm831x_gpio = to_wm831x_gpio(chip);
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 	int val = WM831X_GPN_DIR;
 
@@ -51,7 +46,7 @@ static int wm831x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 
 static int wm831x_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm831x_gpio *wm831x_gpio = to_wm831x_gpio(chip);
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 	int ret;
 
@@ -67,7 +62,7 @@ static int wm831x_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void wm831x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct wm831x_gpio *wm831x_gpio = to_wm831x_gpio(chip);
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 
 	wm831x_set_bits(wm831x, WM831X_GPIO_LEVEL, 1 << offset,
@@ -77,7 +72,7 @@ static void wm831x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int wm831x_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
-	struct wm831x_gpio *wm831x_gpio = to_wm831x_gpio(chip);
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 	int val = 0;
 	int ret;
@@ -99,7 +94,7 @@ static int wm831x_gpio_direction_out(struct gpio_chip *chip,
 
 static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm831x_gpio *wm831x_gpio = to_wm831x_gpio(chip);
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 
 	return irq_create_mapping(wm831x->irq_domain,
@@ -109,7 +104,7 @@ static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 static int wm831x_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
 				    unsigned debounce)
 {
-	struct wm831x_gpio *wm831x_gpio = to_wm831x_gpio(chip);
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 	int reg = WM831X_GPIO1_CONTROL + offset;
 	int ret, fn;
@@ -140,7 +135,7 @@ static int wm831x_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
 #ifdef CONFIG_DEBUG_FS
 static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct wm831x_gpio *wm831x_gpio = to_wm831x_gpio(chip);
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 	int i, tristated;
 
@@ -264,7 +259,7 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 	else
 		wm831x_gpio->gpio_chip.base = -1;
 
-	ret = gpiochip_add(&wm831x_gpio->gpio_chip);
+	ret = gpiochip_add_data(&wm831x_gpio->gpio_chip, wm831x_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

