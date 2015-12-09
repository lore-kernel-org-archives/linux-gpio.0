From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 069/182] gpio: tps65910: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:24:01 +0100
Message-ID: <1449667441-619-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36276 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753902AbbLINYF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:24:05 -0500
Received: by lfs39 with SMTP id 39so34288029lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:24:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rhyland Klein <rklein@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Rhyland Klein <rklein@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65910.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 83894c0387fb..e81eee7627a3 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -27,14 +27,9 @@ struct tps65910_gpio {
 	struct tps65910 *tps65910;
 };
 
-static inline struct tps65910_gpio *to_tps65910_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct tps65910_gpio, gpio_chip);
-}
-
 static int tps65910_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps65910_gpio *tps65910_gpio = to_tps65910_gpio(gc);
+	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 	unsigned int val;
 
@@ -49,7 +44,7 @@ static int tps65910_gpio_get(struct gpio_chip *gc, unsigned offset)
 static void tps65910_gpio_set(struct gpio_chip *gc, unsigned offset,
 			      int value)
 {
-	struct tps65910_gpio *tps65910_gpio = to_tps65910_gpio(gc);
+	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 
 	if (value)
@@ -63,7 +58,7 @@ static void tps65910_gpio_set(struct gpio_chip *gc, unsigned offset,
 static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
-	struct tps65910_gpio *tps65910_gpio = to_tps65910_gpio(gc);
+	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 
 	/* Set the initial value */
@@ -75,7 +70,7 @@ static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
 
 static int tps65910_gpio_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps65910_gpio *tps65910_gpio = to_tps65910_gpio(gc);
+	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 
 	return tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset,
@@ -175,7 +170,7 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 	}
 
 skip_init:
-	ret = gpiochip_add(&tps65910_gpio->gpio_chip);
+	ret = gpiochip_add_data(&tps65910_gpio->gpio_chip, tps65910_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

