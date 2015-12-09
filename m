From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 070/182] gpio: tps65912: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:24:09 +0100
Message-ID: <1449667449-678-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:35708 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753902AbbLINYO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:24:14 -0500
Received: by lbpu9 with SMTP id u9so29692943lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:24:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>, Margarita Olaya <magi@slimlogic.co.uk>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: Margarita Olaya <magi@slimlogic.co.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65912.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 0f073ffa74cf..4f2029c7da3a 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -26,11 +26,9 @@ struct tps65912_gpio_data {
 	struct gpio_chip gpio_chip;
 };
 
-#define to_tgd(gc) container_of(gc, struct tps65912_gpio_data, gpio_chip)
-
 static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912_gpio_data *tps65912_gpio = gpiochip_get_data(gc);
 	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 	int val;
 
@@ -45,7 +43,7 @@ static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
 static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
 			      int value)
 {
-	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912_gpio_data *tps65912_gpio = gpiochip_get_data(gc);
 	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 
 	if (value)
@@ -59,7 +57,7 @@ static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
 static int tps65912_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
-	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912_gpio_data *tps65912_gpio = gpiochip_get_data(gc);
 	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 
 	/* Set the initial value */
@@ -71,7 +69,7 @@ static int tps65912_gpio_output(struct gpio_chip *gc, unsigned offset,
 
 static int tps65912_gpio_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912_gpio_data *tps65912_gpio = gpiochip_get_data(gc);
 	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 
 	return tps65912_clear_bits(tps65912, TPS65912_GPIO1 + offset,
@@ -108,7 +106,7 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
 	if (pdata && pdata->gpio_base)
 		tps65912_gpio->gpio_chip.base = pdata->gpio_base;
 
-	ret = gpiochip_add(&tps65912_gpio->gpio_chip);
+	ret = gpiochip_add_data(&tps65912_gpio->gpio_chip, tps65912_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

