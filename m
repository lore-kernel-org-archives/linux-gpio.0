From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 081/182] gpio: wm8994: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:28:01 +0100
Message-ID: <1449667681-1258-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34638 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLIN2F (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:28:05 -0500
Received: by lffu14 with SMTP id u14so34230415lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:28:04 -0800 (PST)
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
 drivers/gpio/gpio-wm8994.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index de73c80163c1..3ae4c1597494 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -31,14 +31,9 @@ struct wm8994_gpio {
 	struct gpio_chip gpio_chip;
 };
 
-static inline struct wm8994_gpio *to_wm8994_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct wm8994_gpio, gpio_chip);
-}
-
 static int wm8994_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 
 	switch (wm8994->type) {
@@ -61,7 +56,7 @@ static int wm8994_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static int wm8994_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 
 	return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset,
@@ -70,7 +65,7 @@ static int wm8994_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 
 static int wm8994_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 	int ret;
 
@@ -87,7 +82,7 @@ static int wm8994_gpio_get(struct gpio_chip *chip, unsigned offset)
 static int wm8994_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
-	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 
 	if (value)
@@ -99,7 +94,7 @@ static int wm8994_gpio_direction_out(struct gpio_chip *chip,
 
 static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 
 	if (value)
@@ -110,7 +105,7 @@ static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int wm8994_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 
 	return regmap_irq_get_virq(wm8994->irq_data, offset);
@@ -174,7 +169,7 @@ static const char *wm8994_gpio_fn(u16 fn)
 
 static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 	int i;
 
@@ -266,7 +261,7 @@ static int wm8994_gpio_probe(struct platform_device *pdev)
 	else
 		wm8994_gpio->gpio_chip.base = -1;
 
-	ret = gpiochip_add(&wm8994_gpio->gpio_chip);
+	ret = gpiochip_add_data(&wm8994_gpio->gpio_chip, wm8994_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
 			ret);
-- 
2.4.3

