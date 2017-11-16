From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Fix to delete A20..A25 pins function definitions
Date: Thu, 16 Nov 2017 12:17:18 +0900
Message-ID: <1510802238-30752-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:54661 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdKPDRh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 22:17:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the macro definitions of A20..A25 pins function deleted.

This is a correction because IPSR register specification for R8A7796 SoC
was changed in R-Car Gen3 Hardware User's Manual Rev.0.53E.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the for-next branch of linux-pinctrl tree.

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 73ed9c7..954daae 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -224,12 +224,12 @@
 #define IP0_27_24	FM(IRQ0)		FM(QPOLB)	F_(0, 0)		FM(DU_CDE)			FM(VI4_DATA0_B) FM(CAN0_TX_B)	FM(CANFD0_TX_B)		FM(MSIOF3_SS2_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_31_28	FM(IRQ1)		FM(QPOLA)	F_(0, 0)		FM(DU_DISP)			FM(VI4_DATA1_B) FM(CAN0_RX_B)	FM(CANFD0_RX_B)		FM(MSIOF3_SS1_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_3_0		FM(IRQ2)		FM(QCPV_QDE)	F_(0, 0)		FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(VI4_DATA2_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SYNC_E) F_(0, 0)		FM(PWM3_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_7_4		FM(IRQ3)		FM(QSTVB_QVE)	FM(A25)			FM(DU_DOTCLKOUT1)		FM(VI4_DATA3_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SCK_E) F_(0, 0)		FM(PWM4_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_11_8	FM(IRQ4)		FM(QSTH_QHS)	FM(A24)			FM(DU_EXHSYNC_DU_HSYNC)		FM(VI4_DATA4_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_RXD_E) F_(0, 0)		FM(PWM5_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_15_12	FM(IRQ5)		FM(QSTB_QHE)	FM(A23)			FM(DU_EXVSYNC_DU_VSYNC)		FM(VI4_DATA5_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_TXD_E) F_(0, 0)		FM(PWM6_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_19_16	FM(PWM0)		FM(AVB_AVTP_PPS)FM(A22)			F_(0, 0)			FM(VI4_DATA6_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IECLK_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_23_20	FM(PWM1_A)		F_(0, 0)	FM(A21)			FM(HRX3_D)			FM(VI4_DATA7_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IERX_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_27_24	FM(PWM2_A)		F_(0, 0)	FM(A20)			FM(HTX3_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IETX_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_7_4		FM(IRQ3)		FM(QSTVB_QVE)	F_(0, 0)		FM(DU_DOTCLKOUT1)		FM(VI4_DATA3_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SCK_E) F_(0, 0)		FM(PWM4_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_11_8	FM(IRQ4)		FM(QSTH_QHS)	F_(0, 0)		FM(DU_EXHSYNC_DU_HSYNC)		FM(VI4_DATA4_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_RXD_E) F_(0, 0)		FM(PWM5_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_15_12	FM(IRQ5)		FM(QSTB_QHE)	F_(0, 0)		FM(DU_EXVSYNC_DU_VSYNC)		FM(VI4_DATA5_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_TXD_E) F_(0, 0)		FM(PWM6_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_19_16	FM(PWM0)		FM(AVB_AVTP_PPS)F_(0, 0)		F_(0, 0)			FM(VI4_DATA6_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IECLK_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_23_20	FM(PWM1_A)		F_(0, 0)	F_(0, 0)		FM(HRX3_D)			FM(VI4_DATA7_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IERX_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_27_24	FM(PWM2_A)		F_(0, 0)	F_(0, 0)		FM(HTX3_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IETX_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_31_28	FM(A0)			FM(LCDOUT16)	FM(MSIOF3_SYNC_B)	F_(0, 0)			FM(VI4_DATA8)	F_(0, 0)	FM(DU_DB0)		F_(0, 0)	F_(0, 0)		FM(PWM3_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_3_0		FM(A1)			FM(LCDOUT17)	FM(MSIOF3_TXD_B)	F_(0, 0)			FM(VI4_DATA9)	F_(0, 0)	FM(DU_DB1)		F_(0, 0)	F_(0, 0)		FM(PWM4_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_7_4		FM(A2)			FM(LCDOUT18)	FM(MSIOF3_SCK_B)	F_(0, 0)			FM(VI4_DATA10)	F_(0, 0)	FM(DU_DB2)		F_(0, 0)	F_(0, 0)		FM(PWM5_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -654,7 +654,6 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP1_7_4,	IRQ3),
 	PINMUX_IPSR_GPSR(IP1_7_4,	QSTVB_QVE),
-	PINMUX_IPSR_GPSR(IP1_7_4,	A25),
 	PINMUX_IPSR_GPSR(IP1_7_4,	DU_DOTCLKOUT1),
 	PINMUX_IPSR_MSEL(IP1_7_4,	VI4_DATA3_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_7_4,	PWM4_B,			SEL_PWM4_1),
@@ -662,7 +661,6 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP1_11_8,	IRQ4),
 	PINMUX_IPSR_GPSR(IP1_11_8,	QSTH_QHS),
-	PINMUX_IPSR_GPSR(IP1_11_8,	A24),
 	PINMUX_IPSR_GPSR(IP1_11_8,	DU_EXHSYNC_DU_HSYNC),
 	PINMUX_IPSR_MSEL(IP1_11_8,	VI4_DATA4_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_11_8,	PWM5_B,			SEL_PWM5_1),
@@ -670,7 +668,6 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP1_15_12,	IRQ5),
 	PINMUX_IPSR_GPSR(IP1_15_12,	QSTB_QHE),
-	PINMUX_IPSR_GPSR(IP1_15_12,	A23),
 	PINMUX_IPSR_GPSR(IP1_15_12,	DU_EXVSYNC_DU_VSYNC),
 	PINMUX_IPSR_MSEL(IP1_15_12,	VI4_DATA5_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_15_12,	PWM6_B,			SEL_PWM6_1),
@@ -678,18 +675,15 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP1_19_16,	PWM0),
 	PINMUX_IPSR_GPSR(IP1_19_16,	AVB_AVTP_PPS),
-	PINMUX_IPSR_GPSR(IP1_19_16,	A22),
 	PINMUX_IPSR_MSEL(IP1_19_16,	VI4_DATA6_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_19_16,	IECLK_B,		SEL_IEBUS_1),
 
 	PINMUX_IPSR_MSEL(IP1_23_20,	PWM1_A,			SEL_PWM1_0),
-	PINMUX_IPSR_GPSR(IP1_23_20,	A21),
 	PINMUX_IPSR_MSEL(IP1_23_20,	HRX3_D,			SEL_HSCIF3_3),
 	PINMUX_IPSR_MSEL(IP1_23_20,	VI4_DATA7_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_23_20,	IERX_B,			SEL_IEBUS_1),
 
 	PINMUX_IPSR_MSEL(IP1_27_24,	PWM2_A,			SEL_PWM2_0),
-	PINMUX_IPSR_GPSR(IP1_27_24,	A20),
 	PINMUX_IPSR_MSEL(IP1_27_24,	HTX3_D,			SEL_HSCIF3_3),
 	PINMUX_IPSR_MSEL(IP1_27_24,	IETX_B,			SEL_IEBUS_1),
 
-- 
1.9.1

