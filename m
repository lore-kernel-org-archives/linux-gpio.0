From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Rename SSI_{WS,SCK}0129 to SSI_{WS,SCK}01239
Date: Fri, 15 Jan 2016 12:07:03 +0100
Message-ID: <1452856024-10793-2-git-send-email-geert+renesas@glider.be>
References: <1452856024-10793-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1452856024-10793-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Cfr. Manual Errata for Rev 0.50 of the R-Car Gen3 datasheet.

This has no user-visible impact, as the string used for configuration
("ssi01239_ctrl") was already correct.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index bcd56affb81350d1..ca55ec92c7716e88 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -189,8 +189,8 @@
 #define GPSR6_4		F_(SSI_SDATA2_A,	IP14_7_4)
 #define GPSR6_3		F_(SSI_SDATA1_A,	IP14_3_0)
 #define GPSR6_2		F_(SSI_SDATA0,		IP13_31_28)
-#define GPSR6_1		F_(SSI_WS0129,		IP13_27_24)
-#define GPSR6_0		F_(SSI_SCK0129,		IP13_23_20)
+#define GPSR6_1		F_(SSI_WS01239,		IP13_27_24)
+#define GPSR6_0		F_(SSI_SCK01239,	IP13_23_20)
 
 /* GPSR7 */
 #define GPSR7_3		FM(HDMI1_CEC)
@@ -315,8 +315,8 @@
 #define IP13_11_8	FM(MLB_CLK)		F_(0, 0)	FM(MSIOF1_SCK_F)	F_(0, 0)			FM(SCL1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_15_12	FM(MLB_SIG)		FM(RX1_B)	FM(MSIOF1_SYNC_F)	F_(0, 0)			FM(SDA1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_19_16	FM(MLB_DAT)		FM(TX1_B)	FM(MSIOF1_RXD_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_23_20	FM(SSI_SCK0129)		F_(0, 0)	FM(MSIOF1_TXD_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_27_24	FM(SSI_WS0129)		F_(0, 0)	FM(MSIOF1_SS1_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_23_20	FM(SSI_SCK01239)	F_(0, 0)	FM(MSIOF1_TXD_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_27_24	FM(SSI_WS01239)		F_(0, 0)	FM(MSIOF1_SS1_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP13_31_28	FM(SSI_SDATA0)		F_(0, 0)	FM(MSIOF1_SS2_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP14_3_0	FM(SSI_SDATA1_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP14_7_4	FM(SSI_SDATA2_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			FM(SSI_SCK1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -1214,10 +1214,10 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP13_19_16,	TX1_B,			SEL_SCIF1_1),
 	PINMUX_IPSR_MSEL(IP13_19_16,	MSIOF1_RXD_F,		SEL_MSIOF1_5),
 
-	PINMUX_IPSR_GPSR(IP13_23_20,	SSI_SCK0129),
+	PINMUX_IPSR_GPSR(IP13_23_20,	SSI_SCK01239),
 	PINMUX_IPSR_MSEL(IP13_23_20,	MSIOF1_TXD_F,		SEL_MSIOF1_5),
 
-	PINMUX_IPSR_GPSR(IP13_27_24,	SSI_WS0129),
+	PINMUX_IPSR_GPSR(IP13_27_24,	SSI_WS01239),
 	PINMUX_IPSR_MSEL(IP13_27_24,	MSIOF1_SS1_F,		SEL_MSIOF1_5),
 
 	PINMUX_IPSR_GPSR(IP13_31_28,	SSI_SDATA0),
@@ -2926,7 +2926,7 @@ static const unsigned int ssi01239_ctrl_pins[] = {
 	RCAR_GP_PIN(6, 0), RCAR_GP_PIN(6, 1),
 };
 static const unsigned int ssi01239_ctrl_mux[] = {
-	SSI_SCK0129_MARK, SSI_WS0129_MARK,
+	SSI_SCK01239_MARK, SSI_WS01239_MARK,
 };
 static const unsigned int ssi1_data_a_pins[] = {
 	/* SDATA */
-- 
1.9.1

