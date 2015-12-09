From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 062/182] gpio: stp-xway: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:07 +0100
Message-ID: <1449667387-32720-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33719 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINXM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:12 -0500
Received: by lfaz4 with SMTP id z4so34115330lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stp-xway.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index c250f21b9e40..d11dd48570b2 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -100,8 +100,7 @@ struct xway_stp {
  */
 static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
 {
-	struct xway_stp *chip =
-		container_of(gc, struct xway_stp, gc);
+	struct xway_stp *chip = gpiochip_get_data(gc);
 
 	if (val)
 		chip->shadow |= BIT(gpio);
@@ -135,8 +134,7 @@ static int xway_stp_dir_out(struct gpio_chip *gc, unsigned gpio, int val)
  */
 static int xway_stp_request(struct gpio_chip *gc, unsigned gpio)
 {
-	struct xway_stp *chip =
-		container_of(gc, struct xway_stp, gc);
+	struct xway_stp *chip = gpiochip_get_data(gc);
 
 	if ((gpio < 8) && (chip->reserved & BIT(gpio))) {
 		dev_err(gc->parent, "GPIO %d is driven by hardware\n", gpio);
@@ -260,7 +258,7 @@ static int xway_stp_probe(struct platform_device *pdev)
 
 	ret = xway_stp_hw_init(chip);
 	if (!ret)
-		ret = gpiochip_add(&chip->gc);
+		ret = gpiochip_add_data(&chip->gc, chip);
 
 	if (!ret)
 		dev_info(&pdev->dev, "Init done\n");
-- 
2.4.3

