From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] gpio: axp209: Implement get_direction
Date: Wed, 21 Sep 2016 23:51:22 +0300
Message-ID: <20160921205122.29800-1-maxime.ripard@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:42571 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S934137AbcIUUvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2016 16:51:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>

Implement the get_direction callback for the GPIOs found in the AXP209
PMIC.

Due to the way they are implemented, in the same register you have the
muxing options, GPIO directions and GPIO values. Since you have no control
over what value is there at reset, simply use output as the default.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpio/gpio-axp209.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpio/gpio-axp209.c b/drivers/gpio/gpio-axp209.c
index 3174799c27c6..d9c2a517c6df 100644
--- a/drivers/gpio/gpio-axp209.c
+++ b/drivers/gpio/gpio-axp209.c
@@ -77,6 +77,35 @@ static int axp20x_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offset + 4));
 }
 
+static int axp20x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct axp20x_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int val;
+	int reg, ret;
+
+	reg = axp20x_gpio_get_reg(offset);
+	if (reg < 0)
+		return reg;
+
+	ret = regmap_read(gpio->regmap, reg, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * This shouldn't really happen if the pin is in use already,
+	 * or if it's not in use yet, it doesn't matter since we're
+	 * going to change the value soon anyway. Default to output.
+	 */
+	if ((val & AXP20X_GPIO_FUNCTIONS) > 2)
+		return 0;
+
+	/*
+	 * The GPIO directions are the three lowest values.
+	 * 2 is input, 0 and 1 are output
+	 */
+	return val & 2;
+}
+
 static int axp20x_gpio_output(struct gpio_chip *chip, unsigned offset,
 			      int value)
 {
@@ -123,6 +152,7 @@ static int axp20x_gpio_probe(struct platform_device *pdev)
 	gpio->chip.label		= dev_name(&pdev->dev);
 	gpio->chip.owner		= THIS_MODULE;
 	gpio->chip.get			= axp20x_gpio_get;
+	gpio->chip.get_direction	= axp20x_gpio_get_direction;
 	gpio->chip.set			= axp20x_gpio_set;
 	gpio->chip.direction_input	= axp20x_gpio_input;
 	gpio->chip.direction_output	= axp20x_gpio_output;
-- 
2.9.3

