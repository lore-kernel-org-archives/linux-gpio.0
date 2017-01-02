From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [PATCH 2/2] pinctrl: imx: use generic pinmux helpers for managing functions
Date: Mon,  2 Jan 2017 19:20:22 +0100
Message-ID: <20170102182022.2047-3-gary.bisson@boundarydevices.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, fabio.estevam@nxp.com
Cc: tony@atomide.com, shawnguo@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Gary Bisson <gary.bisson@boundarydevices.com>
List-Id: linux-gpio@vger.kernel.org

Now using function_desc structure instead of imx_pmx_func.

Also leveraging generic functions to retrieve functions count/name/groups.

The imx_free_funcs function can be removed since it is now handled by
the core driver during unregister.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 drivers/pinctrl/freescale/Kconfig       |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c | 96 ++++++---------------------------
 drivers/pinctrl/freescale/pinctrl-imx.h | 14 -----
 3 files changed, 18 insertions(+), 94 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index cb50e21615da..cae05e76c111 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -1,7 +1,7 @@
 config PINCTRL_IMX
 	bool
 	select GENERIC_PINCTRL_GROUPS
-	select PINMUX
+	select GENERIC_PINMUX_FUNCTIONS
 	select PINCONF
 	select REGMAP
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 62c20f661fed..bccd9416d44f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -27,6 +27,7 @@
 #include <linux/regmap.h>
 
 #include "../core.h"
+#include "../pinmux.h"
 #include "pinctrl-imx.h"
 
 /* The bits in CONFIG cell defined in binding doc*/
@@ -161,7 +162,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	unsigned int npins, pin_id;
 	int i;
 	struct group_desc *grp = NULL;
-	struct imx_pmx_func *func = NULL;
+	struct function_desc *func = NULL;
 
 	/*
 	 * Configure the mux mode for each pin in the group for a specific
@@ -171,7 +172,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	if (!grp)
 		return -EINVAL;
 
-	func = radix_tree_lookup(&info->ftree, selector);
+	func = pinmux_generic_get_function(pctldev, selector);
 	if (!func)
 		return -EINVAL;
 
@@ -251,46 +252,6 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
-static int imx_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
-{
-	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct imx_pinctrl_soc_info *info = ipctl->info;
-
-	return info->nfunctions;
-}
-
-static const char *imx_pmx_get_func_name(struct pinctrl_dev *pctldev,
-					  unsigned selector)
-{
-	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct imx_pmx_func *func = NULL;
-
-	func = radix_tree_lookup(&info->ftree, selector);
-	if (!func)
-		return NULL;
-
-	return func->name;
-}
-
-static int imx_pmx_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
-			       const char * const **groups,
-			       unsigned * const num_groups)
-{
-	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct imx_pmx_func *func = NULL;
-
-	func = radix_tree_lookup(&info->ftree, selector);
-	if (!func)
-		return -EINVAL;
-
-	*groups = func->groups;
-	*num_groups = func->num_groups;
-
-	return 0;
-}
-
 static int imx_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range, unsigned offset)
 {
@@ -389,9 +350,9 @@ static int imx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinmux_ops imx_pmx_ops = {
-	.get_functions_count = imx_pmx_get_funcs_count,
-	.get_function_name = imx_pmx_get_func_name,
-	.get_function_groups = imx_pmx_get_groups,
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
 	.set_mux = imx_pmx_set,
 	.gpio_request_enable = imx_pmx_gpio_request_enable,
 	.gpio_disable_free = imx_pmx_gpio_disable_free,
@@ -603,28 +564,29 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	struct pinctrl_dev *pctl = ipctl->pctl;
 	struct imx_pinctrl_soc_info *info = ipctl->info;
 	struct device_node *child;
-	struct imx_pmx_func *func;
+	struct function_desc *func;
 	struct group_desc *grp;
 	u32 i = 0;
 
 	dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);
 
-	func = radix_tree_lookup(&info->ftree, index);
+	func = pinmux_generic_get_function(pctl, index);
 	if (!func)
 		return -EINVAL;
 
 	/* Initialise function */
 	func->name = np->name;
-	func->num_groups = of_get_child_count(np);
-	if (func->num_groups == 0) {
+	func->num_group_names = of_get_child_count(np);
+	if (func->num_group_names == 0) {
 		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
 		return -EINVAL;
 	}
-	func->groups = devm_kzalloc(info->dev,
-			func->num_groups * sizeof(char *), GFP_KERNEL);
+	func->group_names = devm_kzalloc(info->dev,
+					 func->num_group_names *
+					 sizeof(char *), GFP_KERNEL);
 
 	for_each_child_of_node(np, child) {
-		func->groups[i] = child->name;
+		func->group_names[i] = child->name;
 
 		grp = devm_kzalloc(info->dev, sizeof(struct group_desc),
 				   GFP_KERNEL);
@@ -691,7 +653,7 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 	}
 
 	for (i = 0; i < nfuncs; i++) {
-		struct imx_pmx_func *function;
+		struct function_desc *function;
 
 		function = devm_kzalloc(&pdev->dev, sizeof(*function),
 					GFP_KERNEL);
@@ -699,10 +661,10 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 			return -ENOMEM;
 
 		mutex_lock(&info->mutex);
-		radix_tree_insert(&info->ftree, i, function);
+		radix_tree_insert(&pctl->pin_function_tree, i, function);
 		mutex_unlock(&info->mutex);
 	}
-	info->nfunctions = nfuncs;
+	pctl->num_functions = nfuncs;
 
 	info->group_index = 0;
 	if (flat_funcs) {
@@ -725,26 +687,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 }
 
 /*
- * imx_free_funcs() - free memory used by functions
- * @info: info driver instance
- */
-static void imx_free_funcs(struct imx_pinctrl_soc_info *info)
-{
-	int i;
-
-	mutex_lock(&info->mutex);
-	for (i = 0; i < info->nfunctions; i++) {
-		struct imx_pmx_func *func;
-
-		func = radix_tree_lookup(&info->ftree, i);
-		if (!func)
-			continue;
-		radix_tree_delete(&info->ftree, i);
-	}
-	mutex_unlock(&info->mutex);
-}
-
-/*
  * imx_free_resources() - free memory used by this driver
  * @info: info driver instance
  */
@@ -752,8 +694,6 @@ static void imx_free_resources(struct imx_pinctrl *ipctl)
 {
 	if (ipctl->pctl)
 		pinctrl_unregister(ipctl->pctl);
-
-	imx_free_funcs(ipctl->info);
 }
 
 int imx_pinctrl_probe(struct platform_device *pdev,
@@ -831,8 +771,6 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 
 	mutex_init(&info->mutex);
 
-	INIT_RADIX_TREE(&info->ftree, GFP_KERNEL);
-
 	ipctl->info = info;
 	ipctl->dev = info->dev;
 	platform_set_drvdata(pdev, ipctl);
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 3c51db15223b..ff2d3e56b7c5 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -35,18 +35,6 @@ struct imx_pin {
 };
 
 /**
- * struct imx_pmx_func - describes IMX pinmux functions
- * @name: the name of this specific function
- * @groups: corresponding pin groups
- * @num_groups: the number of groups
- */
-struct imx_pmx_func {
-	const char *name;
-	const char **groups;
-	unsigned num_groups;
-};
-
-/**
  * struct imx_pin_reg - describe a pin reg map
  * @mux_reg: mux register offset
  * @conf_reg: config register offset
@@ -62,10 +50,8 @@ struct imx_pinctrl_soc_info {
 	unsigned int npins;
 	struct imx_pin_reg *pin_regs;
 	unsigned int group_index;
-	unsigned int nfunctions;
 	unsigned int flags;
 	const char *gpr_compatible;
-	struct radix_tree_root ftree;
 	struct mutex mutex;
 };
 
-- 
2.11.0
