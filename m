From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 12/14] pinctrl: sh-pfc: r8a7796: Fix to delete MOD_SEL0 bit2 register definitions
Date: Thu, 13 Jul 2017 01:55:45 +0900
Message-ID: <1499878547-3452-13-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the macro definitions of MOD_SEL0 bit2 register deleted.

This is a correction because MOD_SEL register specification for R8A7796
SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.53E.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index e2c6a51..df33b9d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -471,7 +471,6 @@
 #define MOD_SEL0_7_6		FM(SEL_DRIF0_0)		FM(SEL_DRIF0_1)		FM(SEL_DRIF0_2)		F_(0, 0)
 #define MOD_SEL0_5		FM(SEL_CANFD0_0)	FM(SEL_CANFD0_1)
 #define MOD_SEL0_4_3		FM(SEL_ADG_A_0)		FM(SEL_ADG_A_1)		FM(SEL_ADG_A_2)		FM(SEL_ADG_A_3)
-#define MOD_SEL0_2		FM(SEL_5LINE_0)		FM(SEL_5LINE_1)
 
 /* MOD_SEL1 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
 #define MOD_SEL1_31_30		FM(SEL_TSIF1_0)		FM(SEL_TSIF1_1)		FM(SEL_TSIF1_2)		FM(SEL_TSIF1_3)
@@ -540,7 +539,7 @@
 MOD_SEL0_5		MOD_SEL1_5 \
 MOD_SEL0_4_3		MOD_SEL1_4 \
 			MOD_SEL1_3 \
-MOD_SEL0_2		MOD_SEL1_2 \
+			MOD_SEL1_2 \
 			MOD_SEL1_1 \
 			MOD_SEL1_0		MOD_SEL2_0
 
-- 
1.9.1
