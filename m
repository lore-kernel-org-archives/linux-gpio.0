From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 13/14] pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin assignment for FSO pins group
Date: Thu, 13 Jul 2017 01:55:46 +0900
Message-ID: <1499878547-3452-14-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes IPSR{12,17,18} and MOD_SEL0 pin assignment for FSO pins
group.

This is a correction because GPSR and IPSR register specification for
R8A7796 SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.54E.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index df33b9d..bac9b7fe 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -318,14 +318,14 @@
 #define IP11_31_28	FM(RX0)			FM(HRX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SCK0_C)	FM(STP_ISCLK_0_C)	FM(RIF0_D0_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_3_0	FM(TX0)			FM(HTX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC0_C)FM(STP_ISSYNC_0_C)	FM(RIF0_D1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_7_4	FM(CTS0_N)		FM(HCTS1_N_B)	FM(MSIOF1_SYNC_B)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_C)FM(STP_ISSYNC_1_C)	FM(RIF1_SYNC_B)	FM(AUDIO_CLKOUT_C)	FM(ADICS_SAMP)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_11_8	FM(RTS0_N_TANS)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	FM(FSO_TOE_A)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_11_8	FM(RTS0_N_TANS)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	F_(0, 0)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_15_12	FM(RX1_A)		FM(HRX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_C)	FM(STP_ISD_0_C)		FM(RIF1_CLK_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_19_16	FM(TX1_A)		FM(HTX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_C)	FM(STP_ISEN_0_C)	FM(RIF1_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_23_20	FM(CTS1_N)		FM(HCTS1_N_A)	FM(MSIOF1_RXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_C)	FM(STP_ISEN_1_C)	FM(RIF1_D0_B)	F_(0, 0)		FM(ADIDATA)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_27_24	FM(RTS1_N_TANS)		FM(HRTS1_N_A)	FM(MSIOF1_TXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_C)	FM(STP_ISD_1_C)		FM(RIF1_D1_B)	F_(0, 0)		FM(ADICHS0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_31_28	FM(SCK2)		FM(SCIF_CLK_B)	FM(MSIOF1_SCK_B)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_C)	FM(STP_ISCLK_1_C)	FM(RIF1_CLK_B)	F_(0, 0)		FM(ADICLK)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_3_0	FM(TX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_CD_B)			FM(SCL1_A)	F_(0, 0)	FM(FMCLK_A)		FM(RIF1_D1_C)	F_(0, 0)		FM(FSO_CFE_0_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_7_4	FM(RX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_WP_B)			FM(SDA1_A)	F_(0, 0)	FM(FMIN_A)		FM(RIF1_SYNC_C)	F_(0, 0)		FM(FSO_CFE_1_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_3_0	FM(TX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_CD_B)			FM(SCL1_A)	F_(0, 0)	FM(FMCLK_A)		FM(RIF1_D1_C)	F_(0, 0)		FM(FSO_CFE_0_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_7_4	FM(RX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_WP_B)			FM(SDA1_A)	F_(0, 0)	FM(FMIN_A)		FM(RIF1_SYNC_C)	F_(0, 0)		FM(FSO_CFE_1_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_11_8	FM(HSCK0)		F_(0, 0)	FM(MSIOF1_SCK_D)	FM(AUDIO_CLKB_A)		FM(SSI_SDATA1_B)FM(TS_SCK0_D)	FM(STP_ISCLK_0_D)	FM(RIF0_CLK_C)	F_(0, 0)		F_(0, 0)	FM(RX5_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_15_12	FM(HRX0)		F_(0, 0)	FM(MSIOF1_RXD_D)	F_(0, 0)			FM(SSI_SDATA2_B)FM(TS_SDEN0_D)	FM(STP_ISEN_0_D)	FM(RIF0_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_19_16	FM(HTX0)		F_(0, 0)	FM(MSIOF1_TXD_D)	F_(0, 0)			FM(SSI_SDATA9_B)FM(TS_SDAT0_D)	FM(STP_ISD_0_D)		FM(RIF0_D1_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -365,9 +365,9 @@
 #define IP17_19_16	FM(USB1_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_CLK_C)			FM(SSI_SCK1_A)	FM(TS_SCK0_E)	FM(STP_ISCLK_0_E)	FM(FMCLK_B)	FM(RIF2_CLK_B)		F_(0, 0)	FM(SPEEDIN_A)	F_(0, 0)	F_(0, 0) FM(HTX2_C) F_(0, 0) F_(0, 0)
 #define IP17_23_20	FM(USB1_OVC)		F_(0, 0)	FM(MSIOF1_SS2_C)	F_(0, 0)			FM(SSI_WS1_A)	FM(TS_SDAT0_E)	FM(STP_ISD_0_E)		FM(FMIN_B)	FM(RIF2_SYNC_B)		F_(0, 0)	FM(REMOCON_B)	F_(0, 0)	F_(0, 0) FM(HCTS2_N_C) F_(0, 0) F_(0, 0)
 #define IP17_27_24	FM(USB30_PWEN)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT_B)		FM(SSI_SCK2_B)	FM(TS_SDEN1_D)	FM(STP_ISEN_1_D)	FM(STP_OPWM_0_E)FM(RIF3_D0_B)		F_(0, 0)	FM(TCLK2_B)	FM(TPU0TO0)	FM(BPFCLK_C) FM(HRTS2_N_C) F_(0, 0) F_(0, 0)
-#define IP17_31_28	FM(USB30_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT1_B)		FM(SSI_WS2_B)	FM(TS_SPSYNC1_D)FM(STP_ISSYNC_1_D)	FM(STP_IVCXO27_0_E)FM(RIF3_D1_B)	F_(0, 0)	FM(FSO_TOE_B)	FM(TPU0TO1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP18_3_0	FM(GP6_30)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT2_B)		FM(SSI_SCK9_B)	FM(TS_SDEN0_E)	FM(STP_ISEN_0_E)	F_(0, 0)	FM(RIF2_D0_B)		F_(0, 0)	FM(FSO_CFE_0_A)	FM(TPU0TO2)	FM(FMCLK_C) FM(FMCLK_D) F_(0, 0) F_(0, 0)
-#define IP18_7_4	FM(GP6_31)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT3_B)		FM(SSI_WS9_B)	FM(TS_SPSYNC0_E)FM(STP_ISSYNC_0_E)	F_(0, 0)	FM(RIF2_D1_B)		F_(0, 0)	FM(FSO_CFE_1_A)	FM(TPU0TO3)	FM(FMIN_C) FM(FMIN_D) F_(0, 0) F_(0, 0)
+#define IP17_31_28	FM(USB30_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT1_B)		FM(SSI_WS2_B)	FM(TS_SPSYNC1_D)FM(STP_ISSYNC_1_D)	FM(STP_IVCXO27_0_E)FM(RIF3_D1_B)	F_(0, 0)	FM(FSO_TOE_N)	FM(TPU0TO1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP18_3_0	FM(GP6_30)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT2_B)		FM(SSI_SCK9_B)	FM(TS_SDEN0_E)	FM(STP_ISEN_0_E)	F_(0, 0)	FM(RIF2_D0_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO2)	FM(FMCLK_C) FM(FMCLK_D) F_(0, 0) F_(0, 0)
+#define IP18_7_4	FM(GP6_31)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT3_B)		FM(SSI_WS9_B)	FM(TS_SPSYNC0_E)FM(STP_ISSYNC_0_E)	F_(0, 0)	FM(RIF2_D1_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO3)	FM(FMIN_C) FM(FMIN_D) F_(0, 0) F_(0, 0)
 
 #define PINMUX_GPSR	\
 \
@@ -462,7 +462,6 @@
 #define MOD_SEL0_19		FM(SEL_HSCIF4_0)	FM(SEL_HSCIF4_1)
 #define MOD_SEL0_18_17		FM(SEL_HSCIF3_0)	FM(SEL_HSCIF3_1)	FM(SEL_HSCIF3_2)	FM(SEL_HSCIF3_3)
 #define MOD_SEL0_16		FM(SEL_HSCIF1_0)	FM(SEL_HSCIF1_1)
-#define MOD_SEL0_15		FM(SEL_FSO_0)		FM(SEL_FSO_1)
 #define MOD_SEL0_14_13		FM(SEL_HSCIF2_0)	FM(SEL_HSCIF2_1)	FM(SEL_HSCIF2_2)	F_(0, 0)
 #define MOD_SEL0_12		FM(SEL_ETHERAVB_0)	FM(SEL_ETHERAVB_1)
 #define MOD_SEL0_11		FM(SEL_DRIF3_0)		FM(SEL_DRIF3_1)
@@ -527,7 +526,7 @@
 MOD_SEL0_18_17		MOD_SEL1_18_17		MOD_SEL2_18 \
 						MOD_SEL2_17 \
 MOD_SEL0_16		MOD_SEL1_16 \
-MOD_SEL0_15		MOD_SEL1_15_14 \
+			MOD_SEL1_15_14 \
 MOD_SEL0_14_13 \
 			MOD_SEL1_13 \
 MOD_SEL0_12		MOD_SEL1_12 \
@@ -1169,7 +1168,6 @@ enum {
 	PINMUX_IPSR_MSEL(IP12_11_8,	SCL2_A,			SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP12_11_8,	STP_IVCXO27_1_C,	SEL_SSP1_1_2),
 	PINMUX_IPSR_MSEL(IP12_11_8,	RIF0_SYNC_B,		SEL_DRIF0_1),
-	PINMUX_IPSR_MSEL(IP12_11_8,	FSO_TOE_A,		SEL_FSO_0),
 	PINMUX_IPSR_GPSR(IP12_11_8,	ADICHS1),
 
 	PINMUX_IPSR_MSEL(IP12_15_12,	RX1_A,			SEL_SCIF1_0),
@@ -1214,14 +1212,14 @@ enum {
 	PINMUX_IPSR_MSEL(IP13_3_0,	SCL1_A,			SEL_I2C1_0),
 	PINMUX_IPSR_MSEL(IP13_3_0,	FMCLK_A,		SEL_FM_0),
 	PINMUX_IPSR_MSEL(IP13_3_0,	RIF1_D1_C,		SEL_DRIF1_2),
-	PINMUX_IPSR_MSEL(IP13_3_0,	FSO_CFE_0_B,		SEL_FSO_1),
+	PINMUX_IPSR_GPSR(IP13_3_0,	FSO_CFE_0_N),
 
 	PINMUX_IPSR_MSEL(IP13_7_4,	RX2_A,			SEL_SCIF2_0),
 	PINMUX_IPSR_MSEL(IP13_7_4,	SD2_WP_B,		SEL_SDHI2_1),
 	PINMUX_IPSR_MSEL(IP13_7_4,	SDA1_A,			SEL_I2C1_0),
 	PINMUX_IPSR_MSEL(IP13_7_4,	FMIN_A,			SEL_FM_0),
 	PINMUX_IPSR_MSEL(IP13_7_4,	RIF1_SYNC_C,		SEL_DRIF1_2),
-	PINMUX_IPSR_MSEL(IP13_7_4,	FSO_CFE_1_B,		SEL_FSO_1),
+	PINMUX_IPSR_GPSR(IP13_7_4,	FSO_CFE_1_N),
 
 	PINMUX_IPSR_GPSR(IP13_11_8,	HSCK0),
 	PINMUX_IPSR_MSEL(IP13_11_8,	MSIOF1_SCK_D,		SEL_MSIOF1_3),
@@ -1472,7 +1470,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP17_31_28,	STP_ISSYNC_1_D,		SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_31_28,	STP_IVCXO27_0_E,	SEL_SSP1_0_4),
 	PINMUX_IPSR_MSEL(IP17_31_28,	RIF3_D1_B,		SEL_DRIF3_1),
-	PINMUX_IPSR_MSEL(IP17_31_28,	FSO_TOE_B,		SEL_FSO_1),
+	PINMUX_IPSR_GPSR(IP17_31_28,	FSO_TOE_N),
 	PINMUX_IPSR_GPSR(IP17_31_28,	TPU0TO1),
 
 	/* IPSR18 */
@@ -1483,7 +1481,6 @@ enum {
 	PINMUX_IPSR_MSEL(IP18_3_0,	STP_ISEN_0_E,		SEL_SSP1_0_4),
 	PINMUX_IPSR_MSEL(IP18_3_0,	RIF2_D0_B,		SEL_DRIF2_1),
 	PINMUX_IPSR_GPSR(IP18_3_0,	TPU0TO2),
-	PINMUX_IPSR_MSEL(IP18_3_0,	FSO_CFE_0_A,		SEL_FSO_0),
 	PINMUX_IPSR_MSEL(IP18_3_0,	FMCLK_C,		SEL_FM_2),
 	PINMUX_IPSR_MSEL(IP18_3_0,	FMCLK_D,		SEL_FM_3),
 
@@ -1494,7 +1491,6 @@ enum {
 	PINMUX_IPSR_MSEL(IP18_7_4,	STP_ISSYNC_0_E,		SEL_SSP1_0_4),
 	PINMUX_IPSR_MSEL(IP18_7_4,	RIF2_D1_B,		SEL_DRIF2_1),
 	PINMUX_IPSR_GPSR(IP18_7_4,	TPU0TO3),
-	PINMUX_IPSR_MSEL(IP18_7_4,	FSO_CFE_1_A,		SEL_FSO_0),
 	PINMUX_IPSR_MSEL(IP18_7_4,	FMIN_C,			SEL_FM_2),
 	PINMUX_IPSR_MSEL(IP18_7_4,	FMIN_D,			SEL_FM_3),
 
@@ -5056,7 +5052,7 @@ enum {
 		MOD_SEL0_19
 		MOD_SEL0_18_17
 		MOD_SEL0_16
-		MOD_SEL0_15
+		0, 0, /* RESERVED 15 */
 		MOD_SEL0_14_13
 		MOD_SEL0_12
 		MOD_SEL0_11
-- 
1.9.1
