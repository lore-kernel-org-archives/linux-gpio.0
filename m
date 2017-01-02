From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [PATCH 1/2] pinctrl: imx: use generic pinctrl helpers for managing groups
Date: Mon,  2 Jan 2017 19:20:21 +0100
Message-ID: <20170102182022.2047-2-gary.bisson@boundarydevices.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, fabio.estevam@nxp.com
Cc: tony@atomide.com, shawnguo@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Gary Bisson <gary.bisson@boundarydevices.com>
List-Id: linux-gpio@vger.kernel.org

Now using group_desc structure instead of imx_pin_group.

Also leveraging generic functions to retrieve groups count/name/pins.

The imx_free_pingroups function can be removed since it is now handled by
the core driver during unregister.

Finally the device tree parsing is moved after the pinctrl driver registration
since this latter initializes the radix trees.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 drivers/pinctrl/freescale/Kconfig       |   1 +
 drivers/pinctrl/freescale/pinctrl-imx.c | 190 +++++++++++---------------------
 drivers/pinctrl/freescale/pinctrl-imx.h |  19 +---
 3 files changed, 69 insertions(+), 141 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index fc8cbf611723..cb50e21615da 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -1,5 +1,6 @@
 config PINCTRL_IMX
 	bool
+	select GENERIC_PINCTRL_GROUPS
 	select PINMUX
 	select PINCONF
 	select REGMAP
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index e832a2c7af68..62c20f661fed 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -45,15 +45,15 @@ struct imx_pinctrl {
 	struct imx_pinctrl_soc_info *info;
 };
 
-static inline const struct imx_pin_group *imx_pinctrl_find_group_by_name(
-				struct imx_pinctrl_soc_info *info,
+static inline const struct group_desc *imx_pinctrl_find_group_by_name(
+				struct pinctrl_dev *pctldev,
 				const char *name)
 {
-	const struct imx_pin_group *grp = NULL;
+	const struct group_desc *grp = NULL;
 	int i;
 
-	for (i = 0; i < info->ngroups; i++) {
-		grp = radix_tree_lookup(&info->pgtree, i);
+	for (i = 0; i < pctldev->num_groups; i++) {
+		grp = pinctrl_generic_get_group(pctldev, i);
 		if (grp && !strcmp(grp->name, name))
 			break;
 	}
@@ -61,49 +61,6 @@ static inline const struct imx_pin_group *imx_pinctrl_find_group_by_name(
 	return grp;
 }
 
-static int imx_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct imx_pinctrl_soc_info *info = ipctl->info;
-
-	return info->ngroups;
-}
-
-static const char *imx_get_group_name(struct pinctrl_dev *pctldev,
-				       unsigned selector)
-{
-	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct imx_pin_group *grp = NULL;
-
-	grp = radix_tree_lookup(&info->pgtree, selector);
-	if (!grp)
-		return NULL;
-
-	return grp->name;
-}
-
-static int imx_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
-			       const unsigned **pins,
-			       unsigned *npins)
-{
-	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct imx_pin_group *grp = NULL;
-
-	if (selector >= info->ngroups)
-		return -EINVAL;
-
-	grp = radix_tree_lookup(&info->pgtree, selector);
-	if (!grp)
-		return -EINVAL;
-
-	*pins = grp->pin_ids;
-	*npins = grp->npins;
-
-	return 0;
-}
-
 static void imx_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 		   unsigned offset)
 {
@@ -116,7 +73,7 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	struct imx_pinctrl_soc_info *info = ipctl->info;
-	const struct imx_pin_group *grp;
+	const struct group_desc *grp;
 	struct pinctrl_map *new_map;
 	struct device_node *parent;
 	int map_num = 1;
@@ -126,15 +83,17 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	 * first find the group of this node and check if we need create
 	 * config maps for pins
 	 */
-	grp = imx_pinctrl_find_group_by_name(info, np->name);
+	grp = imx_pinctrl_find_group_by_name(pctldev, np->name);
 	if (!grp) {
 		dev_err(info->dev, "unable to find group for node %s\n",
 			np->name);
 		return -EINVAL;
 	}
 
-	for (i = 0; i < grp->npins; i++) {
-		if (!(grp->pins[i].config & IMX_NO_PAD_CTL))
+	for (i = 0; i < grp->num_pins; i++) {
+		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
+
+		if (!(pin->config & IMX_NO_PAD_CTL))
 			map_num++;
 	}
 
@@ -158,12 +117,14 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	/* create config map */
 	new_map++;
-	for (i = j = 0; i < grp->npins; i++) {
-		if (!(grp->pins[i].config & IMX_NO_PAD_CTL)) {
+	for (i = j = 0; i < grp->num_pins; i++) {
+		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
+
+		if (!(pin->config & IMX_NO_PAD_CTL)) {
 			new_map[j].type = PIN_MAP_TYPE_CONFIGS_PIN;
 			new_map[j].data.configs.group_or_pin =
-					pin_get_name(pctldev, grp->pins[i].pin);
-			new_map[j].data.configs.configs = &grp->pins[i].config;
+					pin_get_name(pctldev, pin->pin);
+			new_map[j].data.configs.configs = &pin->config;
 			new_map[j].data.configs.num_configs = 1;
 			j++;
 		}
@@ -182,9 +143,9 @@ static void imx_dt_free_map(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinctrl_ops imx_pctrl_ops = {
-	.get_groups_count = imx_get_groups_count,
-	.get_group_name = imx_get_group_name,
-	.get_group_pins = imx_get_group_pins,
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
 	.pin_dbg_show = imx_pin_dbg_show,
 	.dt_node_to_map = imx_dt_node_to_map,
 	.dt_free_map = imx_dt_free_map,
@@ -199,14 +160,14 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	const struct imx_pin_reg *pin_reg;
 	unsigned int npins, pin_id;
 	int i;
-	struct imx_pin_group *grp = NULL;
+	struct group_desc *grp = NULL;
 	struct imx_pmx_func *func = NULL;
 
 	/*
 	 * Configure the mux mode for each pin in the group for a specific
 	 * function.
 	 */
-	grp = radix_tree_lookup(&info->pgtree, group);
+	grp = pinctrl_generic_get_group(pctldev, group);
 	if (!grp)
 		return -EINVAL;
 
@@ -214,13 +175,14 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	if (!func)
 		return -EINVAL;
 
-	npins = grp->npins;
+	npins = grp->num_pins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
 		func->name, grp->name);
 
 	for (i = 0; i < npins; i++) {
-		struct imx_pin *pin = &grp->pins[i];
+		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
+
 		pin_id = pin->pin;
 		pin_reg = &info->pin_regs[pin_id];
 
@@ -335,7 +297,7 @@ static int imx_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg;
-	struct imx_pin_group *grp;
+	struct group_desc *grp;
 	struct imx_pin *imx_pin;
 	unsigned int pin, group;
 	u32 reg;
@@ -349,12 +311,12 @@ static int imx_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	/* Find the pinctrl config with GPIO mux mode for the requested pin */
-	for (group = 0; group < info->ngroups; group++) {
-		grp = radix_tree_lookup(&info->pgtree, group);
+	for (group = 0; group < pctldev->num_groups; group++) {
+		grp = pinctrl_generic_get_group(pctldev, group);
 		if (!grp)
 			continue;
-		for (pin = 0; pin < grp->npins; pin++) {
-			imx_pin = &grp->pins[pin];
+		for (pin = 0; pin < grp->num_pins; pin++) {
+			imx_pin = &((struct imx_pin *)(grp->data))[pin];
 			if (imx_pin->pin == offset && !imx_pin->mux_mode)
 				goto mux_pin;
 		}
@@ -512,23 +474,22 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 					 struct seq_file *s, unsigned group)
 {
-	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct imx_pin_group *grp;
+	struct group_desc *grp;
 	unsigned long config;
 	const char *name;
 	int i, ret;
 
-	if (group > info->ngroups)
+	if (group > pctldev->num_groups)
 		return;
 
 	seq_printf(s, "\n");
-	grp = radix_tree_lookup(&info->pgtree, group);
+	grp = pinctrl_generic_get_group(pctldev, group);
 	if (!grp)
 		return;
 
-	for (i = 0; i < grp->npins; i++) {
-		struct imx_pin *pin = &grp->pins[i];
+	for (i = 0; i < grp->num_pins; i++) {
+		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
+
 		name = pin_get_name(pctldev, pin->pin);
 		ret = imx_pinconf_get(pctldev, pin->pin, &config);
 		if (ret)
@@ -552,7 +513,7 @@ static const struct pinconf_ops imx_pinconf_ops = {
 #define SHARE_FSL_PIN_SIZE 20
 
 static int imx_pinctrl_parse_groups(struct device_node *np,
-				    struct imx_pin_group *grp,
+				    struct group_desc *grp,
 				    struct imx_pinctrl_soc_info *info,
 				    u32 index)
 {
@@ -586,20 +547,20 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		return -EINVAL;
 	}
 
-	grp->npins = size / pin_size;
-	grp->pins = devm_kzalloc(info->dev, grp->npins * sizeof(struct imx_pin),
-				GFP_KERNEL);
-	grp->pin_ids = devm_kzalloc(info->dev, grp->npins * sizeof(unsigned int),
-				GFP_KERNEL);
-	if (!grp->pins || ! grp->pin_ids)
+	grp->num_pins = size / pin_size;
+	grp->data = devm_kzalloc(info->dev, grp->num_pins *
+				 sizeof(struct imx_pin), GFP_KERNEL);
+	grp->pins = devm_kzalloc(info->dev, grp->num_pins *
+				 sizeof(unsigned int), GFP_KERNEL);
+	if (!grp->pins || !grp->data)
 		return -ENOMEM;
 
-	for (i = 0; i < grp->npins; i++) {
+	for (i = 0; i < grp->num_pins; i++) {
 		u32 mux_reg = be32_to_cpu(*list++);
 		u32 conf_reg;
 		unsigned int pin_id;
 		struct imx_pin_reg *pin_reg;
-		struct imx_pin *pin = &grp->pins[i];
+		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
 
 		if (!(info->flags & ZERO_OFFSET_VALID) && !mux_reg)
 			mux_reg = -1;
@@ -615,7 +576,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
 		pin_reg = &info->pin_regs[pin_id];
 		pin->pin = pin_id;
-		grp->pin_ids[i] = pin_id;
+		grp->pins[i] = pin_id;
 		pin_reg->mux_reg = mux_reg;
 		pin_reg->conf_reg = conf_reg;
 		pin->input_reg = be32_to_cpu(*list++);
@@ -636,12 +597,14 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 }
 
 static int imx_pinctrl_parse_functions(struct device_node *np,
-				       struct imx_pinctrl_soc_info *info,
+				       struct imx_pinctrl *ipctl,
 				       u32 index)
 {
+	struct pinctrl_dev *pctl = ipctl->pctl;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	struct device_node *child;
 	struct imx_pmx_func *func;
-	struct imx_pin_group *grp;
+	struct group_desc *grp;
 	u32 i = 0;
 
 	dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);
@@ -663,13 +626,14 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	for_each_child_of_node(np, child) {
 		func->groups[i] = child->name;
 
-		grp = devm_kzalloc(info->dev, sizeof(struct imx_pin_group),
+		grp = devm_kzalloc(info->dev, sizeof(struct group_desc),
 				   GFP_KERNEL);
 		if (!grp)
 			return -ENOMEM;
 
 		mutex_lock(&info->mutex);
-		radix_tree_insert(&info->pgtree, info->group_index++, grp);
+		radix_tree_insert(&pctl->pin_group_tree,
+				  info->group_index++, grp);
 		mutex_unlock(&info->mutex);
 
 		imx_pinctrl_parse_groups(child, grp, info, i++);
@@ -702,10 +666,12 @@ static bool imx_pinctrl_dt_is_flat_functions(struct device_node *np)
 }
 
 static int imx_pinctrl_probe_dt(struct platform_device *pdev,
-				struct imx_pinctrl_soc_info *info)
+				struct imx_pinctrl *ipctl)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *child;
+	struct pinctrl_dev *pctl = ipctl->pctl;
+	struct imx_pinctrl_soc_info *info = ipctl->info;
 	u32 nfuncs = 0;
 	u32 i = 0;
 	bool flat_funcs;
@@ -740,19 +706,19 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 
 	info->group_index = 0;
 	if (flat_funcs) {
-		info->ngroups = of_get_child_count(np);
+		pctl->num_groups = of_get_child_count(np);
 	} else {
-		info->ngroups = 0;
+		pctl->num_groups = 0;
 		for_each_child_of_node(np, child)
-			info->ngroups += of_get_child_count(child);
+			pctl->num_groups += of_get_child_count(child);
 	}
 
 	if (flat_funcs) {
-		imx_pinctrl_parse_functions(np, info, 0);
+		imx_pinctrl_parse_functions(np, ipctl, 0);
 	} else {
 		i = 0;
 		for_each_child_of_node(np, child)
-			imx_pinctrl_parse_functions(child, info, i++);
+			imx_pinctrl_parse_functions(child, ipctl, i++);
 	}
 
 	return 0;
@@ -779,26 +745,6 @@ static void imx_free_funcs(struct imx_pinctrl_soc_info *info)
 }
 
 /*
- * imx_free_pingroups() - free memory used by pingroups
- * @info: info driver instance
- */
-static void imx_free_pingroups(struct imx_pinctrl_soc_info *info)
-{
-	int i;
-
-	mutex_lock(&info->mutex);
-	for (i = 0; i < info->ngroups; i++) {
-		struct imx_pin_group *pingroup;
-
-		pingroup = radix_tree_lookup(&info->pgtree, i);
-		if (!pingroup)
-			continue;
-		radix_tree_delete(&info->pgtree, i);
-	}
-	mutex_unlock(&info->mutex);
-}
-
-/*
  * imx_free_resources() - free memory used by this driver
  * @info: info driver instance
  */
@@ -808,7 +754,6 @@ static void imx_free_resources(struct imx_pinctrl *ipctl)
 		pinctrl_unregister(ipctl->pctl);
 
 	imx_free_funcs(ipctl->info);
-	imx_free_pingroups(ipctl->info);
 }
 
 int imx_pinctrl_probe(struct platform_device *pdev,
@@ -886,15 +831,8 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 
 	mutex_init(&info->mutex);
 
-	INIT_RADIX_TREE(&info->pgtree, GFP_KERNEL);
 	INIT_RADIX_TREE(&info->ftree, GFP_KERNEL);
 
-	ret = imx_pinctrl_probe_dt(pdev, info);
-	if (ret) {
-		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		goto free;
-	}
-
 	ipctl->info = info;
 	ipctl->dev = info->dev;
 	platform_set_drvdata(pdev, ipctl);
@@ -906,6 +844,12 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 		goto free;
 	}
 
+	ret = imx_pinctrl_probe_dt(pdev, ipctl);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to probe dt properties\n");
+		goto free;
+	}
+
 	dev_info(&pdev->dev, "initialized IMX pinctrl driver\n");
 
 	return 0;
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 62aa8f8f57e9..3c51db15223b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -18,7 +18,7 @@
 struct platform_device;
 
 /**
- * struct imx_pin_group - describes a single i.MX pin
+ * struct imx_pin - describes a single i.MX pin
  * @pin: the pin_id of this pin
  * @mux_mode: the mux mode for this pin.
  * @input_reg: the select input register offset for this pin if any
@@ -35,21 +35,6 @@ struct imx_pin {
 };
 
 /**
- * struct imx_pin_group - describes an IMX pin group
- * @name: the name of this specific pin group
- * @npins: the number of pins in this group array, i.e. the number of
- *	elements in .pins so we can iterate over that array
- * @pin_ids: array of pin_ids. pinctrl forces us to maintain such an array
- * @pins: array of pins
- */
-struct imx_pin_group {
-	const char *name;
-	unsigned npins;
-	unsigned int *pin_ids;
-	struct imx_pin *pins;
-};
-
-/**
  * struct imx_pmx_func - describes IMX pinmux functions
  * @name: the name of this specific function
  * @groups: corresponding pin groups
@@ -76,13 +61,11 @@ struct imx_pinctrl_soc_info {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	struct imx_pin_reg *pin_regs;
-	unsigned int ngroups;
 	unsigned int group_index;
 	unsigned int nfunctions;
 	unsigned int flags;
 	const char *gpr_compatible;
 	struct radix_tree_root ftree;
-	struct radix_tree_root pgtree;
 	struct mutex mutex;
 };
 
-- 
2.11.0
