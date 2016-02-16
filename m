From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 1/2] pinctrl: mediatek: add input-enable setting in gpio_request_enable
Date: Wed, 17 Feb 2016 03:16:33 +0800
Message-ID: <1455650194-9813-2-git-send-email-biao.huang@mediatek.com>
References: <1455650194-9813-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455650194-9813-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

Since input-disable cuts off input signal of gpio, add input-enable
setting in .gpio_request_enable implementation to ensure gpio function well

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 6024483..578897a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -764,6 +764,7 @@ static int mtk_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 	}
 
 	mtk_pmx_set_mode(pctldev, offset, muxval);
+	mtk_pconf_set_ies_smt(pctl, offset, 1, PIN_CONFIG_INPUT_ENABLE);
 
 	return 0;
 }
-- 
1.7.9.5
