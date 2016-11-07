From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 08/15] pinctrl-sx150x: Convert driver to use regmap API
Date: Mon,  7 Nov 2016 08:53:16 -0800
Message-ID: <1478537603-23653-9-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

To allow for future code simplification

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/Kconfig          |   1 +
 drivers/pinctrl/pinctrl-sx150x.c | 102 +++++++++++++++++++++------------------
 2 files changed, 57 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 801fa8b..666e952 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -171,6 +171,7 @@ config PINCTRL_SX150X
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
+	select REGMAP
 	help
 	  Say yes here to provide support for Semtech SX150x-series I2C
 	  GPIO expanders as pinctrl module.
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index d51ec73..2eb233f 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -18,6 +18,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/regmap.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -45,6 +46,7 @@ enum {
 };
 enum {
 	SX150X_789_REG_MISC_AUTOCLEAR_OFF = 1 << 0,
+	SX150X_MAX_REGISTER = 0xad,
 };
 
 struct sx150x_123_pri {
@@ -102,6 +104,7 @@ struct sx150x_pinctrl {
 	struct pinctrl_desc pinctrl_desc;
 	struct gpio_chip gpio;
 	struct irq_chip irq_chip;
+	struct regmap *regmap;
 	struct {
 		int update;
 		u32 sense;
@@ -256,30 +259,6 @@ static const struct sx150x_device_data sx1503q_device_data = {
 	.npins  = 16, /* oscio not available */
 };
 
-static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
-{
-	s32 err = i2c_smbus_write_byte_data(client, reg, val);
-
-	if (err < 0)
-		dev_warn(&client->dev,
-			"i2c write fail: can't write %02x to %02x: %d\n",
-			val, reg, err);
-	return err;
-}
-
-static s32 sx150x_i2c_read(struct i2c_client *client, u8 reg, u8 *val)
-{
-	s32 err = i2c_smbus_read_byte_data(client, reg);
-
-	if (err >= 0)
-		*val = err;
-	else
-		dev_warn(&client->dev,
-			"i2c read fail: can't read from %02x: %d\n",
-			reg, err);
-	return err;
-}
-
 /*
  * These utility functions solve the common problem of locating and setting
  * configuration bits.  Configuration bits are grouped into registers
@@ -312,30 +291,32 @@ static int sx150x_write_cfg(struct i2c_client *client,
 			    u8 offset, u8 width, u8 reg, u8 val)
 {
 	u8  mask;
-	u8  data;
+	unsigned int data;
 	u8  shift;
 	int err;
+	struct sx150x_pinctrl *pctl = i2c_get_clientdata(client);
 
 	sx150x_find_cfg(offset, width, &reg, &mask, &shift);
-	err = sx150x_i2c_read(client, reg, &data);
+	err = regmap_read(pctl->regmap, reg, &data);
 	if (err < 0)
 		return err;
 
 	data &= ~mask;
 	data |= (val << shift) & mask;
-	return sx150x_i2c_write(client, reg, data);
+	return regmap_write(pctl->regmap, reg, data);
 }
 
 static int sx150x_read_cfg(struct i2c_client *client,
 			   u8 offset, u8 width, u8 reg)
 {
 	u8  mask;
-	u8  data;
+	unsigned int data;
 	u8  shift;
 	int err;
+	struct sx150x_pinctrl *pctl = i2c_get_clientdata(client);
 
 	sx150x_find_cfg(offset, width, &reg, &mask, &shift);
-	err = sx150x_i2c_read(client, reg, &data);
+	err = regmap_read(pctl->regmap, reg, &data);
 	if (err < 0)
 		return err;
 
@@ -463,11 +444,10 @@ static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 
 	if (sx150x_pin_is_oscio(pctl, offset)) {
-
 		mutex_lock(&pctl->lock);
-		sx150x_i2c_write(pctl->client,
-				       pctl->data->pri.x789.reg_clock,
-				       (value ? 0x1f : 0x10));
+		regmap_write(pctl->regmap,
+			     pctl->data->pri.x789.reg_clock,
+			     (value ? 0x1f : 0x10));
 		mutex_unlock(&pctl->lock);
 	} else {
 		mutex_lock(&pctl->lock);
@@ -567,19 +547,19 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 	unsigned int sub_irq;
 	unsigned int n;
 	s32 err;
-	u8 val;
+	unsigned int val;
 	int i;
 
 	for (i = (pctl->data->ngpios / 8) - 1; i >= 0; --i) {
-		err = sx150x_i2c_read(pctl->client,
-				      pctl->data->reg_irq_src - i,
-				      &val);
+		err = regmap_read(pctl->regmap,
+				  pctl->data->reg_irq_src - i,
+				  &val);
 		if (err < 0)
 			continue;
 
-		err = sx150x_i2c_write(pctl->client,
-				       pctl->data->reg_irq_src - i,
-				       val);
+		err = regmap_write(pctl->regmap,
+				   pctl->data->reg_irq_src - i,
+				   val);
 		if (err < 0)
 			continue;
 
@@ -650,15 +630,15 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	u32 arg;
 
 	if (sx150x_pin_is_oscio(pctl, pin)) {
-		u8 data;
+		unsigned int data;
 
 		switch (param) {
 		case PIN_CONFIG_DRIVE_PUSH_PULL:
 		case PIN_CONFIG_OUTPUT:
 			mutex_lock(&pctl->lock);
-			ret = sx150x_i2c_read(pctl->client,
-					pctl->data->pri.x789.reg_clock,
-					&data);
+			ret = regmap_read(pctl->regmap,
+					  pctl->data->pri.x789.reg_clock,
+					  &data);
 			mutex_unlock(&pctl->lock);
 
 			if (ret < 0)
@@ -904,7 +884,7 @@ static int sx150x_init_io(struct sx150x_pinctrl *pctl, u8 base, u16 cfg)
 	unsigned int n;
 
 	for (n = 0; err >= 0 && n < (pctl->data->ngpios / 8); ++n)
-		err = sx150x_i2c_write(pctl->client, base - n, cfg >> (n * 8));
+		err = regmap_write(pctl->regmap, base - n, cfg >> (n * 8));
 	return err;
 }
 
@@ -953,7 +933,7 @@ static int sx150x_init_misc(struct sx150x_pinctrl *pctl)
 		return -EINVAL;
 	}
 
-	return sx150x_i2c_write(pctl->client, reg, value);
+	return i2c_smbus_write_byte_data(pctl->client, reg, value);
 }
 
 static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
@@ -997,6 +977,26 @@ static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 	return 0;
 }
 
+static bool sx150x_reg_volatile(struct device *dev, unsigned int reg)
+{
+	struct sx150x_pinctrl *pctl = i2c_get_clientdata(to_i2c_client(dev));
+
+	return reg == pctl->data->reg_irq_src     ||
+	       reg == pctl->data->reg_irq_src - 1 ||
+	       reg == pctl->data->reg_data        ||
+	       reg == pctl->data->reg_data - 1;
+}
+
+const struct regmap_config sx150x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.cache_type = REGCACHE_RBTREE,
+
+	.max_register = SX150X_MAX_REGISTER,
+	.volatile_reg = sx150x_reg_volatile,
+};
+
 static int sx150x_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -1013,6 +1013,8 @@ static int sx150x_probe(struct i2c_client *client,
 	if (!pctl)
 		return -ENOMEM;
 
+	i2c_set_clientdata(client, pctl);
+
 	pctl->dev = dev;
 	pctl->client = client;
 
@@ -1024,6 +1026,14 @@ static int sx150x_probe(struct i2c_client *client,
 	if (!pctl->data)
 		return -EINVAL;
 
+	pctl->regmap = devm_regmap_init_i2c(client, &sx150x_regmap_config);
+	if (IS_ERR(pctl->regmap)) {
+		ret = PTR_ERR(pctl->regmap);
+		dev_err(dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
 	mutex_init(&pctl->lock);
 
 	ret = sx150x_init_hw(pctl);
-- 
2.5.5
