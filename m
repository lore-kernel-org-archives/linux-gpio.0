From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 2/2] pinctrl: mediatek: add input-enable and direction setting for eint resources
Date: Wed, 17 Feb 2016 03:16:34 +0800
Message-ID: <1455650194-9813-3-git-send-email-biao.huang@mediatek.com>
References: <1455650194-9813-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455650194-9813-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

To use pin as eint, user should make sure that:
1. pin is set to right mode, this is done in .irq_request_resources
implementation already.
2. direction of the pin is input, which should call GPIO API to set
pin to input gpio.
We add what step 2 do to .irq_request_resources so that user doesn't
need call GPIO API any more when pin for eint usage.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 578897a..342d85b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -863,6 +863,10 @@ static int mtk_pinctrl_irq_request_resources(struct irq_data *d)
 
 	/* set mux to INT mode */
 	mtk_pmx_set_mode(pctl->pctl_dev, pin->pin.number, pin->eint.eintmux);
+	/* set gpio direction to input */
+	mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, pin->pin.number, true);
+	/* set input-enable */
+	mtk_pconf_set_ies_smt(pctl, pin->pin.number, 1, PIN_CONFIG_INPUT_ENABLE);
 
 	return 0;
 }
-- 
1.7.9.5
