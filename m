From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 167/182] mfd: tps65010: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:48:09 +0100
Message-ID: <1449668889-6451-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33069 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753092AbbLINsN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:48:13 -0500
Received: by lfaz4 with SMTP id z4so34607428lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:48:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.
---
 drivers/mfd/tps65010.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index b96847491277..1ffb8ebd7b2c 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -34,7 +34,7 @@
 
 #include <linux/i2c/tps65010.h>
 
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 
 /*-------------------------------------------------------------------------*/
@@ -477,7 +477,7 @@ tps65010_output(struct gpio_chip *chip, unsigned offset, int value)
 	if (offset < 4) {
 		struct tps65010		*tps;
 
-		tps = container_of(chip, struct tps65010, chip);
+		tps = gpiochip_get_data(chip);
 		if (!(tps->outmask & (1 << offset)))
 			return -EINVAL;
 		tps65010_set_gpio_out_value(offset + 1, value);
@@ -494,7 +494,7 @@ static int tps65010_gpio_get(struct gpio_chip *chip, unsigned offset)
 	int			value;
 	struct tps65010		*tps;
 
-	tps = container_of(chip, struct tps65010, chip);
+	tps = gpiochip_get_data(chip);
 
 	if (offset < 4) {
 		value = i2c_smbus_read_byte_data(tps->client, TPS_DEFGPIO);
@@ -651,7 +651,7 @@ static int tps65010_probe(struct i2c_client *client,
 		tps->chip.ngpio = 7;
 		tps->chip.can_sleep = 1;
 
-		status = gpiochip_add(&tps->chip);
+		status = gpiochip_add_data(&tps->chip, tps);
 		if (status < 0)
 			dev_err(&client->dev, "can't add gpiochip, err %d\n",
 					status);
-- 
2.4.3

