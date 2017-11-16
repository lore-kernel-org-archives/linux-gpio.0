From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add GP-1-28 port pin support
Date: Thu, 16 Nov 2017 12:14:51 +0900
Message-ID: <1510802091-30535-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:52176 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759178AbdKPDPh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 22:15:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch supports GP-1-28 port pin of R8A7795 ES2.0 SoC added in
Rev.0.54E of the R-Car Gen3 Hardware User's Manual or later version.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the for-next branch of linux-pinctrl tree.

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index d1cec6d..85699fb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -20,7 +20,7 @@
 
 #define CPU_ALL_PORT(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
-	PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),	\
+	PORT_GP_CFG_29(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
 	PORT_GP_CFG_1(3, 12, fn, sfx, CFG_FLAGS),	\
@@ -55,6 +55,7 @@
 #define GPSR0_0		F_(D0,			IP5_15_12)
 
 /* GPSR1 */
+#define GPSR1_28	FM(CLKOUT)
 #define GPSR1_27	F_(EX_WAIT0_A,		IP5_11_8)
 #define GPSR1_26	F_(WE1_N,		IP5_7_4)
 #define GPSR1_25	F_(WE0_N,		IP5_3_0)
@@ -368,7 +369,7 @@
 												GPSR6_31 \
 												GPSR6_30 \
 												GPSR6_29 \
-												GPSR6_28 \
+		GPSR1_28									GPSR6_28 \
 		GPSR1_27									GPSR6_27 \
 		GPSR1_26									GPSR6_26 \
 		GPSR1_25							GPSR5_25	GPSR6_25 \
@@ -548,7 +549,7 @@
 	FM(AVB_TX_CTL) FM(AVB_TXC) FM(AVB_TD0) FM(AVB_TD1) FM(AVB_TD2) FM(AVB_TD3) \
 	FM(AVB_RX_CTL) FM(AVB_RXC) FM(AVB_RD0) FM(AVB_RD1) FM(AVB_RD2) FM(AVB_RD3) \
 	FM(AVB_TXCREFCLK) FM(AVB_MDIO) \
-	FM(CLKOUT) FM(PRESETOUT) \
+	FM(PRESETOUT) \
 	FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN2) FM(DU_DOTCLKIN3) \
 	FM(TMS) FM(TDO) FM(ASEBRK) FM(MLB_REF) FM(TDI) FM(TCK) FM(TRST) FM(EXTALR)
 
@@ -587,6 +588,7 @@ enum {
 
 	PINMUX_SINGLE(AVS1),
 	PINMUX_SINGLE(AVS2),
+	PINMUX_SINGLE(CLKOUT),
 	PINMUX_SINGLE(HDMI0_CEC),
 	PINMUX_SINGLE(HDMI1_CEC),
 	PINMUX_SINGLE(I2C_SEL_0_1),
@@ -4644,7 +4646,7 @@ enum {
 		0, 0,
 		0, 0,
 		0, 0,
-		0, 0,
+		GP_1_28_FN,	GPSR1_28,
 		GP_1_27_FN,	GPSR1_27,
 		GP_1_26_FN,	GPSR1_26,
 		GP_1_25_FN,	GPSR1_25,
@@ -5246,7 +5248,7 @@ enum {
 		{ RCAR_GP_PIN(1, 19),  0, 3 },	/* A19 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL8", 0xe6060320) {
-		{ PIN_NUMBER('F', 1), 28, 3 },	/* CLKOUT */
+		{ RCAR_GP_PIN(1, 28), 28, 3 },	/* CLKOUT */
 		{ RCAR_GP_PIN(1, 20), 24, 3 },	/* CS0 */
 		{ RCAR_GP_PIN(1, 21), 20, 3 },	/* CS1_A26 */
 		{ RCAR_GP_PIN(1, 22), 16, 3 },	/* BS */
-- 
1.9.1

