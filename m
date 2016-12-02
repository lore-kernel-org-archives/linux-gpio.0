From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [RFC v2 2/3] pinctrl: imx: use radix trees for groups and functions
Date: Fri,  2 Dec 2016 17:35:19 +0100
Message-ID: <20161202163520.22927-3-gary.bisson@boundarydevices.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161202163520.22927-1-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, fabio.estevam@nxp.com
Cc: shawnguo@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, pantelis.antoniou@konsulko.com, vladimir_zapolskiy@mentor.com, Gary Bisson <gary.bisson@boundarydevices.com>
List-Id: linux-gpio@vger.kernel.org

This change is inspired from the pinctrl-single architecture.

The problem with current implementation is that it isn't possible
to add/remove functions and/or groups dynamically. The radix tree
offers an easy way to do so. The intent is to offer a follow-up
patch later that will enable the use of pinctrl nodes in dt-overlays.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 164 +++++++++++++++++++++++++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h |   5 +-
 2 files changed, 141 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 8697c1b..e832a2c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -53,10 +53,9 @@ static inline const struct imx_pin_group *imx_pinctrl_find_group_by_name(
 	int i;
 
 	for (i = 0; i < info->ngroups; i++) {
-		if (!strcmp(info->groups[i].name, name)) {
-			grp = &info->groups[i];
+		grp = radix_tree_lookup(&info->pgtree, i);
+		if (grp && !strcmp(grp->name, name))
 			break;
-		}
 	}
 
 	return grp;
@@ -75,8 +74,13 @@ static const char *imx_get_group_name(struct pinctrl_dev *pctldev,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pin_group *grp = NULL;
+
+	grp = radix_tree_lookup(&info->pgtree, selector);
+	if (!grp)
+		return NULL;
 
-	return info->groups[selector].name;
+	return grp->name;
 }
 
 static int imx_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
@@ -85,12 +89,17 @@ static int imx_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pin_group *grp = NULL;
 
 	if (selector >= info->ngroups)
 		return -EINVAL;
 
-	*pins = info->groups[selector].pin_ids;
-	*npins = info->groups[selector].npins;
+	grp = radix_tree_lookup(&info->pgtree, selector);
+	if (!grp)
+		return -EINVAL;
+
+	*pins = grp->pin_ids;
+	*npins = grp->npins;
 
 	return 0;
 }
@@ -190,17 +199,25 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	const struct imx_pin_reg *pin_reg;
 	unsigned int npins, pin_id;
 	int i;
-	struct imx_pin_group *grp;
+	struct imx_pin_group *grp = NULL;
+	struct imx_pmx_func *func = NULL;
 
 	/*
 	 * Configure the mux mode for each pin in the group for a specific
 	 * function.
 	 */
-	grp = &info->groups[group];
+	grp = radix_tree_lookup(&info->pgtree, group);
+	if (!grp)
+		return -EINVAL;
+
+	func = radix_tree_lookup(&info->ftree, selector);
+	if (!func)
+		return -EINVAL;
+
 	npins = grp->npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		info->functions[selector].name, grp->name);
+		func->name, grp->name);
 
 	for (i = 0; i < npins; i++) {
 		struct imx_pin *pin = &grp->pins[i];
@@ -285,8 +302,13 @@ static const char *imx_pmx_get_func_name(struct pinctrl_dev *pctldev,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pmx_func *func = NULL;
+
+	func = radix_tree_lookup(&info->ftree, selector);
+	if (!func)
+		return NULL;
 
-	return info->functions[selector].name;
+	return func->name;
 }
 
 static int imx_pmx_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
@@ -295,9 +317,14 @@ static int imx_pmx_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct imx_pmx_func *func = NULL;
+
+	func = radix_tree_lookup(&info->ftree, selector);
+	if (!func)
+		return -EINVAL;
 
-	*groups = info->functions[selector].groups;
-	*num_groups = info->functions[selector].num_groups;
+	*groups = func->groups;
+	*num_groups = func->num_groups;
 
 	return 0;
 }
@@ -323,7 +350,9 @@ static int imx_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	/* Find the pinctrl config with GPIO mux mode for the requested pin */
 	for (group = 0; group < info->ngroups; group++) {
-		grp = &info->groups[group];
+		grp = radix_tree_lookup(&info->pgtree, group);
+		if (!grp)
+			continue;
 		for (pin = 0; pin < grp->npins; pin++) {
 			imx_pin = &grp->pins[pin];
 			if (imx_pin->pin == offset && !imx_pin->mux_mode)
@@ -494,7 +523,10 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		return;
 
 	seq_printf(s, "\n");
-	grp = &info->groups[group];
+	grp = radix_tree_lookup(&info->pgtree, group);
+	if (!grp)
+		return;
+
 	for (i = 0; i < grp->npins; i++) {
 		struct imx_pin *pin = &grp->pins[i];
 		name = pin_get_name(pctldev, pin->pin);
@@ -614,7 +646,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 	dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);
 
-	func = &info->functions[index];
+	func = radix_tree_lookup(&info->ftree, index);
+	if (!func)
+		return -EINVAL;
 
 	/* Initialise function */
 	func->name = np->name;
@@ -628,7 +662,16 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 	for_each_child_of_node(np, child) {
 		func->groups[i] = child->name;
-		grp = &info->groups[info->group_index++];
+
+		grp = devm_kzalloc(info->dev, sizeof(struct imx_pin_group),
+				   GFP_KERNEL);
+		if (!grp)
+			return -ENOMEM;
+
+		mutex_lock(&info->mutex);
+		radix_tree_insert(&info->pgtree, info->group_index++, grp);
+		mutex_unlock(&info->mutex);
+
 		imx_pinctrl_parse_groups(child, grp, info, i++);
 	}
 
@@ -681,11 +724,19 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	info->nfunctions = nfuncs;
-	info->functions = devm_kzalloc(&pdev->dev, nfuncs * sizeof(struct imx_pmx_func),
+	for (i = 0; i < nfuncs; i++) {
+		struct imx_pmx_func *function;
+
+		function = devm_kzalloc(&pdev->dev, sizeof(*function),
 					GFP_KERNEL);
-	if (!info->functions)
-		return -ENOMEM;
+		if (!function)
+			return -ENOMEM;
+
+		mutex_lock(&info->mutex);
+		radix_tree_insert(&info->ftree, i, function);
+		mutex_unlock(&info->mutex);
+	}
+	info->nfunctions = nfuncs;
 
 	info->group_index = 0;
 	if (flat_funcs) {
@@ -695,14 +746,11 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		for_each_child_of_node(np, child)
 			info->ngroups += of_get_child_count(child);
 	}
-	info->groups = devm_kzalloc(&pdev->dev, info->ngroups * sizeof(struct imx_pin_group),
-					GFP_KERNEL);
-	if (!info->groups)
-		return -ENOMEM;
 
 	if (flat_funcs) {
 		imx_pinctrl_parse_functions(np, info, 0);
 	} else {
+		i = 0;
 		for_each_child_of_node(np, child)
 			imx_pinctrl_parse_functions(child, info, i++);
 	}
@@ -710,6 +758,59 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 	return 0;
 }
 
+/*
+ * imx_free_funcs() - free memory used by functions
+ * @info: info driver instance
+ */
+static void imx_free_funcs(struct imx_pinctrl_soc_info *info)
+{
+	int i;
+
+	mutex_lock(&info->mutex);
+	for (i = 0; i < info->nfunctions; i++) {
+		struct imx_pmx_func *func;
+
+		func = radix_tree_lookup(&info->ftree, i);
+		if (!func)
+			continue;
+		radix_tree_delete(&info->ftree, i);
+	}
+	mutex_unlock(&info->mutex);
+}
+
+/*
+ * imx_free_pingroups() - free memory used by pingroups
+ * @info: info driver instance
+ */
+static void imx_free_pingroups(struct imx_pinctrl_soc_info *info)
+{
+	int i;
+
+	mutex_lock(&info->mutex);
+	for (i = 0; i < info->ngroups; i++) {
+		struct imx_pin_group *pingroup;
+
+		pingroup = radix_tree_lookup(&info->pgtree, i);
+		if (!pingroup)
+			continue;
+		radix_tree_delete(&info->pgtree, i);
+	}
+	mutex_unlock(&info->mutex);
+}
+
+/*
+ * imx_free_resources() - free memory used by this driver
+ * @info: info driver instance
+ */
+static void imx_free_resources(struct imx_pinctrl *ipctl)
+{
+	if (ipctl->pctl)
+		pinctrl_unregister(ipctl->pctl);
+
+	imx_free_funcs(ipctl->info);
+	imx_free_pingroups(ipctl->info);
+}
+
 int imx_pinctrl_probe(struct platform_device *pdev,
 		      struct imx_pinctrl_soc_info *info)
 {
@@ -783,10 +884,15 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	imx_pinctrl_desc->confops = &imx_pinconf_ops;
 	imx_pinctrl_desc->owner = THIS_MODULE;
 
+	mutex_init(&info->mutex);
+
+	INIT_RADIX_TREE(&info->pgtree, GFP_KERNEL);
+	INIT_RADIX_TREE(&info->ftree, GFP_KERNEL);
+
 	ret = imx_pinctrl_probe_dt(pdev, info);
 	if (ret) {
 		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		return ret;
+		goto free;
 	}
 
 	ipctl->info = info;
@@ -796,10 +902,16 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 					    imx_pinctrl_desc, ipctl);
 	if (IS_ERR(ipctl->pctl)) {
 		dev_err(&pdev->dev, "could not register IMX pinctrl driver\n");
-		return PTR_ERR(ipctl->pctl);
+		ret = PTR_ERR(ipctl->pctl);
+		goto free;
 	}
 
 	dev_info(&pdev->dev, "initialized IMX pinctrl driver\n");
 
 	return 0;
+
+free:
+	imx_free_resources(ipctl);
+
+	return ret;
 }
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 8af8aa2..62aa8f8 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -76,13 +76,14 @@ struct imx_pinctrl_soc_info {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	struct imx_pin_reg *pin_regs;
-	struct imx_pin_group *groups;
 	unsigned int ngroups;
 	unsigned int group_index;
-	struct imx_pmx_func *functions;
 	unsigned int nfunctions;
 	unsigned int flags;
 	const char *gpr_compatible;
+	struct radix_tree_root ftree;
+	struct radix_tree_root pgtree;
+	struct mutex mutex;
 };
 
 #define SHARE_MUX_CONF_REG	0x1
-- 
2.9.3
