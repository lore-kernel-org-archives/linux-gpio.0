From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 17/17] pinctrl: vt8500: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:29 +0200
Message-ID: <1502359589-15970-18-git-send-email-Julia.Lawall@lip6.fr>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:24088
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751978AbdHJKcZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Aug 2017 06:32:25 -0400
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

These structures are only stored in fields of a pinctrl_desc
structure (confops, pctlops, and pmxops) that are const. Make the
structures const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/vt8500/pinctrl-wmt.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index 974e646..d73956b 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -163,7 +163,7 @@ static int wmt_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinmux_ops wmt_pinmux_ops = {
+static const struct pinmux_ops wmt_pinmux_ops = {
 	.get_functions_count = wmt_pmx_get_functions_count,
 	.get_function_name = wmt_pmx_get_function_name,
 	.get_function_groups = wmt_pmx_get_function_groups,
@@ -409,7 +409,7 @@ static int wmt_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return err;
 }
 
-static struct pinctrl_ops wmt_pctl_ops = {
+static const struct pinctrl_ops wmt_pctl_ops = {
 	.get_groups_count = wmt_get_groups_count,
 	.get_group_name	= wmt_get_group_name,
 	.get_group_pins	= wmt_get_group_pins,
@@ -472,7 +472,7 @@ static int wmt_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 	return 0;
 }
 
-static struct pinconf_ops wmt_pinconf_ops = {
+static const struct pinconf_ops wmt_pinconf_ops = {
 	.pin_config_get = wmt_pinconf_get,
 	.pin_config_set = wmt_pinconf_set,
 };

