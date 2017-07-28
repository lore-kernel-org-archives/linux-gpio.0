From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 6/9] pinctrl: sh-pfc: r8a7795: Fix MOD_SEL register pin assignment for TCLK{1,2}_{A,B} pins group
Date: Fri, 28 Jul 2017 20:41:18 +0900
Message-ID: <1501242081-3805-7-git-send-email-ykaneko0929@gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:37903 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751737AbdG1Llo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2017 07:41:44 -0400
In-Reply-To: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes to set MOD_SEL2 bit19 when using TCLK2_A pin function is
selected for IPSR16 bit[23:20] or using TCLK2_B pin function is selected
for IPSR17 bit[27:24]. And renames MOD_SEL2 bit26 value definition name
to SEL_TIMER_TMU1.

This is a correction because MOD_SEL register specification for R8A7795
ES2.0 SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.53E.

Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 945d123..18fea79 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -469,7 +469,7 @@
 /* MOD_SEL1 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
 #define MOD_SEL1_31_30		FM(SEL_TSIF1_0)		FM(SEL_TSIF1_1)		FM(SEL_TSIF1_2)		FM(SEL_TSIF1_3)
 #define MOD_SEL1_29_28_27	FM(SEL_TSIF0_0)		FM(SEL_TSIF0_1)		FM(SEL_TSIF0_2)		FM(SEL_TSIF0_3)		FM(SEL_TSIF0_4)		F_(0, 0)		F_(0, 0)		F_(0, 0)
-#define MOD_SEL1_26		FM(SEL_TIMER_TMU_0)	FM(SEL_TIMER_TMU_1)
+#define MOD_SEL1_26		FM(SEL_TIMER_TMU1_0)	FM(SEL_TIMER_TMU1_1)
 #define MOD_SEL1_25_24		FM(SEL_SSP1_1_0)	FM(SEL_SSP1_1_1)	FM(SEL_SSP1_1_2)	FM(SEL_SSP1_1_3)
 #define MOD_SEL1_23_22_21	FM(SEL_SSP1_0_0)	FM(SEL_SSP1_0_1)	FM(SEL_SSP1_0_2)	FM(SEL_SSP1_0_3)	FM(SEL_SSP1_0_4)	F_(0, 0)		F_(0, 0)		F_(0, 0)
 #define MOD_SEL1_20		FM(SEL_SSI_0)		FM(SEL_SSI_1)
@@ -1276,7 +1276,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SCK2_A,		SEL_SSI_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
 	PINMUX_IPSR_GPSR(IP14_3_0,	AUDIO_CLKOUT3_A),
-	PINMUX_IPSR_MSEL(IP14_3_0,	TCLK1_B,		SEL_TIMER_TMU_1),
+	PINMUX_IPSR_MSEL(IP14_3_0,	TCLK1_B,		SEL_TIMER_TMU1_1),
 
 	PINMUX_IPSR_GPSR(IP14_7_4,	MSIOF0_SS2),
 	PINMUX_IPSR_MSEL(IP14_7_4,	TX5_A,			SEL_SCIF5_0),
@@ -1392,7 +1392,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP16_23_20,	STP_ISEN_1_A,		SEL_SSP1_1_0),
 	PINMUX_IPSR_MSEL(IP16_23_20,	RIF1_D0_A,		SEL_DRIF1_0),
 	PINMUX_IPSR_MSEL(IP16_23_20,	RIF3_D0_A,		SEL_DRIF3_0),
-	PINMUX_IPSR_MSEL(IP16_23_20,	TCLK2_A,		SEL_TIMER_TMU_0),
+	PINMUX_IPSR_MSEL(IP16_23_20,	TCLK2_A,		SEL_TIMER_TMU2_0),
 
 	PINMUX_IPSR_GPSR(IP16_27_24,	SSI_SDATA8),
 	PINMUX_IPSR_MSEL(IP16_27_24,	HRTS2_N_B,		SEL_HSCIF2_1),
@@ -1419,7 +1419,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_7_4,	REMOCON_A,		SEL_REMOCON_0),
-	PINMUX_IPSR_MSEL(IP17_7_4,	TCLK1_A,		SEL_TIMER_TMU_0),
+	PINMUX_IPSR_MSEL(IP17_7_4,	TCLK1_A,		SEL_TIMER_TMU1_0),
 
 	PINMUX_IPSR_GPSR(IP17_11_8,	USB0_PWEN),
 	PINMUX_IPSR_MSEL(IP17_11_8,	SIM0_RST_C,		SEL_SIMCARD_2),
@@ -1463,7 +1463,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP17_27_24,	STP_ISEN_1_D,		SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_27_24,	STP_OPWM_0_E,		SEL_SSP1_0_4),
 	PINMUX_IPSR_MSEL(IP17_27_24,	RIF3_D0_B,		SEL_DRIF3_1),
-	PINMUX_IPSR_MSEL(IP17_27_24,	TCLK2_B,		SEL_TIMER_TMU_1),
+	PINMUX_IPSR_MSEL(IP17_27_24,	TCLK2_B,		SEL_TIMER_TMU2_1),
 	PINMUX_IPSR_GPSR(IP17_27_24,	TPU0TO0),
 	PINMUX_IPSR_MSEL(IP17_27_24,	BPFCLK_C,		SEL_FM_2),
 	PINMUX_IPSR_MSEL(IP17_27_24,	HRTS2_N_C,		SEL_HSCIF2_2),
-- 
1.9.1

