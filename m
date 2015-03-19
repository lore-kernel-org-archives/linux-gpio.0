From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH 1/2] pinctrl: pinconf-generic: scan also referenced phandle node
Date: Thu, 19 Mar 2015 22:17:41 +0200
Message-ID: <a7b25eb6f4fd888e9ac600959cf4216ffa11921e.1426796262.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:56568 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750852AbbCSUR7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 19 Mar 2015 16:17:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

Make pinconf_generic_dt_node_to_map() also scan the dt pin configuration node
directly referenced by phandle, not only its child nodes.

The "parent scan" feature needs a few other changes:

   * Move the pinconf_generic_dt_node_to_map() error handling code to a common
     place, under the 'exit' label.

   * Move the pins/groups strings count earlier in
     pinconf_generic_dt_subnode_to_map(), to allow us to bail out early when
     these properties are missing or wrong

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/pinctrl/pinconf-generic.c | 48 +++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 4db92f64b4de..b5fbfb3584d9 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -283,11 +283,26 @@ int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	struct device *dev = pctldev->dev;
 	unsigned long *configs = NULL;
 	unsigned num_configs = 0;
-	unsigned reserve;
+	unsigned reserve, strings_count;
 	struct property *prop;
 	const char *group;
 	const char *subnode_target_type = "pins";
 
+	ret = of_property_count_strings(np, "pins");
+	if (ret < 0) {
+		ret = of_property_count_strings(np, "groups");
+		if (ret < 0)
+			/* skip this node; may contain config child nodes */
+			return 0;
+		if (type == PIN_MAP_TYPE_INVALID)
+			type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		subnode_target_type = "groups";
+	} else {
+		if (type == PIN_MAP_TYPE_INVALID)
+			type = PIN_MAP_TYPE_CONFIGS_PIN;
+	}
+	strings_count = ret;
+
 	ret = of_property_read_string(np, "function", &function);
 	if (ret < 0) {
 		/* EINVAL=missing, which is fine since it's optional */
@@ -309,21 +324,7 @@ int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	if (num_configs)
 		reserve++;
 
-	ret = of_property_count_strings(np, "pins");
-	if (ret < 0) {
-		ret = of_property_count_strings(np, "groups");
-		if (ret < 0) {
-			dev_err(dev, "could not parse property pins/groups\n");
-			goto exit;
-		}
-		if (type == PIN_MAP_TYPE_INVALID)
-			type = PIN_MAP_TYPE_CONFIGS_GROUP;
-		subnode_target_type = "groups";
-	} else {
-		if (type == PIN_MAP_TYPE_INVALID)
-			type = PIN_MAP_TYPE_CONFIGS_PIN;
-	}
-	reserve *= ret;
+	reserve *= strings_count;
 
 	ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps,
 			num_maps, reserve);
@@ -367,15 +368,22 @@ int pinconf_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*map = NULL;
 	*num_maps = 0;
 
+	ret = pinconf_generic_dt_subnode_to_map(pctldev, np_config, map,
+						&reserved_maps, num_maps, type);
+	if (ret < 0)
+		goto exit;
+
 	for_each_child_of_node(np_config, np) {
 		ret = pinconf_generic_dt_subnode_to_map(pctldev, np, map,
 					&reserved_maps, num_maps, type);
-		if (ret < 0) {
-			pinctrl_utils_dt_free_map(pctldev, *map, *num_maps);
-			return ret;
-		}
+		if (ret < 0)
+			goto exit;
 	}
 	return 0;
+
+exit:
+	pinctrl_utils_dt_free_map(pctldev, *map, *num_maps);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pinconf_generic_dt_node_to_map);
 
-- 
2.1.4

