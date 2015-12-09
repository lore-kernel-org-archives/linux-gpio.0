From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 021/182] gpio: da9055: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:35 +0100
Message-ID: <1449666935-30737-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36861 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLINPj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:39 -0500
Received: by lfs39 with SMTP id 39so34123448lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:15:38 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ashish Jangam <ashish.jangam@kpitcummins.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ashish Jangam <ashish.jangam@kpitcummins.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-da9055.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 7227e6ed3cb9..18210fb2cb13 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -35,14 +35,9 @@ struct da9055_gpio {
 	struct gpio_chip gp;
 };
 
-static inline struct da9055_gpio *to_da9055_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct da9055_gpio, gp);
-}
-
 static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct da9055_gpio *gpio = to_da9055_gpio(gc);
+	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 	int gpio_direction = 0;
 	int ret;
 
@@ -71,7 +66,7 @@ static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 static void da9055_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct da9055_gpio *gpio = to_da9055_gpio(gc);
+	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 
 	da9055_reg_update(gpio->da9055,
 			DA9055_REG_GPIO_MODE0_2,
@@ -81,7 +76,7 @@ static void da9055_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 
 static int da9055_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct da9055_gpio *gpio = to_da9055_gpio(gc);
+	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char reg_byte;
 
 	reg_byte = (DA9055_ACT_LOW | DA9055_GPI)
@@ -97,7 +92,7 @@ static int da9055_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 static int da9055_gpio_direction_output(struct gpio_chip *gc,
 					unsigned offset, int value)
 {
-	struct da9055_gpio *gpio = to_da9055_gpio(gc);
+	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char reg_byte;
 	int ret;
 
@@ -119,7 +114,7 @@ static int da9055_gpio_direction_output(struct gpio_chip *gc,
 
 static int da9055_gpio_to_irq(struct gpio_chip *gc, u32 offset)
 {
-	struct da9055_gpio *gpio = to_da9055_gpio(gc);
+	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 	struct da9055 *da9055 = gpio->da9055;
 
 	return regmap_irq_get_virq(da9055->irq_data,
@@ -156,7 +151,7 @@ static int da9055_gpio_probe(struct platform_device *pdev)
 	if (pdata && pdata->gpio_base)
 		gpio->gp.base = pdata->gpio_base;
 
-	ret = gpiochip_add(&gpio->gp);
+	ret = gpiochip_add_data(&gpio->gp, gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		goto err_mem;
-- 
2.4.3

