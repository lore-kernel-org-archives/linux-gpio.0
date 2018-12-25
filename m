From: <chuanjia.liu@mediatek.com>
Subject: [PATCH v3] pinctrl:mediatek:add EINT support to virtual GPIOs
Date: Tue, 25 Dec 2018 12:23:58 +0800
Message-ID: <1545711838-20444-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: youlin.pei@mediatek.com, eddie.huang@mediatek.com, zhiyong.tao@mediatek.com, hailong.fan@mediatek.com, Chuanjia Liu <Chuanjia.Liu@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>

Virtual gpio only used inside SOC and not being exported to outside SOC.
Some modules use virtual gpio as eint and doesn't nedd SMT.
So this patch add EINT support to virtual GPIOs.

Signed-off-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
---
change note:
v3 : 1. modify subject and description
      2. modify comments
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4a9e0d4c2bbc..a0db145f798d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -290,7 +290,15 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
 		return err;
 
 	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
-	if (err)
+	/*
+	 *SMT is supposed to be supported by every real GPIO and doesn't
+	 *support virtual GPIOs, so the extra condition err != -ENOTSUPP
+	 *is just for adding EINT support to these virtual GPIOs. It should
+	 *add an extra flag in the pin descriptor when more pins with
+	 *distinctive characteristic come out.
+	 */
+
+	if (err && err != -ENOTSUPP)
 		return err;
 
 	return 0;
-- 
2.19.1
