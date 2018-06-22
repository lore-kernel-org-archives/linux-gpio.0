From: <sean.wang@mediatek.com>
Subject: [PATCH 1/7] pinctrl: mt7622: fix error path on failing at groups building
Date: Fri, 22 Jun 2018 11:49:04 +0800
Message-ID: <f222c9f488490bd86d35346e725491e1de306ace.1529639050.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

It should be to return an error code when failing at groups building.

Cc: stable@vger.kernel.org
Fixes: d6ed93551320 ("pinctrl: mediatek: add pinctrl driver for MT7622 SoC")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7622.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index e3f1ab2..9ad8cb77 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -1703,7 +1703,7 @@ static int mtk_pinctrl_probe(struct platform_device *pdev)
 	err = mtk_build_groups(hw);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to build groups\n");
-		return 0;
+		return err;
 	}
 
 	/* Setup functions descriptions per SoC types */
-- 
2.7.4
