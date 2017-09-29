From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH RFC 4/4] pinctrl: Add support for parsing individual pinmux from DT
Date: Fri, 29 Sep 2017 11:15:03 +0100
Message-ID: <20170929101503.6769-5-ckeepax@opensource.cirrus.com>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: linux-gpio@vger.kernel.org

From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

So as to not break existing drivers that rely on pins properties being
treated as a group, leave functionality of the existing generic
parsing functions the same. Add a new parsing function
pinctrl_generic_dt_node_to_map_all that will map pin properties from DT
to the newly created pin type maps.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/pinctrl/pinconf-generic.c       | 30 +++++++++++++++++++-----------
 drivers/pinctrl/pinctrl-utils.c         |  8 ++++----
 drivers/pinctrl/pinctrl-utils.h         | 14 ++++++++++++--
 drivers/pinctrl/sirf/pinctrl-atlas7.c   |  3 ++-
 include/linux/pinctrl/pinconf-generic.h | 24 +++++++++++++++++++-----
 5 files changed, 56 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 8eaa25c3384f..3f5cbe7e96dd 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -287,7 +287,8 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np, struct pinctrl_map **map,
 		unsigned *reserved_maps, unsigned *num_maps,
-		enum pinctrl_map_type type)
+		enum pinctrl_map_type conf_type,
+		enum pinctrl_map_type mux_type)
 {
 	int ret;
 	const char *function;
@@ -305,12 +306,16 @@ int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		if (ret < 0)
 			/* skip this node; may contain config child nodes */
 			return 0;
-		if (type == PIN_MAP_TYPE_INVALID)
-			type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		if (conf_type == PIN_MAP_TYPE_INVALID)
+			conf_type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		if (mux_type == PIN_MAP_TYPE_INVALID)
+			mux_type = PIN_MAP_TYPE_MUX_GROUP;
 		subnode_target_type = "groups";
 	} else {
-		if (type == PIN_MAP_TYPE_INVALID)
-			type = PIN_MAP_TYPE_CONFIGS_PIN;
+		if (conf_type == PIN_MAP_TYPE_INVALID)
+			conf_type = PIN_MAP_TYPE_CONFIGS_PIN;
+		if (mux_type == PIN_MAP_TYPE_INVALID)
+			mux_type = PIN_MAP_TYPE_MUX_PIN;
 	}
 	strings_count = ret;
 
@@ -345,9 +350,9 @@ int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 
 	of_property_for_each_string(np, subnode_target_type, prop, group) {
 		if (function) {
-			ret = pinctrl_utils_add_map_mux(pctldev, map,
+			ret = pinctrl_utils_add_map_mux_type(pctldev, map,
 					reserved_maps, num_maps, group,
-					function);
+					function, mux_type);
 			if (ret < 0)
 				goto exit;
 		}
@@ -355,7 +360,7 @@ int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		if (num_configs) {
 			ret = pinctrl_utils_add_map_configs(pctldev, map,
 					reserved_maps, num_maps, group, configs,
-					num_configs, type);
+					num_configs, conf_type);
 			if (ret < 0)
 				goto exit;
 		}
@@ -370,7 +375,8 @@ EXPORT_SYMBOL_GPL(pinconf_generic_dt_subnode_to_map);
 
 int pinconf_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np_config, struct pinctrl_map **map,
-		unsigned *num_maps, enum pinctrl_map_type type)
+		unsigned *num_maps, enum pinctrl_map_type conf_type,
+		enum pinctrl_map_type mux_type)
 {
 	unsigned reserved_maps;
 	struct device_node *np;
@@ -381,13 +387,15 @@ int pinconf_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = 0;
 
 	ret = pinconf_generic_dt_subnode_to_map(pctldev, np_config, map,
-						&reserved_maps, num_maps, type);
+						&reserved_maps, num_maps,
+						conf_type, mux_type);
 	if (ret < 0)
 		goto exit;
 
 	for_each_available_child_of_node(np_config, np) {
 		ret = pinconf_generic_dt_subnode_to_map(pctldev, np, map,
-					&reserved_maps, num_maps, type);
+					&reserved_maps, num_maps,
+					conf_type, mux_type);
 		if (ret < 0)
 			goto exit;
 	}
diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c
index d9c65a24eb30..c7bb7d46bbbc 100644
--- a/drivers/pinctrl/pinctrl-utils.c
+++ b/drivers/pinctrl/pinctrl-utils.c
@@ -53,22 +53,22 @@ int pinctrl_utils_reserve_map(struct pinctrl_dev *pctldev,
 }
 EXPORT_SYMBOL_GPL(pinctrl_utils_reserve_map);
 
-int pinctrl_utils_add_map_mux(struct pinctrl_dev *pctldev,
+int pinctrl_utils_add_map_mux_type(struct pinctrl_dev *pctldev,
 		struct pinctrl_map **map, unsigned *reserved_maps,
 		unsigned *num_maps, const char *group,
-		const char *function)
+		const char *function, enum pinctrl_map_type type)
 {
 	if (WARN_ON(*num_maps == *reserved_maps))
 		return -ENOSPC;
 
-	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
+	(*map)[*num_maps].type = type;
 	(*map)[*num_maps].data.mux.group_or_pin = group;
 	(*map)[*num_maps].data.mux.function = function;
 	(*num_maps)++;
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pinctrl_utils_add_map_mux);
+EXPORT_SYMBOL_GPL(pinctrl_utils_add_map_mux_type);
 
 int pinctrl_utils_add_map_configs(struct pinctrl_dev *pctldev,
 		struct pinctrl_map **map, unsigned *reserved_maps,
diff --git a/drivers/pinctrl/pinctrl-utils.h b/drivers/pinctrl/pinctrl-utils.h
index 8f9f2d28c5b8..fc3dfb3245ee 100644
--- a/drivers/pinctrl/pinctrl-utils.h
+++ b/drivers/pinctrl/pinctrl-utils.h
@@ -25,10 +25,10 @@
 int pinctrl_utils_reserve_map(struct pinctrl_dev *pctldev,
 		struct pinctrl_map **map, unsigned *reserved_maps,
 		unsigned *num_maps, unsigned reserve);
-int pinctrl_utils_add_map_mux(struct pinctrl_dev *pctldev,
+int pinctrl_utils_add_map_mux_type(struct pinctrl_dev *pctldev,
 		struct pinctrl_map **map, unsigned *reserved_maps,
 		unsigned *num_maps, const char *group,
-		const char *function);
+		const char *function, enum pinctrl_map_type type);
 int pinctrl_utils_add_map_configs(struct pinctrl_dev *pctldev,
 		struct pinctrl_map **map, unsigned *reserved_maps,
 		unsigned *num_maps, const char *group,
@@ -40,4 +40,14 @@ int pinctrl_utils_add_config(struct pinctrl_dev *pctldev,
 void pinctrl_utils_free_map(struct pinctrl_dev *pctldev,
 		struct pinctrl_map *map, unsigned num_maps);
 
+static inline int pinctrl_utils_add_map_mux(struct pinctrl_dev *pctldev,
+		struct pinctrl_map **map, unsigned *reserved_maps,
+		unsigned *num_maps, const char *group,
+		const char *function)
+{
+	return pinctrl_utils_add_map_mux_type(pctldev, map, reserved_maps,
+					      num_maps, group, function,
+					      PIN_MAP_TYPE_MUX_GROUP);
+}
+
 #endif /* __PINCTRL_UTILS_H__ */
diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 4db9323251e3..7407be0c176a 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5301,7 +5301,8 @@ static int atlas7_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					u32 *num_maps)
 {
 	return pinconf_generic_dt_node_to_map(pctldev, np_config, map,
-				num_maps, PIN_MAP_TYPE_INVALID);
+				num_maps, PIN_MAP_TYPE_INVALID,
+				PIN_MAP_TYPE_MUX_GROUP);
 }
 
 static void atlas7_pinctrl_dt_free_map(struct pinctrl_dev *pctldev,
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 5d8bc7f21c2a..6da4bad1b81c 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -180,10 +180,12 @@ struct pinconf_generic_params {
 int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np, struct pinctrl_map **map,
 		unsigned *reserved_maps, unsigned *num_maps,
-		enum pinctrl_map_type type);
+		enum pinctrl_map_type conf_type,
+		enum pinctrl_map_type mux_type);
 int pinconf_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np_config, struct pinctrl_map **map,
-		unsigned *num_maps, enum pinctrl_map_type type);
+		unsigned *num_maps, enum pinctrl_map_type conf_type,
+		enum pinctrl_map_type mux_type);
 void pinconf_generic_dt_free_map(struct pinctrl_dev *pctldev,
 		struct pinctrl_map *map, unsigned num_maps);
 
@@ -192,7 +194,7 @@ static inline int pinconf_generic_dt_node_to_map_group(
 		struct pinctrl_map **map, unsigned *num_maps)
 {
 	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
-			PIN_MAP_TYPE_CONFIGS_GROUP);
+			PIN_MAP_TYPE_CONFIGS_GROUP, PIN_MAP_TYPE_MUX_GROUP);
 }
 
 static inline int pinconf_generic_dt_node_to_map_pin(
@@ -200,7 +202,7 @@ static inline int pinconf_generic_dt_node_to_map_pin(
 		struct pinctrl_map **map, unsigned *num_maps)
 {
 	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
-			PIN_MAP_TYPE_CONFIGS_PIN);
+			PIN_MAP_TYPE_CONFIGS_PIN, PIN_MAP_TYPE_MUX_GROUP);
 }
 
 static inline int pinconf_generic_dt_node_to_map_all(
@@ -212,7 +214,19 @@ static inline int pinconf_generic_dt_node_to_map_all(
 	 * to infer the map type from the DT properties used.
 	 */
 	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
-			PIN_MAP_TYPE_INVALID);
+			PIN_MAP_TYPE_INVALID, PIN_MAP_TYPE_MUX_GROUP);
+}
+
+static inline int pinctrl_generic_dt_node_to_map_all(
+		struct pinctrl_dev *pctldev, struct device_node *np_config,
+		struct pinctrl_map **map, unsigned *num_maps)
+{
+	/*
+	 * passing the type as PIN_MAP_TYPE_INVALID causes the underlying parser
+	 * to infer the map type from the DT properties used.
+	 */
+	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
+			PIN_MAP_TYPE_INVALID, PIN_MAP_TYPE_INVALID);
 }
 #endif
 
-- 
2.11.0
