From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 9/9] pinctrl: sh-pfc: r8a7795: Fix to reserved MOD_SEL2 bit22
Date: Fri, 28 Jul 2017 20:41:21 +0900
Message-ID: <1501242081-3805-10-git-send-email-ykaneko0929@gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34303 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751737AbdG1Llw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2017 07:41:52 -0400
In-Reply-To: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This is a correction because MOD_SEL register specification for R8A7795
ES2.0 SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.54E.

Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 44beb7c..bbed0d6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -496,7 +496,6 @@
 #define MOD_SEL2_28_27		FM(SEL_FM_0)		FM(SEL_FM_1)		FM(SEL_FM_2)		FM(SEL_FM_3)
 #define MOD_SEL2_26		FM(SEL_SCIF5_0)		FM(SEL_SCIF5_1)
 #define MOD_SEL2_25_24_23	FM(SEL_I2C6_0)		FM(SEL_I2C6_1)		FM(SEL_I2C6_2)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)
-#define MOD_SEL2_22		FM(SEL_NDF_0)		FM(SEL_NDF_1)
 #define MOD_SEL2_21		FM(SEL_SSI2_0)		FM(SEL_SSI2_1)
 #define MOD_SEL2_20		FM(SEL_SSI9_0)		FM(SEL_SSI9_1)
 #define MOD_SEL2_19		FM(SEL_TIMER_TMU2_0)	FM(SEL_TIMER_TMU2_1)
@@ -513,7 +512,7 @@
 MOD_SEL0_26_25_24	MOD_SEL1_26		MOD_SEL2_26 \
 			MOD_SEL1_25_24		MOD_SEL2_25_24_23 \
 MOD_SEL0_23		MOD_SEL1_23_22_21 \
-MOD_SEL0_22					MOD_SEL2_22 \
+MOD_SEL0_22 \
 MOD_SEL0_21					MOD_SEL2_21 \
 MOD_SEL0_20		MOD_SEL1_20		MOD_SEL2_20 \
 MOD_SEL0_19		MOD_SEL1_19		MOD_SEL2_19 \
@@ -1020,35 +1019,35 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP8_15_12,	SD1_CMD),
 	PINMUX_IPSR_MSEL(IP8_15_12,	MSIOF1_SYNC_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_15_12,	NFCE_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_GPSR(IP8_15_12,	NFCE_N_B),
 	PINMUX_IPSR_MSEL(IP8_15_12,	SIM0_D_A,		SEL_SIMCARD_0),
 	PINMUX_IPSR_MSEL(IP8_15_12,	STP_IVCXO27_1_B,	SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_19_16,	SD1_DAT0),
 	PINMUX_IPSR_GPSR(IP8_19_16,	SD2_DAT4),
 	PINMUX_IPSR_MSEL(IP8_19_16,	MSIOF1_RXD_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_19_16,	NFWP_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_GPSR(IP8_19_16,	NFWP_N_B),
 	PINMUX_IPSR_MSEL(IP8_19_16,	TS_SCK1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_19_16,	STP_ISCLK_1_B,		SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_23_20,	SD1_DAT1),
 	PINMUX_IPSR_GPSR(IP8_23_20,	SD2_DAT5),
 	PINMUX_IPSR_MSEL(IP8_23_20,	MSIOF1_TXD_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_23_20,	NFDATA14_B,		SEL_NDF_1),
+	PINMUX_IPSR_GPSR(IP8_23_20,	NFDATA14_B),
 	PINMUX_IPSR_MSEL(IP8_23_20,	TS_SPSYNC1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_23_20,	STP_ISSYNC_1_B,		SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_27_24,	SD1_DAT2),
 	PINMUX_IPSR_GPSR(IP8_27_24,	SD2_DAT6),
 	PINMUX_IPSR_MSEL(IP8_27_24,	MSIOF1_SS1_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_27_24,	NFDATA15_B,		SEL_NDF_1),
+	PINMUX_IPSR_GPSR(IP8_27_24,	NFDATA15_B),
 	PINMUX_IPSR_MSEL(IP8_27_24,	TS_SDAT1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_27_24,	STP_ISD_1_B,		SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_31_28,	SD1_DAT3),
 	PINMUX_IPSR_GPSR(IP8_31_28,	SD2_DAT7),
 	PINMUX_IPSR_MSEL(IP8_31_28,	MSIOF1_SS2_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_31_28,	NFRB_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_GPSR(IP8_31_28,	NFRB_N_B),
 	PINMUX_IPSR_MSEL(IP8_31_28,	TS_SDEN1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_31_28,	STP_ISEN_1_B,		SEL_SSP1_1_1),
 
@@ -1268,7 +1267,7 @@ enum {
 	/* IPSR14 */
 	PINMUX_IPSR_GPSR(IP14_3_0,	MSIOF0_SS1),
 	PINMUX_IPSR_MSEL(IP14_3_0,	RX5_A,			SEL_SCIF5_0),
-	PINMUX_IPSR_MSEL(IP14_3_0,	NFWP_N_A,		SEL_NDF_0),
+	PINMUX_IPSR_GPSR(IP14_3_0,	NFWP_N_A),
 	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADG_A_2),
 	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SCK2_A,		SEL_SSI_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
@@ -2779,7 +2778,8 @@ enum {
 		MOD_SEL2_28_27
 		MOD_SEL2_26
 		MOD_SEL2_25_24_23
-		MOD_SEL2_22
+		/* RESERVED 22 */
+		0, 0,
 		MOD_SEL2_21
 		MOD_SEL2_20
 		MOD_SEL2_19
-- 
1.9.1

