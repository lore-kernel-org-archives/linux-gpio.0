From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/2] pinctrl: sx150x: support setting multiple pins at once
Date: Tue, 22 Nov 2016 17:06:02 +0100
Message-ID: <1479830762-1839-3-git-send-email-peda@axentia.se>
References: <1479830762-1839-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479830762-1839-1-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The mask of a possible oscio pin is cached, making it easier to test
for the exception.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index ef4ef88e0ee9..5bcede2b2cd8 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -114,6 +114,7 @@ struct sx150x_pinctrl {
 	} irq;
 	struct mutex lock;
 	const struct sx150x_device_data *data;
+	unsigned long oscio_mask;
 };
 
 static const struct pinctrl_pin_desc sx150x_8_pins[] = {
@@ -290,14 +291,7 @@ static const struct pinctrl_ops sx150x_pinctrl_ops = {
 
 static bool sx150x_pin_is_oscio(struct sx150x_pinctrl *pctl, unsigned int pin)
 {
-	if (pin >= pctl->data->npins)
-		return false;
-
-	/* OSCIO pin is only present in 789 devices */
-	if (pctl->data->model != SX150X_789)
-		return false;
-
-	return !strcmp(pctl->data->pins[pin].name, "oscio");
+	return !!(BIT(pin) & pctl->oscio_mask);
 }
 
 static int sx150x_gpio_get_direction(struct gpio_chip *chip,
@@ -395,6 +389,15 @@ static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
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
@@ -996,6 +999,20 @@ static int sx150x_regmap_reg_write(void *context, unsigned int reg,
 	return 0;
 }
 
+static void sx150x_oscio_mask_init(struct sx150x_pinctrl *pctl)
+{
+	int pin;
+
+	/* OSCIO pin is only present in 789 devices */
+	if (pctl->data->model != SX150X_789)
+		return;
+
+	for (pin = 0; pin < pctl->data->npins; ++pin) {
+		if (!strcmp(pctl->data->pins[pin].name, "oscio"))
+			pctl->oscio_mask |= BIT(pin);
+	}
+}
+
 static bool sx150x_reg_volatile(struct device *dev, unsigned int reg)
 {
 	struct sx150x_pinctrl *pctl = i2c_get_clientdata(to_i2c_client(dev));
@@ -1045,6 +1062,8 @@ static int sx150x_probe(struct i2c_client *client,
 	if (!pctl->data)
 		return -EINVAL;
 
+	sx150x_oscio_mask_init(pctl);
+
 	pctl->regmap = devm_regmap_init(dev, NULL, pctl,
 					&sx150x_regmap_config);
 	if (IS_ERR(pctl->regmap)) {
@@ -1069,6 +1088,8 @@ static int sx150x_probe(struct i2c_client *client,
 	pctl->gpio.direction_output = sx150x_gpio_direction_output;
 	pctl->gpio.get = sx150x_gpio_get;
 	pctl->gpio.set = sx150x_gpio_set;
+	if (!pctl->oscio_mask)
+		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
 	pctl->gpio.set_single_ended = sx150x_gpio_set_single_ended;
 	pctl->gpio.parent = dev;
 #ifdef CONFIG_OF_GPIO
-- 
2.1.4
