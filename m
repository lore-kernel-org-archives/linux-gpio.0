From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [v2, PATCH] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Mon, 5 Dec 2016 09:38:52 +0800
Message-ID: <1480901933-6971-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:9379 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751070AbcLEBje (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Dec 2016 20:39:34 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: --to=Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>

the default mode of GPIO16 pin is gpio, when set EINT16 to
IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
fixed when set its default mode as usb iddig.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h
index 13e5b68..9b018fd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h
@@ -201,7 +201,7 @@
 	MTK_PIN(
 		PINCTRL_PIN(16, "IDDIG"),
 		NULL, "mt8173",
-		MTK_EINT_FUNCTION(0, 16),
+		MTK_EINT_FUNCTION(1, 16),
 		MTK_FUNCTION(0, "GPIO16"),
 		MTK_FUNCTION(1, "IDDIG"),
 		MTK_FUNCTION(2, "CMFLASH"),
-- 
1.7.9.5

