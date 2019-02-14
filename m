From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/2] pinctrl: stm32: fix memory leak issue
Date: Thu, 14 Feb 2019 17:54:24 +0100
Message-ID: <1550163266-19975-2-git-send-email-alexandre.torgue@st.com>
References: <1550163266-19975-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550163266-19975-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, alexandre.torgue@st.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-gpio@vger.kernel.org

configs is allocated by pinconf_generic_parse_dt_config(),
pinctrl_utils_add_map_configs() duplicates configs so it can and has to
be freed to prevent memory leaks.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 813eccb..f6279c8 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -414,7 +414,7 @@ static int stm32_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	unsigned int num_configs;
 	bool has_config = 0;
 	unsigned reserve = 0;
-	int num_pins, num_funcs, maps_per_pin, i, err;
+	int num_pins, num_funcs, maps_per_pin, i, err = 0;
 
 	pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -441,41 +441,45 @@ static int stm32_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	if (has_config && num_pins >= 1)
 		maps_per_pin++;
 
-	if (!num_pins || !maps_per_pin)
-		return -EINVAL;
+	if (!num_pins || !maps_per_pin) {
+		err = -EINVAL;
+		goto exit;
+	}
 
 	reserve = num_pins * maps_per_pin;
 
 	err = pinctrl_utils_reserve_map(pctldev, map,
 			reserved_maps, num_maps, reserve);
 	if (err)
-		return err;
+		goto exit;
 
 	for (i = 0; i < num_pins; i++) {
 		err = of_property_read_u32_index(node, "pinmux",
 				i, &pinfunc);
 		if (err)
-			return err;
+			goto exit;
 
 		pin = STM32_GET_PIN_NO(pinfunc);
 		func = STM32_GET_PIN_FUNC(pinfunc);
 
 		if (!stm32_pctrl_is_function_valid(pctl, pin, func)) {
 			dev_err(pctl->dev, "invalid function.\n");
-			return -EINVAL;
+			err = -EINVAL;
+			goto exit;
 		}
 
 		grp = stm32_pctrl_find_group_by_pin(pctl, pin);
 		if (!grp) {
 			dev_err(pctl->dev, "unable to match pin %d to group\n",
 					pin);
-			return -EINVAL;
+			err = -EINVAL;
+			goto exit;
 		}
 
 		err = stm32_pctrl_dt_node_to_map_func(pctl, pin, func, grp, map,
 				reserved_maps, num_maps);
 		if (err)
-			return err;
+			goto exit;
 
 		if (has_config) {
 			err = pinctrl_utils_add_map_configs(pctldev, map,
@@ -483,11 +487,13 @@ static int stm32_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 					configs, num_configs,
 					PIN_MAP_TYPE_CONFIGS_GROUP);
 			if (err)
-				return err;
+				goto exit;
 		}
 	}
 
-	return 0;
+exit:
+	kfree(configs);
+	return err;
 }
 
 static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
-- 
2.7.4
