From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 025/182] gpio: f7188: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:16:10 +0100
Message-ID: <1449666970-30929-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33106 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753156AbbLINQS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:16:18 -0500
Received: by lfaz4 with SMTP id z4so33981454lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:16:16 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Andreas Bofjall <andreas@gazonk.org>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-f7188x.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 2be7337cf4ae..d62fd6bbaf82 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -193,8 +193,7 @@ static struct f7188x_gpio_bank f71889_gpio_bank[] = {
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	int err;
-	struct f7188x_gpio_bank *bank =
-		container_of(chip, struct f7188x_gpio_bank, chip);
+	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
 	u8 dir;
 
@@ -215,8 +214,7 @@ static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	int err;
-	struct f7188x_gpio_bank *bank =
-		container_of(chip, struct f7188x_gpio_bank, chip);
+	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
 	u8 dir, data;
 
@@ -241,8 +239,7 @@ static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
 	int err;
-	struct f7188x_gpio_bank *bank =
-		container_of(chip, struct f7188x_gpio_bank, chip);
+	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
 	u8 dir, data_out;
 
@@ -270,8 +267,7 @@ static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	int err;
-	struct f7188x_gpio_bank *bank =
-		container_of(chip, struct f7188x_gpio_bank, chip);
+	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
 	u8 data_out;
 
@@ -336,7 +332,7 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		bank->chip.parent = &pdev->dev;
 		bank->data = data;
 
-		err = gpiochip_add(&bank->chip);
+		err = gpiochip_add_data(&bank->chip, bank);
 		if (err) {
 			dev_err(&pdev->dev,
 				"Failed to register gpiochip %d: %d\n",
-- 
2.4.3

