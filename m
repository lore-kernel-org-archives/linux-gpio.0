From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 14/17] pinctrl: tz1090-pdc: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:26 +0200
Message-ID: <1502359589-15970-15-git-send-email-Julia.Lawall@lip6.fr>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

These structures are only stored in fields of a pinctrl_desc
structure (confops, pctlops, and pmxops) that are const. Make the
structures const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

This seems to target the metag architecture for which I don't know how to
compile.

 drivers/pinctrl/pinctrl-tz1090-pdc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tz1090-pdc.c b/drivers/pinctrl/pinctrl-tz1090-pdc.c
index e70e362..5cfa93c 100644
--- a/drivers/pinctrl/pinctrl-tz1090-pdc.c
+++ b/drivers/pinctrl/pinctrl-tz1090-pdc.c
@@ -486,7 +486,7 @@ static int tz1090_pdc_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinctrl_ops tz1090_pdc_pinctrl_ops = {
+static const struct pinctrl_ops tz1090_pdc_pinctrl_ops = {
 	.get_groups_count	= tz1090_pdc_pinctrl_get_groups_count,
 	.get_group_name		= tz1090_pdc_pinctrl_get_group_name,
 	.get_group_pins		= tz1090_pdc_pinctrl_get_group_pins,
@@ -631,7 +631,7 @@ static void tz1090_pdc_pinctrl_gpio_disable_free(
 	}
 }
 
-static struct pinmux_ops tz1090_pdc_pinmux_ops = {
+static const struct pinmux_ops tz1090_pdc_pinmux_ops = {
 	.get_functions_count	= tz1090_pdc_pinctrl_get_funcs_count,
 	.get_function_name	= tz1090_pdc_pinctrl_get_func_name,
 	.get_function_groups	= tz1090_pdc_pinctrl_get_func_groups,
@@ -905,7 +905,7 @@ static int tz1090_pdc_pinconf_group_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinconf_ops tz1090_pdc_pinconf_ops = {
+static const struct pinconf_ops tz1090_pdc_pinconf_ops = {
 	.is_generic			= true,
 	.pin_config_get			= tz1090_pdc_pinconf_get,
 	.pin_config_set			= tz1090_pdc_pinconf_set,
