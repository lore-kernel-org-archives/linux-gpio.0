From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get() to be compliant
Date: Mon,  2 Jul 2018 15:59:39 -0700
Message-ID: <20180702225939.109169-3-dianders@chromium.org>
References: <20180702225939.109169-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702225939.109169-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: iivanov@mm-sol.com, swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

If you do this on an sdm845 board:
  grep "" /sys/kernel/debug/pinctrl/*spmi:pmic*/pinconf-groups

...it looks like nonsense.  For every pin you see listed:
  input bias disabled, input bias high impedance, input bias pull down, input bias pull up, ...

That's because pmic_gpio_config_get() isn't complying with the rules
that pinconf_generic_dump_one() expects.  Specifically for boolean
parameters (anything with a "struct pin_config_item" where has_arg is
false) the function expects that the function should return its value
not through the "config" parameter but should return "0" if the value
is set and "-EINVAL" if the value isn't set.

Let's fix this.

>From a quick sample of other pinctrl drivers, it appears to be
tradition to also return 1 through the config parameter for these
boolean parameters when they exist.  I'm not one to knock tradition,
so I'll follow tradition and return 1 in these cases.  While I'm at
it, I'll also continue searching for four leaf clovers, kocking on
wood three times, and trying not to break mirrors.

NOTE: This also fixes an apparent typo for reading
PIN_CONFIG_BIAS_DISABLE where the old driver was accidentally
using "=" instead of "==" and thus was setting some internal
state when you tried to query PIN_CONFIG_BIAS_DISABLE.  Oops.

Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 32 ++++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 3e66e0d10010..cf82db78e69e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -390,31 +390,47 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
 
 	switch (param) {
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		arg = pad->buffer_type == PMIC_GPIO_OUT_BUF_CMOS;
+		if (pad->buffer_type != PMIC_GPIO_OUT_BUF_CMOS)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		arg = pad->buffer_type == PMIC_GPIO_OUT_BUF_OPEN_DRAIN_NMOS;
+		if (pad->buffer_type != PMIC_GPIO_OUT_BUF_OPEN_DRAIN_NMOS)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
-		arg = pad->buffer_type == PMIC_GPIO_OUT_BUF_OPEN_DRAIN_PMOS;
+		if (pad->buffer_type != PMIC_GPIO_OUT_BUF_OPEN_DRAIN_PMOS)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		arg = pad->pullup == PMIC_GPIO_PULL_DOWN;
+		if (pad->pullup != PMIC_GPIO_PULL_DOWN)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_BIAS_DISABLE:
-		arg = pad->pullup = PMIC_GPIO_PULL_DISABLE;
+		if (pad->pullup != PMIC_GPIO_PULL_DISABLE)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		arg = pad->pullup == PMIC_GPIO_PULL_UP_30;
+		if (pad->pullup != PMIC_GPIO_PULL_UP_30)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
-		arg = !pad->is_enabled;
+		if (pad->is_enabled)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		arg = pad->power_source;
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-		arg = pad->input_enabled;
+		if (!pad->input_enabled)
+			return -EINVAL;
+		arg = 1;
 		break;
 	case PIN_CONFIG_OUTPUT:
 		arg = pad->out_value;
-- 
2.18.0.399.gad0ab374a1-goog
