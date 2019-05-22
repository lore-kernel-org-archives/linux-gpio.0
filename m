From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Handle PIN_CONFIG_OUTPUT config
Date: Wed, 22 May 2019 18:12:24 +0200
Message-ID: <20190522161224.6169-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: od@zcrc.me, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-gpio@vger.kernel.org

This enables devicetree bindings to specify that a given GPIO should be
driven low or high.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a83ddd52efdd..07342bc769d1 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1154,19 +1154,30 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
 }
 
+static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
+				     unsigned int pin, bool high)
+{
+	if (jzpc->version >= ID_JZ4770)
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, high);
+	else
+		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DATA, high);
+}
+
 static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		unsigned long *configs, unsigned int num_configs)
 {
 	struct ingenic_pinctrl *jzpc = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
-	unsigned int cfg;
+	unsigned int cfg, arg;
+	int ret;
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
 		switch (pinconf_to_config_param(configs[cfg])) {
 		case PIN_CONFIG_BIAS_DISABLE:
 		case PIN_CONFIG_BIAS_PULL_UP:
 		case PIN_CONFIG_BIAS_PULL_DOWN:
+		case PIN_CONFIG_OUTPUT:
 			continue;
 		default:
 			return -ENOTSUPP;
@@ -1174,6 +1185,8 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	}
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
+		arg = pinconf_to_config_argument(configs[cfg]);
+
 		switch (pinconf_to_config_param(configs[cfg])) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			dev_dbg(jzpc->dev, "disable pull-over for pin P%c%u\n",
@@ -1197,6 +1210,14 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			ingenic_set_bias(jzpc, pin, true);
 			break;
 
+		case PIN_CONFIG_OUTPUT:
+			ret = pinctrl_gpio_direction_output(pin);
+			if (ret)
+				return ret;
+
+			ingenic_set_output_level(jzpc, pin, arg);
+			break;
+
 		default:
 			unreachable();
 		}
-- 
2.21.0.593.g511ec345e18
