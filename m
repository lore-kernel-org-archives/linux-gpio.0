From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 103/182] pinctrl: digicolor: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:32:01 +0100
Message-ID: <1449667921-2612-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:35279 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754181AbbLINcG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:32:06 -0500
Received: by lbpu9 with SMTP id u9so29824300lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:32:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-digicolor.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index d8efb2ccac6c..f1343d6ca823 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -171,7 +171,7 @@ static struct pinmux_ops dc_pmxops = {
 
 static int dc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	struct dc_pinmap *pmap = gpiochip_get_data(chip);
 	int reg_off = GP_DRIVE0(gpio/PINS_PER_COLLECTION);
 	int bit_off = gpio % PINS_PER_COLLECTION;
 	u8 drive;
@@ -191,7 +191,7 @@ static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value);
 static int dc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 				    int value)
 {
-	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	struct dc_pinmap *pmap = gpiochip_get_data(chip);
 	int reg_off = GP_DRIVE0(gpio/PINS_PER_COLLECTION);
 	int bit_off = gpio % PINS_PER_COLLECTION;
 	u8 drive;
@@ -210,7 +210,7 @@ static int dc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 
 static int dc_gpio_get(struct gpio_chip *chip, unsigned gpio)
 {
-	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	struct dc_pinmap *pmap = gpiochip_get_data(chip);
 	int reg_off = GP_INPUT(gpio/PINS_PER_COLLECTION);
 	int bit_off = gpio % PINS_PER_COLLECTION;
 	u8 input;
@@ -222,7 +222,7 @@ static int dc_gpio_get(struct gpio_chip *chip, unsigned gpio)
 
 static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 {
-	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	struct dc_pinmap *pmap = gpiochip_get_data(chip);
 	int reg_off = GP_OUTPUT0(gpio/PINS_PER_COLLECTION);
 	int bit_off = gpio % PINS_PER_COLLECTION;
 	u8 output;
@@ -258,7 +258,7 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap, struct device_node *np)
 
 	spin_lock_init(&pmap->lock);
 
-	ret = gpiochip_add(chip);
+	ret = gpiochip_add_data(chip, pmap);
 	if (ret < 0)
 		return ret;
 
-- 
2.4.3

