From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 08/14] pinctrl-sx150x: Replace sx150x_*_cfg by means of regmap API
Date: Tue,  1 Nov 2016 08:57:42 -0700
Message-ID: <1478015868-10309-9-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33965 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751757AbcKAP6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 11:58:11 -0400
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>

The difference between 8 and 16 pin GPIO expanders can be accomodated by
the means of regmap API without resorting to usaing driver-specific
read/write accessors. This change, IMHO, brings the following benefits:

	- Replaces driver's idiosyncratic way of dealing with
	  mult-register fields with regmap API, which, hopefuly,
	  makes the code a bit easier for a new reader to understand

	- Removes various multi-read for-loop register read logic
	  from various places in the code and puts it in a signle
	  place

	- Removes ad-hoc IRQ register caching code in
	  sx150x_irq_bus_sync_unlock, since that functionality is
	  provided by regmap

Besided aforementioned benefits this change also implements necessary
RegSense byte swap necessary for SX1503 and SX1506 variants of the chip.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 527 +++++++++++++++++++++------------------
 1 file changed, 284 insertions(+), 243 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 0e7c5fb..af0fc07 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -105,11 +105,8 @@ struct sx150x_pinctrl {
 	struct irq_chip irq_chip;
 	struct regmap *regmap;
 	struct {
-		int update;
 		u32 sense;
 		u32 masked;
-		u32 dev_sense;
-		u32 dev_masked;
 	} irq;
 	struct mutex lock;
 	const struct sx150x_device_data *data;
@@ -170,16 +167,16 @@ static const struct sx150x_device_data sx1508q_device_data = {
 
 static const struct sx150x_device_data sx1509q_device_data = {
 	.model = SX150X_789,
-	.reg_pullup	= 0x07,
-	.reg_pulldn	= 0x09,
-	.reg_dir	= 0x0f,
-	.reg_data	= 0x11,
-	.reg_irq_mask	= 0x13,
-	.reg_irq_src	= 0x19,
-	.reg_sense	= 0x17,
+	.reg_pullup	= 0x06,
+	.reg_pulldn	= 0x08,
+	.reg_dir	= 0x0e,
+	.reg_data	= 0x10,
+	.reg_irq_mask	= 0x12,
+	.reg_irq_src	= 0x18,
+	.reg_sense	= 0x14,
 	.pri.x789 = {
-		.reg_drain	= 0x0b,
-		.reg_polarity	= 0x0d,
+		.reg_drain	= 0x0a,
+		.reg_polarity	= 0x0c,
 		.reg_clock	= 0x1e,
 		.reg_misc	= 0x1f,
 		.reg_reset	= 0x7d,
@@ -191,20 +188,20 @@ static const struct sx150x_device_data sx1509q_device_data = {
 
 static const struct sx150x_device_data sx1506q_device_data = {
 	.model = SX150X_456,
-	.reg_pullup	= 0x05,
-	.reg_pulldn	= 0x07,
-	.reg_dir	= 0x03,
-	.reg_data	= 0x01,
-	.reg_irq_mask	= 0x09,
-	.reg_irq_src	= 0x0f,
-	.reg_sense	= 0x0d,
+	.reg_pullup	= 0x04,
+	.reg_pulldn	= 0x06,
+	.reg_dir	= 0x02,
+	.reg_data	= 0x00,
+	.reg_irq_mask	= 0x08,
+	.reg_irq_src	= 0x0e,
+	.reg_sense	= 0x0a,
 	.pri.x456 = {
-		.reg_pld_mode	= 0x21,
-		.reg_pld_table0	= 0x23,
-		.reg_pld_table1	= 0x25,
-		.reg_pld_table2	= 0x27,
-		.reg_pld_table3	= 0x29,
-		.reg_pld_table4	= 0x2b,
+		.reg_pld_mode	= 0x20,
+		.reg_pld_table0	= 0x22,
+		.reg_pld_table1	= 0x24,
+		.reg_pld_table2	= 0x26,
+		.reg_pld_table3	= 0x28,
+		.reg_pld_table4	= 0x2a,
 		.reg_advance	= 0xad,
 	},
 	.ngpios	= 16,
@@ -237,20 +234,20 @@ static const struct sx150x_device_data sx1502q_device_data = {
 
 static const struct sx150x_device_data sx1503q_device_data = {
 	.model = SX150X_123,
-	.reg_pullup	= 0x05,
-	.reg_pulldn	= 0x07,
-	.reg_dir	= 0x03,
-	.reg_data	= 0x01,
-	.reg_irq_mask	= 0x09,
-	.reg_irq_src	= 0x0f,
-	.reg_sense	= 0x07,
+	.reg_pullup	= 0x04,
+	.reg_pulldn	= 0x06,
+	.reg_dir	= 0x02,
+	.reg_data	= 0x00,
+	.reg_irq_mask	= 0x08,
+	.reg_irq_src	= 0x0e,
+	.reg_sense	= 0x0a,
 	.pri.x123 = {
-		.reg_pld_mode	= 0x10,
-		.reg_pld_table0	= 0x11,
-		.reg_pld_table1	= 0x12,
-		.reg_pld_table2	= 0x13,
-		.reg_pld_table3	= 0x14,
-		.reg_pld_table4	= 0x15,
+		.reg_pld_mode	= 0x20,
+		.reg_pld_table0	= 0x22,
+		.reg_pld_table1	= 0x24,
+		.reg_pld_table2	= 0x26,
+		.reg_pld_table3	= 0x28,
+		.reg_pld_table4	= 0x2a,
 		.reg_advance	= 0xad,
 	},
 	.ngpios	= 16,
@@ -258,70 +255,6 @@ static const struct sx150x_device_data sx1503q_device_data = {
 	.npins  = 16, /* oscio not available */
 };
 
-/*
- * These utility functions solve the common problem of locating and setting
- * configuration bits.  Configuration bits are grouped into registers
- * whose indexes increase downwards.  For example, with eight-bit registers,
- * sixteen gpios would have their config bits grouped in the following order:
- * REGISTER N-1 [ f e d c b a 9 8 ]
- *          N   [ 7 6 5 4 3 2 1 0 ]
- *
- * For multi-bit configurations, the pattern gets wider:
- * REGISTER N-3 [ f f e e d d c c ]
- *          N-2 [ b b a a 9 9 8 8 ]
- *          N-1 [ 7 7 6 6 5 5 4 4 ]
- *          N   [ 3 3 2 2 1 1 0 0 ]
- *
- * Given the address of the starting register 'N', the index of the gpio
- * whose configuration we seek to change, and the width in bits of that
- * configuration, these functions allow us to locate the correct
- * register and mask the correct bits.
- */
-static inline void sx150x_find_cfg(u8 offset, u8 width,
-				   u8 *reg, u8 *mask, u8 *shift)
-{
-	*reg   -= offset * width / 8;
-	*mask   = (1 << width) - 1;
-	*shift  = (offset * width) % 8;
-	*mask <<= *shift;
-}
-
-static int sx150x_write_cfg(struct i2c_client *client,
-			    u8 offset, u8 width, u8 reg, u8 val)
-{
-	u8  mask;
-	unsigned int data;
-	u8  shift;
-	int err;
-	struct sx150x_pinctrl *pctl = i2c_get_clientdata(client);
-
-	sx150x_find_cfg(offset, width, &reg, &mask, &shift);
-	err = regmap_read(pctl->regmap, reg, &data);
-	if (err < 0)
-		return err;
-
-	data &= ~mask;
-	data |= (val << shift) & mask;
-	return regmap_write(pctl->regmap, reg, data);
-}
-
-static int sx150x_read_cfg(struct i2c_client *client,
-			   u8 offset, u8 width, u8 reg)
-{
-	u8  mask;
-	unsigned int data;
-	u8  shift;
-	int err;
-	struct sx150x_pinctrl *pctl = i2c_get_clientdata(client);
-
-	sx150x_find_cfg(offset, width, &reg, &mask, &shift);
-	err = regmap_read(pctl->regmap, reg, &data);
-	if (err < 0)
-		return err;
-
-	return (data & mask);
-}
-
 static int sx150x_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	return 0;
@@ -367,31 +300,33 @@ static int sx150x_gpio_get_direction(struct gpio_chip *chip,
 				      unsigned int offset)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
-	int status;
+	unsigned int value;
+	int ret;
 
 	if (sx150x_pin_is_oscio(pctl, offset))
 		return false;
 
-	status = sx150x_read_cfg(pctl->client, offset, 1, pctl->data->reg_dir);
-	if (status >= 0)
-		status = !!status;
+	ret = regmap_read(pctl->regmap, pctl->data->reg_dir, &value);
+	if (ret < 0)
+		return ret;
 
-	return status;
+	return !!(value & BIT(offset));
 }
 
 static int sx150x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
-	int status;
+	unsigned int value;
+	int ret;
 
 	if (sx150x_pin_is_oscio(pctl, offset))
 		return -EINVAL;
 
-	status = sx150x_read_cfg(pctl->client, offset, 1, pctl->data->reg_data);
-	if (status >= 0)
-		status = !!status;
+	ret = regmap_read(pctl->regmap, pctl->data->reg_data, &value);
+	if (ret < 0)
+		return ret;
 
-	return status;
+	return !!(value & BIT(offset));
 }
 
 static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
@@ -408,9 +343,9 @@ static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
 			return 0;
 
 		mutex_lock(&pctl->lock);
-		ret = sx150x_write_cfg(pctl->client, offset, 1,
-				       pctl->data->pri.x789.reg_drain,
-				       0);
+		ret = regmap_write_bits(pctl->regmap,
+					pctl->data->pri.x789.reg_drain,
+					BIT(offset), 0);
 		mutex_unlock(&pctl->lock);
 		if (ret < 0)
 			return ret;
@@ -422,9 +357,9 @@ static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
 			return -ENOTSUPP;
 
 		mutex_lock(&pctl->lock);
-		ret = sx150x_write_cfg(pctl->client, offset, 1,
-				       pctl->data->pri.x789.reg_drain,
-				       1);
+		ret = regmap_write_bits(pctl->regmap,
+					pctl->data->pri.x789.reg_drain,
+					BIT(offset), BIT(offset));
 		mutex_unlock(&pctl->lock);
 		if (ret < 0)
 			return ret;
@@ -437,6 +372,13 @@ static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
 	return 0;
 }
 
+static int __sx150x_gpio_set(struct sx150x_pinctrl *pctl, unsigned int offset,
+			     int value)
+{
+	return regmap_write_bits(pctl->regmap, pctl->data->reg_data,
+				 BIT(offset), value ? BIT(offset) : 0);
+}
+
 static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			       int value)
 {
@@ -450,9 +392,7 @@ static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 		mutex_unlock(&pctl->lock);
 	} else {
 		mutex_lock(&pctl->lock);
-		sx150x_write_cfg(pctl->client, offset, 1,
-				       pctl->data->reg_data,
-				       (value ? 1 : 0));
+		__sx150x_gpio_set(pctl, offset, value);
 		mutex_unlock(&pctl->lock);
 	}
 }
@@ -467,8 +407,9 @@ static int sx150x_gpio_direction_input(struct gpio_chip *chip,
 		return -EINVAL;
 
 	mutex_lock(&pctl->lock);
-	ret = sx150x_write_cfg(pctl->client, offset, 1,
-				pctl->data->reg_dir, 1);
+	ret = regmap_write_bits(pctl->regmap,
+				pctl->data->reg_dir,
+				BIT(offset), BIT(offset));
 	mutex_unlock(&pctl->lock);
 
 	return ret;
@@ -486,12 +427,11 @@ static int sx150x_gpio_direction_output(struct gpio_chip *chip,
 	}
 
 	mutex_lock(&pctl->lock);
-	status = sx150x_write_cfg(pctl->client, offset, 1,
-				  pctl->data->reg_data,
-				  (value ? 1 : 0));
+	status = __sx150x_gpio_set(pctl, offset, value);
 	if (status >= 0)
-		status = sx150x_write_cfg(pctl->client, offset, 1,
-					  pctl->data->reg_dir, 0);
+		status = regmap_write_bits(pctl->regmap,
+					   pctl->data->reg_dir,
+					   BIT(offset), 0);
 	mutex_unlock(&pctl->lock);
 
 	return status;
@@ -503,8 +443,7 @@ static void sx150x_irq_mask(struct irq_data *d)
 			gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned int n = d->hwirq;
 
-	pctl->irq.masked |= (1 << n);
-	pctl->irq.update = n;
+	pctl->irq.masked |= BIT(n);
 }
 
 static void sx150x_irq_unmask(struct irq_data *d)
@@ -513,8 +452,7 @@ static void sx150x_irq_unmask(struct irq_data *d)
 			gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned int n = d->hwirq;
 
-	pctl->irq.masked &= ~(1 << n);
-	pctl->irq.update = n;
+	pctl->irq.masked &= ~BIT(n);
 }
 
 static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
@@ -535,7 +473,6 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 
 	pctl->irq.sense &= ~(3UL << (n * 2));
 	pctl->irq.sense |= val << (n * 2);
-	pctl->irq.update = n;
 	return 0;
 }
 
@@ -547,29 +484,20 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 	unsigned int n;
 	s32 err;
 	unsigned int val;
-	int i;
 
-	for (i = (pctl->data->ngpios / 8) - 1; i >= 0; --i) {
-		err = regmap_read(pctl->regmap,
-				  pctl->data->reg_irq_src - i,
-				  &val);
-		if (err < 0)
-			continue;
+	err = regmap_read(pctl->regmap, pctl->data->reg_irq_src, &val);
+	if (err < 0)
+		return IRQ_NONE;
 
-		err = regmap_write(pctl->regmap,
-				   pctl->data->reg_irq_src - i,
-				   val);
-		if (err < 0)
-			continue;
-
-		for (n = 0; n < 8; ++n) {
-			if (val & (1 << n)) {
-				sub_irq = irq_find_mapping(
-						pctl->gpio.irqdomain,
-						(i * 8) + n);
-				handle_nested_irq(sub_irq);
-				++nhandled;
-			}
+	err = regmap_write(pctl->regmap, pctl->data->reg_irq_src, val);
+	if (err < 0)
+		return IRQ_NONE;
+
+	for (n = 0; n < pctl->data->ngpios; ++n) {
+		if (val & BIT(n)) {
+			sub_irq = irq_find_mapping(pctl->gpio.irqdomain, n);
+			handle_nested_irq(sub_irq);
+			++nhandled;
 		}
 	}
 
@@ -588,35 +516,9 @@ static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct sx150x_pinctrl *pctl =
 			gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int n;
-
-	if (pctl->irq.update < 0)
-		goto out;
 
-	n = pctl->irq.update;
-	pctl->irq.update = -1;
-
-	/* Avoid updates if nothing changed */
-	if (pctl->irq.dev_sense == pctl->irq.sense &&
-	    pctl->irq.dev_masked == pctl->irq.masked)
-		goto out;
-
-	pctl->irq.dev_sense = pctl->irq.sense;
-	pctl->irq.dev_masked = pctl->irq.masked;
-
-	if (pctl->irq.masked & (1 << n)) {
-		sx150x_write_cfg(pctl->client, n, 1,
-				 pctl->data->reg_irq_mask, 1);
-		sx150x_write_cfg(pctl->client, n, 2,
-				 pctl->data->reg_sense, 0);
-	} else {
-		sx150x_write_cfg(pctl->client, n, 1,
-				 pctl->data->reg_irq_mask, 0);
-		sx150x_write_cfg(pctl->client, n, 2,
-				 pctl->data->reg_sense,
-				 pctl->irq.sense >> (n * 2));
-	}
-out:
+	regmap_write(pctl->regmap, pctl->data->reg_irq_mask, pctl->irq.masked);
+	regmap_write(pctl->regmap, pctl->data->reg_sense, pctl->irq.sense);
 	mutex_unlock(&pctl->lock);
 }
 
@@ -627,10 +529,9 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int param = pinconf_to_config_param(*config);
 	int ret;
 	u32 arg;
+	unsigned int data;
 
 	if (sx150x_pin_is_oscio(pctl, pin)) {
-		unsigned int data;
-
 		switch (param) {
 		case PIN_CONFIG_DRIVE_PUSH_PULL:
 		case PIN_CONFIG_OUTPUT:
@@ -665,8 +566,10 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		mutex_lock(&pctl->lock);
-		ret = sx150x_read_cfg(pctl->client, pin, 1,
-				      pctl->data->reg_pulldn);
+		ret = regmap_read(pctl->regmap,
+				  pctl->data->reg_pulldn,
+				  &data);
+		data &= BIT(pin);
 		mutex_unlock(&pctl->lock);
 
 		if (ret < 0)
@@ -680,8 +583,10 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	case PIN_CONFIG_BIAS_PULL_UP:
 		mutex_lock(&pctl->lock);
-		ret = sx150x_read_cfg(pctl->client, pin, 1,
-				      pctl->data->reg_pullup);
+		ret = regmap_read(pctl->regmap,
+				  pctl->data->reg_pullup,
+				  &data);
+		data &= BIT(pin);
 		mutex_unlock(&pctl->lock);
 
 		if (ret < 0)
@@ -698,14 +603,16 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			return -ENOTSUPP;
 
 		mutex_lock(&pctl->lock);
-		ret = sx150x_read_cfg(pctl->client, pin, 1,
-				      pctl->data->pri.x789.reg_drain);
+		ret = regmap_read(pctl->regmap,
+				  pctl->data->pri.x789.reg_drain,
+				  &data);
+		data &= BIT(pin);
 		mutex_unlock(&pctl->lock);
 
 		if (ret < 0)
 			return ret;
 
-		if (!ret)
+		if (!data)
 			return -EINVAL;
 
 		arg = 1;
@@ -716,14 +623,16 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			arg = true;
 		else {
 			mutex_lock(&pctl->lock);
-			ret = sx150x_read_cfg(pctl->client, pin, 1,
-					      pctl->data->pri.x789.reg_drain);
+			ret = regmap_read(pctl->regmap,
+					  pctl->data->pri.x789.reg_drain,
+					  &data);
+			data &= BIT(pin);
 			mutex_unlock(&pctl->lock);
 
 			if (ret < 0)
 				return ret;
 
-			if (ret)
+			if (data)
 				return -EINVAL;
 
 			arg = 1;
@@ -784,15 +693,17 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
 		case PIN_CONFIG_BIAS_DISABLE:
 			mutex_lock(&pctl->lock);
-			ret = sx150x_write_cfg(pctl->client, pin, 1,
-					       pctl->data->reg_pulldn, 0);
+			ret = regmap_write_bits(pctl->regmap,
+						pctl->data->reg_pulldn,
+						BIT(pin), 0);
 			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
 
 			mutex_lock(&pctl->lock);
-			ret = sx150x_write_cfg(pctl->client, pin, 1,
-					       pctl->data->reg_pullup, 0);
+			ret = regmap_write_bits(pctl->regmap,
+						pctl->data->reg_pullup,
+						BIT(pin), 0);
 			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
@@ -801,9 +712,9 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		case PIN_CONFIG_BIAS_PULL_UP:
 			mutex_lock(&pctl->lock);
-			ret = sx150x_write_cfg(pctl->client, pin, 1,
-					       pctl->data->reg_pullup,
-					       1);
+			ret = regmap_write_bits(pctl->regmap,
+						pctl->data->reg_pullup,
+						BIT(pin), BIT(pin));
 			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
@@ -812,9 +723,9 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			mutex_lock(&pctl->lock);
-			ret = sx150x_write_cfg(pctl->client, pin, 1,
-					       pctl->data->reg_pulldn,
-					       1);
+			ret = regmap_write_bits(pctl->regmap,
+						pctl->data->reg_pulldn,
+						BIT(pin), BIT(pin));
 			mutex_unlock(&pctl->lock);
 			if (ret < 0)
 				return ret;
@@ -868,16 +779,6 @@ static const struct i2c_device_id sx150x_id[] = {
 	{}
 };
 
-static int sx150x_init_io(struct sx150x_pinctrl *pctl, u8 base, u16 cfg)
-{
-	int err = 0;
-	unsigned int n;
-
-	for (n = 0; err >= 0 && n < (pctl->data->ngpios / 8); ++n)
-		err = regmap_write(pctl->regmap, base - n, cfg >> (n * 8));
-	return err;
-}
-
 static int sx150x_reset(struct sx150x_pinctrl *pctl)
 {
 	int err;
@@ -923,11 +824,16 @@ static int sx150x_init_misc(struct sx150x_pinctrl *pctl)
 		return -EINVAL;
 	}
 
-	return i2c_smbus_write_byte_data(pctl->client, reg, value);
+	return regmap_write(pctl->regmap, reg, value);
 }
 
 static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 {
+	const u8 reg[] = {
+		[SX150X_789] = pctl->data->pri.x789.reg_polarity,
+		[SX150X_456] = pctl->data->pri.x456.reg_pld_mode,
+		[SX150X_123] = pctl->data->pri.x123.reg_pld_mode,
+	};
 	int err;
 
 	if (pctl->data->model == SX150X_789 &&
@@ -942,28 +848,165 @@ static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 		return err;
 
 	/* Set all pins to work in normal mode */
-	if (pctl->data->model == SX150X_789) {
-		err = sx150x_init_io(pctl,
-				pctl->data->pri.x789.reg_polarity,
-				0);
-		if (err < 0)
-			return err;
-	} else if (pctl->data->model == SX150X_456) {
-		/* Set all pins to work in normal mode */
-		err = sx150x_init_io(pctl,
-				pctl->data->pri.x456.reg_pld_mode,
-				0);
-		if (err < 0)
-			return err;
+	return regmap_write(pctl->regmap, reg[pctl->data->model], 0);
+}
+
+static int sx150x_regmap_reg_width(struct sx150x_pinctrl *pctl,
+				   unsigned int reg)
+{
+	const struct sx150x_device_data *data = pctl->data;
+
+	if (reg == data->reg_sense) {
+		/*
+		 * RegSense packs two bits of configuration per GPIO,
+		 * so we'd need to read twice as many bits as there
+		 * are GPIO in our chip
+		 */
+		return 2 * data->ngpios;
+	} else if ((data->model == SX150X_789 &&
+		    (reg == data->pri.x789.reg_misc ||
+		     reg == data->pri.x789.reg_clock ||
+		     reg == data->pri.x789.reg_reset))
+		   ||
+		   (data->model == SX150X_123 &&
+		    reg == data->pri.x123.reg_advance)
+		   ||
+		   (data->model == SX150X_456 &&
+		    reg == data->pri.x456.reg_advance)) {
+		return 8;
 	} else {
-		/* Set all pins to work in normal mode */
-		err = sx150x_init_io(pctl,
-				pctl->data->pri.x123.reg_pld_mode,
-				0);
-		if (err < 0)
-			return err;
+		return data->ngpios;
+	}
+}
+
+static unsigned int sx150x_maybe_swizzle(struct sx150x_pinctrl *pctl,
+					 unsigned int reg, unsigned int val)
+{
+	unsigned int a, b;
+	const struct sx150x_device_data *data = pctl->data;
+
+	/*
+	 * Whereas SX1509 presents RegSense in a simple layout as such:
+	 *	reg     [ f f e e d d c c ]
+	 *	reg + 1 [ b b a a 9 9 8 8 ]
+	 *	reg + 2 [ 7 7 6 6 5 5 4 4 ]
+	 *	reg + 3 [ 3 3 2 2 1 1 0 0 ]
+	 *
+	 * SX1503 and SX1506 deviate from that data layout, instead storing
+	 * thier contents as follows:
+	 *
+	 *	reg     [ f f e e d d c c ]
+	 *	reg + 1 [ 7 7 6 6 5 5 4 4 ]
+	 *	reg + 2 [ b b a a 9 9 8 8 ]
+	 *	reg + 3 [ 3 3 2 2 1 1 0 0 ]
+	 *
+	 * so, taking that into account, we swap two
+	 * inner bytes of a 4-byte result
+	 */
+
+	if (reg == data->reg_sense &&
+	    data->ngpios == 16 &&
+	    (data->model == SX150X_123 ||
+	     data->model == SX150X_456)) {
+		a = val & 0x00ff0000;
+		b = val & 0x0000ff00;
+
+		val &= 0xff0000ff;
+		val |= b << 8;
+		val |= a >> 8;
 	}
 
+	return val;
+}
+
+/*
+ * In order to mask the differences between 16 and 8 bit expander
+ * devices we set up a sligthly ficticious regmap that pretends to be
+ * a set of 32-bit (to accomodate RegSenseLow/RegSenseHigh
+ * pair/quartet) registers and transparently reconstructs those
+ * registers via multiple I2C/SMBus reads
+ *
+ * This way the rest of the driver code, interfacing with the chip via
+ * regmap API, can work assuming that each GPIO pin is represented by
+ * a group of bits at an offset proportioan to GPIO number within a
+ * given register.
+ *
+ */
+static int sx150x_regmap_reg_read(void *context, unsigned int reg,
+				  unsigned int *result)
+{
+	int ret, n;
+	struct sx150x_pinctrl *pctl = context;
+	struct i2c_client *i2c = pctl->client;
+	const int width = sx150x_regmap_reg_width(pctl, reg);
+	unsigned int idx, val;
+
+	/*
+	 * There are four potential cases coverd by this function:
+	 *
+	 * 1) 8-pin chip, single configuration bit register
+	 *
+	 *	This is trivial the code below just needs to read:
+	 *		reg  [ 7 6 5 4 3 2 1 0 ]
+	 *
+	 * 2) 8-pin chip, double configuration bit register (RegSense)
+	 *
+	 *	The read will be done as follows:
+	 *		reg      [ 7 7 6 6 5 5 4 4 ]
+	 *		reg + 1  [ 3 3 2 2 1 1 0 0 ]
+	 *
+	 * 3) 16-pin chip, single configuration bit register
+	 *
+	 *	The read will be done as follows:
+	 *		reg     [ f e d c b a 9 8 ]
+	 *		reg + 1 [ 7 6 5 4 3 2 1 0 ]
+	 *
+	 * 4) 16-pin chip, double configuration bit register (RegSense)
+	 *
+	 *	The read will be done as follows:
+	 *		reg     [ f f e e d d c c ]
+	 *		reg + 1 [ b b a a 9 9 8 8 ]
+	 *		reg + 2 [ 7 7 6 6 5 5 4 4 ]
+	 *		reg + 3 [ 3 3 2 2 1 1 0 0 ]
+	 */
+
+	for (n = width, val = 0, idx = reg; n > 0; n -= 8, idx++) {
+		val <<= 8;
+
+		ret = i2c_smbus_read_byte_data(i2c, idx);
+		if (ret < 0)
+			return ret;
+
+		val |= ret;
+	}
+
+	*result = sx150x_maybe_swizzle(pctl, reg, val);
+
+	return 0;
+}
+
+static int sx150x_regmap_reg_write(void *context, unsigned int reg,
+				   unsigned int val)
+{
+	int ret, n;
+	struct sx150x_pinctrl *pctl = context;
+	struct i2c_client *i2c = pctl->client;
+	const int width = sx150x_regmap_reg_width(pctl, reg);
+
+	val = sx150x_maybe_swizzle(pctl, reg, val);
+
+	n = width - 8;
+	do {
+		const u8 byte = (val >> n) & 0xff;
+
+		ret = i2c_smbus_write_byte_data(i2c, reg, byte);
+		if (ret < 0)
+			return ret;
+
+		reg++;
+		n -= 8;
+	} while (n >= 0);
+
 	return 0;
 }
 
@@ -971,18 +1014,18 @@ static bool sx150x_reg_volatile(struct device *dev, unsigned int reg)
 {
 	struct sx150x_pinctrl *pctl = i2c_get_clientdata(to_i2c_client(dev));
 
-	return reg == pctl->data->reg_irq_src     ||
-	       reg == pctl->data->reg_irq_src - 1 ||
-	       reg == pctl->data->reg_data        ||
-	       reg == pctl->data->reg_data - 1;
+	return reg == pctl->data->reg_irq_src || reg == pctl->data->reg_data;
 }
 
 const struct regmap_config sx150x_regmap_config = {
 	.reg_bits = 8,
-	.val_bits = 8,
+	.val_bits = 32,
 
 	.cache_type = REGCACHE_RBTREE,
 
+	.reg_read = sx150x_regmap_reg_read,
+	.reg_write = sx150x_regmap_reg_write,
+
 	.max_register = SX150X_MAX_REGISTER,
 	.volatile_reg = sx150x_reg_volatile,
 };
@@ -1012,7 +1055,8 @@ static int sx150x_probe(struct i2c_client *client,
 	pctl->client = client;
 	pctl->data = (void *)id->driver_data;
 
-	pctl->regmap = devm_regmap_init_i2c(client, &sx150x_regmap_config);
+	pctl->regmap = devm_regmap_init(dev, NULL, pctl,
+					&sx150x_regmap_config);
 	if (IS_ERR(pctl->regmap)) {
 		ret = PTR_ERR(pctl->regmap);
 		dev_err(dev, "Failed to allocate register map: %d\n",
@@ -1058,9 +1102,6 @@ static int sx150x_probe(struct i2c_client *client,
 
 		pctl->irq.masked = ~0;
 		pctl->irq.sense = 0;
-		pctl->irq.dev_masked = ~0;
-		pctl->irq.dev_sense = 0;
-		pctl->irq.update = -1;
 
 		ret = gpiochip_irqchip_add(&pctl->gpio,
 					   &pctl->irq_chip, 0,
-- 
2.5.5

