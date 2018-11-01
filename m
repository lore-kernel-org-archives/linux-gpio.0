From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] pinctrl: mt7622: fix small typo
Date: Thu,  1 Nov 2018 11:44:27 -0400
Message-ID: <20181101154427.23110-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, linus.walleij@linaro.org, matthias.bgg@gmail.com
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7622.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index 6f931b85701b..9b00c5e6ba8e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -977,7 +977,7 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw, int pin,
 		return -EINVAL;
 	}
 
-	/* Caculated bits as the overall offset the pin is located at */
+	/* Calculated bits as the overall offset the pin is located at */
 	bits = c->s_bit + (pin - c->s_pin) * (c->x_bits);
 
 	/* Fill pfd from bits and 32-bit register applied is assumed */
-- 
2.17.0
