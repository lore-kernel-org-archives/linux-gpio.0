From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 072/182] gpio: twl4030: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:26:53 +0100
Message-ID: <1449667613-812-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36822 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753942AbbLIN06 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:26:58 -0500
Received: by lfs39 with SMTP id 39so34344137lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:26:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-twl4030.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 14f40bf64e34..26d7f852b76a 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -76,11 +76,6 @@ struct gpio_twl4030_priv {
 
 /*----------------------------------------------------------------------*/
 
-static inline struct gpio_twl4030_priv *to_gpio_twl4030(struct gpio_chip *chip)
-{
-	return container_of(chip, struct gpio_twl4030_priv, gpio_chip);
-}
-
 /*
  * To configure TWL4030 GPIO module registers
  */
@@ -205,7 +200,7 @@ static int twl4030_get_gpio_datain(int gpio)
 
 static int twl_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int status = 0;
 
 	mutex_lock(&priv->mutex);
@@ -273,7 +268,7 @@ done:
 
 static void twl_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 
 	mutex_lock(&priv->mutex);
 	if (offset >= TWL4030_GPIO_MAX) {
@@ -293,7 +288,7 @@ out:
 
 static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret;
 
 	mutex_lock(&priv->mutex);
@@ -312,7 +307,7 @@ static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
 
 static int twl_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret;
 	int status = 0;
 
@@ -335,7 +330,7 @@ out:
 
 static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 
 	mutex_lock(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX)
@@ -353,7 +348,7 @@ static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret = 0;
 
 	mutex_lock(&priv->mutex);
@@ -379,7 +374,7 @@ static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 
 static int twl_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 
 	return (priv->irq_base && (offset < TWL4030_GPIO_MAX))
 		? (priv->irq_base + offset)
@@ -544,7 +539,7 @@ no_irqs:
 	if (pdata->use_leds)
 		priv->gpio_chip.ngpio += 2;
 
-	ret = gpiochip_add(&priv->gpio_chip);
+	ret = gpiochip_add_data(&priv->gpio_chip, priv);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "could not register gpiochip, %d\n", ret);
 		priv->gpio_chip.ngpio = 0;
-- 
2.4.3

