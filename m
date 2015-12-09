From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 157/182] input: ad7879: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:45:21 +0100
Message-ID: <1449668721-5832-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35621 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753092AbbLINp0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:45:26 -0500
Received: by lfdl133 with SMTP id l133so34375171lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:45:25 -0800 (PST)
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
 drivers/input/touchscreen/ad7879.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index 16b5cc2196f2..583a0590ceb2 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -379,7 +379,7 @@ static const struct attribute_group ad7879_attr_group = {
 static int ad7879_gpio_direction_input(struct gpio_chip *chip,
 					unsigned gpio)
 {
-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
+	struct ad7879 *ts = gpiochip_get_data(chip);
 	int err;
 
 	mutex_lock(&ts->mutex);
@@ -393,7 +393,7 @@ static int ad7879_gpio_direction_input(struct gpio_chip *chip,
 static int ad7879_gpio_direction_output(struct gpio_chip *chip,
 					unsigned gpio, int level)
 {
-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
+	struct ad7879 *ts = gpiochip_get_data(chip);
 	int err;
 
 	mutex_lock(&ts->mutex);
@@ -412,7 +412,7 @@ static int ad7879_gpio_direction_output(struct gpio_chip *chip,
 
 static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
+	struct ad7879 *ts = gpiochip_get_data(chip);
 	u16 val;
 
 	mutex_lock(&ts->mutex);
@@ -425,7 +425,7 @@ static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 static void ad7879_gpio_set_value(struct gpio_chip *chip,
 				  unsigned gpio, int value)
 {
-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
+	struct ad7879 *ts = gpiochip_get_data(chip);
 
 	mutex_lock(&ts->mutex);
 	if (value)
@@ -456,7 +456,7 @@ static int ad7879_gpio_add(struct ad7879 *ts,
 		ts->gc.owner = THIS_MODULE;
 		ts->gc.parent = ts->dev;
 
-		ret = gpiochip_add(&ts->gc);
+		ret = gpiochip_add_data(&ts->gc, ts);
 		if (ret)
 			dev_err(ts->dev, "failed to register gpio %d\n",
 				ts->gc.base);
-- 
2.4.3

