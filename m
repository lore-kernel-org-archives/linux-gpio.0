From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77995: Remove USB0_IDIN and USB0_IDPU pins
Date: Wed, 11 Oct 2017 10:32:31 +0200
Message-ID: <1507710751-14138-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

R-Car Gen3 Hardware Manual Errata for Rev 0.55 of September 8, 2017
removed the USB0_IDIN and USB0_IDPU pins on R-Car D3.

This change has no functional impact, as these definitions were unused.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued up in sh-pfc-for-v4.15.

 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 3f67b8d4f05085ce..b151fc15d8e8d2a7 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -198,8 +198,8 @@
 #define GPSR6_0		FM(QSPI0_SPCLK)
 
 /* IPSRx */		/* 0 */			/* 1 */			/* 2 */			/* 3 */		/* 4 */			/* 5 */		/* 6  - F */
-#define IP0_3_0		FM(IRQ0_A)		FM(MSIOF2_SYNC_B)	FM(USB0_IDIN)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_7_4		FM(MSIOF2_SCK)		F_(0, 0)		FM(USB0_IDPU)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_3_0		FM(IRQ0_A)		FM(MSIOF2_SYNC_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_7_4		FM(MSIOF2_SCK)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_11_8	FM(MSIOF2_TXD)		FM(SCL3_A)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_15_12	FM(MSIOF2_RXD)		FM(SDA3_A)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_19_16	FM(MLB_CLK)		FM(MSIOF2_SYNC_A)	FM(SCK5_A)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -522,10 +522,8 @@ static const u16 pinmux_data[] = {
 	/* IPSR0 */
 	PINMUX_IPSR_MSEL(IP0_3_0,	IRQ0_A, SEL_IRQ_0_0),
 	PINMUX_IPSR_MSEL(IP0_3_0,	MSIOF2_SYNC_B, SEL_MSIOF2_1),
-	PINMUX_IPSR_GPSR(IP0_3_0,	USB0_IDIN),
 
 	PINMUX_IPSR_GPSR(IP0_7_4,	MSIOF2_SCK),
-	PINMUX_IPSR_GPSR(IP0_7_4,	USB0_IDPU),
 
 	PINMUX_IPSR_GPSR(IP0_11_8,	MSIOF2_TXD),
 	PINMUX_IPSR_MSEL(IP0_11_8,	SCL3_A, SEL_I2C3_0),
-- 
2.7.4
