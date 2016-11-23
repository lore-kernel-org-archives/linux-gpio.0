From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v2 2/2] pinctrl: sx150x: support setting multiple pins at once
Date: Wed, 23 Nov 2016 11:18:51 +0100
Message-ID: <1479896331-16915-3-git-send-email-peda@axentia.se>
References: <1479896331-16915-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479896331-16915-1-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

If the chip does not have an oscio pin, all pins are configured in
the same regmap register making it trivial to update all pins at
once, so do that. If an oscio pin is present, there needs to be
more locking in place to handle all cases correctly, so this is
skipped.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index ef4ef88e0ee9..f9e559e22537 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -395,6 +395,15 @@ static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 }
 
+static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
+				     unsigned long *mask,
+				     unsigned long *bits)
+{
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
+
+	regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask, *bits);
+}
+
 static int sx150x_gpio_direction_input(struct gpio_chip *chip,
 				       unsigned int offset)
 {
@@ -1075,6 +1084,14 @@ static int sx150x_probe(struct i2c_client *client,
 	pctl->gpio.of_node = dev->of_node;
 #endif
 	pctl->gpio.can_sleep = true;
+	/*
+	 * Setting multiple pins is not safe when all pins are not
+	 * handled by the same regmap register. The oscio pin (present
+	 * on the SX150X_789 chips) lives in its own register, so
+	 * would require locking that is not in place at this time.
+	 */
+	if (pctl->data->model != SX150X_789)
+		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
 
 	ret = devm_gpiochip_add_data(dev, &pctl->gpio, pctl);
 	if (ret)
-- 
2.1.4
