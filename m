From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 14/14] pinctrl: sh-pfc: r8a7796: Rename CS1# pin function definitions
Date: Thu, 13 Jul 2017 01:55:47 +0900
Message-ID: <1499878547-3452-15-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch renames the pin function macro definitions of the GPSR1 and
IPSR4 registers value for the CS1# pin.

This is a correction because GPSR and IPSR register specification for
R8A7796 SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.54E.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index bac9b7fe..6bf26d7 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -67,7 +67,7 @@
 #define GPSR1_24	F_(RD_WR_N,		IP4_31_28)
 #define GPSR1_23	F_(RD_N,		IP4_27_24)
 #define GPSR1_22	F_(BS_N,		IP4_23_20)
-#define GPSR1_21	F_(CS1_N_A26,		IP4_19_16)
+#define GPSR1_21	F_(CS1_N,		IP4_19_16)
 #define GPSR1_20	F_(CS0_N,		IP4_15_12)
 #define GPSR1_19	F_(A19,			IP4_11_8)
 #define GPSR1_18	F_(A18,			IP4_7_4)
@@ -253,7 +253,7 @@
 #define IP4_7_4		FM(A18)			FM(LCDOUT10)	F_(0, 0)		F_(0, 0)			FM(VI4_HSYNC_N)	F_(0, 0)	FM(DU_DG2)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_11_8	FM(A19)			FM(LCDOUT11)	F_(0, 0)		F_(0, 0)			FM(VI4_CLKENB)	F_(0, 0)	FM(DU_DG3)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_15_12	FM(CS0_N)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(VI5_CLKENB)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP4_19_16	FM(CS1_N_A26)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(VI5_CLK)	F_(0, 0)		FM(EX_WAIT0_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP4_19_16	FM(CS1_N)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(VI5_CLK)	F_(0, 0)		FM(EX_WAIT0_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_23_20	FM(BS_N)		FM(QSTVA_QVS)	FM(MSIOF3_SCK_D)	FM(SCK3)			FM(HSCK3)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(CAN1_TX)		FM(CANFD1_TX)	FM(IETX_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_27_24	FM(RD_N)		F_(0, 0)	FM(MSIOF3_SYNC_D)	FM(RX3_A)			FM(HRX3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(CAN0_TX_A)		FM(CANFD0_TX_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_31_28	FM(RD_WR_N)		F_(0, 0)	FM(MSIOF3_RXD_D)	FM(TX3_A)			FM(HTX3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(CAN0_RX_A)		FM(CANFD0_RX_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -834,7 +834,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP4_15_12,	CS0_N),
 	PINMUX_IPSR_GPSR(IP4_15_12,	VI5_CLKENB),
 
-	PINMUX_IPSR_GPSR(IP4_19_16,	CS1_N_A26),
+	PINMUX_IPSR_GPSR(IP4_19_16,	CS1_N),
 	PINMUX_IPSR_GPSR(IP4_19_16,	VI5_CLK),
 	PINMUX_IPSR_MSEL(IP4_19_16,	EX_WAIT0_B,		SEL_LBSC_1),
 
@@ -5494,7 +5494,7 @@ static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	{ RCAR_GP_PIN(1, 24),    PU2,  5 },	/* RD_WR_N */
 	{ RCAR_GP_PIN(1, 23),    PU2,  4 },	/* RD_N */
 	{ RCAR_GP_PIN(1, 22),    PU2,  3 },	/* BS_N */
-	{ RCAR_GP_PIN(1, 21),    PU2,  2 },	/* CS1_N_A26 */
+	{ RCAR_GP_PIN(1, 21),    PU2,  2 },	/* CS1_N */
 	{ RCAR_GP_PIN(1, 20),    PU2,  1 },	/* CS0_N */
 	{ RCAR_GP_PIN(1, 28),    PU2,  0 },	/* CLKOUT */
 
-- 
1.9.1
