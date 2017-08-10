From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 13/17] pinctrl: tb10x: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:25 +0200
Message-ID: <1502359589-15970-14-git-send-email-Julia.Lawall@lip6.fr>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

These structures are only stored in fields of a pinctrl_desc
structure (pctlops and pmxops) that are const. Make the
structures const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/pinctrl-tb10x.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 09d3500..2e90a6d 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -577,7 +577,7 @@ static int tb10x_dt_node_to_map(struct pinctrl_dev *pctl,
 	return ret;
 }
 
-static struct pinctrl_ops tb10x_pinctrl_ops = {
+static const struct pinctrl_ops tb10x_pinctrl_ops = {
 	.get_groups_count = tb10x_get_groups_count,
 	.get_group_name   = tb10x_get_group_name,
 	.get_group_pins   = tb10x_get_group_pins,
@@ -738,7 +738,7 @@ static int tb10x_pctl_set_mux(struct pinctrl_dev *pctl,
 	return 0;
 }
 
-static struct pinmux_ops tb10x_pinmux_ops = {
+static const struct pinmux_ops tb10x_pinmux_ops = {
 	.get_functions_count = tb10x_get_functions_count,
 	.get_function_name = tb10x_get_function_name,
 	.get_function_groups = tb10x_get_function_groups,
