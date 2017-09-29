From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH RFC 3/4] pinctrl: Add support for muxing individual pins
Date: Fri, 29 Sep 2017 11:15:02 +0100
Message-ID: <20170929101503.6769-4-ckeepax@opensource.cirrus.com>
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

Currently pinmuxing can only be applied to groups, this has lead to
several drivers within the kernel adding many pin groups that just
contain a single pin to allow muxing of individual pins.

Add support to the core for muxing individual pins. Groups are still
used as a mechanism to determine if a function is suitable to be
applied to a specific pin. For example a pin might be in the GPIO
group allowing it to be muxed to a GPIO but it would now be possible
to just mux one pin from that group.

This change makes no changes to the current DT parsing, everything
will still be parsed into a group type map.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/pinctrl/core.c          |  26 ++++-
 drivers/pinctrl/core.h          |   1 +
 drivers/pinctrl/pinmux.c        | 218 +++++++++++++++++++++++++++++-----------
 include/linux/pinctrl/machine.h |   1 +
 include/linux/pinctrl/pinmux.h  |   7 ++
 5 files changed, 192 insertions(+), 61 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 56fbe4c3e800..17994b690bc8 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -950,6 +950,7 @@ static int add_setting(struct pinctrl *p, struct pinctrl_dev *pctldev,
 	setting->dev_name = map->dev_name;
 
 	switch (map->type) {
+	case PIN_MAP_TYPE_MUX_PIN:
 	case PIN_MAP_TYPE_MUX_GROUP:
 		ret = pinmux_map_to_setting(map, setting);
 		break;
@@ -1104,6 +1105,7 @@ static void pinctrl_free_setting(bool disable_setting,
 				 struct pinctrl_setting *setting)
 {
 	switch (setting->type) {
+	case PIN_MAP_TYPE_MUX_PIN:
 	case PIN_MAP_TYPE_MUX_GROUP:
 		if (disable_setting)
 			pinmux_disable_setting(setting);
@@ -1210,9 +1212,14 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 		 * to pinmux_enable_setting() in the loop below.
 		 */
 		list_for_each_entry(setting, &p->state->settings, node) {
-			if (setting->type != PIN_MAP_TYPE_MUX_GROUP)
-				continue;
-			pinmux_disable_setting(setting);
+			switch (setting->type) {
+			case PIN_MAP_TYPE_MUX_GROUP:
+			case PIN_MAP_TYPE_MUX_PIN:
+				pinmux_disable_setting(setting);
+				break;
+			default:
+				break;
+			}
 		}
 	}
 
@@ -1221,6 +1228,7 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 	/* Apply all the settings for the new state */
 	list_for_each_entry(setting, &state->settings, node) {
 		switch (setting->type) {
+		case PIN_MAP_TYPE_MUX_PIN:
 		case PIN_MAP_TYPE_MUX_GROUP:
 			ret = pinmux_enable_setting(setting);
 			break;
@@ -1255,8 +1263,14 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 		 * "unmux a pin"!), but it's not a big deal since the pins
 		 * are free to be muxed by another apply_setting.
 		 */
-		if (setting2->type == PIN_MAP_TYPE_MUX_GROUP)
+		switch (setting2->type) {
+		case PIN_MAP_TYPE_MUX_GROUP:
+		case PIN_MAP_TYPE_MUX_PIN:
 			pinmux_disable_setting(setting2);
+			break;
+		default:
+			break;
+		}
 	}
 
 	/* There's no infinite recursive loop here because p->state is NULL */
@@ -1353,6 +1367,7 @@ int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_maps,
 		switch (maps[i].type) {
 		case PIN_MAP_TYPE_DUMMY_STATE:
 			break;
+		case PIN_MAP_TYPE_MUX_PIN:
 		case PIN_MAP_TYPE_MUX_GROUP:
 			ret = pinmux_validate_map(&maps[i], i);
 			if (ret < 0)
@@ -1686,6 +1701,7 @@ static inline const char *map_type(enum pinctrl_map_type type)
 	static const char * const names[] = {
 		"INVALID",
 		"DUMMY_STATE",
+		"MUX_PIN",
 		"MUX_GROUP",
 		"CONFIGS_PIN",
 		"CONFIGS_GROUP",
@@ -1716,6 +1732,7 @@ static int pinctrl_maps_show(struct seq_file *s, void *what)
 				   map->ctrl_dev_name);
 
 		switch (map->type) {
+		case PIN_MAP_TYPE_MUX_PIN:
 		case PIN_MAP_TYPE_MUX_GROUP:
 			pinmux_show_map(s, map);
 			break;
@@ -1760,6 +1777,7 @@ static int pinctrl_show(struct seq_file *s, void *what)
 					   pinctrl_dev_get_name(pctldev));
 
 				switch (setting->type) {
+				case PIN_MAP_TYPE_MUX_PIN:
 				case PIN_MAP_TYPE_MUX_GROUP:
 					pinmux_show_setting(s, setting);
 					break;
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 96a003a719e3..863132d7b217 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -166,6 +166,7 @@ struct pin_desc {
 #ifdef CONFIG_PINMUX
 	unsigned mux_usecount;
 	const char *mux_owner;
+	enum pinctrl_map_type mux_type;
 	const struct pinctrl_setting_mux *mux_setting;
 	const char *gpio_owner;
 #endif
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 699b3e406d10..cb007c56c375 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -220,6 +220,7 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		owner = desc->mux_owner;
 		desc->mux_owner = NULL;
 		desc->mux_setting = NULL;
+		desc->mux_type = PIN_MAP_TYPE_INVALID;
 	}
 
 	module_put(pctldev->owner);
@@ -312,6 +313,52 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
+static int pinmux_get_group_selector(struct pinctrl_dev *pctldev,
+				     const char *group,
+				     char const * const *groups,
+				     unsigned int num_groups)
+{
+	int ret;
+
+	ret = match_string(groups, num_groups, group);
+	if (ret < 0)
+		return ret;
+
+	return pinctrl_get_group_selector(pctldev, group);
+}
+
+static int pinmux_get_pin_selector(struct pinctrl_dev *pctldev,
+				   const char *pin,
+				   char const * const *groups,
+				   unsigned int num_groups)
+{
+	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
+	int i, j;
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	for (i = 0; i < num_groups; ++i) {
+		const unsigned int *pins = NULL;
+		unsigned int num_pins = 0;
+
+		ret = pinctrl_get_group_selector(pctldev, groups[i]);
+		if (ret < 0)
+			return ret;
+
+		if (pctlops->get_group_pins)
+			ret = pctlops->get_group_pins(pctldev, ret,
+						      &pins, &num_pins);
+
+		for (j = 0; j < num_pins; ++j)
+			if (!strcmp(pin_desc_get(pctldev, pins[j])->name, pin))
+				return pins[j];
+	}
+
+	return -EINVAL;
+}
+
 int pinmux_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting)
 {
@@ -348,9 +395,14 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 			map->data.mux.function);
 		return -EINVAL;
 	}
-	if (map->data.mux.group_or_pin) {
+
+	if (map->type == PIN_MAP_TYPE_MUX_GROUP) {
 		group = map->data.mux.group_or_pin;
-		ret = match_string(groups, num_groups, group);
+		if (!group)
+			group = groups[0];
+
+		ret = pinmux_get_group_selector(pctldev, group,
+						groups, num_groups);
 		if (ret < 0) {
 			dev_err(pctldev->dev,
 				"invalid group \"%s\" for function \"%s\"\n",
@@ -358,15 +410,18 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 			return ret;
 		}
 	} else {
-		group = groups[0];
+		ret = pinmux_get_pin_selector(pctldev,
+					      map->data.mux.group_or_pin,
+					      groups, num_groups);
+		if (ret < 0) {
+			dev_err(pctldev->dev,
+				"invalid pin \"%s\" for function \"%s\"\n",
+				map->data.mux.group_or_pin,
+				map->data.mux.function);
+			return ret;
+		}
 	}
 
-	ret = pinctrl_get_group_selector(pctldev, group);
-	if (ret < 0) {
-		dev_err(pctldev->dev, "invalid group %s in map table\n",
-			map->data.mux.group_or_pin);
-		return ret;
-	}
 	setting->data.mux.group_or_pin = ret;
 
 	return 0;
@@ -382,27 +437,32 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux = &setting->data.mux;
 	int ret = 0;
 	const unsigned *pins = NULL;
 	unsigned num_pins = 0;
 	int i;
 	struct pin_desc *desc;
 
-	if (pctlops->get_group_pins)
-		ret = pctlops->get_group_pins(pctldev,
-					      setting->data.mux.group_or_pin,
-					      &pins, &num_pins);
-
-	if (ret) {
-		const char *gname;
+	if (setting->type == PIN_MAP_TYPE_MUX_GROUP) {
+		if (pctlops->get_group_pins)
+			ret = pctlops->get_group_pins(pctldev,
+						      mux->group_or_pin,
+						      &pins, &num_pins);
+		if (ret) {
+			const char *gname;
 
-		/* errors only affect debug data, so just warn */
-		gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group_or_pin);
-		dev_warn(pctldev->dev,
-			 "could not get pins for group %s\n",
-			 gname);
-		num_pins = 0;
+			/* errors only affect debug data, so just warn */
+			gname = pctlops->get_group_name(pctldev,
+							mux->group_or_pin);
+			dev_warn(pctldev->dev,
+				 "could not get pins for group %s\n",
+				 gname);
+			num_pins = 0;
+		}
+	} else {
+		pins = &mux->group_or_pin;
+		num_pins = 1;
 	}
 
 	/* Try to allocate all pins in this group, one by one */
@@ -415,7 +475,7 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 			desc = pin_desc_get(pctldev, pins[i]);
 			pname = desc ? desc->name : "non-existing";
 			gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group_or_pin);
+							mux->group_or_pin);
 			dev_err(pctldev->dev,
 				"could not request pin %d (%s) from group %s "
 				" on device %s\n",
@@ -434,11 +494,20 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 				 pins[i]);
 			continue;
 		}
-		desc->mux_setting = &(setting->data.mux);
+		desc->mux_setting = mux;
+		desc->mux_type = setting->type;
 	}
 
-	ret = ops->set_mux(pctldev, setting->data.mux.func,
-			   setting->data.mux.group_or_pin);
+	if (setting->type == PIN_MAP_TYPE_MUX_GROUP) {
+		ret = ops->set_mux(pctldev, mux->func, mux->group_or_pin);
+	} else {
+		if (!ops->set_mux_pin) {
+			dev_err(pctldev->dev, "Missing set_mux_pin op\n");
+			return -ENOTSUPP;
+		}
+
+		ret = ops->set_mux_pin(pctldev, mux->func, mux->group_or_pin);
+	}
 
 	if (ret)
 		goto err_set_mux;
@@ -448,8 +517,10 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 err_set_mux:
 	for (i = 0; i < num_pins; i++) {
 		desc = pin_desc_get(pctldev, pins[i]);
-		if (desc)
+		if (desc) {
 			desc->mux_setting = NULL;
+			desc->mux_type = PIN_MAP_TYPE_INVALID;
+		}
 	}
 err_pin_request:
 	/* On error release all taken pins */
@@ -463,26 +534,32 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
+	const struct pinctrl_setting_mux *mux = &setting->data.mux;
 	int ret = 0;
 	const unsigned *pins = NULL;
 	unsigned num_pins = 0;
 	int i;
 	struct pin_desc *desc;
 
-	if (pctlops->get_group_pins)
-		ret = pctlops->get_group_pins(pctldev,
-					      setting->data.mux.group_or_pin,
-					      &pins, &num_pins);
-	if (ret) {
-		const char *gname;
+	if (setting->type == PIN_MAP_TYPE_MUX_GROUP) {
+		if (pctlops->get_group_pins)
+			ret = pctlops->get_group_pins(pctldev,
+						      mux->group_or_pin,
+						      &pins, &num_pins);
+		if (ret) {
+			const char *gname;
 
-		/* errors only affect debug data, so just warn */
-		gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group_or_pin);
-		dev_warn(pctldev->dev,
-			 "could not get pins for group %s\n",
-			 gname);
-		num_pins = 0;
+			/* errors only affect debug data, so just warn */
+			gname = pctlops->get_group_name(pctldev,
+							mux->group_or_pin);
+			dev_warn(pctldev->dev,
+				 "could not get pins for group %s\n",
+				 gname);
+			num_pins = 0;
+		}
+	} else {
+		pins = &mux->group_or_pin;
+		num_pins = 1;
 	}
 
 	/* Flag the descs that no setting is active */
@@ -494,15 +571,16 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 				 pins[i]);
 			continue;
 		}
-		if (desc->mux_setting == &(setting->data.mux)) {
+		if (desc->mux_setting == mux) {
 			desc->mux_setting = NULL;
+			desc->mux_type = PIN_MAP_TYPE_INVALID;
 			/* And release the pin */
 			pin_free(pctldev, pins[i], NULL);
 		} else {
 			const char *gname;
 
 			gname = pctlops->get_group_name(pctldev,
-						setting->data.mux.group_or_pin);
+							mux->group_or_pin);
 			dev_warn(pctldev->dev,
 				 "not freeing pin %d (%s) as part of "
 				 "deactivating group %s - it is already "
@@ -595,14 +673,27 @@ static int pinmux_pin_show(struct seq_file *s, unsigned int pin)
 	}
 
 	/* If mux: print function+group claiming the pin */
-	if (desc->mux_setting)
-		seq_printf(s, " function %s group %s\n",
-			   pmxops->get_function_name(pctldev,
-				desc->mux_setting->func),
-			   pctlops->get_group_name(pctldev,
-				desc->mux_setting->group_or_pin));
-	else
+	if (desc->mux_setting) {
+		const struct pinctrl_setting_mux *mux = desc->mux_setting;
+
+		seq_printf(s, " function %s",
+			   pmxops->get_function_name(pctldev, mux->func));
+
+		switch (desc->mux_type) {
+		case PIN_MAP_TYPE_MUX_GROUP:
+			seq_printf(s, " group %s\n",
+				   pctlops->get_group_name(pctldev,
+							   mux->group_or_pin));
+			break;
+		case PIN_MAP_TYPE_MUX_PIN:
+			seq_printf(s, " pin %s\n", desc->name);
+			break;
+		default:
+			break;
+		}
+	} else {
 		seq_puts(s, "\n");
+	}
 
 	return 0;
 }
@@ -639,7 +730,8 @@ void pinmux_show_map(struct seq_file *s, const struct pinctrl_map *map)
 {
 	const struct pinctrl_map_mux *mux = &map->data.mux;
 
-	seq_printf(s, "group %s\nfunction %s\n",
+	seq_printf(s, "%s %s\nfunction %s\n",
+		   map->type == PIN_MAP_TYPE_MUX_PIN ? "pin" : "group",
 		   mux->group_or_pin ? mux->group_or_pin : "(default)",
 		   mux->function);
 }
@@ -648,15 +740,27 @@ void pinmux_show_setting(struct seq_file *s,
 			 const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
+	const struct pinctrl_setting_mux *mux = &setting->data.mux;
 	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
 
-	seq_printf(s, "group: %s (%u) function: %s (%u)\n",
-		   pctlops->get_group_name(pctldev,
-					   setting->data.mux.group_or_pin),
-		   setting->data.mux.group_or_pin,
-		   pmxops->get_function_name(pctldev, setting->data.mux.func),
-		   setting->data.mux.func);
+	switch (setting->type) {
+	case PIN_MAP_TYPE_MUX_GROUP:
+		seq_printf(s, "group: %s (%u)",
+			   pctlops->get_group_name(pctldev, mux->group_or_pin),
+			   mux->group_or_pin);
+		break;
+	case PIN_MAP_TYPE_MUX_PIN:
+		seq_printf(s, "pin: %s (%u)",
+			   pin_desc_get(pctldev, mux->group_or_pin)->name,
+			   mux->group_or_pin);
+		break;
+	default:
+		break;
+	}
+
+	seq_printf(s, " function: %s (%u)\n",
+		   pmxops->get_function_name(pctldev, mux->func), mux->func);
 }
 
 static int pinmux_functions_open(struct inode *inode, struct file *file)
diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index ec58c3647eb8..c7e50fa8434e 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -19,6 +19,7 @@
 enum pinctrl_map_type {
 	PIN_MAP_TYPE_INVALID,
 	PIN_MAP_TYPE_DUMMY_STATE,
+	PIN_MAP_TYPE_MUX_PIN,
 	PIN_MAP_TYPE_MUX_GROUP,
 	PIN_MAP_TYPE_CONFIGS_PIN,
 	PIN_MAP_TYPE_CONFIGS_GROUP,
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index ace60d775b20..1c315dcc1992 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -45,6 +45,11 @@ struct pinctrl_dev;
  *	are handled by the pinmux subsystem. The @func_selector selects a
  *	certain function whereas @group_selector selects a certain set of pins
  *	to be used. On simple controllers the latter argument may be ignored
+ * @set_mux_pin: enable a certain muxing function with a certain pin. The driver
+ *	does not need to figure out whether enabling this function conflicts
+ *	some other use of the pin, such collisions are handled by the pinmux
+ *	subsystem. The @func_selector selects a certain function whereas
+ *	@pin_selector selects a certain pin to be used.
  * @gpio_request_enable: requests and enables GPIO on a certain pin.
  *	Implement this only if you can mux every pin individually as GPIO. The
  *	affected GPIO range is passed along with an offset(pin number) into that
@@ -72,6 +77,8 @@ struct pinmux_ops {
 				  unsigned *num_groups);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned func_selector,
 			unsigned group_selector);
+	int (*set_mux_pin) (struct pinctrl_dev *pctldev, unsigned func_selector,
+			    unsigned pin_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
 				    struct pinctrl_gpio_range *range,
 				    unsigned offset);
-- 
2.11.0
