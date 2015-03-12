From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] pinctrl: mediatek: mtk-common: Use devm_kcalloc at
 appropriate places
Date: Thu, 12 Mar 2015 21:53:32 +0800
Message-ID: <1426168412.30920.3.camel@phoenix>
References: <1426168353.30920.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:38840 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749AbbCLNxj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2015 09:53:39 -0400
Received: by pdbfl12 with SMTP id fl12so20325648pdb.5
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2015 06:53:38 -0700 (PDT)
In-Reply-To: <1426168353.30920.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Prefer devm_kcalloc over devm_kzalloc with multiply.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index f82f57a..493294c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1076,16 +1076,14 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
 	pctl->ngroups = pctl->devdata->npins;
 
 	/* Allocate groups */
-	pctl->groups = devm_kzalloc(&pdev->dev,
-				    pctl->ngroups * sizeof(*pctl->groups),
-				    GFP_KERNEL);
+	pctl->groups = devm_kcalloc(&pdev->dev, pctl->ngroups,
+				    sizeof(*pctl->groups), GFP_KERNEL);
 	if (!pctl->groups)
 		return -ENOMEM;
 
 	/* We assume that one pin is one group, use pin name as group name. */
-	pctl->grp_names = devm_kzalloc(&pdev->dev,
-				    pctl->ngroups * sizeof(*pctl->grp_names),
-				    GFP_KERNEL);
+	pctl->grp_names = devm_kcalloc(&pdev->dev, pctl->ngroups,
+				       sizeof(*pctl->grp_names), GFP_KERNEL);
 	if (!pctl->grp_names)
 		return -ENOMEM;
 
@@ -1152,8 +1150,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	pins = devm_kzalloc(&pdev->dev,
-			    pctl->devdata->npins * sizeof(*pins),
+	pins = devm_kcalloc(&pdev->dev, pctl->devdata->npins, sizeof(*pins),
 			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
@@ -1211,8 +1208,8 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		goto chip_error;
 	}
 
-	pctl->eint_dual_edges = devm_kzalloc(&pdev->dev,
-			sizeof(int) * pctl->devdata->ap_num, GFP_KERNEL);
+	pctl->eint_dual_edges = devm_kcalloc(&pdev->dev, pctl->devdata->ap_num,
+					     sizeof(int), GFP_KERNEL);
 	if (!pctl->eint_dual_edges) {
 		ret = -ENOMEM;
 		goto chip_error;
-- 
1.9.1



