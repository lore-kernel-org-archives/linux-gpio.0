From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] pinctrl: meson: Use library functions
Date: Fri, 22 Sep 2017 11:22:42 +0200
Message-ID: <20170922092243.7546-3-linus.walleij@linaro.org>
References: <20170922092243.7546-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:43763 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751809AbdIVJWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 05:22:55 -0400
Received: by mail-lf0-f53.google.com with SMTP id c80so559803lfh.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 02:22:54 -0700 (PDT)
In-Reply-To: <20170922092243.7546-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>

These request/free functions are just reimplementations of the
standard helpers in gpiolib. Delete them and replace with the
helpers.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index e6e12a7b21e0..da2c41e23f10 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -410,18 +410,6 @@ static const struct pinconf_ops meson_pinconf_ops = {
 	.is_generic		= true,
 };
 
-static int meson_gpio_request(struct gpio_chip *chip, unsigned gpio)
-{
-	return pinctrl_gpio_request(chip->base + gpio);
-}
-
-static void meson_gpio_free(struct gpio_chip *chip, unsigned gpio)
-{
-	struct meson_pinctrl *pc = gpiochip_get_data(chip);
-
-	pinctrl_gpio_free(pc->data->pin_base + gpio);
-}
-
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
 	struct meson_pinctrl *pc = gpiochip_get_data(chip);
@@ -539,8 +527,8 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 
 	pc->chip.label = pc->data->name;
 	pc->chip.parent = pc->dev;
-	pc->chip.request = meson_gpio_request;
-	pc->chip.free = meson_gpio_free;
+	pc->chip.request = gpiochip_generic_request;
+	pc->chip.free = gpiochip_generic_free;
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
-- 
2.13.5

