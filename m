From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 095/182] pinctrl: meson: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:30:58 +0100
Message-ID: <1449667858-2137-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:32850 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754447AbbLINbC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:02 -0500
Received: by lfaz4 with SMTP id z4so34267056lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:01 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>, Antoine Tenart <antoine.tenart@free-electrons.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Carlo Caione <carlo@endlessm.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 4b5f6829144d..50cab27c64d4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -448,11 +448,6 @@ static const struct pinconf_ops meson_pinconf_ops = {
 	.is_generic		= true,
 };
 
-static inline struct meson_domain *to_meson_domain(struct gpio_chip *chip)
-{
-	return container_of(chip, struct meson_domain, chip);
-}
-
 static int meson_gpio_request(struct gpio_chip *chip, unsigned gpio)
 {
 	return pinctrl_request_gpio(chip->base + gpio);
@@ -460,14 +455,14 @@ static int meson_gpio_request(struct gpio_chip *chip, unsigned gpio)
 
 static void meson_gpio_free(struct gpio_chip *chip, unsigned gpio)
 {
-	struct meson_domain *domain = to_meson_domain(chip);
+	struct meson_domain *domain = gpiochip_get_data(chip);
 
 	pinctrl_free_gpio(domain->data->pin_base + gpio);
 }
 
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct meson_domain *domain = to_meson_domain(chip);
+	struct meson_domain *domain = gpiochip_get_data(chip);
 	unsigned int reg, bit, pin;
 	struct meson_bank *bank;
 	int ret;
@@ -485,7 +480,7 @@ static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 				       int value)
 {
-	struct meson_domain *domain = to_meson_domain(chip);
+	struct meson_domain *domain = gpiochip_get_data(chip);
 	unsigned int reg, bit, pin;
 	struct meson_bank *bank;
 	int ret;
@@ -507,7 +502,7 @@ static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 
 static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 {
-	struct meson_domain *domain = to_meson_domain(chip);
+	struct meson_domain *domain = gpiochip_get_data(chip);
 	unsigned int reg, bit, pin;
 	struct meson_bank *bank;
 	int ret;
@@ -524,7 +519,7 @@ static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 
 static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 {
-	struct meson_domain *domain = to_meson_domain(chip);
+	struct meson_domain *domain = gpiochip_get_data(chip);
 	unsigned int reg, bit, val, pin;
 	struct meson_bank *bank;
 	int ret;
@@ -575,7 +570,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 		domain->chip.of_node = domain->of_node;
 		domain->chip.of_gpio_n_cells = 2;
 
-		ret = gpiochip_add(&domain->chip);
+		ret = gpiochip_add_data(&domain->chip, domain);
 		if (ret) {
 			dev_err(pc->dev, "can't add gpio chip %s\n",
 				domain->data->name);
-- 
2.4.3

