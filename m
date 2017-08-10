From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 16/17] pinctrl: ti-iodelay: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:28 +0200
Message-ID: <1502359589-15970-17-git-send-email-Julia.Lawall@lip6.fr>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

These structures are only stored in fields of a pinctrl_desc
structure (confops and pctlops) that are const. Make the
structures const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 362c509..5c1b632 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -716,7 +716,7 @@ static void ti_iodelay_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 }
 #endif
 
-static struct pinctrl_ops ti_iodelay_pinctrl_ops = {
+static const struct pinctrl_ops ti_iodelay_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
@@ -726,7 +726,7 @@ static void ti_iodelay_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	.dt_node_to_map = ti_iodelay_dt_node_to_map,
 };
 
-static struct pinconf_ops ti_iodelay_pinctrl_pinconf_ops = {
+static const struct pinconf_ops ti_iodelay_pinctrl_pinconf_ops = {
 	.pin_config_group_get = ti_iodelay_pinconf_group_get,
 	.pin_config_group_set = ti_iodelay_pinconf_group_set,
 #ifdef CONFIG_DEBUG_FS
