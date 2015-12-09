From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 068/182] gpio: tps6586x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:53 +0100
Message-ID: <1449667433-567-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:36206 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753902AbbLINX6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:58 -0500
Received: by lfs39 with SMTP id 39so34285443lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps6586x.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 89b2249100b0..87de5486a29e 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -38,14 +38,9 @@ struct tps6586x_gpio {
 	struct device *parent;
 };
 
-static inline struct tps6586x_gpio *to_tps6586x_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct tps6586x_gpio, gpio_chip);
-}
-
 static int tps6586x_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps6586x_gpio *tps6586x_gpio = to_tps6586x_gpio(gc);
+	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 	uint8_t val;
 	int ret;
 
@@ -59,7 +54,7 @@ static int tps6586x_gpio_get(struct gpio_chip *gc, unsigned offset)
 static void tps6586x_gpio_set(struct gpio_chip *gc, unsigned offset,
 			      int value)
 {
-	struct tps6586x_gpio *tps6586x_gpio = to_tps6586x_gpio(gc);
+	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 
 	tps6586x_update(tps6586x_gpio->parent, TPS6586X_GPIOSET2,
 			value << offset, 1 << offset);
@@ -68,7 +63,7 @@ static void tps6586x_gpio_set(struct gpio_chip *gc, unsigned offset,
 static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
-	struct tps6586x_gpio *tps6586x_gpio = to_tps6586x_gpio(gc);
+	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 	uint8_t val, mask;
 
 	tps6586x_gpio_set(gc, offset, value);
@@ -82,7 +77,7 @@ static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
 
 static int tps6586x_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps6586x_gpio *tps6586x_gpio = to_tps6586x_gpio(gc);
+	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 
 	return tps6586x_irq_get_virq(tps6586x_gpio->parent,
 				TPS6586X_INT_PLDO_0 + offset);
@@ -122,7 +117,7 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 	else
 		tps6586x_gpio->gpio_chip.base = -1;
 
-	ret = gpiochip_add(&tps6586x_gpio->gpio_chip);
+	ret = gpiochip_add_data(&tps6586x_gpio->gpio_chip, tps6586x_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

