From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] pinctrl: mediatek: mtk-common: Fix a typo in
 mtk_eint_set_type
Date: Sat, 14 Mar 2015 15:15:18 +0800
Message-ID: <1426317318.15425.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:34232 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752481AbbCNHPX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Mar 2015 03:15:23 -0400
Received: by pdbni2 with SMTP id ni2so6827561pdb.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2015 00:15:23 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Fix a typo when checking level trigger irq type.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Hongzhou,
This looks like a typo, but I don't have the datasheet so please confirm if
this patch is correct or not.
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 493294c..cc27929 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -934,7 +934,7 @@ static int mtk_eint_set_type(struct irq_data *d,
 	else
 		pctl->eint_dual_edges[d->hwirq] = 0;
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
+	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH)) {
 		reg = mtk_eint_get_offset(pctl, d->hwirq,
 			eint_offsets->pol_clr);
 		writel(mask, reg);
-- 
1.9.1



