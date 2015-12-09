From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 075/182] gpio: ucb1400: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:15 +0100
Message-ID: <1449667635-968-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:32892 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754327AbbLIN1U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:20 -0500
Received: by lfaz4 with SMTP id z4so34195263lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ucb1400.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index d502825159b9..3e719c213696 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -15,7 +15,7 @@
 static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned off)
 {
 	struct ucb1400_gpio *gpio;
-	gpio = container_of(gc, struct ucb1400_gpio, gc);
+	gpio = gpiochip_get_data(gc);
 	ucb1400_gpio_set_direction(gpio->ac97, off, 0);
 	return 0;
 }
@@ -23,7 +23,7 @@ static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned off)
 static int ucb1400_gpio_dir_out(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct ucb1400_gpio *gpio;
-	gpio = container_of(gc, struct ucb1400_gpio, gc);
+	gpio = gpiochip_get_data(gc);
 	ucb1400_gpio_set_direction(gpio->ac97, off, 1);
 	ucb1400_gpio_set_value(gpio->ac97, off, val);
 	return 0;
@@ -32,14 +32,14 @@ static int ucb1400_gpio_dir_out(struct gpio_chip *gc, unsigned off, int val)
 static int ucb1400_gpio_get(struct gpio_chip *gc, unsigned off)
 {
 	struct ucb1400_gpio *gpio;
-	gpio = container_of(gc, struct ucb1400_gpio, gc);
+	gpio = gpiochip_get_data(gc);
 	return ucb1400_gpio_get_value(gpio->ac97, off);
 }
 
 static void ucb1400_gpio_set(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct ucb1400_gpio *gpio;
-	gpio = container_of(gc, struct ucb1400_gpio, gc);
+	gpio = gpiochip_get_data(gc);
 	ucb1400_gpio_set_value(gpio->ac97, off, val);
 }
 
@@ -66,7 +66,7 @@ static int ucb1400_gpio_probe(struct platform_device *dev)
 	ucb->gc.set = ucb1400_gpio_set;
 	ucb->gc.can_sleep = true;
 
-	err = gpiochip_add(&ucb->gc);
+	err = gpiochip_add_data(&ucb->gc, ucb);
 	if (err)
 		goto err;
 
-- 
2.4.3

