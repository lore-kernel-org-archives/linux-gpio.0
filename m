From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: clamp values on gpio[d]_direction_output()
Date: Sun, 13 Nov 2016 23:02:44 +0100
Message-ID: <1479074564-5466-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35935 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964784AbcKMWCu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2016 17:02:50 -0500
Received: by mail-lf0-f45.google.com with SMTP id t196so46282507lff.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2016 14:02:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

I saw weird values != [0,1] being passed down to drivers
in their .set_direction_output() callbacks. Go over the
gpiolib and make sure to hammer it to [0,1] before hitting
the driver to avoid undesired side effects.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4575c2c5f293..26ce0743adae 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2150,6 +2150,7 @@ EXPORT_SYMBOL_GPL(gpiod_direction_input);
 static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
+	int val = !!value;
 	int ret;
 
 	/* GPIOs used for IRQs shall not be set as output */
@@ -2169,7 +2170,7 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 				goto set_output_value;
 		}
 		/* Emulate open drain by not actively driving the line high */
-		if (value)
+		if (val)
 			return gpiod_direction_input(desc);
 	}
 	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
@@ -2180,7 +2181,7 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 				goto set_output_value;
 		}
 		/* Emulate open source by not actively driving the line low */
-		if (!value)
+		if (!val)
 			return gpiod_direction_input(desc);
 	} else {
 		/* Make sure to disable open drain/source hardware, if any */
@@ -2198,10 +2199,10 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 		return -EIO;
 	}
 
-	ret = gc->direction_output(gc, gpio_chip_hwgpio(desc), value);
+	ret = gc->direction_output(gc, gpio_chip_hwgpio(desc), val);
 	if (!ret)
 		set_bit(FLAG_IS_OUT, &desc->flags);
-	trace_gpio_value(desc_to_gpio(desc), 0, value);
+	trace_gpio_value(desc_to_gpio(desc), 0, val);
 	trace_gpio_direction(desc_to_gpio(desc), 0, ret);
 	return ret;
 }
@@ -2241,6 +2242,8 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	VALIDATE_DESC(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
+	else
+		value = !!value;
 	return _gpiod_direction_output_raw(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
@@ -3097,7 +3100,7 @@ static int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	/* Process flags */
 	if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
 		status = gpiod_direction_output(desc,
-					      dflags & GPIOD_FLAGS_BIT_DIR_VAL);
+				!!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
 	else
 		status = gpiod_direction_input(desc);
 
-- 
2.7.4

