From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 014/182] gpio: arizona: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:14:38 +0100
Message-ID: <1449666878-30404-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:32969 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754108AbbLINOn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:14:43 -0500
Received: by lbbkw15 with SMTP id kw15so29742336lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:14:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Mark Brown <broonie@kernel.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-arizona.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 412d131b513d..c729fee1dcdf 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -28,14 +28,9 @@ struct arizona_gpio {
 	struct gpio_chip gpio_chip;
 };
 
-static inline struct arizona_gpio *to_arizona_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct arizona_gpio, gpio_chip);
-}
-
 static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
+	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
 
 	return regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
@@ -44,7 +39,7 @@ static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 
 static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
+	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
 	unsigned int val;
 	int ret;
@@ -62,7 +57,7 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 static int arizona_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
-	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
+	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
 
 	if (value)
@@ -74,7 +69,7 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 
 static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
+	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
 
 	if (value)
@@ -133,7 +128,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	else
 		arizona_gpio->gpio_chip.base = -1;
 
-	ret = gpiochip_add(&arizona_gpio->gpio_chip);
+	ret = gpiochip_add_data(&arizona_gpio->gpio_chip, arizona_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
 			ret);
-- 
2.4.3

