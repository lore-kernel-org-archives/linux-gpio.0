From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 033/182] gpio: max730x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:17:21 +0100
Message-ID: <1449667041-31314-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34470 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753598AbbLINR0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:26 -0500
Received: by lbbcs9 with SMTP id cs9so29706161lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:25 -0800 (PST)
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
 drivers/gpio/gpio-max730x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index 5d6a723cb414..08807368f007 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -50,7 +50,7 @@
 
 static int max7301_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct max7301 *ts = container_of(chip, struct max7301, chip);
+	struct max7301 *ts = gpiochip_get_data(chip);
 	u8 *config;
 	u8 offset_bits, pin_config;
 	int ret;
@@ -92,7 +92,7 @@ static int __max7301_set(struct max7301 *ts, unsigned offset, int value)
 static int max7301_direction_output(struct gpio_chip *chip, unsigned offset,
 				    int value)
 {
-	struct max7301 *ts = container_of(chip, struct max7301, chip);
+	struct max7301 *ts = gpiochip_get_data(chip);
 	u8 *config;
 	u8 offset_bits;
 	int ret;
@@ -120,7 +120,7 @@ static int max7301_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int max7301_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct max7301 *ts = container_of(chip, struct max7301, chip);
+	struct max7301 *ts = gpiochip_get_data(chip);
 	int config, level = -EINVAL;
 
 	/* First 4 pins are unused in the controller */
@@ -148,7 +148,7 @@ static int max7301_get(struct gpio_chip *chip, unsigned offset)
 
 static void max7301_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct max7301 *ts = container_of(chip, struct max7301, chip);
+	struct max7301 *ts = gpiochip_get_data(chip);
 
 	/* First 4 pins are unused in the controller */
 	offset += 4;
@@ -213,7 +213,7 @@ int __max730x_probe(struct max7301 *ts)
 		}
 	}
 
-	ret = gpiochip_add(&ts->chip);
+	ret = gpiochip_add_data(&ts->chip, ts);
 	if (ret)
 		goto exit_destroy;
 
-- 
2.4.3

