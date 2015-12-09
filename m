From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 037/182] gpio: mc9s08dz60: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:17:53 +0100
Message-ID: <1449667073-31503-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35093 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754AbbLINR7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:59 -0500
Received: by lfdl133 with SMTP id l133so33842195lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, wu guoxing <b39297@freescale.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: wu guoxing <b39297@freescale.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mc9s08dz60.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mc9s08dz60.c b/drivers/gpio/gpio-mc9s08dz60.c
index 45f176018378..ba22fb92a6e7 100644
--- a/drivers/gpio/gpio-mc9s08dz60.c
+++ b/drivers/gpio/gpio-mc9s08dz60.c
@@ -29,12 +29,6 @@ struct mc9s08dz60 {
 	struct gpio_chip chip;
 };
 
-static inline struct mc9s08dz60 *to_mc9s08dz60(struct gpio_chip *gc)
-{
-	return container_of(gc, struct mc9s08dz60, chip);
-}
-
-
 static void mc9s_gpio_to_reg_and_bit(int offset, u8 *reg, u8 *bit)
 {
 	*reg = 0x20 + offset / GPIO_NUM_PER_GROUP;
@@ -45,7 +39,7 @@ static int mc9s08dz60_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	u8 reg, bit;
 	s32 value;
-	struct mc9s08dz60 *mc9s = to_mc9s08dz60(gc);
+	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
 
 	mc9s_gpio_to_reg_and_bit(offset, &reg, &bit);
 	value = i2c_smbus_read_byte_data(mc9s->client, reg);
@@ -75,7 +69,7 @@ static int mc9s08dz60_set(struct mc9s08dz60 *mc9s, unsigned offset, int val)
 
 static void mc9s08dz60_set_value(struct gpio_chip *gc, unsigned offset, int val)
 {
-	struct mc9s08dz60 *mc9s = to_mc9s08dz60(gc);
+	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
 
 	mc9s08dz60_set(mc9s, offset, val);
 }
@@ -83,7 +77,7 @@ static void mc9s08dz60_set_value(struct gpio_chip *gc, unsigned offset, int val)
 static int mc9s08dz60_direction_output(struct gpio_chip *gc,
 				       unsigned offset, int val)
 {
-	struct mc9s08dz60 *mc9s = to_mc9s08dz60(gc);
+	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
 
 	return mc9s08dz60_set(mc9s, offset, val);
 }
@@ -109,7 +103,7 @@ static int mc9s08dz60_probe(struct i2c_client *client,
 	mc9s->client = client;
 	i2c_set_clientdata(client, mc9s);
 
-	return gpiochip_add(&mc9s->chip);
+	return gpiochip_add_data(&mc9s->chip, mc9s);
 }
 
 static int mc9s08dz60_remove(struct i2c_client *client)
-- 
2.4.3

