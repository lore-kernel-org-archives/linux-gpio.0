From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 2/3] pinctrl: lpc18xx: add nxp,gpio-pin-interrupt property
Date: Sat, 20 Feb 2016 23:51:55 +0100
Message-ID: <1456008716-6236-3-git-send-email-manabian@gmail.com>
References: <1456008716-6236-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36291 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759616AbcBTWwT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2016 17:52:19 -0500
Received: by mail-lf0-f49.google.com with SMTP id 78so73942415lfy.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2016 14:52:19 -0800 (PST)
In-Reply-To: <1456008716-6236-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

Add support for setting up GPIO pin interrupts in the lpc18xx pinctrl
driver. The LPC18xx SCU contain two registers that sets up the signal
routing to the GPIO pin interrupt (PINT) block. The routing uses the
GPIO namespace and not the pin namespace so a lookup is preformed on
the pin.

Routing configuration is done in the device tree by using the new
nxp,gpio-pin-interrupt property. This property takes single parameter
which sets the PINT hwirq for the GPIO.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/pinctrl/pinctrl-lpc18xx.c | 144 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 138 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index f0bebbe0682b..c95af68d5925 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -49,6 +49,19 @@
 
 #define LPC18XX_SCU_FUNC_PER_PIN	8
 
+/* LPC18XX SCU pin interrupt select registers */
+#define LPC18XX_SCU_PINTSEL0		0xe00
+#define LPC18XX_SCU_PINTSEL1		0xe04
+#define LPC18XX_SCU_PINTSEL_VAL_MASK	0xff
+#define LPC18XX_SCU_PINTSEL_PORT_SHIFT	5
+#define LPC18XX_SCU_IRQ_PER_PINTSEL	4
+#define LPC18XX_GPIO_PINS_PER_PORT	32
+#define LPC18XX_GPIO_PIN_INT_MAX	8
+
+#define LPC18XX_SCU_PINTSEL_VAL(val, n) \
+	((val) << (((n) % LPC18XX_SCU_IRQ_PER_PINTSEL) * 8))
+
+
 /* LPC18xx pin types */
 enum {
 	TYPE_ND,	/* Normal-drive */
@@ -618,6 +631,25 @@ static const struct pinctrl_pin_desc lpc18xx_pins[] = {
 	LPC18XX_PIN(i2c0_sda, PIN_I2C0_SDA),
 };
 
+/**
+ * enum lpc18xx_pin_config_param - possible pin configuration parameters
+ * @PIN_CONFIG_GPIO_PIN_INT: route gpio to the gpio pin interrupt
+ * 	controller.
+ */
+enum lpc18xx_pin_config_param {
+	PIN_CONFIG_GPIO_PIN_INT = PIN_CONFIG_END + 1,
+};
+
+static const struct pinconf_generic_params lpc18xx_params[] = {
+	{"nxp,gpio-pin-interrupt", PIN_CONFIG_GPIO_PIN_INT, 0},
+};
+
+#ifdef CONFIG_DEBUG_FS
+static const struct pin_config_item lpc18xx_conf_items[ARRAY_SIZE(lpc18xx_params)] = {
+	PCONFDUMP(PIN_CONFIG_GPIO_PIN_INT, "gpio pin int", NULL, true),
+};
+#endif
+
 static int lpc18xx_pconf_get_usb1(enum pin_config_param param, int *arg, u32 reg)
 {
 	switch (param) {
@@ -693,7 +725,71 @@ static int lpc18xx_pconf_get_i2c0(enum pin_config_param param, int *arg, u32 reg
 	return 0;
 }
 
-static int lpc18xx_pconf_get_pin(enum pin_config_param param, int *arg, u32 reg,
+static int lpc18xx_pin_to_gpio(struct pinctrl_dev *pctldev, unsigned pin)
+{
+	struct pinctrl_gpio_range *range;
+
+	range = __pinctrl_find_gpio_range_from_pin(pctldev, pin);
+	if (!range)
+		return -EINVAL;
+
+	return pin - range->pin_base + range->base;
+}
+
+static int lpc18xx_get_pintsel(void __iomem *addr, u32 val, int *arg)
+{
+	u32 reg_val;
+	int i;
+
+	reg_val = readl(addr);
+	for (i = 0; i < LPC18XX_SCU_IRQ_PER_PINTSEL; i++) {
+		if ((reg_val & LPC18XX_SCU_PINTSEL_VAL_MASK) == val)
+			return 0;
+
+		reg_val >>= BITS_PER_BYTE;
+		*arg += 1;
+	}
+
+	return -EINVAL;
+}
+
+static u32 lpc18xx_gpio_to_pintsel_val(int gpio)
+{
+	unsigned int gpio_port, gpio_pin;
+
+	gpio_port = gpio / LPC18XX_GPIO_PINS_PER_PORT;
+	gpio_pin  = gpio % LPC18XX_GPIO_PINS_PER_PORT;
+
+	return gpio_pin | (gpio_port << LPC18XX_SCU_PINTSEL_PORT_SHIFT);
+}
+
+static int lpc18xx_pconf_get_gpio_pin_int(struct pinctrl_dev *pctldev,
+					  int *arg, unsigned pin)
+{
+	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
+	int gpio, ret;
+	u32 val;
+
+	gpio = lpc18xx_pin_to_gpio(pctldev, pin);
+	if (gpio < 0)
+		return -ENOTSUPP;
+
+	val = lpc18xx_gpio_to_pintsel_val(gpio);
+
+	/*
+	 * Check if this pin has been enabled as a interrupt in any of the two
+	 * PINTSEL registers. *arg indicates which interrupt number (0-7).
+	 */
+	*arg = 0;
+	ret = lpc18xx_get_pintsel(scu->base + LPC18XX_SCU_PINTSEL0, val, arg);
+	if (ret == 0)
+		return ret;
+
+	return lpc18xx_get_pintsel(scu->base + LPC18XX_SCU_PINTSEL1, val, arg);
+}
+
+static int lpc18xx_pconf_get_pin(struct pinctrl_dev *pctldev, unsigned param,
+				 int *arg, u32 reg, unsigned pin,
 				 struct lpc18xx_pin_caps *pin_cap)
 {
 	switch (param) {
@@ -755,6 +851,9 @@ static int lpc18xx_pconf_get_pin(enum pin_config_param param, int *arg, u32 reg,
 		}
 		break;
 
+	case PIN_CONFIG_GPIO_PIN_INT:
+		return lpc18xx_pconf_get_gpio_pin_int(pctldev, arg, pin);
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -794,7 +893,7 @@ static int lpc18xx_pconf_get(struct pinctrl_dev *pctldev, unsigned pin,
 	else if (pin_cap->type == TYPE_USB1)
 		ret = lpc18xx_pconf_get_usb1(param, &arg, reg);
 	else
-		ret = lpc18xx_pconf_get_pin(param, &arg, reg, pin_cap);
+		ret = lpc18xx_pconf_get_pin(pctldev, param, &arg, reg, pin, pin_cap);
 
 	if (ret < 0)
 		return ret;
@@ -883,9 +982,34 @@ static int lpc18xx_pconf_set_i2c0(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int lpc18xx_pconf_set_pin(struct pinctrl_dev *pctldev,
-				 enum pin_config_param param,
-				 u16 param_val, u32 *reg,
+static int lpc18xx_pconf_set_gpio_pin_int(struct pinctrl_dev *pctldev,
+					  u16 param_val, unsigned pin)
+{
+	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
+	u32 val, reg_val, reg_offset = LPC18XX_SCU_PINTSEL0;
+	int gpio;
+
+	if (param_val >= LPC18XX_GPIO_PIN_INT_MAX)
+		return -EINVAL;
+
+	gpio = lpc18xx_pin_to_gpio(pctldev, pin);
+	if (gpio < 0)
+		return -ENOTSUPP;
+
+	val = lpc18xx_gpio_to_pintsel_val(gpio);
+
+	reg_offset += (param_val / LPC18XX_SCU_IRQ_PER_PINTSEL) * sizeof(u32);
+
+	reg_val = readl(scu->base + reg_offset);
+	reg_val &= ~LPC18XX_SCU_PINTSEL_VAL(LPC18XX_SCU_PINTSEL_VAL_MASK, param_val);
+	reg_val |= LPC18XX_SCU_PINTSEL_VAL(val, param_val);
+	writel(reg_val, scu->base + reg_offset);
+
+	return 0;
+}
+
+static int lpc18xx_pconf_set_pin(struct pinctrl_dev *pctldev, unsigned param,
+				 u16 param_val, u32 *reg, unsigned pin,
 				 struct lpc18xx_pin_caps *pin_cap)
 {
 	switch (param) {
@@ -948,6 +1072,9 @@ static int lpc18xx_pconf_set_pin(struct pinctrl_dev *pctldev,
 		*reg |= param_val << LPC18XX_SCU_PIN_EHD_POS;
 		break;
 
+	case PIN_CONFIG_GPIO_PIN_INT:
+		return lpc18xx_pconf_set_gpio_pin_int(pctldev, param_val, pin);
+
 	default:
 		dev_err(pctldev->dev, "Property not supported\n");
 		return -ENOTSUPP;
@@ -982,7 +1109,7 @@ static int lpc18xx_pconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 		else if (pin_cap->type == TYPE_USB1)
 			ret = lpc18xx_pconf_set_usb1(pctldev, param, param_val, &reg);
 		else
-			ret = lpc18xx_pconf_set_pin(pctldev, param, param_val, &reg, pin_cap);
+			ret = lpc18xx_pconf_set_pin(pctldev, param, param_val, &reg, pin, pin_cap);
 
 		if (ret)
 			return ret;
@@ -1136,6 +1263,11 @@ static struct pinctrl_desc lpc18xx_scu_desc = {
 	.pctlops = &lpc18xx_pctl_ops,
 	.pmxops = &lpc18xx_pmx_ops,
 	.confops = &lpc18xx_pconf_ops,
+	.num_custom_params = ARRAY_SIZE(lpc18xx_params),
+	.custom_params = lpc18xx_params,
+#ifdef CONFIG_DEBUG_FS
+	.custom_conf_items = lpc18xx_conf_items,
+#endif
 	.owner = THIS_MODULE,
 };
 
-- 
1.8.0

