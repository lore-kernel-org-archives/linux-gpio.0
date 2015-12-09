From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 020/182] gpio: da9052: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:28 +0100
Message-ID: <1449666928-30690-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33997 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLINPc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:32 -0500
Received: by lffu14 with SMTP id u14so33985125lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:15:31 -0800 (PST)
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
 drivers/gpio/gpio-da9052.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
index 2e9578ec0ca1..b9fba2156216 100644
--- a/drivers/gpio/gpio-da9052.c
+++ b/drivers/gpio/gpio-da9052.c
@@ -51,11 +51,6 @@ struct da9052_gpio {
 	struct gpio_chip gp;
 };
 
-static inline struct da9052_gpio *to_da9052_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct da9052_gpio, gp);
-}
-
 static unsigned char da9052_gpio_port_odd(unsigned offset)
 {
 	return offset % 2;
@@ -63,7 +58,7 @@ static unsigned char da9052_gpio_port_odd(unsigned offset)
 
 static int da9052_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct da9052_gpio *gpio = to_da9052_gpio(gc);
+	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	int da9052_port_direction = 0;
 	int ret;
 
@@ -105,7 +100,7 @@ static int da9052_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 static void da9052_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct da9052_gpio *gpio = to_da9052_gpio(gc);
+	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	int ret;
 
 	if (da9052_gpio_port_odd(offset)) {
@@ -131,7 +126,7 @@ static void da9052_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 
 static int da9052_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct da9052_gpio *gpio = to_da9052_gpio(gc);
+	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char register_value;
 	int ret;
 
@@ -157,7 +152,7 @@ static int da9052_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 static int da9052_gpio_direction_output(struct gpio_chip *gc,
 					unsigned offset, int value)
 {
-	struct da9052_gpio *gpio = to_da9052_gpio(gc);
+	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char register_value;
 	int ret;
 
@@ -182,7 +177,7 @@ static int da9052_gpio_direction_output(struct gpio_chip *gc,
 
 static int da9052_gpio_to_irq(struct gpio_chip *gc, u32 offset)
 {
-	struct da9052_gpio *gpio = to_da9052_gpio(gc);
+	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	struct da9052 *da9052 = gpio->da9052;
 
 	int irq;
@@ -222,7 +217,7 @@ static int da9052_gpio_probe(struct platform_device *pdev)
 	if (pdata && pdata->gpio_base)
 		gpio->gp.base = pdata->gpio_base;
 
-	ret = gpiochip_add(&gpio->gp);
+	ret = gpiochip_add_data(&gpio->gp, gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

