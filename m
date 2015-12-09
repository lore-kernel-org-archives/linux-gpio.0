From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 007/182] gpio: 74x164: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:13:33 +0100
Message-ID: <1449666813-30065-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34001 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbbLINNl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:13:41 -0500
Received: by lffu14 with SMTP id u14so33948405lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:13:40 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexander Shiyan <shc_work@mail.ru>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-74x164.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index fb555300008f..34c20e802da9 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -26,11 +26,6 @@ struct gen_74x164_chip {
 	u32			registers;
 };
 
-static struct gen_74x164_chip *gpio_to_74x164_chip(struct gpio_chip *gc)
-{
-	return container_of(gc, struct gen_74x164_chip, gpio_chip);
-}
-
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 {
 	struct spi_device *spi = to_spi_device(chip->gpio_chip.parent);
@@ -68,7 +63,7 @@ static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 
 static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
 {
-	struct gen_74x164_chip *chip = gpio_to_74x164_chip(gc);
+	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
 	u8 bank = offset / 8;
 	u8 pin = offset % 8;
 	int ret;
@@ -83,7 +78,7 @@ static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
 static void gen_74x164_set_value(struct gpio_chip *gc,
 		unsigned offset, int val)
 {
-	struct gen_74x164_chip *chip = gpio_to_74x164_chip(gc);
+	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
 	u8 bank = offset / 8;
 	u8 pin = offset % 8;
 
@@ -154,7 +149,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 		goto exit_destroy;
 	}
 
-	ret = gpiochip_add(&chip->gpio_chip);
+	ret = gpiochip_add_data(&chip->gpio_chip, chip);
 	if (!ret)
 		return 0;
 
-- 
2.4.3

