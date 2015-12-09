From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 030/182] gpio: lpc18xx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:16:53 +0100
Message-ID: <1449667013-31170-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:36030 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753592AbbLINRE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:04 -0500
Received: by lbblt2 with SMTP id lt2so29885389lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joachim Eastwood <manabian@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Joachim Eastwood <manabian@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Joachim: this driver looks very simplistic, it seems it can
be totally replaced with drivers/gpio/gpio-generic.c provided
that some (optional) clock handling is added to the generic GPIO
driver, if you have some time, please look into that.
---
 drivers/gpio/gpio-lpc18xx.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index b01fbc9db7cd..98832c9f614a 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -31,27 +31,22 @@ struct lpc18xx_gpio_chip {
 	spinlock_t lock;
 };
 
-static inline struct lpc18xx_gpio_chip *to_lpc18xx_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct lpc18xx_gpio_chip, gpio);
-}
-
 static void lpc18xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct lpc18xx_gpio_chip *gc = to_lpc18xx_gpio(chip);
+	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
 	writeb(value ? 1 : 0, gc->base + offset);
 }
 
 static int lpc18xx_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct lpc18xx_gpio_chip *gc = to_lpc18xx_gpio(chip);
+	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
 	return !!readb(gc->base + offset);
 }
 
 static int lpc18xx_gpio_direction(struct gpio_chip *chip, unsigned offset,
 				  bool out)
 {
-	struct lpc18xx_gpio_chip *gc = to_lpc18xx_gpio(chip);
+	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 port, pin, dir;
 
@@ -129,7 +124,7 @@ static int lpc18xx_gpio_probe(struct platform_device *pdev)
 
 	gc->gpio.parent = &pdev->dev;
 
-	ret = gpiochip_add(&gc->gpio);
+	ret = gpiochip_add_data(&gc->gpio, gc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add gpio chip\n");
 		clk_disable_unprepare(gc->clk);
-- 
2.4.3

