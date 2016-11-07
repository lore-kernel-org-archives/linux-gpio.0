From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 10/15] pinctrl-sx150x: Remove excessive locking
Date: Mon,  7 Nov 2016 08:53:18 -0800
Message-ID: <1478537603-23653-11-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

Gpiochip and irqchip aspects of this driver do not access any shared
registers on the chip itself and atomicity of various regmap operations
is ensured by that API's implementation, so there doesn't seem to be a
reason to hold the lock in as many places as it is held now.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 70 +++++++++-------------------------------
 1 file changed, 16 insertions(+), 54 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 4725fac..c339800 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -343,13 +343,9 @@ static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
 		    sx150x_pin_is_oscio(pctl, offset))
 			return 0;
 
-		mutex_lock(&pctl->lock);
 		ret = regmap_write_bits(pctl->regmap,
 					pctl->data->pri.x789.reg_drain,
 					BIT(offset), 0);
-		mutex_unlock(&pctl->lock);
-		if (ret < 0)
-			return ret;
 		break;
 
 	case LINE_MODE_OPEN_DRAIN:
@@ -357,20 +353,16 @@ static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
 		    sx150x_pin_is_oscio(pctl, offset))
 			return -ENOTSUPP;
 
-		mutex_lock(&pctl->lock);
 		ret = regmap_write_bits(pctl->regmap,
 					pctl->data->pri.x789.reg_drain,
 					BIT(offset), BIT(offset));
-		mutex_unlock(&pctl->lock);
-		if (ret < 0)
-			return ret;
 		break;
-
 	default:
-		return -ENOTSUPP;
+		ret = -ENOTSUPP;
+		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int __sx150x_gpio_set(struct sx150x_pinctrl *pctl, unsigned int offset,
@@ -385,57 +377,46 @@ static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 
-	if (sx150x_pin_is_oscio(pctl, offset)) {
-		mutex_lock(&pctl->lock);
+	if (sx150x_pin_is_oscio(pctl, offset))
 		regmap_write(pctl->regmap,
 			     pctl->data->pri.x789.reg_clock,
 			     (value ? 0x1f : 0x10));
-		mutex_unlock(&pctl->lock);
-	} else {
-		mutex_lock(&pctl->lock);
+	else
 		__sx150x_gpio_set(pctl, offset, value);
-		mutex_unlock(&pctl->lock);
-	}
+
 }
 
 static int sx150x_gpio_direction_input(struct gpio_chip *chip,
 				      unsigned int offset)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
-	int ret;
 
 	if (sx150x_pin_is_oscio(pctl, offset))
 		return -EINVAL;
 
-	mutex_lock(&pctl->lock);
-	ret = regmap_write_bits(pctl->regmap,
-				pctl->data->reg_dir,
-				BIT(offset), BIT(offset));
-	mutex_unlock(&pctl->lock);
-
-	return ret;
+	return regmap_write_bits(pctl->regmap,
+				 pctl->data->reg_dir,
+				 BIT(offset), BIT(offset));
 }
 
 static int sx150x_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
-	int status;
+	int ret;
 
 	if (sx150x_pin_is_oscio(pctl, offset)) {
 		sx150x_gpio_set(chip, offset, value);
 		return 0;
 	}
 
-	mutex_lock(&pctl->lock);
-	status = __sx150x_gpio_set(pctl, offset, value);
-	if (status >= 0)
-		status = regmap_write_bits(pctl->regmap,
-					   pctl->data->reg_dir,
-					   BIT(offset), 0);
-	mutex_unlock(&pctl->lock);
+	ret = __sx150x_gpio_set(pctl, offset, value);
+	if (ret < 0)
+		return ret;
 
-	return status;
+	return regmap_write_bits(pctl->regmap,
+				 pctl->data->reg_dir,
+				 BIT(offset), 0);
 }
 
 static void sx150x_irq_mask(struct irq_data *d)
@@ -536,12 +517,9 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_DRIVE_PUSH_PULL:
 		case PIN_CONFIG_OUTPUT:
-			mutex_lock(&pctl->lock);
 			ret = regmap_read(pctl->regmap,
 					  pctl->data->pri.x789.reg_clock,
 					  &data);
-			mutex_unlock(&pctl->lock);
-
 			if (ret < 0)
 				return ret;
 
@@ -566,12 +544,10 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		mutex_lock(&pctl->lock);
 		ret = regmap_read(pctl->regmap,
 				  pctl->data->reg_pulldn,
 				  &data);
 		data &= BIT(pin);
-		mutex_unlock(&pctl->lock);
 
 		if (ret < 0)
 			return ret;
@@ -583,12 +559,10 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		break;
 
 	case PIN_CONFIG_BIAS_PULL_UP:
-		mutex_lock(&pctl->lock);
 		ret = regmap_read(pctl->regmap,
 				  pctl->data->reg_pullup,
 				  &data);
 		data &= BIT(pin);
-		mutex_unlock(&pctl->lock);
 
 		if (ret < 0)
 			return ret;
@@ -603,12 +577,10 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		if (pctl->data->model != SX150X_789)
 			return -ENOTSUPP;
 
-		mutex_lock(&pctl->lock);
 		ret = regmap_read(pctl->regmap,
 				  pctl->data->pri.x789.reg_drain,
 				  &data);
 		data &= BIT(pin);
-		mutex_unlock(&pctl->lock);
 
 		if (ret < 0)
 			return ret;
@@ -623,12 +595,10 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		if (pctl->data->model != SX150X_789)
 			arg = true;
 		else {
-			mutex_lock(&pctl->lock);
 			ret = regmap_read(pctl->regmap,
 					  pctl->data->pri.x789.reg_drain,
 					  &data);
 			data &= BIT(pin);
-			mutex_unlock(&pctl->lock);
 
 			if (ret < 0)
 				return ret;
@@ -693,41 +663,33 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
 		case PIN_CONFIG_BIAS_DISABLE:
-			mutex_lock(&pctl->lock);
 			ret = regmap_write_bits(pctl->regmap,
 						pctl->data->reg_pulldn,
 						BIT(pin), 0);
-			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
 
-			mutex_lock(&pctl->lock);
 			ret = regmap_write_bits(pctl->regmap,
 						pctl->data->reg_pullup,
 						BIT(pin), 0);
-			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
 
 			break;
 
 		case PIN_CONFIG_BIAS_PULL_UP:
-			mutex_lock(&pctl->lock);
 			ret = regmap_write_bits(pctl->regmap,
 						pctl->data->reg_pullup,
 						BIT(pin), BIT(pin));
-			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
 
 			break;
 
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			mutex_lock(&pctl->lock);
 			ret = regmap_write_bits(pctl->regmap,
 						pctl->data->reg_pulldn,
 						BIT(pin), BIT(pin));
-			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
 
-- 
2.5.5
