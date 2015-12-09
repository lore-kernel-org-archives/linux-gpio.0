From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 009/182] gpio: adp5520: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:13:52 +0100
Message-ID: <1449666832-30159-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34985 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754080AbbLINOA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:14:00 -0500
Received: by lfdl133 with SMTP id l133so33763975lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:13:59 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adp5520.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index caff711ca5a9..4fa7ff1fec9a 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -27,7 +27,7 @@ static int adp5520_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	struct adp5520_gpio *dev;
 	uint8_t reg_val;
 
-	dev = container_of(chip, struct adp5520_gpio, gpio_chip);
+	dev = gpiochip_get_data(chip);
 
 	/*
 	 * There are dedicated registers for GPIO IN/OUT.
@@ -46,7 +46,7 @@ static void adp5520_gpio_set_value(struct gpio_chip *chip,
 		unsigned off, int val)
 {
 	struct adp5520_gpio *dev;
-	dev = container_of(chip, struct adp5520_gpio, gpio_chip);
+	dev = gpiochip_get_data(chip);
 
 	if (val)
 		adp5520_set_bits(dev->master, ADP5520_GPIO_OUT, dev->lut[off]);
@@ -57,7 +57,7 @@ static void adp5520_gpio_set_value(struct gpio_chip *chip,
 static int adp5520_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 {
 	struct adp5520_gpio *dev;
-	dev = container_of(chip, struct adp5520_gpio, gpio_chip);
+	dev = gpiochip_get_data(chip);
 
 	clear_bit(off, &dev->output);
 
@@ -70,7 +70,7 @@ static int adp5520_gpio_direction_output(struct gpio_chip *chip,
 {
 	struct adp5520_gpio *dev;
 	int ret = 0;
-	dev = container_of(chip, struct adp5520_gpio, gpio_chip);
+	dev = gpiochip_get_data(chip);
 
 	set_bit(off, &dev->output);
 
@@ -153,7 +153,7 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = gpiochip_add(&dev->gpio_chip);
+	ret = gpiochip_add_data(&dev->gpio_chip, dev);
 	if (ret)
 		goto err;
 
-- 
2.4.3

