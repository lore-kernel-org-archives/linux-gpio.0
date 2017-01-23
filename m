From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/3] pinctrl: Widen the generic pinconf argument from 16 to 24 bits
Date: Mon, 23 Jan 2017 15:34:32 +0300
Message-ID: <20170123123434.61972-2-mika.westerberg@linux.intel.com>
References: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The current pinconf packed format allows only 16-bit argument limiting
the maximum value 65535. For most types this is enough. However,
debounce time can be in range of hundreths of milliseconds in case of
mechanical switches so we cannot represent the worst case using the
current format.

In order to support larger values change the packed format so that the
lower 8 bits are used as type which leaves 24 bits for the argument.
This allows representing values up to 16777215 and debounce times up to
16 seconds.

We also convert the existing users to use 32-bit integer when extracting
argument from the packed configuration value.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c           |  6 +++---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c         |  2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c            |  6 +++---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c           |  6 +++---
 drivers/pinctrl/intel/pinctrl-cherryview.c       |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson.c            |  2 --
 drivers/pinctrl/pinctrl-da850-pupd.c             |  2 --
 drivers/pinctrl/pinctrl-lpc18xx.c                | 10 +++++-----
 drivers/pinctrl/pinctrl-max77620.c               |  2 +-
 drivers/pinctrl/pinctrl-palmas.c                 |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c               |  2 +-
 drivers/pinctrl/pinctrl-single.c                 |  2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c            |  3 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c            |  2 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c |  4 ++--
 drivers/pinctrl/vt8500/pinctrl-wmt.c             |  2 +-
 drivers/rtc/rtc-omap.c                           |  2 +-
 include/linux/pinctrl/pinconf-generic.h          | 19 +++++++++++--------
 18 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index a5331fdfc795..810a81786f62 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1106,7 +1106,7 @@ static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	int i;
 	enum pin_config_param param;
-	u16 arg;
+	u32 arg;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
@@ -1222,7 +1222,7 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	int i, j;
 	enum pin_config_param param;
-	u16 arg;
+	u32 arg;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
@@ -1292,7 +1292,7 @@ static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	int i;
 	enum pin_config_param param;
-	u16 arg;
+	u32 arg;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 5d1e505c3c63..3ca925dfefd1 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -619,7 +619,7 @@ static int iproc_pin_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 {
 	struct iproc_gpio *chip = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
-	u16 arg;
+	u32 arg;
 	unsigned i, gpio = iproc_pin_to_gpio(pin);
 	int ret = -ENOTSUPP;
 
diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 13a4c2774157..4b5cf0e0f16e 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -703,7 +703,7 @@ static int ns2_pin_get_enable(struct pinctrl_dev *pctrldev, unsigned int pin)
 }
 
 static int ns2_pin_set_slew(struct pinctrl_dev *pctrldev, unsigned int pin,
-			    u16 slew)
+			    u32 slew)
 {
 	struct ns2_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrldev);
 	struct ns2_pin *pin_data = pctrldev->desc->pins[pin].drv_data;
@@ -793,7 +793,7 @@ static void ns2_pin_get_pull(struct pinctrl_dev *pctrldev,
 }
 
 static int ns2_pin_set_strength(struct pinctrl_dev *pctrldev, unsigned int pin,
-				u16 strength)
+				u32 strength)
 {
 	struct ns2_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrldev);
 	struct ns2_pin *pin_data = pctrldev->desc->pins[pin].drv_data;
@@ -904,7 +904,7 @@ static int ns2_pin_config_set(struct pinctrl_dev *pctrldev, unsigned int pin,
 	struct ns2_pin *pin_data = pctrldev->desc->pins[pin].drv_data;
 	enum pin_config_param param;
 	unsigned int i;
-	u16 arg;
+	u32 arg;
 	int ret = -ENOTSUPP;
 
 	if (pin_data->pin_conf.base == -1)
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index c8deb8be1da7..91ea32dc1e7f 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -366,7 +366,7 @@ static const struct pinctrl_ops nsp_pctrl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 };
 
-static int nsp_gpio_set_slew(struct nsp_gpio *chip, unsigned gpio, u16 slew)
+static int nsp_gpio_set_slew(struct nsp_gpio *chip, unsigned gpio, u32 slew)
 {
 	if (slew)
 		nsp_set_bit(chip, IO_CTRL, NSP_GPIO_SLEW_RATE_EN, gpio, true);
@@ -403,7 +403,7 @@ static void nsp_gpio_get_pull(struct nsp_gpio *chip, unsigned gpio,
 }
 
 static int nsp_gpio_set_strength(struct nsp_gpio *chip, unsigned gpio,
-				 u16 strength)
+				 u32 strength)
 {
 	u32 offset, shift, i;
 	u32 val;
@@ -522,7 +522,7 @@ static int nsp_pin_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 {
 	struct nsp_gpio *chip = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
-	u16 arg;
+	u32 arg;
 	unsigned int i, gpio;
 	int ret = -ENOTSUPP;
 
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 5e66860a5e67..f80134e3e0b6 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1059,7 +1059,7 @@ static int chv_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 }
 
 static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
-			       enum pin_config_param param, u16 arg)
+			       enum pin_config_param param, u32 arg)
 {
 	void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL0);
 	unsigned long flags;
@@ -1151,7 +1151,7 @@ static int chv_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
 	int i, ret;
-	u16 arg;
+	u32 arg;
 
 	if (chv_pad_locked(pctrl, pin))
 		return -EBUSY;
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 620c231a2889..cf1686e04378 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -260,7 +260,6 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 	enum pin_config_param param;
 	unsigned int reg, bit;
 	int i, ret;
-	u16 arg;
 
 	ret = meson_get_bank(pc, pin, &bank);
 	if (ret)
@@ -268,7 +267,6 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
diff --git a/drivers/pinctrl/pinctrl-da850-pupd.c b/drivers/pinctrl/pinctrl-da850-pupd.c
index b36a90a3f3e4..44d5f5f5b07f 100644
--- a/drivers/pinctrl/pinctrl-da850-pupd.c
+++ b/drivers/pinctrl/pinctrl-da850-pupd.c
@@ -113,7 +113,6 @@ static int da850_pupd_pin_config_group_set(struct pinctrl_dev *pctldev,
 	struct da850_pupd_data *data = pinctrl_dev_get_drvdata(pctldev);
 	u32 ena, sel;
 	enum pin_config_param param;
-	u16 arg;
 	int i;
 
 	ena = readl(data->base + DA850_PUPD_ENA);
@@ -121,7 +120,6 @@ static int da850_pupd_pin_config_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index e053f1fa5512..d090f37ca4a1 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -904,7 +904,7 @@ static int lpc18xx_pconf_get(struct pinctrl_dev *pctldev, unsigned pin,
 
 static int lpc18xx_pconf_set_usb1(struct pinctrl_dev *pctldev,
 				  enum pin_config_param param,
-				  u16 param_val, u32 *reg)
+				  u32 param_val, u32 *reg)
 {
 	switch (param) {
 	case PIN_CONFIG_LOW_POWER_MODE:
@@ -932,7 +932,7 @@ static int lpc18xx_pconf_set_usb1(struct pinctrl_dev *pctldev,
 
 static int lpc18xx_pconf_set_i2c0(struct pinctrl_dev *pctldev,
 				  enum pin_config_param param,
-				  u16 param_val, u32 *reg,
+				  u32 param_val, u32 *reg,
 				  unsigned pin)
 {
 	u8 shift;
@@ -982,7 +982,7 @@ static int lpc18xx_pconf_set_i2c0(struct pinctrl_dev *pctldev,
 }
 
 static int lpc18xx_pconf_set_gpio_pin_int(struct pinctrl_dev *pctldev,
-					  u16 param_val, unsigned pin)
+					  u32 param_val, unsigned pin)
 {
 	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
 	u32 val, reg_val, reg_offset = LPC18XX_SCU_PINTSEL0;
@@ -1008,7 +1008,7 @@ static int lpc18xx_pconf_set_gpio_pin_int(struct pinctrl_dev *pctldev,
 }
 
 static int lpc18xx_pconf_set_pin(struct pinctrl_dev *pctldev, unsigned param,
-				 u16 param_val, u32 *reg, unsigned pin,
+				 u32 param_val, u32 *reg, unsigned pin,
 				 struct lpc18xx_pin_caps *pin_cap)
 {
 	switch (param) {
@@ -1088,7 +1088,7 @@ static int lpc18xx_pconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
 	struct lpc18xx_pin_caps *pin_cap;
 	enum pin_config_param param;
-	u16 param_val;
+	u32 param_val;
 	u32 reg;
 	int ret;
 	int i;
diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index d9ff53e8f715..b8d2180a2bea 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -402,7 +402,7 @@ static int max77620_pinconf_set(struct pinctrl_dev *pctldev,
 	struct device *dev = mpci->dev;
 	struct max77620_fps_config *fps_config;
 	int param;
-	u16 param_val;
+	u32 param_val;
 	unsigned int val;
 	unsigned int pu_val;
 	unsigned int pd_val;
diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index a30146da7ffd..4d6a5015b927 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -860,7 +860,7 @@ static int palmas_pinconf_set(struct pinctrl_dev *pctldev,
 {
 	struct palmas_pctrl_chip_info *pci = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
-	u16 param_val;
+	u32 param_val;
 	const struct palmas_pingroup *g;
 	const struct palmas_pin_info *opt;
 	int ret;
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 08765f58253c..7813599e43fa 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1441,7 +1441,7 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
 	enum pin_config_param param;
-	u16 arg;
+	u32 arg;
 	int i;
 	int rc;
 
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index a5a0392ab817..f71f2e813ea6 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -622,7 +622,7 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
 	struct pcs_function *func;
 	unsigned offset = 0, shift = 0, i, data, ret;
-	u16 arg;
+	u32 arg;
 	int j;
 
 	ret = pcs_get_function(pctldev, pin, &func);
diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 7f3041697813..82b8a429743d 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5322,7 +5322,8 @@ static int atlas7_pin_config_set(struct pinctrl_dev *pctldev,
 				unsigned pin, unsigned long *configs,
 				unsigned num_configs)
 {
-	u16 param, arg;
+	u16 param;
+	u32 arg;
 	int idx, err;
 
 	for (idx = 0; idx < num_configs; idx++) {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0eb51e33cb1b..28bfa5f413e4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -540,7 +540,7 @@ static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev,
 		enum pin_config_param param;
 		unsigned long flags;
 		u32 offset, shift, mask, reg;
-		u16 arg, val;
+		u32 arg, val;
 		int ret;
 
 		param = pinconf_to_config_param(configs[i]);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
index 9b2ee717bccc..546f23c9040c 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
@@ -297,7 +297,7 @@ static int uniphier_conf_pin_config_get(struct pinctrl_dev *pctldev,
 
 static int uniphier_conf_pin_bias_set(struct pinctrl_dev *pctldev,
 				      const struct pin_desc *desc,
-				      enum pin_config_param param, u16 arg)
+				      enum pin_config_param param, u32 arg)
 {
 	struct uniphier_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
 	enum uniphier_pin_pull_dir pull_dir =
@@ -468,7 +468,7 @@ static int uniphier_conf_pin_config_set(struct pinctrl_dev *pctldev,
 	for (i = 0; i < num_configs; i++) {
 		enum pin_config_param param =
 					pinconf_to_config_param(configs[i]);
-		u16 arg = pinconf_to_config_argument(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index 270ca2a47a8c..c207e60b734f 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -428,7 +428,7 @@ static int wmt_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 {
 	struct wmt_pinctrl_data *data = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
-	u16 arg;
+	u32 arg;
 	u32 bank = WMT_BANK_FROM_PIN(pin);
 	u32 bit = WMT_BIT_FROM_PIN(pin);
 	u32 reg_pull_en = data->banks[bank].reg_pull_en;
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 51e52446eacb..73594f38c453 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -610,7 +610,7 @@ static int rtc_pinconf_set(struct pinctrl_dev *pctldev,
 	struct omap_rtc *rtc = pinctrl_dev_get_drvdata(pctldev);
 	u32 val;
 	unsigned int param;
-	u16 param_val;
+	u32 param_val;
 	int i;
 
 	rtc->type->unlock(rtc);
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 12343caa114e..9a09107c890e 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -92,6 +92,8 @@
  * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
  *	you need to pass in custom configurations to the pin controller, use
  *	PIN_CONFIG_END+1 as the base offset.
+ * @PIN_CONFIG_MAX: this is the maximum configuration value that can be
+ *	presented using the packed format.
  */
 enum pin_config_param {
 	PIN_CONFIG_BIAS_BUS_HOLD,
@@ -112,7 +114,8 @@ enum pin_config_param {
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SLEW_RATE,
-	PIN_CONFIG_END = 0x7FFF,
+	PIN_CONFIG_END = 0x7F,
+	PIN_CONFIG_MAX = 0xFF,
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -130,27 +133,27 @@ struct pin_config_item {
 /*
  * Helpful configuration macro to be used in tables etc.
  */
-#define PIN_CONF_PACKED(p, a) ((a << 16) | ((unsigned long) p & 0xffffUL))
+#define PIN_CONF_PACKED(p, a) ((a << 8) | ((unsigned long) p & 0xffUL))
 
 /*
  * The following inlines stuffs a configuration parameter and data value
  * into and out of an unsigned long argument, as used by the generic pin config
- * system. We put the parameter in the lower 16 bits and the argument in the
- * upper 16 bits.
+ * system. We put the parameter in the lower 8 bits and the argument in the
+ * upper 24 bits.
  */
 
 static inline enum pin_config_param pinconf_to_config_param(unsigned long config)
 {
-	return (enum pin_config_param) (config & 0xffffUL);
+	return (enum pin_config_param) (config & 0xffUL);
 }
 
-static inline u16 pinconf_to_config_argument(unsigned long config)
+static inline u32 pinconf_to_config_argument(unsigned long config)
 {
-	return (enum pin_config_param) ((config >> 16) & 0xffffUL);
+	return (u32) ((config >> 8) & 0xffffffUL);
 }
 
 static inline unsigned long pinconf_to_config_packed(enum pin_config_param param,
-						     u16 argument)
+						     u32 argument)
 {
 	return PIN_CONF_PACKED(param, argument);
 }
-- 
2.11.0
