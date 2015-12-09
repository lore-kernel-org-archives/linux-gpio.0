From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 071/182] gpio: ts5500: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:26:46 +0100
Message-ID: <1449667606-738-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33591 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310AbbLIN0u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:26:50 -0500
Received: by lbbkw15 with SMTP id kw15so29947415lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:26:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ts5500.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index aafe7910e030..5f945083f9d8 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -185,11 +185,6 @@ static const struct ts5500_dio ts5500_lcd[] = {
 	TS5500_DIO_IN_IRQ(0x73, 7, 1),
 };
 
-static inline struct ts5500_priv *ts5500_gc_to_priv(struct gpio_chip *chip)
-{
-	return container_of(chip, struct ts5500_priv, gpio_chip);
-}
-
 static inline void ts5500_set_mask(u8 mask, u8 addr)
 {
 	u8 val = inb(addr);
@@ -206,7 +201,7 @@ static inline void ts5500_clear_mask(u8 mask, u8 addr)
 
 static int ts5500_gpio_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct ts5500_priv *priv = ts5500_gc_to_priv(chip);
+	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
 	unsigned long flags;
 
@@ -225,7 +220,7 @@ static int ts5500_gpio_input(struct gpio_chip *chip, unsigned offset)
 
 static int ts5500_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct ts5500_priv *priv = ts5500_gc_to_priv(chip);
+	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
 
 	return !!(inb(line.value_addr) & line.value_mask);
@@ -233,7 +228,7 @@ static int ts5500_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static int ts5500_gpio_output(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct ts5500_priv *priv = ts5500_gc_to_priv(chip);
+	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
 	unsigned long flags;
 
@@ -255,7 +250,7 @@ static int ts5500_gpio_output(struct gpio_chip *chip, unsigned offset, int val)
 
 static void ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct ts5500_priv *priv = ts5500_gc_to_priv(chip);
+	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
 	unsigned long flags;
 
@@ -269,7 +264,7 @@ static void ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 
 static int ts5500_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct ts5500_priv *priv = ts5500_gc_to_priv(chip);
+	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio *block = priv->pinout;
 	const struct ts5500_dio line = block[offset];
 
@@ -414,7 +409,7 @@ static int ts5500_dio_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = gpiochip_add(&priv->gpio_chip);
+	ret = gpiochip_add_data(&priv->gpio_chip, priv);
 	if (ret) {
 		dev_err(dev, "failed to register the gpio chip\n");
 		return ret;
-- 
2.4.3

