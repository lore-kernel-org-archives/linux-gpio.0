From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 029/182] gpio: lp3943: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:16:45 +0100
Message-ID: <1449667005-31123-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:36447 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINQu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:16:50 -0500
Received: by lfs39 with SMTP id 39so34145399lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:16:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Milo Kim <milo.kim@ti.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Milo Kim <milo.kim@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-lp3943.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index f979c3be217f..1c8e2ae26938 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -45,14 +45,9 @@ struct lp3943_gpio {
 	u16 input_mask;		/* 1 = GPIO is input direction, 0 = output */
 };
 
-static inline struct lp3943_gpio *to_lp3943_gpio(struct gpio_chip *_chip)
-{
-	return container_of(_chip, struct lp3943_gpio, chip);
-}
-
 static int lp3943_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct lp3943_gpio *lp3943_gpio = to_lp3943_gpio(chip);
+	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	struct lp3943 *lp3943 = lp3943_gpio->lp3943;
 
 	/* Return an error if the pin is already assigned */
@@ -64,7 +59,7 @@ static int lp3943_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void lp3943_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct lp3943_gpio *lp3943_gpio = to_lp3943_gpio(chip);
+	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	struct lp3943 *lp3943 = lp3943_gpio->lp3943;
 
 	clear_bit(offset, &lp3943->pin_used);
@@ -82,7 +77,7 @@ static int lp3943_gpio_set_mode(struct lp3943_gpio *lp3943_gpio, u8 offset,
 
 static int lp3943_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct lp3943_gpio *lp3943_gpio = to_lp3943_gpio(chip);
+	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 
 	lp3943_gpio->input_mask |= BIT(offset);
 
@@ -138,7 +133,7 @@ static int lp3943_get_gpio_out_status(struct lp3943_gpio *lp3943_gpio,
 
 static int lp3943_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct lp3943_gpio *lp3943_gpio = to_lp3943_gpio(chip);
+	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 
 	/*
 	 * Limitation:
@@ -157,7 +152,7 @@ static int lp3943_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void lp3943_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct lp3943_gpio *lp3943_gpio = to_lp3943_gpio(chip);
+	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	u8 data;
 
 	if (value)
@@ -171,7 +166,7 @@ static void lp3943_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 					int value)
 {
-	struct lp3943_gpio *lp3943_gpio = to_lp3943_gpio(chip);
+	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 
 	lp3943_gpio_set(chip, offset, value);
 	lp3943_gpio->input_mask &= ~BIT(offset);
@@ -209,7 +204,7 @@ static int lp3943_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, lp3943_gpio);
 
-	return gpiochip_add(&lp3943_gpio->chip);
+	return gpiochip_add_data(&lp3943_gpio->chip, lp3943_gpio);
 }
 
 static int lp3943_gpio_remove(struct platform_device *pdev)
-- 
2.4.3

