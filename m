From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 05/14] pinctrl: sh-pfc: r8a7796: Fix SCIF_CLK_{A,B} pin's MOD_SEL assignment to MOD_SEL1 bit10
Date: Thu, 13 Jul 2017 01:55:38 +0900
Message-ID: <1499878547-3452-6-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes SCIF_CLK_{A,B} pin's MOD_SEL assignment from MOD_SEL1
bit11 to MOD_SEL1 bit10.

This is a correction to the incorrect implementation of IPSR register
pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 18c9c61..467f32e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -488,7 +488,7 @@
 #define MOD_SEL1_13		FM(SEL_SCIF3_0)		FM(SEL_SCIF3_1)
 #define MOD_SEL1_12		FM(SEL_SCIF2_0)		FM(SEL_SCIF2_1)
 #define MOD_SEL1_11		FM(SEL_SCIF1_0)		FM(SEL_SCIF1_1)
-#define MOD_SEL1_10		FM(SEL_SATA_0)		FM(SEL_SATA_1)
+#define MOD_SEL1_10		FM(SEL_SCIF_0)		FM(SEL_SCIF_1)
 #define MOD_SEL1_9		FM(SEL_REMOCON_0)	FM(SEL_REMOCON_1)
 #define MOD_SEL1_6		FM(SEL_RCAN0_0)		FM(SEL_RCAN0_1)
 #define MOD_SEL1_5		FM(SEL_PWM6_0)		FM(SEL_PWM6_1)
@@ -1205,7 +1205,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP12_27_24,	ADICHS0),
 
 	PINMUX_IPSR_GPSR(IP12_31_28,	SCK2),
-	PINMUX_IPSR_MSEL(IP12_31_28,	SCIF_CLK_B,		SEL_SCIF1_1),
+	PINMUX_IPSR_MSEL(IP12_31_28,	SCIF_CLK_B,		SEL_SCIF_1),
 	PINMUX_IPSR_MSEL(IP12_31_28,	MSIOF1_SCK_B,		SEL_MSIOF1_1),
 	PINMUX_IPSR_MSEL(IP12_31_28,	TS_SCK1_C,		SEL_TSIF1_2),
 	PINMUX_IPSR_MSEL(IP12_31_28,	STP_ISCLK_1_C,		SEL_SSP1_1_2),
@@ -1417,7 +1417,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP17_3_0,	CC5_OSCOUT),
 
 	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
-	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF1_0),
+	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_7_4,	REMOCON_A,		SEL_REMOCON_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	TCLK1_A,		SEL_TIMER_TMU_0),
-- 
1.9.1
