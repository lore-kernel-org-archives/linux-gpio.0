From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 1/8] pinctrl: qcom: spmi-mpp: Transition to generic dt binding parser
Date: Wed, 17 Jun 2015 23:47:25 -0700
Message-ID: <1434610052-602-2-git-send-email-bjorn.andersson@sonymobile.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use the newly introduced extensible generic dt parser instead of rolling
our own dt parsing functions.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 130 ++++----------------------------
 1 file changed, 16 insertions(+), 114 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 3121de9b6331..b247a17bc2af 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -129,15 +129,17 @@ struct pmic_mpp_state {
 	struct gpio_chip chip;
 };
 
-struct pmic_mpp_bindings {
-	const char	*property;
-	unsigned	param;
+static const struct pinconf_generic_params pmic_mpp_bindings[] = {
+	{"qcom,amux-route",	PMIC_MPP_CONF_AMUX_ROUTE,	0},
+	{"qcom,analog-mode",	PMIC_MPP_CONF_ANALOG_MODE,	0},
 };
 
-static struct pmic_mpp_bindings pmic_mpp_bindings[] = {
-	{"qcom,amux-route",	PMIC_MPP_CONF_AMUX_ROUTE},
-	{"qcom,analog-mode",	PMIC_MPP_CONF_ANALOG_MODE},
+#ifdef CONFIG_DEBUG_FS
+static const struct pin_config_item pmic_conf_items[] = {
+	PCONFDUMP(PMIC_MPP_CONF_AMUX_ROUTE, "analog mux", NULL, true),
+	PCONFDUMP(PMIC_MPP_CONF_ANALOG_MODE, "analog output", NULL, false),
 };
+#endif
 
 static const char *const pmic_mpp_groups[] = {
 	"mpp1", "mpp2", "mpp3", "mpp4", "mpp5", "mpp6", "mpp7", "mpp8",
@@ -204,118 +206,11 @@ static int pmic_mpp_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int pmic_mpp_parse_dt_config(struct device_node *np,
-				    struct pinctrl_dev *pctldev,
-				    unsigned long **configs,
-				    unsigned int *nconfs)
-{
-	struct pmic_mpp_bindings *par;
-	unsigned long cfg;
-	int ret, i;
-	u32 val;
-
-	for (i = 0; i < ARRAY_SIZE(pmic_mpp_bindings); i++) {
-		par = &pmic_mpp_bindings[i];
-		ret = of_property_read_u32(np, par->property, &val);
-
-		/* property not found */
-		if (ret == -EINVAL)
-			continue;
-
-		/* use zero as default value, when no value is specified */
-		if (ret)
-			val = 0;
-
-		dev_dbg(pctldev->dev, "found %s with value %u\n",
-			par->property, val);
-
-		cfg = pinconf_to_config_packed(par->param, val);
-
-		ret = pinctrl_utils_add_config(pctldev, configs, nconfs, cfg);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int pmic_mpp_dt_subnode_to_map(struct pinctrl_dev *pctldev,
-				      struct device_node *np,
-				      struct pinctrl_map **map,
-				      unsigned *reserv, unsigned *nmaps,
-				      enum pinctrl_map_type type)
-{
-	unsigned long *configs = NULL;
-	unsigned nconfs = 0;
-	struct property *prop;
-	const char *group;
-	int ret;
-
-	ret = pmic_mpp_parse_dt_config(np, pctldev, &configs, &nconfs);
-	if (ret < 0)
-		return ret;
-
-	if (!nconfs)
-		return 0;
-
-	ret = of_property_count_strings(np, "pins");
-	if (ret < 0)
-		goto exit;
-
-	ret = pinctrl_utils_reserve_map(pctldev, map, reserv, nmaps, ret);
-	if (ret < 0)
-		goto exit;
-
-	of_property_for_each_string(np, "pins", prop, group) {
-		ret = pinctrl_utils_add_map_configs(pctldev, map,
-						    reserv, nmaps, group,
-						    configs, nconfs, type);
-		if (ret < 0)
-			break;
-	}
-exit:
-	kfree(configs);
-	return ret;
-}
-
-static int pmic_mpp_dt_node_to_map(struct pinctrl_dev *pctldev,
-				   struct device_node *np_config,
-				   struct pinctrl_map **map, unsigned *nmaps)
-{
-	struct device_node *np;
-	enum pinctrl_map_type type;
-	unsigned reserv;
-	int ret;
-
-	ret = 0;
-	*map = NULL;
-	*nmaps = 0;
-	reserv = 0;
-	type = PIN_MAP_TYPE_CONFIGS_GROUP;
-
-	for_each_child_of_node(np_config, np) {
-		ret = pinconf_generic_dt_subnode_to_map(pctldev, np, map,
-							&reserv, nmaps, type);
-		if (ret)
-			break;
-
-		ret = pmic_mpp_dt_subnode_to_map(pctldev, np, map, &reserv,
-						 nmaps, type);
-		if (ret)
-			break;
-	}
-
-	if (ret < 0)
-		pinctrl_utils_dt_free_map(pctldev, *map, *nmaps);
-
-	return ret;
-}
-
 static const struct pinctrl_ops pmic_mpp_pinctrl_ops = {
 	.get_groups_count	= pmic_mpp_get_groups_count,
 	.get_group_name		= pmic_mpp_get_group_name,
 	.get_group_pins		= pmic_mpp_get_group_pins,
-	.dt_node_to_map		= pmic_mpp_dt_node_to_map,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
 	.dt_free_map		= pinctrl_utils_dt_free_map,
 };
 
@@ -594,6 +489,7 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinconf_ops pmic_mpp_pinconf_ops = {
+	.is_generic = true,
 	.pin_config_group_get		= pmic_mpp_config_get,
 	.pin_config_group_set		= pmic_mpp_config_set,
 	.pin_config_group_dbg_show	= pmic_mpp_config_dbg_show,
@@ -866,6 +762,12 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 	pctrldesc->pins = pindesc;
 	pctrldesc->npins = npins;
 
+	pctrldesc->num_custom_params = ARRAY_SIZE(pmic_mpp_bindings);
+	pctrldesc->custom_params = pmic_mpp_bindings;
+#ifdef CONFIG_DEBUG_FS
+	pctrldesc->custom_conf_items = pmic_conf_items;
+#endif
+
 	for (i = 0; i < npins; i++, pindesc++) {
 		pad = &pads[i];
 		pindesc->drv_data = pad;
-- 
1.8.2.2
