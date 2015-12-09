From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 031/182] gpio: lpc32xx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:17:06 +0100
Message-ID: <1449667026-31219-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:34344 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINRL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:11 -0500
Received: by lbbcs9 with SMTP id cs9so29701931lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Roland Stigge <stigge@antcom.de>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Roland Stigge <stigge@antcom.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Roland: this looks like a driver that should move to drivers/pinctrl
since it is obviously controlling a lot of pins. Can you confirm?
---
 drivers/gpio/gpio-lpc32xx.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 47e2dde63734..b4df5057a48c 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -165,12 +165,6 @@ struct lpc32xx_gpio_chip {
 	struct gpio_regs	*gpio_grp;
 };
 
-static inline struct lpc32xx_gpio_chip *to_lpc32xx_gpio(
-	struct gpio_chip *gpc)
-{
-	return container_of(gpc, struct lpc32xx_gpio_chip, chip);
-}
-
 static void __set_gpio_dir_p012(struct lpc32xx_gpio_chip *group,
 	unsigned pin, int input)
 {
@@ -261,7 +255,7 @@ static int __get_gpo_state_p3(struct lpc32xx_gpio_chip *group,
 static int lpc32xx_gpio_dir_input_p012(struct gpio_chip *chip,
 	unsigned pin)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_dir_p012(group, pin, 1);
 
@@ -271,7 +265,7 @@ static int lpc32xx_gpio_dir_input_p012(struct gpio_chip *chip,
 static int lpc32xx_gpio_dir_input_p3(struct gpio_chip *chip,
 	unsigned pin)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_dir_p3(group, pin, 1);
 
@@ -286,21 +280,21 @@ static int lpc32xx_gpio_dir_in_always(struct gpio_chip *chip,
 
 static int lpc32xx_gpio_get_value_p012(struct gpio_chip *chip, unsigned pin)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return __get_gpio_state_p012(group, pin);
 }
 
 static int lpc32xx_gpio_get_value_p3(struct gpio_chip *chip, unsigned pin)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return __get_gpio_state_p3(group, pin);
 }
 
 static int lpc32xx_gpi_get_value(struct gpio_chip *chip, unsigned pin)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return __get_gpi_state_p3(group, pin);
 }
@@ -308,7 +302,7 @@ static int lpc32xx_gpi_get_value(struct gpio_chip *chip, unsigned pin)
 static int lpc32xx_gpio_dir_output_p012(struct gpio_chip *chip, unsigned pin,
 	int value)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p012(group, pin, value);
 	__set_gpio_dir_p012(group, pin, 0);
@@ -319,7 +313,7 @@ static int lpc32xx_gpio_dir_output_p012(struct gpio_chip *chip, unsigned pin,
 static int lpc32xx_gpio_dir_output_p3(struct gpio_chip *chip, unsigned pin,
 	int value)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p3(group, pin, value);
 	__set_gpio_dir_p3(group, pin, 0);
@@ -330,7 +324,7 @@ static int lpc32xx_gpio_dir_output_p3(struct gpio_chip *chip, unsigned pin,
 static int lpc32xx_gpio_dir_out_always(struct gpio_chip *chip, unsigned pin,
 	int value)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpo_level_p3(group, pin, value);
 	return 0;
@@ -339,7 +333,7 @@ static int lpc32xx_gpio_dir_out_always(struct gpio_chip *chip, unsigned pin,
 static void lpc32xx_gpio_set_value_p012(struct gpio_chip *chip, unsigned pin,
 	int value)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p012(group, pin, value);
 }
@@ -347,7 +341,7 @@ static void lpc32xx_gpio_set_value_p012(struct gpio_chip *chip, unsigned pin,
 static void lpc32xx_gpio_set_value_p3(struct gpio_chip *chip, unsigned pin,
 	int value)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p3(group, pin, value);
 }
@@ -355,14 +349,14 @@ static void lpc32xx_gpio_set_value_p3(struct gpio_chip *chip, unsigned pin,
 static void lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned pin,
 	int value)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpo_level_p3(group, pin, value);
 }
 
 static int lpc32xx_gpo_get_value(struct gpio_chip *chip, unsigned pin)
 {
-	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
+	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return __get_gpo_state_p3(group, pin);
 }
@@ -553,7 +547,8 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].chip.of_node = pdev->dev.of_node;
 		}
-		gpiochip_add(&lpc32xx_gpiochip[i].chip);
+		gpiochip_add_data(&lpc32xx_gpiochip[i].chip,
+				  &lpc32xx_gpiochip[i]);
 	}
 
 	return 0;
-- 
2.4.3

