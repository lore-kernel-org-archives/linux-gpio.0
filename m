From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 155/182] input: adp5588-keys: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:44:53 +0100
Message-ID: <1449668693-5734-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:35345 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754324AbbLINpE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:45:04 -0500
Received: by lbpu9 with SMTP id u9so30043807lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:45:03 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Michael Hennerich <michael.hennerich@analog.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Dmitry: please ACK this so I can take it through the GPIO tree.
---
 drivers/input/keyboard/adp5588-keys.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 21a62d0fa764..53fe9a3fb620 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -73,7 +73,7 @@ static int adp5588_write(struct i2c_client *client, u8 reg, u8 val)
 #ifdef CONFIG_GPIOLIB
 static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
 {
-	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
+	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 	int val;
@@ -93,7 +93,7 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
 static void adp5588_gpio_set_value(struct gpio_chip *chip,
 				   unsigned off, int val)
 {
-	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
+	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 
@@ -112,7 +112,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 
 static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 {
-	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
+	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 	int ret;
@@ -130,7 +130,7 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned off, int val)
 {
-	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
+	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 	int ret;
@@ -210,7 +210,7 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 
 	mutex_init(&kpad->gpio_lock);
 
-	error = gpiochip_add(&kpad->gc);
+	error = gpiochip_add_data(&kpad->gc, kpad);
 	if (error) {
 		dev_err(dev, "gpiochip_add failed, err: %d\n", error);
 		return error;
-- 
2.4.3

