From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] pinctrl: mediatek: mtk-common: Remove kfree for memory
 allocated by devm_kzalloc
Date: Thu, 12 Mar 2015 21:52:33 +0800
Message-ID: <1426168353.30920.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:40203 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749AbbCLNwl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2015 09:52:41 -0400
Received: by padfb1 with SMTP id fb1so20731601pad.7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2015 06:52:40 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index b8f8bef..f82f57a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1222,7 +1222,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	if (!irq) {
 		dev_err(&pdev->dev, "couldn't parse and map irq\n");
 		ret = -EINVAL;
-		goto free_edges;
+		goto chip_error;
 	}
 
 	pctl->domain = irq_domain_add_linear(np,
@@ -1230,7 +1230,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	if (!pctl->domain) {
 		dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
 		ret = -ENOMEM;
-		goto free_edges;
+		goto chip_error;
 	}
 
 	mtk_eint_init(pctl);
@@ -1248,8 +1248,6 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	set_irq_flags(irq, IRQF_VALID);
 	return 0;
 
-free_edges:
-	kfree(pctl->eint_dual_edges);
 chip_error:
 	gpiochip_remove(pctl->chip);
 pctrl_error:
-- 
1.9.1



