From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 3/5] pinctrl: single: Fix group and function selector use
Date: Fri, 15 Jun 2018 04:11:39 -0700
Message-ID: <20180615111141.37184-4-tony@atomide.com>
References: <20180615111141.37184-1-tony@atomide.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180615111141.37184-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

We must use a mutex around the generic_add functions and save the
function and group selector in case we need to remove them. Otherwise
the selector use will be racy for deferred probe at least.

Note that struct device_node *np is unused in pcs_add_function() we
remove that too and fix a checkpatch warning for bare unsigned while
at it.

Fixes: 571aec4df5b7 ("pinctrl: single: Use generic pinmux helpers for
managing functions")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/pinctrl/pinctrl-single.c | 91 +++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -747,38 +747,44 @@ static int pcs_allocate_pin_table(struct pcs_device *pcs)
 /**
  * pcs_add_function() - adds a new function to the function list
  * @pcs: pcs driver instance
- * @np: device node of the mux entry
+ * @fcn: new function allocated
  * @name: name of the function
  * @vals: array of mux register value pairs used by the function
  * @nvals: number of mux register value pairs
  * @pgnames: array of pingroup names for the function
  * @npgnames: number of pingroup names
+ *
+ * Caller must take care of locking.
  */
-static struct pcs_function *pcs_add_function(struct pcs_device *pcs,
-					struct device_node *np,
-					const char *name,
-					struct pcs_func_vals *vals,
-					unsigned nvals,
-					const char **pgnames,
-					unsigned npgnames)
+static int pcs_add_function(struct pcs_device *pcs,
+			    struct pcs_function **fcn,
+			    const char *name,
+			    struct pcs_func_vals *vals,
+			    unsigned int nvals,
+			    const char **pgnames,
+			    unsigned int npgnames)
 {
 	struct pcs_function *function;
-	int res;
+	int selector;
 
 	function = devm_kzalloc(pcs->dev, sizeof(*function), GFP_KERNEL);
 	if (!function)
-		return NULL;
+		return -ENOMEM;
 
 	function->vals = vals;
 	function->nvals = nvals;
 
-	res = pinmux_generic_add_function(pcs->pctl, name,
-					  pgnames, npgnames,
-					  function);
-	if (res)
-		return NULL;
+	selector = pinmux_generic_add_function(pcs->pctl, name,
+					       pgnames, npgnames,
+					       function);
+	if (selector < 0) {
+		devm_kfree(pcs->dev, function);
+		*fcn = NULL;
+	} else {
+		*fcn = function;
+	}
 
-	return function;
+	return selector;
 }
 
 /**
@@ -979,8 +985,8 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 {
 	const char *name = "pinctrl-single,pins";
 	struct pcs_func_vals *vals;
-	int rows, *pins, found = 0, res = -ENOMEM, i;
-	struct pcs_function *function;
+	int rows, *pins, found = 0, res = -ENOMEM, i, fsel, gsel;
+	struct pcs_function *function = NULL;
 
 	rows = pinctrl_count_index_with_args(np, name);
 	if (rows <= 0) {
@@ -1030,21 +1036,25 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	}
 
 	pgnames[0] = np->name;
-	function = pcs_add_function(pcs, np, np->name, vals, found, pgnames, 1);
-	if (!function) {
-		res = -ENOMEM;
+	mutex_lock(&pcs->mutex);
+	fsel = pcs_add_function(pcs, &function, np->name, vals, found,
+				pgnames, 1);
+	if (fsel < 0) {
+		res = fsel;
 		goto free_pins;
 	}
 
-	res = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
-	if (res < 0)
+	gsel = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
+	if (gsel < 0) {
+		res = gsel;
 		goto free_function;
+	}
 
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
 	(*map)->data.mux.group = np->name;
 	(*map)->data.mux.function = np->name;
 
-	if (PCS_HAS_PINCONF) {
+	if (PCS_HAS_PINCONF && function) {
 		res = pcs_parse_pinconf(pcs, np, function, map);
 		if (res)
 			goto free_pingroups;
@@ -1052,14 +1062,16 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	} else {
 		*num_maps = 1;
 	}
+	mutex_unlock(&pcs->mutex);
+
 	return 0;
 
 free_pingroups:
-	pinctrl_generic_remove_last_group(pcs->pctl);
+	pinctrl_generic_remove_group(pcs->pctl, gsel);
 	*num_maps = 1;
 free_function:
-	pinmux_generic_remove_last_function(pcs->pctl);
-
+	pinmux_generic_remove_function(pcs->pctl, fsel);
+	mutex_unlock(&pcs->mutex);
 free_pins:
 	devm_kfree(pcs->dev, pins);
 
@@ -1077,9 +1089,9 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 {
 	const char *name = "pinctrl-single,bits";
 	struct pcs_func_vals *vals;
-	int rows, *pins, found = 0, res = -ENOMEM, i;
+	int rows, *pins, found = 0, res = -ENOMEM, i, fsel, gsel;
 	int npins_in_row;
-	struct pcs_function *function;
+	struct pcs_function *function = NULL;
 
 	rows = pinctrl_count_index_with_args(np, name);
 	if (rows <= 0) {
@@ -1166,15 +1178,19 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 	}
 
 	pgnames[0] = np->name;
-	function = pcs_add_function(pcs, np, np->name, vals, found, pgnames, 1);
-	if (!function) {
-		res = -ENOMEM;
+	mutex_lock(&pcs->mutex);
+	fsel = pcs_add_function(pcs, &function, np->name, vals, found,
+				pgnames, 1);
+	if (fsel < 0) {
+		res = fsel;
 		goto free_pins;
 	}
 
-	res = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
-	if (res < 0)
+	gsel = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
+	if (gsel < 0) {
+		res = gsel;
 		goto free_function;
+	}
 
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
 	(*map)->data.mux.group = np->name;
@@ -1186,13 +1202,16 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 	}
 
 	*num_maps = 1;
+	mutex_unlock(&pcs->mutex);
+
 	return 0;
 
 free_pingroups:
-	pinctrl_generic_remove_last_group(pcs->pctl);
+	pinctrl_generic_remove_group(pcs->pctl, gsel);
 	*num_maps = 1;
 free_function:
-	pinmux_generic_remove_last_function(pcs->pctl);
+	pinmux_generic_remove_function(pcs->pctl, fsel);
+	mutex_unlock(&pcs->mutex);
 free_pins:
 	devm_kfree(pcs->dev, pins);
 
-- 
2.17.1
