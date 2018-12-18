From: <chuanjia.liu@mediatek.com>
Subject: [PATCH v2] pinctrl:mediatek:add judgment conditions
Date: Tue, 18 Dec 2018 10:31:22 +0800
Message-ID: <1545100282-15756-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: zhiyong.tao@mediatek.com, eddie.huang@mediatek.com, hailong.fan@mediatek.com, youlin.pei@mediatek.com, chuanjia.liu@mediatek.com, Chuanjia Liu <Chuanjia.Liu@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>

This patch avoid return err when virtual gpio set SMT.

Signed-off-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
---
change note:
v2 : 1. delete virtual gpio number
     2. add judgment conditions
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4a9e0d4c2bbc..a576e417744a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -290,7 +290,11 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
 		return err;
 
 	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
-	if (err)
+
+	/* SMT doesn't support virtual GPIO, add err != -ENOTSUPP is used for
+	 * avoid return err when virtual gpio set SMT.
+	 */
+	if (err && err != -ENOTSUPP)
 		return err;
 
 	return 0;
-- 
2.19.1
