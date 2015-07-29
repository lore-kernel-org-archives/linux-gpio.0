From: <maoguang.meng@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: Implement pictrl irq wake handler
Date: Wed, 29 Jul 2015 17:36:40 +0800
Message-ID: <1438162601-448-1-git-send-email-maoguang.meng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Maoguang Meng <maoguang.meng@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

From: Maoguang Meng <maoguang.meng@mediatek.com>

This patch implement irq_set_wake for suspend resume.

Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index ad1ea16..a3d137e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1,7 +1,9 @@
 /*
  * mt65xx pinctrl driver based on Allwinner A1X pinctrl driver.
  * Copyright (c) 2014 MediaTek Inc.
- * Author: Hongzhou.Yang <hongzhou.yang@mediatek.com>
+ * Author:
+ *  Hongzhou.Yang <hongzhou.yang@mediatek.com>
+ *  Maoguang.Meng <maoguang.meng@mediatek.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -1062,6 +1064,16 @@ static int mtk_eint_set_type(struct irq_data *d,
 	return 0;
 }
 
+static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	if (on)
+		d->chip->flags |= IRQF_NO_SUSPEND;
+	else
+		d->chip->flags &= ~IRQF_NO_SUSPEND;
+
+	return 0;
+}
+
 static void mtk_eint_ack(struct irq_data *d)
 {
 	struct mtk_pinctrl *pctl = irq_data_get_irq_chip_data(d);
@@ -1075,11 +1087,13 @@ static void mtk_eint_ack(struct irq_data *d)
 }
 
 static struct irq_chip mtk_pinctrl_irq_chip = {
-	.name = "mt-eint",
+	.name = "mtk-eint",
+	.irq_disable = mtk_eint_mask,
 	.irq_mask = mtk_eint_mask,
 	.irq_unmask = mtk_eint_unmask,
 	.irq_ack = mtk_eint_ack,
 	.irq_set_type = mtk_eint_set_type,
+	.irq_set_wake = mtk_eint_irq_set_wake,
 	.irq_request_resources = mtk_pinctrl_irq_request_resources,
 	.irq_release_resources = mtk_pinctrl_irq_release_resources,
 };
-- 
1.8.1.1.dirty
