From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 114/182] pinctrl: sh-pfc: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:26 +0100
Message-ID: <1449668006-3199-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33919 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754451AbbLINdb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:31 -0500
Received: by lbbcs9 with SMTP id cs9so29980180lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sh-pfc/gpio.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index cdb2460a7b00..a6681b8b17c3 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -38,14 +38,10 @@ struct sh_pfc_chip {
 	struct sh_pfc_gpio_pin		*pins;
 };
 
-static struct sh_pfc_chip *gpio_to_pfc_chip(struct gpio_chip *gc)
-{
-	return container_of(gc, struct sh_pfc_chip, gpio_chip);
-}
-
 static struct sh_pfc *gpio_to_pfc(struct gpio_chip *gc)
 {
-	return gpio_to_pfc_chip(gc)->pfc;
+	struct sh_pfc_chip *chip = gpiochip_get_data(gc);
+	return chip->pfc;
 }
 
 static void gpio_get_data_reg(struct sh_pfc_chip *chip, unsigned int offset,
@@ -178,14 +174,14 @@ static int gpio_pin_direction_input(struct gpio_chip *gc, unsigned offset)
 static int gpio_pin_direction_output(struct gpio_chip *gc, unsigned offset,
 				    int value)
 {
-	gpio_pin_set_value(gpio_to_pfc_chip(gc), offset, value);
+	gpio_pin_set_value(gpiochip_get_data(gc), offset, value);
 
 	return pinctrl_gpio_direction_output(offset);
 }
 
 static int gpio_pin_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct sh_pfc_chip *chip = gpio_to_pfc_chip(gc);
+	struct sh_pfc_chip *chip = gpiochip_get_data(gc);
 	struct sh_pfc_gpio_data_reg *reg;
 	unsigned int bit;
 	unsigned int pos;
@@ -199,7 +195,7 @@ static int gpio_pin_get(struct gpio_chip *gc, unsigned offset)
 
 static void gpio_pin_set(struct gpio_chip *gc, unsigned offset, int value)
 {
-	gpio_pin_set_value(gpio_to_pfc_chip(gc), offset, value);
+	gpio_pin_set_value(gpiochip_get_data(gc), offset, value);
 }
 
 static int gpio_pin_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -322,7 +318,7 @@ sh_pfc_add_gpiochip(struct sh_pfc *pfc, int(*setup)(struct sh_pfc_chip *),
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-	ret = gpiochip_add(&chip->gpio_chip);
+	ret = gpiochip_add_data(&chip->gpio_chip, chip);
 	if (unlikely(ret < 0))
 		return ERR_PTR(ret);
 
-- 
2.4.3

