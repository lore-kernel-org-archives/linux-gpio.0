From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Change USB3_{OVC,PWEN} definitions
Date: Wed, 26 Jul 2017 20:28:10 +0900
Message-ID: <1501068491-3926-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068491-3926-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:33557 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751068AbdGZLbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jul 2017 07:31:14 -0400
In-Reply-To: <1501068491-3926-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Since the latest datasheet revises the names, this patch changes
the definitions from USB3_{OVC,PWEN} to USB2_CH3_{OVC,PWEN}.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 7df11d4..947abbd9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -168,8 +168,8 @@
 #define GPSR5_0		F_(SCK0,		IP11_27_24)
 
 /* GPSR6 */
-#define GPSR6_31	F_(USB3_OVC,		IP18_7_4)
-#define GPSR6_30	F_(USB3_PWEN,		IP18_3_0)
+#define GPSR6_31	F_(USB2_CH3_OVC,	IP18_7_4)
+#define GPSR6_30	F_(USB2_CH3_PWEN,	IP18_3_0)
 #define GPSR6_29	F_(USB30_OVC,		IP17_31_28)
 #define GPSR6_28	F_(USB30_PWEN,		IP17_27_24)
 #define GPSR6_27	F_(USB1_OVC,		IP17_23_20)
@@ -361,8 +361,8 @@
 #define IP17_23_20	FM(USB1_OVC)		F_(0, 0)	FM(MSIOF1_SS2_C)	F_(0, 0)			FM(SSI_WS1_A)	FM(TS_SDAT0_E)	FM(STP_ISD_0_E)		FM(FMIN_B)	FM(RIF2_SYNC_B)		F_(0, 0)	FM(REMOCON_B)	F_(0, 0)	F_(0, 0) FM(HCTS2_N_C) F_(0, 0) F_(0, 0)
 #define IP17_27_24	FM(USB30_PWEN)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT_B)		FM(SSI_SCK2_B)	FM(TS_SDEN1_D)	FM(STP_ISEN_1_D)	FM(STP_OPWM_0_E)FM(RIF3_D0_B)		F_(0, 0)	FM(TCLK2_B)	FM(TPU0TO0)	FM(BPFCLK_C) FM(HRTS2_N_C) F_(0, 0) F_(0, 0)
 #define IP17_31_28	FM(USB30_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT1_B)		FM(SSI_WS2_B)	FM(TS_SPSYNC1_D)FM(STP_ISSYNC_1_D)	FM(STP_IVCXO27_0_E)FM(RIF3_D1_B)	F_(0, 0)	FM(FSO_TOE_N)	FM(TPU0TO1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP18_3_0	FM(USB3_PWEN)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT2_B)		FM(SSI_SCK9_B)	FM(TS_SDEN0_E)	FM(STP_ISEN_0_E)	F_(0, 0)	FM(RIF2_D0_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO2)	F_(0, 0) FM(FMCLK_C) FM(FMCLK_D) F_(0, 0)
-#define IP18_7_4	FM(USB3_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT3_B)		FM(SSI_WS9_B)	FM(TS_SPSYNC0_E)FM(STP_ISSYNC_0_E)	F_(0, 0)	FM(RIF2_D1_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO3)	F_(0, 0) FM(FMIN_C) FM(FMIN_D) F_(0, 0)
+#define IP18_3_0	FM(USB2_CH3_PWEN)	F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT2_B)		FM(SSI_SCK9_B)	FM(TS_SDEN0_E)	FM(STP_ISEN_0_E)	F_(0, 0)	FM(RIF2_D0_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO2)	F_(0, 0) FM(FMCLK_C) FM(FMCLK_D) F_(0, 0)
+#define IP18_7_4	FM(USB2_CH3_OVC)	F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT3_B)		FM(SSI_WS9_B)	FM(TS_SPSYNC0_E)FM(STP_ISSYNC_0_E)	F_(0, 0)	FM(RIF2_D1_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO3)	F_(0, 0) FM(FMIN_C) FM(FMIN_D) F_(0, 0)
 
 #define PINMUX_GPSR	\
 \
@@ -1479,7 +1479,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP17_31_28,	TPU0TO1),
 
 	/* IPSR18 */
-	PINMUX_IPSR_GPSR(IP18_3_0,	USB3_PWEN),
+	PINMUX_IPSR_GPSR(IP18_3_0,	USB2_CH3_PWEN),
 	PINMUX_IPSR_GPSR(IP18_3_0,	AUDIO_CLKOUT2_B),
 	PINMUX_IPSR_MSEL(IP18_3_0,	SSI_SCK9_B,		SEL_SSI_1),
 	PINMUX_IPSR_MSEL(IP18_3_0,	TS_SDEN0_E,		SEL_TSIF0_4),
@@ -1489,7 +1489,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP18_3_0,	FMCLK_C,		SEL_FM_2),
 	PINMUX_IPSR_MSEL(IP18_3_0,	FMCLK_D,		SEL_FM_3),
 
-	PINMUX_IPSR_GPSR(IP18_7_4,	USB3_OVC),
+	PINMUX_IPSR_GPSR(IP18_7_4,	USB2_CH3_OVC),
 	PINMUX_IPSR_GPSR(IP18_7_4,	AUDIO_CLKOUT3_B),
 	PINMUX_IPSR_MSEL(IP18_7_4,	SSI_WS9_B,		SEL_SSI_1),
 	PINMUX_IPSR_MSEL(IP18_7_4,	TS_SPSYNC0_E,		SEL_TSIF0_4),
@@ -3961,8 +3961,8 @@ enum {
 		{ RCAR_GP_PIN(6, 27), 20, 3 },	/* USB1_OVC */
 		{ RCAR_GP_PIN(6, 28), 16, 3 },	/* USB30_PWEN */
 		{ RCAR_GP_PIN(6, 29), 12, 3 },	/* USB30_OVC */
-		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* USB3_PWEN */
-		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* USB3_OVC */
+		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* USB2_CH3_PWEN */
+		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* USB2_CH3_OVC */
 	} },
 	{ },
 };
@@ -4192,8 +4192,8 @@ static int r8a7795_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	{ RCAR_GP_PIN(5, 21),    PU5,  1 },	/* MSIOF0_SS2 */
 	{ RCAR_GP_PIN(5, 20),    PU5,  0 },	/* MSIOF0_TXD */
 
-	{ RCAR_GP_PIN(6, 31),    PU6,  6 },	/* USB3_OVC */
-	{ RCAR_GP_PIN(6, 30),    PU6,  5 },	/* USB3_PWEN */
+	{ RCAR_GP_PIN(6, 31),    PU6,  6 },	/* USB2_CH3_OVC */
+	{ RCAR_GP_PIN(6, 30),    PU6,  5 },	/* USB2_CH3_PWEN */
 	{ RCAR_GP_PIN(6, 29),    PU6,  4 },	/* USB30_OVC */
 	{ RCAR_GP_PIN(6, 28),    PU6,  3 },	/* USB30_PWEN */
 	{ RCAR_GP_PIN(6, 27),    PU6,  2 },	/* USB1_OVC */
-- 
1.9.1

