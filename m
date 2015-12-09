From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 163/182] mfd: htc-egpio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:47:37 +0100
Message-ID: <1449668857-6260-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:33425 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINrm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:47:42 -0500
Received: by lbbkw15 with SMTP id kw15so30304212lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:47:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <philipp.zabel@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.
Philipp: should this driver move to drivers/gpio? Looks like
so to me.
---
 drivers/mfd/htc-egpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
index d334e7d8a77d..2e066fe66ca7 100644
--- a/drivers/mfd/htc-egpio.c
+++ b/drivers/mfd/htc-egpio.c
@@ -155,7 +155,7 @@ static int egpio_get(struct gpio_chip *chip, unsigned offset)
 
 	pr_debug("egpio_get_value(%d)\n", chip->base + offset);
 
-	egpio = container_of(chip, struct egpio_chip, chip);
+	egpio = gpiochip_get_data(chip);
 	ei    = dev_get_drvdata(egpio->dev);
 	bit   = egpio_bit(ei, offset);
 	reg   = egpio->reg_start + egpio_pos(ei, offset);
@@ -170,7 +170,7 @@ static int egpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct egpio_chip *egpio;
 
-	egpio = container_of(chip, struct egpio_chip, chip);
+	egpio = gpiochip_get_data(chip);
 	return test_bit(offset, &egpio->is_out) ? -EINVAL : 0;
 }
 
@@ -192,7 +192,7 @@ static void egpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	pr_debug("egpio_set(%s, %d(%d), %d)\n",
 			chip->label, offset, offset+chip->base, value);
 
-	egpio = container_of(chip, struct egpio_chip, chip);
+	egpio = gpiochip_get_data(chip);
 	ei    = dev_get_drvdata(egpio->dev);
 	bit   = egpio_bit(ei, offset);
 	pos   = egpio_pos(ei, offset);
@@ -216,7 +216,7 @@ static int egpio_direction_output(struct gpio_chip *chip,
 {
 	struct egpio_chip *egpio;
 
-	egpio = container_of(chip, struct egpio_chip, chip);
+	egpio = gpiochip_get_data(chip);
 	if (test_bit(offset, &egpio->is_out)) {
 		egpio_set(chip, offset, value);
 		return 0;
@@ -330,7 +330,7 @@ static int __init egpio_probe(struct platform_device *pdev)
 		chip->base            = pdata->chip[i].gpio_base;
 		chip->ngpio           = pdata->chip[i].num_gpios;
 
-		gpiochip_add(chip);
+		gpiochip_add_data(chip, &ei->chip[i]);
 	}
 
 	/* Set initial pin values */
-- 
2.4.3

