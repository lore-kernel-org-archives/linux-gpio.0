From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 053/182] gpio: rc5t583: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:21:59 +0100
Message-ID: <1449667319-32294-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:34610 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754461AbbLINWF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:05 -0500
Received: by lbbcs9 with SMTP id cs9so29784743lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:04 -0800 (PST)
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
 drivers/gpio/gpio-rc5t583.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index f26d9f7d8cdd..1e2d210b3369 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -34,14 +34,9 @@ struct rc5t583_gpio {
 	struct rc5t583 *rc5t583;
 };
 
-static inline struct rc5t583_gpio *to_rc5t583_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct rc5t583_gpio, gpio_chip);
-}
-
 static int rc5t583_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
-	struct rc5t583_gpio *rc5t583_gpio = to_rc5t583_gpio(gc);
+	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 	uint8_t val = 0;
 	int ret;
@@ -55,7 +50,7 @@ static int rc5t583_gpio_get(struct gpio_chip *gc, unsigned int offset)
 
 static void rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	struct rc5t583_gpio *rc5t583_gpio = to_rc5t583_gpio(gc);
+	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 	if (val)
 		rc5t583_set_bits(parent, RC5T583_GPIO_IOOUT, BIT(offset));
@@ -65,7 +60,7 @@ static void rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 
 static int rc5t583_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
 {
-	struct rc5t583_gpio *rc5t583_gpio = to_rc5t583_gpio(gc);
+	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 	int ret;
 
@@ -80,7 +75,7 @@ static int rc5t583_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
 static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned offset,
 			int value)
 {
-	struct rc5t583_gpio *rc5t583_gpio = to_rc5t583_gpio(gc);
+	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 	int ret;
 
@@ -95,7 +90,7 @@ static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned offset,
 
 static int rc5t583_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct rc5t583_gpio *rc5t583_gpio = to_rc5t583_gpio(gc);
+	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 
 	if (offset < RC5T583_MAX_GPIO)
 		return rc5t583_gpio->rc5t583->irq_base +
@@ -105,7 +100,7 @@ static int rc5t583_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 
 static void rc5t583_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
-	struct rc5t583_gpio *rc5t583_gpio = to_rc5t583_gpio(gc);
+	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 
 	rc5t583_set_bits(parent, RC5T583_GPIO_PGSEL, BIT(offset));
@@ -141,7 +136,7 @@ static int rc5t583_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rc5t583_gpio);
 
-	return gpiochip_add(&rc5t583_gpio->gpio_chip);
+	return gpiochip_add_data(&rc5t583_gpio->gpio_chip, rc5t583_gpio);
 }
 
 static int rc5t583_gpio_remove(struct platform_device *pdev)
-- 
2.4.3

