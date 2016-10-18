From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] pinctrl: imx: remove unused gpoup_index field
Date: Wed, 19 Oct 2016 01:47:12 +0300
Message-ID: <1476830832-5389-1-git-send-email-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:50255 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754258AbcJRWrO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Oct 2016 18:47:14 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Alexander Shiyan <shc_work@mail.ru>, linux-gpio@vger.kernel.org

The group_index field of struct imx_pinctrl_soc_info does not serve
any particular purpose and its usage can be safely replaced by
a preexisting local variable.

Also Stefan Agner reports that the usage of the group_index field
without reinitialization may lead to an oops on a repeated driver
probe, this is found with DEBUG_TEST_DRIVER_REMOVE option enabled.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
The change is supposed to obsolete Stefan's change:

   https://patchwork.ozlabs.org/patch/683885/

The change is tested on i.MX6Q platform only.

 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 47613201269a..3425d10c1478 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -628,7 +628,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 	for_each_child_of_node(np, child) {
 		func->groups[i] = child->name;
-		grp = &info->groups[info->group_index++];
+		grp = &info->groups[i];
 		imx_pinctrl_parse_groups(child, grp, info, i++);
 	}
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 8af8aa2897ab..eaf893967453 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -78,7 +78,6 @@ struct imx_pinctrl_soc_info {
 	struct imx_pin_reg *pin_regs;
 	struct imx_pin_group *groups;
 	unsigned int ngroups;
-	unsigned int group_index;
 	struct imx_pmx_func *functions;
 	unsigned int nfunctions;
 	unsigned int flags;
-- 
2.8.1

