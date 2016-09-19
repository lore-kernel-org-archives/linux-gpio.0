From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc3589x: add .get_direction() and small cleanup
Date: Mon, 19 Sep 2016 10:10:12 +0200
Message-ID: <1474272612-11987-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36463 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760546AbcISIKT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2016 04:10:19 -0400
Received: by mail-lf0-f45.google.com with SMTP id g62so100081427lfe.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2016 01:10:18 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This adds a .get_direction() callback to the TC3589x and
renames the function for setting single-ended mode to be
more to the point.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 5baa45768ec5..537a4335ddec 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -84,9 +84,25 @@ static int tc3589x_gpio_direction_input(struct gpio_chip *chip,
 	return tc3589x_set_bits(tc3589x, reg, BIT(pos), 0);
 }
 
-static int tc3589x_gpio_single_ended(struct gpio_chip *chip,
-				     unsigned offset,
-				     enum single_ended_mode mode)
+static int tc3589x_gpio_get_direction(struct gpio_chip *chip,
+				      unsigned offset)
+{
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
+	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
+	u8 reg = TC3589x_GPIODIR0 + offset / 8;
+	unsigned pos = offset % 8;
+	int ret;
+
+	ret = tc3589x_reg_read(tc3589x, reg);
+	if (ret < 0)
+		return ret;
+
+	return !!(ret & BIT(pos));
+}
+
+static int tc3589x_gpio_set_single_ended(struct gpio_chip *chip,
+					 unsigned offset,
+					 enum single_ended_mode mode)
 {
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
@@ -127,11 +143,12 @@ static int tc3589x_gpio_single_ended(struct gpio_chip *chip,
 static const struct gpio_chip template_chip = {
 	.label			= "tc3589x",
 	.owner			= THIS_MODULE,
-	.direction_input	= tc3589x_gpio_direction_input,
 	.get			= tc3589x_gpio_get,
-	.direction_output	= tc3589x_gpio_direction_output,
 	.set			= tc3589x_gpio_set,
-	.set_single_ended	= tc3589x_gpio_single_ended,
+	.direction_output	= tc3589x_gpio_direction_output,
+	.direction_input	= tc3589x_gpio_direction_input,
+	.get_direction		= tc3589x_gpio_get_direction,
+	.set_single_ended	= tc3589x_gpio_set_single_ended,
 	.can_sleep		= true,
 };
 
-- 
2.7.4

