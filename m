From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 11/17] pinctrl: ingenic: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:23 +0200
Message-ID: <1502359589-15970-12-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/pinctrl/pinctrl-ingenic.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d8e8842..d847618 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -460,7 +460,7 @@ static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
 	return val & BIT(idx);
 }
 
-static struct pinctrl_ops ingenic_pctlops = {
+static const struct pinctrl_ops ingenic_pctlops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
@@ -543,7 +543,7 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinmux_ops ingenic_pmxops = {
+static const struct pinmux_ops ingenic_pmxops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
@@ -696,7 +696,7 @@ static int ingenic_pinconf_group_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinconf_ops ingenic_confops = {
+static const struct pinconf_ops ingenic_confops = {
 	.is_generic = true,
 	.pin_config_get = ingenic_pinconf_get,
 	.pin_config_set = ingenic_pinconf_set,
