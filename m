From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: pl061: implement .get_direction()
Date: Thu, 28 Apr 2016 14:36:04 +0200
Message-ID: <1461846964-30854-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34334 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316AbcD1MgJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2016 08:36:09 -0400
Received: by mail-lf0-f41.google.com with SMTP id j11so93332643lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2016 05:36:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Implement this callback so that the driver reports correctly
the direction setting of each line.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 70eb9ada002e..6e3c1430616f 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -61,6 +61,13 @@ struct pl061_gpio {
 #endif
 };
 
+static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
+
+	return !(readb(chip->base + GPIODIR) & BIT(offset));
+}
+
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061_gpio *chip = gpiochip_get_data(gc);
@@ -315,6 +322,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		chip->gc.free = gpiochip_generic_free;
 	}
 
+	chip->gc.get_direction = pl061_get_direction;
 	chip->gc.direction_input = pl061_direction_input;
 	chip->gc.direction_output = pl061_direction_output;
 	chip->gc.get = pl061_get_value;
-- 
2.4.11

