From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 010/182] gpio: adp5588: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:14:03 +0100
Message-ID: <1449666843-30216-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36018 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754080AbbLINOI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:14:08 -0500
Received: by lfs39 with SMTP id 39so34093646lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:14:07 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jean-Francois Dagenais <jeff.dagenais@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adp5588.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index 984186ee58a0..19a0eba1e942 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -65,8 +65,7 @@ static int adp5588_gpio_write(struct i2c_client *client, u8 reg, u8 val)
 
 static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
 {
-	struct adp5588_gpio *dev =
-	    container_of(chip, struct adp5588_gpio, gpio_chip);
+	struct adp5588_gpio *dev = gpiochip_get_data(chip);
 	unsigned bank = ADP5588_BANK(off);
 	unsigned bit = ADP5588_BIT(off);
 	int val;
@@ -87,8 +86,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 				   unsigned off, int val)
 {
 	unsigned bank, bit;
-	struct adp5588_gpio *dev =
-	    container_of(chip, struct adp5588_gpio, gpio_chip);
+	struct adp5588_gpio *dev = gpiochip_get_data(chip);
 
 	bank = ADP5588_BANK(off);
 	bit = ADP5588_BIT(off);
@@ -108,8 +106,7 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 {
 	int ret;
 	unsigned bank;
-	struct adp5588_gpio *dev =
-	    container_of(chip, struct adp5588_gpio, gpio_chip);
+	struct adp5588_gpio *dev = gpiochip_get_data(chip);
 
 	bank = ADP5588_BANK(off);
 
@@ -126,8 +123,7 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 {
 	int ret;
 	unsigned bank, bit;
-	struct adp5588_gpio *dev =
-	    container_of(chip, struct adp5588_gpio, gpio_chip);
+	struct adp5588_gpio *dev = gpiochip_get_data(chip);
 
 	bank = ADP5588_BANK(off);
 	bit = ADP5588_BIT(off);
@@ -152,8 +148,8 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 #ifdef CONFIG_GPIO_ADP5588_IRQ
 static int adp5588_gpio_to_irq(struct gpio_chip *chip, unsigned off)
 {
-	struct adp5588_gpio *dev =
-		container_of(chip, struct adp5588_gpio, gpio_chip);
+	struct adp5588_gpio *dev = gpiochip_get_data(chip);
+
 	return dev->irq_base + off;
 }
 
@@ -418,7 +414,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
 		}
 	}
 
-	ret = gpiochip_add(&dev->gpio_chip);
+	ret = gpiochip_add_data(&dev->gpio_chip, dev);
 	if (ret)
 		goto err_irq;
 
-- 
2.4.3

