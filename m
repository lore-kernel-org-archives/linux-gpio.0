From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 2/2] pinctrl: mediatek: mt8183: Add pm_ops
Date: Wed,  8 May 2019 15:33:31 +0800
Message-ID: <20190508073331.27475-3-drinkcat@chromium.org>
References: <20190508073331.27475-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508073331.27475-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org, swboyd@chromium.org
List-Id: linux-gpio@vger.kernel.org

Setting this up will configure wake from suspend properly,
and wake only for the interrupts that are setup in wake_mask,
not all interrupts.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8183.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
index 2c7409ed16fae9c..9a74d5025be648d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
@@ -583,6 +583,7 @@ static struct platform_driver mt8183_pinctrl_driver = {
 	.driver = {
 		.name = "mt8183-pinctrl",
 		.of_match_table = mt8183_pinctrl_of_match,
+		.pm = &mtk_paris_pinctrl_pm_ops,
 	},
 	.probe = mt8183_pinctrl_probe,
 };
-- 
2.21.0.1020.gf2820cf01a-goog
