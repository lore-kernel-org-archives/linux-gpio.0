From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Rename RTS{0,1,3,4}# pin function definitions
Date: Thu, 16 Nov 2017 23:58:40 +0900
Message-ID: <1510844320-24048-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch renames the pin function macro definitions of the GPSR and
IPSR registers value for the RTS{0,1,3,4}# pin.

This is a correction because GPSR and IPSR register specification for
R8A7795 ES2.0 SoC was changed in R-Car Gen3 Hardware User's Manual
Rev.0.54E.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the for-next branch of linux-pinctrl tree.

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 40 ++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index b513010..df7cd0f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -158,11 +158,11 @@
 #define GPSR5_11	F_(RX2_A,		IP13_7_4)
 #define GPSR5_10	F_(TX2_A,		IP13_3_0)
 #define GPSR5_9		F_(SCK2,		IP12_31_28)
-#define GPSR5_8		F_(RTS1_N_TANS,		IP12_27_24)
+#define GPSR5_8		F_(RTS1_N,		IP12_27_24)
 #define GPSR5_7		F_(CTS1_N,		IP12_23_20)
 #define GPSR5_6		F_(TX1_A,		IP12_19_16)
 #define GPSR5_5		F_(RX1_A,		IP12_15_12)
-#define GPSR5_4		F_(RTS0_N_TANS,		IP12_11_8)
+#define GPSR5_4		F_(RTS0_N,		IP12_11_8)
 #define GPSR5_3		F_(CTS0_N,		IP12_7_4)
 #define GPSR5_2		F_(TX0,			IP12_3_0)
 #define GPSR5_1		F_(RX0,			IP11_31_28)
@@ -215,7 +215,7 @@
 #define IP0_11_8	FM(AVB_PHY_INT)		F_(0, 0)	FM(MSIOF2_SYNC_C)	FM(RX4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_15_12	FM(AVB_LINK)		F_(0, 0)	FM(MSIOF2_SCK_C)	FM(TX4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_19_16	FM(AVB_AVTP_MATCH_A)	F_(0, 0)	FM(MSIOF2_RXD_C)	FM(CTS4_N_A)			F_(0, 0)	FM(FSCLKST2_N_A) F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_23_20	FM(AVB_AVTP_CAPTURE_A)	F_(0, 0)	FM(MSIOF2_TXD_C)	FM(RTS4_N_TANS_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_23_20	FM(AVB_AVTP_CAPTURE_A)	F_(0, 0)	FM(MSIOF2_TXD_C)	FM(RTS4_N_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_27_24	FM(IRQ0)		FM(QPOLB)	F_(0, 0)		FM(DU_CDE)			FM(VI4_DATA0_B) FM(CAN0_TX_B)	FM(CANFD0_TX_B)		FM(MSIOF3_SS2_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_31_28	FM(IRQ1)		FM(QPOLA)	F_(0, 0)		FM(DU_DISP)			FM(VI4_DATA1_B) FM(CAN0_RX_B)	FM(CANFD0_RX_B)		FM(MSIOF3_SS1_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_3_0		FM(IRQ2)		FM(QCPV_QDE)	F_(0, 0)		FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(VI4_DATA2_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SYNC_E) F_(0, 0)		FM(PWM3_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -237,7 +237,7 @@
 #define IP2_27_24	FM(A7)			FM(LCDOUT23)	FM(MSIOF2_SS2_A)	FM(TX4_B)			FM(VI4_DATA15)	FM(VI5_DATA15)	FM(DU_DB7)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_31_28	FM(A8)			FM(RX3_B)	FM(MSIOF2_SYNC_A)	FM(HRX4_B)			F_(0, 0)	F_(0, 0)	F_(0, 0)		FM(SDA6_A)	FM(AVB_AVTP_MATCH_B)	FM(PWM1_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_3_0		FM(A9)			F_(0, 0)	FM(MSIOF2_SCK_A)	FM(CTS4_N_B)			F_(0, 0)	FM(VI5_VSYNC_N)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3_7_4		FM(A10)			F_(0, 0)	FM(MSIOF2_RXD_A)	FM(RTS4_N_TANS_B)		F_(0, 0)	FM(VI5_HSYNC_N)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3_7_4		FM(A10)			F_(0, 0)	FM(MSIOF2_RXD_A)	FM(RTS4_N_B)			F_(0, 0)	FM(VI5_HSYNC_N)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_11_8	FM(A11)			FM(TX3_B)	FM(MSIOF2_TXD_A)	FM(HTX4_B)			FM(HSCK4)	FM(VI5_FIELD)	F_(0, 0)		FM(SCL6_A)	FM(AVB_AVTP_CAPTURE_B)	FM(PWM2_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_15_12	FM(A12)			FM(LCDOUT12)	FM(MSIOF3_SCK_C)	F_(0, 0)			FM(HRX4_A)	FM(VI5_DATA8)	FM(DU_DG4)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_19_16	FM(A13)			FM(LCDOUT13)	FM(MSIOF3_SYNC_C)	F_(0, 0)			FM(HTX4_A)	FM(VI5_DATA9)	FM(DU_DG5)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -253,7 +253,7 @@
 #define IP4_27_24	FM(RD_N)		F_(0, 0)	FM(MSIOF3_SYNC_D)	FM(RX3_A)			FM(HRX3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(CAN0_TX_A)		FM(CANFD0_TX_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_31_28	FM(RD_WR_N)		F_(0, 0)	FM(MSIOF3_RXD_D)	FM(TX3_A)			FM(HTX3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(CAN0_RX_A)		FM(CANFD0_RX_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_3_0		FM(WE0_N)		F_(0, 0)	FM(MSIOF3_TXD_D)	FM(CTS3_N)			FM(HCTS3_N)	F_(0, 0)	F_(0, 0)		FM(SCL6_B)	FM(CAN_CLK)		F_(0, 0)	FM(IECLK_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP5_7_4		FM(WE1_N)		F_(0, 0)	FM(MSIOF3_SS1_D)	FM(RTS3_N_TANS)			FM(HRTS3_N)	F_(0, 0)	F_(0, 0)		FM(SDA6_B)	FM(CAN1_RX)		FM(CANFD1_RX)	FM(IERX_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP5_7_4		FM(WE1_N)		F_(0, 0)	FM(MSIOF3_SS1_D)	FM(RTS3_N)			FM(HRTS3_N)	F_(0, 0)	F_(0, 0)		FM(SDA6_B)	FM(CAN1_RX)		FM(CANFD1_RX)	FM(IERX_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_11_8	FM(EX_WAIT0_A)		FM(QCLK)	F_(0, 0)		F_(0, 0)			FM(VI4_CLK)	F_(0, 0)	FM(DU_DOTCLKOUT0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_15_12	FM(D0)			FM(MSIOF2_SS1_B)FM(MSIOF3_SCK_A)	F_(0, 0)			FM(VI4_DATA16)	FM(VI5_DATA0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_19_16	FM(D1)			FM(MSIOF2_SS2_B)FM(MSIOF3_SYNC_A)	F_(0, 0)			FM(VI4_DATA17)	FM(VI5_DATA1)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -266,7 +266,7 @@
 #define IP6_15_12	FM(D8)			FM(LCDOUT0)	FM(MSIOF2_SCK_D)	FM(SCK4_C)			FM(VI4_DATA0_A)	F_(0, 0)	FM(DU_DR0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_19_16	FM(D9)			FM(LCDOUT1)	FM(MSIOF2_SYNC_D)	F_(0, 0)			FM(VI4_DATA1_A)	F_(0, 0)	FM(DU_DR1)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_23_20	FM(D10)			FM(LCDOUT2)	FM(MSIOF2_RXD_D)	FM(HRX3_B)			FM(VI4_DATA2_A)	FM(CTS4_N_C)	FM(DU_DR2)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_27_24	FM(D11)			FM(LCDOUT3)	FM(MSIOF2_TXD_D)	FM(HTX3_B)			FM(VI4_DATA3_A)	FM(RTS4_N_TANS_C)FM(DU_DR3)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_27_24	FM(D11)			FM(LCDOUT3)	FM(MSIOF2_TXD_D)	FM(HTX3_B)			FM(VI4_DATA3_A)	FM(RTS4_N_C)	FM(DU_DR3)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_31_28	FM(D12)			FM(LCDOUT4)	FM(MSIOF2_SS1_D)	FM(RX4_C)			FM(VI4_DATA4_A)	F_(0, 0)	FM(DU_DR4)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_3_0		FM(D13)			FM(LCDOUT5)	FM(MSIOF2_SS2_D)	FM(TX4_C)			FM(VI4_DATA5_A)	F_(0, 0)	FM(DU_DR5)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_7_4		FM(D14)			FM(LCDOUT6)	FM(MSIOF3_SS1_A)	FM(HRX3_C)			FM(VI4_DATA6_A)	F_(0, 0)	FM(DU_DR6)		FM(SCL6_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -313,11 +313,11 @@
 #define IP11_31_28	FM(RX0)			FM(HRX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SCK0_C)	FM(STP_ISCLK_0_C)	FM(RIF0_D0_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_3_0	FM(TX0)			FM(HTX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC0_C)FM(STP_ISSYNC_0_C)	FM(RIF0_D1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_7_4	FM(CTS0_N)		FM(HCTS1_N_B)	FM(MSIOF1_SYNC_B)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_C)FM(STP_ISSYNC_1_C)	FM(RIF1_SYNC_B)	FM(AUDIO_CLKOUT_C)	FM(ADICS_SAMP)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_11_8	FM(RTS0_N_TANS)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	F_(0, 0)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_11_8	FM(RTS0_N)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	F_(0, 0)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_15_12	FM(RX1_A)		FM(HRX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_C)	FM(STP_ISD_0_C)		FM(RIF1_CLK_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_19_16	FM(TX1_A)		FM(HTX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_C)	FM(STP_ISEN_0_C)	FM(RIF1_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_23_20	FM(CTS1_N)		FM(HCTS1_N_A)	FM(MSIOF1_RXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_C)	FM(STP_ISEN_1_C)	FM(RIF1_D0_B)	F_(0, 0)		FM(ADIDATA)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_27_24	FM(RTS1_N_TANS)		FM(HRTS1_N_A)	FM(MSIOF1_TXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_C)	FM(STP_ISD_1_C)		FM(RIF1_D1_B)	F_(0, 0)		FM(ADICHS0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_27_24	FM(RTS1_N)		FM(HRTS1_N_A)	FM(MSIOF1_TXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_C)	FM(STP_ISD_1_C)		FM(RIF1_D1_B)	F_(0, 0)		FM(ADICHS0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_31_28	FM(SCK2)		FM(SCIF_CLK_B)	FM(MSIOF1_SCK_B)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_C)	FM(STP_ISCLK_1_C)	FM(RIF1_CLK_B)	F_(0, 0)		FM(ADICLK)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_3_0	FM(TX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_CD_B)			FM(SCL1_A)	F_(0, 0)	FM(FMCLK_A)		FM(RIF1_D1_C)	F_(0, 0)		FM(FSO_CFE_0_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_7_4	FM(RX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_WP_B)			FM(SDA1_A)	F_(0, 0)	FM(FMIN_A)		FM(RIF1_SYNC_C)	F_(0, 0)		FM(FSO_CFE_1_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -624,7 +624,7 @@ enum {
 
 	PINMUX_IPSR_MSEL(IP0_23_20,	AVB_AVTP_CAPTURE_A,	SEL_ETHERAVB_0),
 	PINMUX_IPSR_MSEL(IP0_23_20,	MSIOF2_TXD_C,		SEL_MSIOF2_2),
-	PINMUX_IPSR_MSEL(IP0_23_20,	RTS4_N_TANS_A,		SEL_SCIF4_0),
+	PINMUX_IPSR_MSEL(IP0_23_20,	RTS4_N_A,		SEL_SCIF4_0),
 
 	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
 	PINMUX_IPSR_GPSR(IP0_27_24,	QPOLB),
@@ -762,7 +762,7 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP3_7_4,	A10),
 	PINMUX_IPSR_MSEL(IP3_7_4,	MSIOF2_RXD_A,		SEL_MSIOF2_0),
-	PINMUX_IPSR_MSEL(IP3_7_4,	RTS4_N_TANS_B,		SEL_SCIF4_1),
+	PINMUX_IPSR_MSEL(IP3_7_4,	RTS4_N_B,		SEL_SCIF4_1),
 	PINMUX_IPSR_GPSR(IP3_7_4,	VI5_HSYNC_N),
 
 	PINMUX_IPSR_GPSR(IP3_11_8,	A11),
@@ -865,7 +865,7 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP5_7_4,	WE1_N),
 	PINMUX_IPSR_MSEL(IP5_7_4,	MSIOF3_SS1_D,		SEL_MSIOF3_3),
-	PINMUX_IPSR_GPSR(IP5_7_4,	RTS3_N_TANS),
+	PINMUX_IPSR_GPSR(IP5_7_4,	RTS3_N),
 	PINMUX_IPSR_GPSR(IP5_7_4,	HRTS3_N),
 	PINMUX_IPSR_MSEL(IP5_7_4,	SDA6_B,			SEL_I2C6_1),
 	PINMUX_IPSR_GPSR(IP5_7_4,	CAN1_RX),
@@ -946,7 +946,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP6_27_24,	MSIOF2_TXD_D,		SEL_MSIOF2_3),
 	PINMUX_IPSR_MSEL(IP6_27_24,	HTX3_B,			SEL_HSCIF3_1),
 	PINMUX_IPSR_MSEL(IP6_27_24,	VI4_DATA3_A,		SEL_VIN4_0),
-	PINMUX_IPSR_MSEL(IP6_27_24,	RTS4_N_TANS_C,		SEL_SCIF4_2),
+	PINMUX_IPSR_MSEL(IP6_27_24,	RTS4_N_C,		SEL_SCIF4_2),
 	PINMUX_IPSR_GPSR(IP6_27_24,	DU_DR3),
 
 	PINMUX_IPSR_GPSR(IP6_31_28,	D12),
@@ -1155,7 +1155,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP12_7_4,	AUDIO_CLKOUT_C),
 	PINMUX_IPSR_GPSR(IP12_7_4,	ADICS_SAMP),
 
-	PINMUX_IPSR_GPSR(IP12_11_8,	RTS0_N_TANS),
+	PINMUX_IPSR_GPSR(IP12_11_8,	RTS0_N),
 	PINMUX_IPSR_MSEL(IP12_11_8,	HRTS1_N_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	MSIOF1_SS1_B,		SEL_MSIOF1_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADG_A_1),
@@ -1184,7 +1184,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP12_23_20,	RIF1_D0_B,		SEL_DRIF1_1),
 	PINMUX_IPSR_GPSR(IP12_23_20,	ADIDATA),
 
-	PINMUX_IPSR_GPSR(IP12_27_24,	RTS1_N_TANS),
+	PINMUX_IPSR_GPSR(IP12_27_24,	RTS1_N),
 	PINMUX_IPSR_MSEL(IP12_27_24,	HRTS1_N_A,		SEL_HSCIF1_0),
 	PINMUX_IPSR_MSEL(IP12_27_24,	MSIOF1_TXD_B,		SEL_MSIOF1_1),
 	PINMUX_IPSR_MSEL(IP12_27_24,	TS_SDAT1_C,		SEL_TSIF1_2),
@@ -3192,7 +3192,7 @@ enum {
 	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 3),
 };
 static const unsigned int scif0_ctrl_mux[] = {
-	RTS0_N_TANS_MARK, CTS0_N_MARK,
+	RTS0_N_MARK, CTS0_N_MARK,
 };
 /* - SCIF1 ------------------------------------------------------------------ */
 static const unsigned int scif1_data_a_pins[] = {
@@ -3214,7 +3214,7 @@ enum {
 	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 7),
 };
 static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_TANS_MARK, CTS1_N_MARK,
+	RTS1_N_MARK, CTS1_N_MARK,
 };
 
 static const unsigned int scif1_data_b_pins[] = {
@@ -3266,7 +3266,7 @@ enum {
 	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
 };
 static const unsigned int scif3_ctrl_mux[] = {
-	RTS3_N_TANS_MARK, CTS3_N_MARK,
+	RTS3_N_MARK, CTS3_N_MARK,
 };
 static const unsigned int scif3_data_b_pins[] = {
 	/* RX, TX */
@@ -3295,7 +3295,7 @@ enum {
 	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 13),
 };
 static const unsigned int scif4_ctrl_a_mux[] = {
-	RTS4_N_TANS_A_MARK, CTS4_N_A_MARK,
+	RTS4_N_A_MARK, CTS4_N_A_MARK,
 };
 static const unsigned int scif4_data_b_pins[] = {
 	/* RX, TX */
@@ -3316,7 +3316,7 @@ enum {
 	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
 };
 static const unsigned int scif4_ctrl_b_mux[] = {
-	RTS4_N_TANS_B_MARK, CTS4_N_B_MARK,
+	RTS4_N_B_MARK, CTS4_N_B_MARK,
 };
 static const unsigned int scif4_data_c_pins[] = {
 	/* RX, TX */
@@ -3337,7 +3337,7 @@ enum {
 	RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
 };
 static const unsigned int scif4_ctrl_c_mux[] = {
-	RTS4_N_TANS_C_MARK, CTS4_N_C_MARK,
+	RTS4_N_C_MARK, CTS4_N_C_MARK,
 };
 /* - SCIF5 ------------------------------------------------------------------ */
 static const unsigned int scif5_data_a_pins[] = {
-- 
1.9.1
