From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 024/182] gpio: em: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:59 +0100
Message-ID: <1449666959-30882-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:33817 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbbLINQG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:16:06 -0500
Received: by lbbcs9 with SMTP id cs9so29683521lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:16:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <damm@opensource.se>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <damm@opensource.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-em.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index c3ca2b1c1dfe..faa98f0388b5 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -192,7 +192,7 @@ static irqreturn_t em_gio_irq_handler(int irq, void *dev_id)
 
 static inline struct em_gio_priv *gpio_to_priv(struct gpio_chip *chip)
 {
-	return container_of(chip, struct em_gio_priv, gpio_chip);
+	return gpiochip_get_data(chip);
 }
 
 static int em_gio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -368,7 +368,7 @@ static int em_gio_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
-	ret = gpiochip_add(gpio_chip);
+	ret = gpiochip_add_data(gpio_chip, p);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add GPIO controller\n");
 		goto err1;
-- 
2.4.3

