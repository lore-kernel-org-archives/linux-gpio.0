From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH RFC 2/4] pinctrl: Rename mux group to group_or_pin to prepare for pin support
Date: Fri, 29 Sep 2017 11:15:01 +0100
Message-ID: <20170929101503.6769-3-ckeepax@opensource.cirrus.com>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:38146 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752002AbdI2KPI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Sep 2017 06:15:08 -0400
In-Reply-To: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com

From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

To prepare for adding support for muxing individual pins rename the
group member of the pinctrl_map_mux and pinctrl_setting_mux structs to
group_or_pin.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         |  2 +-
 drivers/pinctrl/core.h                        |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c       |  5 ++--
 drivers/pinctrl/freescale/pinctrl-imx1-core.c |  5 ++--
 drivers/pinctrl/freescale/pinctrl-mxs.c       |  4 +--
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  2 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c         |  2 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c      |  2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     |  2 +-
 drivers/pinctrl/pinctrl-at91.c                |  5 ++--
 drivers/pinctrl/pinctrl-lantiq.c              |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c            |  5 ++--
 drivers/pinctrl/pinctrl-rza1.c                |  2 +-
 drivers/pinctrl/pinctrl-single.c              |  4 +--
 drivers/pinctrl/pinctrl-st.c                  |  2 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c          |  2 +-
 drivers/pinctrl/pinctrl-tz1090.c              |  2 +-
 drivers/pinctrl/pinctrl-utils.c               |  2 +-
 drivers/pinctrl/pinmux.c                      | 37 +++++++++++++++------------
 drivers/pinctrl/samsung/pinctrl-exynos5440.c  |  4 +--
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c              |  2 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c           |  2 +-
 drivers/pinctrl/spear/pinctrl-spear.c         |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  2 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c          |  2 +-
 include/linux/pinctrl/machine.h               |  2 +-
 28 files changed, 59 insertions(+), 50 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index ff782445dfb7..3ce874c979d4 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -692,7 +692,7 @@ static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
 	}
 
 	map->type = PIN_MAP_TYPE_MUX_GROUP;
-	map->data.mux.group = bcm2835_gpio_groups[pin];
+	map->data.mux.group_or_pin = bcm2835_gpio_groups[pin];
 	map->data.mux.function = bcm2835_functions[fnum];
 	(*maps)++;
 
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 7880c3adc450..96a003a719e3 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -102,7 +102,7 @@ struct pinctrl_state {
  * @func: the function selector to program
  */
 struct pinctrl_setting_mux {
-	unsigned group;
+	unsigned group_or_pin;
 	unsigned func;
 };
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 6e472691d8ee..4d8d526214c4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -102,7 +102,7 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
-	new_map[0].data.mux.group = np->name;
+	new_map[0].data.mux.group_or_pin = np->name;
 	of_node_put(parent);
 
 	/* create config map */
@@ -121,7 +121,8 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
-		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
+		(*map)->data.mux.function, (*map)->data.mux.group_or_pin,
+		map_num);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index a4e9f430d452..e7a76171e922 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -261,7 +261,7 @@ static int imx1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
-	new_map[0].data.mux.group = np->name;
+	new_map[0].data.mux.group_or_pin = np->name;
 	of_node_put(parent);
 
 	/* create config map */
@@ -276,7 +276,8 @@ static int imx1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
-		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
+		(*map)->data.mux.function, (*map)->data.mux.group_or_pin,
+		map_num);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 6852010a6d70..81ae9d6258b4 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -111,7 +111,7 @@ static int mxs_dt_node_to_map(struct pinctrl_dev *pctldev,
 			goto free;
 		}
 		snprintf(group, length, "%s.%d", np->name, reg);
-		new_map[i].data.mux.group = group;
+		new_map[i].data.mux.group_or_pin = group;
 		i++;
 	}
 
@@ -149,7 +149,7 @@ static void mxs_dt_free_map(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_maps; i++) {
 		if (map[i].type == PIN_MAP_TYPE_MUX_GROUP)
-			kfree(map[i].data.mux.group);
+			kfree(map[i].data.mux.group_or_pin);
 		if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
 			kfree(map[i].data.configs.configs);
 	}
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 3cf384f8b122..340dd0e84886 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -475,7 +475,7 @@ static int mtk_pctrl_dt_node_to_map_func(struct mtk_pinctrl *pctl,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = grp->name;
+	(*map)[*num_maps].data.mux.group_or_pin = grp->name;
 
 	ret = mtk_pctrl_is_function_valid(pctl, pin, fnum);
 	if (!ret) {
diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 163d4614b0f8..174ea2d5d6df 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -445,7 +445,7 @@ static int mvebu_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		}
 
 		(*map)[n].type = PIN_MAP_TYPE_MUX_GROUP;
-		(*map)[n].data.mux.group = group;
+		(*map)[n].data.mux.group_or_pin = group;
 		(*map)[n].data.mux.function = function;
 		n++;
 	}
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index b32c0d602024..06ae64c72a6d 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -815,7 +815,7 @@ static int abx500_dt_add_map_mux(struct pinctrl_map **map,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = group;
+	(*map)[*num_maps].data.mux.group_or_pin = group;
 	(*map)[*num_maps].data.mux.function = function;
 	(*num_maps)++;
 
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index a53f1a9b1ed2..b808a54ee0a5 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1270,7 +1270,7 @@ static int nmk_dt_add_map_mux(struct pinctrl_map **map, unsigned *reserved_maps,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = group;
+	(*map)[*num_maps].data.mux.group_or_pin = group;
 	(*map)[*num_maps].data.mux.function = function;
 	(*num_maps)++;
 
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 569bc28cb909..2bbdb0e26a29 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -284,7 +284,7 @@ static int at91_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
-	new_map[0].data.mux.group = np->name;
+	new_map[0].data.mux.group_or_pin = np->name;
 	of_node_put(parent);
 
 	/* create config map */
@@ -298,7 +298,8 @@ static int at91_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
-		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
+		(*map)->data.mux.function, (*map)->data.mux.group_or_pin,
+		map_num);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-lantiq.c
index 41dc39c7a7b1..4d499df5d65f 100644
--- a/drivers/pinctrl/pinctrl-lantiq.c
+++ b/drivers/pinctrl/pinctrl-lantiq.c
@@ -96,7 +96,7 @@ static void ltq_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		of_property_for_each_string(np, "lantiq,groups", prop, group) {
 			(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
 			(*map)->name = function;
-			(*map)->data.mux.group = group;
+			(*map)->data.mux.group_or_pin = group;
 			(*map)->data.mux.function = function;
 			(*map)++;
 		}
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index b5cb7858ffdc..e700a052715e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -522,7 +522,7 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
-	new_map[0].data.mux.group = np->name;
+	new_map[0].data.mux.group_or_pin = np->name;
 	of_node_put(parent);
 
 	/* create config map */
@@ -536,7 +536,8 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
-		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
+		(*map)->data.mux.function, (*map)->data.mux.group_or_pin,
+		map_num);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 04d058706b80..8d1bd8591624 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -952,7 +952,7 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)->data.mux.group = np->name;
+	(*map)->data.mux.group_or_pin = np->name;
 	(*map)->data.mux.function = np->name;
 	*num_maps = 1;
 
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e6cd8de793e2..b48d9fb265c1 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1019,7 +1019,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 		goto free_function;
 
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)->data.mux.group = np->name;
+	(*map)->data.mux.group_or_pin = np->name;
 	(*map)->data.mux.function = np->name;
 
 	if (PCS_HAS_PINCONF) {
@@ -1153,7 +1153,7 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 		goto free_function;
 
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)->data.mux.group = np->name;
+	(*map)->data.mux.group_or_pin = np->name;
 	(*map)->data.mux.function = np->name;
 
 	if (PCS_HAS_PINCONF) {
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index a5205b94b2e6..87c1d0ba962d 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -838,7 +838,7 @@ static int st_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = map_num;
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
-	new_map[0].data.mux.group = np->name;
+	new_map[0].data.mux.group_or_pin = np->name;
 	of_node_put(parent);
 
 	/* create config map per pin */
diff --git a/drivers/pinctrl/pinctrl-tz1090-pdc.c b/drivers/pinctrl/pinctrl-tz1090-pdc.c
index 5cfa93cecf73..89a8ef08ed22 100644
--- a/drivers/pinctrl/pinctrl-tz1090-pdc.c
+++ b/drivers/pinctrl/pinctrl-tz1090-pdc.c
@@ -318,7 +318,7 @@ static int add_map_mux(struct pinctrl_map **map, unsigned int *reserved_maps,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = group;
+	(*map)[*num_maps].data.mux.group_or_pin = group;
 	(*map)[*num_maps].data.mux.function = function;
 	(*num_maps)++;
 
diff --git a/drivers/pinctrl/pinctrl-tz1090.c b/drivers/pinctrl/pinctrl-tz1090.c
index 74d1ffcc2199..1f72a52102ab 100644
--- a/drivers/pinctrl/pinctrl-tz1090.c
+++ b/drivers/pinctrl/pinctrl-tz1090.c
@@ -1062,7 +1062,7 @@ static int add_map_mux(struct pinctrl_map **map, unsigned int *reserved_maps,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = group;
+	(*map)[*num_maps].data.mux.group_or_pin = group;
 	(*map)[*num_maps].data.mux.function = function;
 	(*num_maps)++;
 
diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c
index 9189fbafb102..d9c65a24eb30 100644
--- a/drivers/pinctrl/pinctrl-utils.c
+++ b/drivers/pinctrl/pinctrl-utils.c
@@ -62,7 +62,7 @@ int pinctrl_utils_add_map_mux(struct pinctrl_dev *pctldev,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = group;
+	(*map)[*num_maps].data.mux.group_or_pin = group;
 	(*map)[*num_maps].data.mux.function = function;
 	(*num_maps)++;
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index e76e6f6a79d6..699b3e406d10 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -348,8 +348,8 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 			map->data.mux.function);
 		return -EINVAL;
 	}
-	if (map->data.mux.group) {
-		group = map->data.mux.group;
+	if (map->data.mux.group_or_pin) {
+		group = map->data.mux.group_or_pin;
 		ret = match_string(groups, num_groups, group);
 		if (ret < 0) {
 			dev_err(pctldev->dev,
@@ -364,10 +364,10 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 	ret = pinctrl_get_group_selector(pctldev, group);
 	if (ret < 0) {
 		dev_err(pctldev->dev, "invalid group %s in map table\n",
-			map->data.mux.group);
+			map->data.mux.group_or_pin);
 		return ret;
 	}
-	setting->data.mux.group = ret;
+	setting->data.mux.group_or_pin = ret;
 
 	return 0;
 }
@@ -389,7 +389,8 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 	struct pin_desc *desc;
 
 	if (pctlops->get_group_pins)
-		ret = pctlops->get_group_pins(pctldev, setting->data.mux.group,
+		ret = pctlops->get_group_pins(pctldev,
+					      setting->data.mux.group_or_pin,
 					      &pins, &num_pins);
 
 	if (ret) {
@@ -397,7 +398,7 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 
 		/* errors only affect debug data, so just warn */
 		gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group);
+						setting->data.mux.group_or_pin);
 		dev_warn(pctldev->dev,
 			 "could not get pins for group %s\n",
 			 gname);
@@ -414,7 +415,7 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 			desc = pin_desc_get(pctldev, pins[i]);
 			pname = desc ? desc->name : "non-existing";
 			gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group);
+						setting->data.mux.group_or_pin);
 			dev_err(pctldev->dev,
 				"could not request pin %d (%s) from group %s "
 				" on device %s\n",
@@ -437,7 +438,7 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 	}
 
 	ret = ops->set_mux(pctldev, setting->data.mux.func,
-			   setting->data.mux.group);
+			   setting->data.mux.group_or_pin);
 
 	if (ret)
 		goto err_set_mux;
@@ -469,14 +470,15 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 	struct pin_desc *desc;
 
 	if (pctlops->get_group_pins)
-		ret = pctlops->get_group_pins(pctldev, setting->data.mux.group,
+		ret = pctlops->get_group_pins(pctldev,
+					      setting->data.mux.group_or_pin,
 					      &pins, &num_pins);
 	if (ret) {
 		const char *gname;
 
 		/* errors only affect debug data, so just warn */
 		gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group);
+						setting->data.mux.group_or_pin);
 		dev_warn(pctldev->dev,
 			 "could not get pins for group %s\n",
 			 gname);
@@ -500,7 +502,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 			const char *gname;
 
 			gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group);
+						setting->data.mux.group_or_pin);
 			dev_warn(pctldev->dev,
 				 "not freeing pin %d (%s) as part of "
 				 "deactivating group %s - it is already "
@@ -598,7 +600,7 @@ static int pinmux_pin_show(struct seq_file *s, unsigned int pin)
 			   pmxops->get_function_name(pctldev,
 				desc->mux_setting->func),
 			   pctlops->get_group_name(pctldev,
-				desc->mux_setting->group));
+				desc->mux_setting->group_or_pin));
 	else
 		seq_puts(s, "\n");
 
@@ -635,9 +637,11 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 
 void pinmux_show_map(struct seq_file *s, const struct pinctrl_map *map)
 {
+	const struct pinctrl_map_mux *mux = &map->data.mux;
+
 	seq_printf(s, "group %s\nfunction %s\n",
-		map->data.mux.group ? map->data.mux.group : "(default)",
-		map->data.mux.function);
+		   mux->group_or_pin ? mux->group_or_pin : "(default)",
+		   mux->function);
 }
 
 void pinmux_show_setting(struct seq_file *s,
@@ -648,8 +652,9 @@ void pinmux_show_setting(struct seq_file *s,
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
 
 	seq_printf(s, "group: %s (%u) function: %s (%u)\n",
-		   pctlops->get_group_name(pctldev, setting->data.mux.group),
-		   setting->data.mux.group,
+		   pctlops->get_group_name(pctldev,
+					   setting->data.mux.group_or_pin),
+		   setting->data.mux.group_or_pin,
 		   pmxops->get_function_name(pctldev, setting->data.mux.func),
 		   setting->data.mux.func);
 }
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos5440.c b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
index 32a3a9fd65c4..b6dfba7ac249 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos5440.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
@@ -254,7 +254,7 @@ static int exynos5440_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (!fname)
 			goto free_cfg;
 
-		map[*nmaps].data.mux.group = gname;
+		map[*nmaps].data.mux.group_or_pin = gname;
 		map[*nmaps].data.mux.function = fname;
 		map[*nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
 		*nmaps += 1;
@@ -282,7 +282,7 @@ static void exynos5440_dt_free_map(struct pinctrl_dev *pctldev,
 		if (map[idx].type == PIN_MAP_TYPE_MUX_GROUP) {
 			kfree(map[idx].data.mux.function);
 			if (!idx)
-				kfree(map[idx].data.mux.group);
+				kfree(map[idx].data.mux.group_or_pin);
 		} else if (map->type == PIN_MAP_TYPE_CONFIGS_GROUP) {
 			kfree(map[idx].data.configs.configs);
 			if (!idx)
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index e04f7fe0a65d..cd5b81446e49 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -111,7 +111,7 @@ static int add_map_mux(struct pinctrl_map **map, unsigned *reserved_maps,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = group;
+	(*map)[*num_maps].data.mux.group_or_pin = group;
 	(*map)[*num_maps].data.mux.function = function;
 	(*num_maps)++;
 
diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 5c9d79981e6d..dc456b3e578f 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -202,7 +202,7 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	of_property_for_each_string(np, pmx->groups_prop_name, prop, group) {
 		if (function) {
 			maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
-			maps[idx].data.mux.group = group;
+			maps[idx].data.mux.group_or_pin = group;
 			maps[idx].data.mux.function = function;
 			idx++;
 		}
diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index d3ef05973901..caf384eea5b1 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -116,7 +116,7 @@ static int sirfsoc_dt_node_to_map(struct pinctrl_dev *pctldev,
 		of_property_read_string(np, "sirf,function", &function);
 		of_property_for_each_string(np, "sirf,pins", prop, group) {
 			(*map)[index].type = PIN_MAP_TYPE_MUX_GROUP;
-			(*map)[index].data.mux.group = group;
+			(*map)[index].data.mux.group_or_pin = group;
 			(*map)[index].data.mux.function = function;
 			index++;
 		}
diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index 4db52ba38d8d..811bf0e718ff 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -180,7 +180,7 @@ static int spear_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		of_property_read_string(np, "st,function", &function);
 		of_property_for_each_string(np, "st,pins", prop, group) {
 			(*map)[index].type = PIN_MAP_TYPE_MUX_GROUP;
-			(*map)[index].data.mux.group = group;
+			(*map)[index].data.mux.group_or_pin = group;
 			(*map)[index].data.mux.function = function;
 			index++;
 		}
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 50299ad96659..ddf9f86ab550 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -375,7 +375,7 @@ static int stm32_pctrl_dt_node_to_map_func(struct stm32_pinctrl *pctl,
 		return -ENOSPC;
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
-	(*map)[*num_maps].data.mux.group = grp->name;
+	(*map)[*num_maps].data.mux.group_or_pin = grp->name;
 
 	if (!stm32_pctrl_is_function_valid(pctl, pin, fnum)) {
 		dev_err(pctl->dev, "invalid function %d on pin %d .\n",
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 52edf3b5988d..9e87ff53f0e7 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -377,7 +377,7 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		}
 
 		(*map)[i].type = PIN_MAP_TYPE_MUX_GROUP;
-		(*map)[i].data.mux.group = group;
+		(*map)[i].data.mux.group_or_pin = group;
 		(*map)[i].data.mux.function = function;
 
 		i++;
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index d73956bdc211..13d5e9ed0aa8 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -232,7 +232,7 @@ static int wmt_pctl_dt_node_to_map_func(struct wmt_pinctrl_data *data,
 	}
 
 	map->type = PIN_MAP_TYPE_MUX_GROUP;
-	map->data.mux.group = data->groups[group];
+	map->data.mux.group_or_pin = data->groups[group];
 	map->data.mux.function = wmt_functions[fnum];
 	(*maps)++;
 
diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index 7fa5d87190c2..ec58c3647eb8 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -32,7 +32,7 @@ enum pinctrl_map_type {
  * @function: the mux function to select for the group
  */
 struct pinctrl_map_mux {
-	const char *group;
+	const char *group_or_pin;
 	const char *function;
 };
 
-- 
2.11.0

