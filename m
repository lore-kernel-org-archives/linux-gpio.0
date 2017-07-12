From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] pinctrl: sh-pfc: r8a7795: Fix MSIOF3_{SS1,SS2}_E pin function definitions
Date: Wed, 12 Jul 2017 12:31:13 +0200
Message-ID: <1499855477-20818-2-git-send-email-geert+renesas@glider.be>
References: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:54434 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756115AbdGLKbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 06:31:22 -0400
In-Reply-To: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the incorrect IPSR register value definitions for
MSIOF3_{SS1,SS2}_E pin functions.

This is a correction to the incorrect implementation of IPSR register pin
assignment of the specifications updated for R8A7795 ES2.0 SoC in R-Car
Gen3 Hardware User's Manual Rev.0.53E.

Fixes: b205914c8f822ef2 ("pinctrl: sh-pfc: r8a7795: Add support for R-Car H3 ES2.0")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Reword, update Fixes for upstream]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 1656295af2b0c3be..f27d80c0b2d0953f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -215,8 +215,8 @@
 #define IP0_15_12	FM(AVB_LINK)		F_(0, 0)	FM(MSIOF2_SCK_C)	FM(TX4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_19_16	FM(AVB_AVTP_MATCH_A)	F_(0, 0)	FM(MSIOF2_RXD_C)	FM(CTS4_N_A)			F_(0, 0)	FM(FSCLKST2_N_A) F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_23_20	FM(AVB_AVTP_CAPTURE_A)	F_(0, 0)	FM(MSIOF2_TXD_C)	FM(RTS4_N_TANS_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_27_24	FM(IRQ0)		FM(QPOLB)	F_(0, 0)		FM(DU_CDE)			FM(VI4_DATA0_B) FM(CAN0_TX_B)	FM(CANFD0_TX_B)		FM(MSIOF3_SS1_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_31_28	FM(IRQ1)		FM(QPOLA)	F_(0, 0)		FM(DU_DISP)			FM(VI4_DATA1_B) FM(CAN0_RX_B)	FM(CANFD0_RX_B)		FM(MSIOF3_SS2_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_27_24	FM(IRQ0)		FM(QPOLB)	F_(0, 0)		FM(DU_CDE)			FM(VI4_DATA0_B) FM(CAN0_TX_B)	FM(CANFD0_TX_B)		FM(MSIOF3_SS2_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_31_28	FM(IRQ1)		FM(QPOLA)	F_(0, 0)		FM(DU_DISP)			FM(VI4_DATA1_B) FM(CAN0_RX_B)	FM(CANFD0_RX_B)		FM(MSIOF3_SS1_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_3_0		FM(IRQ2)		FM(QCPV_QDE)	F_(0, 0)		FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(VI4_DATA2_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SYNC_E) F_(0, 0)		FM(PWM3_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_7_4		FM(IRQ3)		FM(QSTVB_QVE)	FM(A25)			FM(DU_DOTCLKOUT1)		FM(VI4_DATA3_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SCK_E) F_(0, 0)		FM(PWM4_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_11_8	FM(IRQ4)		FM(QSTH_QHS)	FM(A24)			FM(DU_EXHSYNC_DU_HSYNC)		FM(VI4_DATA4_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_RXD_E) F_(0, 0)		FM(PWM5_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-- 
2.7.4

