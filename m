From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/2] gpio: mcp23s08: add pinconf support
Date: Fri, 27 Jan 2017 15:47:38 +0100
Message-ID: <20170127144738.21107-3-sre@kernel.org>
References: <20170127144738.21107-1-sre@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170127144738.21107-1-sre@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

mcp23xxx device have configurable 100k pullup resistors. This adds
support for enabling them using pinctrl's pinconf interface.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpio/gpio-mcp23s08.c | 200 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 176 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index bdb692345428..96abecaccc12 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -24,6 +24,10 @@
 #include <linux/of_irq.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
 
 /**
  * MCP types supported by driver
@@ -77,6 +81,9 @@ struct mcp23s08 {
 
 	struct regmap		*regmap;
 	struct device		*dev;
+
+	struct pinctrl_dev	*pctldev;
+	struct pinctrl_desc	pinctrl_desc;
 };
 
 static const struct regmap_config mcp23x08_regmap = {
@@ -96,6 +103,158 @@ static const struct regmap_config mcp23x17_regmap = {
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
+static int mcp_read(struct mcp23s08 *mcp, unsigned int reg, unsigned int *val)
+{
+	return regmap_read(mcp->regmap, reg << mcp->reg_shift, val);
+}
+
+static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned int val)
+{
+	return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
+}
+
+static int mcp_set_bit(struct mcp23s08 *mcp, unsigned int reg,
+		       unsigned int pin, bool enabled)
+{
+	u16 val  = enabled ? 0xffff : 0x0000;
+	u16 mask = BIT(pin);
+	return regmap_update_bits(mcp->regmap, reg << mcp->reg_shift,
+				  mask, val);
+}
+
+static int mcp_update_cache(struct mcp23s08 *mcp)
+{
+	int ret, reg, i;
+
+	for (i = 0; i < ARRAY_SIZE(mcp->cache); i++) {
+		ret = mcp_read(mcp, i, &reg);
+		if (ret < 0)
+			return ret;
+		mcp->cache[i] = reg;
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_pin_desc mcp23x08_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+};
+
+static const struct pinctrl_pin_desc mcp23x17_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+};
+
+static int mcp_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return 0;
+}
+
+static const char *mcp_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						unsigned int group)
+{
+	return NULL;
+}
+
+static int mcp_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					unsigned int group,
+					const unsigned int **pins,
+					unsigned int *num_pins)
+{
+	return -ENOTSUPP;
+}
+
+static const struct pinctrl_ops mcp_pinctrl_ops = {
+	.get_groups_count = mcp_pinctrl_get_groups_count,
+	.get_group_name = mcp_pinctrl_get_group_name,
+	.get_group_pins = mcp_pinctrl_get_group_pins,
+#ifdef CONFIG_OF
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinconf_generic_dt_free_map,
+#endif
+};
+
+static int mcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			      unsigned long *config)
+{
+	struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int data, status;
+	int ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		ret = mcp_read(mcp, MCP_GPPU, &data);
+		if (ret < 0)
+			return ret;
+		status = (data & BIT(pin)) ? 1 : 0;
+		break;
+	default:
+		dev_err(mcp->dev, "Invalid config param %04x\n", param);
+		return -ENOTSUPP;
+	}
+
+	*config = 0;
+
+	return status ? 0 : -EINVAL;
+}
+
+static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			      unsigned long *configs, unsigned int num_configs)
+{
+	struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param;
+	u32 arg, mask;
+	u16 val;
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			val = arg ? 0xFFFF : 0x0000;
+			mask = BIT(pin);
+			ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
+			break;
+		default:
+			dev_err(mcp->dev, "Invalid config param %04x\n", param);
+			return -ENOTSUPP;
+		}
+	}
+
+	return ret;
+}
+
+static const struct pinconf_ops mcp_pinconf_ops = {
+	.pin_config_get = mcp_pinconf_get,
+	.pin_config_set = mcp_pinconf_set,
+	.is_generic = true,
+};
+
 /*----------------------------------------------------------------------*/
 
 #ifdef CONFIG_SPI_MASTER
@@ -158,30 +317,6 @@ static const struct regmap_bus mcp23sxx_spi_regmap = {
 
 #endif /* CONFIG_SPI_MASTER */
 
-static int mcp_read(struct mcp23s08 *mcp, unsigned int reg, unsigned int *val)
-{
-	return regmap_read(mcp->regmap, reg << mcp->reg_shift, val);
-}
-
-static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned int val)
-{
-	return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
-}
-
-static int mcp_update_cache(struct mcp23s08 *mcp)
-{
-	int ret, reg, i;
-
-	for (i = 0; i < ARRAY_SIZE(mcp->cache); i++) {
-		ret = mcp_read(mcp, i, &reg);
-		if (ret < 0)
-			return ret;
-		mcp->cache[i] = reg;
-	}
-
-	return 0;
-}
-
 /*----------------------------------------------------------------------*/
 
 /* A given spi_device can represent up to eight mcp23sxx chips
@@ -627,6 +762,23 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		if (ret)
 			goto fail;
 	}
+
+	mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
+	mcp->pinctrl_desc.pctlops = &mcp_pinctrl_ops;
+	mcp->pinctrl_desc.confops = &mcp_pinconf_ops;
+	mcp->pinctrl_desc.npins = mcp->chip.ngpio;
+	if (mcp->pinctrl_desc.npins == 8)
+		mcp->pinctrl_desc.pins = mcp23x08_pins;
+	else if (mcp->pinctrl_desc.npins == 16)
+		mcp->pinctrl_desc.pins = mcp23x17_pins;
+	mcp->pinctrl_desc.owner = THIS_MODULE;
+
+	mcp->pctldev = pinctrl_register(&mcp->pinctrl_desc, dev, mcp);
+	if (IS_ERR(mcp->pctldev)) {
+		ret = PTR_ERR(mcp->pctldev);
+		goto fail;
+	}
+
 fail:
 	if (ret < 0)
 		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
-- 
2.11.0
