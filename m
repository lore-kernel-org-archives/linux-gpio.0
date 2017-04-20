From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Add group for AVB MDIO and MII pins
Date: Thu, 20 Apr 2017 11:49:06 +0200
Message-ID: <1492681746-20005-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Group the AVB pins into similar groups as found in other sh-pfc drivers.
The pins can not be muxed between functions other than AVB, but their
drive strengths can be controlled.

The group avb_mdc containing ADV_MDC and ADV_MDIO is called avb_mdio on
other SoCs.  In pfc-r8a7796 the avb_mdc group already existed and is in
use in DT. Therefore add the ADV_MDIO pin to the existing group instead
of renaming it.

Based on commit b25719eb938eb39a ("pinctrl: sh-pfc: r8a7795: Add group
for AVB MDIO and MII pins").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued up in sh-pfc-for-v4.13.

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index b0362ae707e2e59a..b9c3d9d7ca75023f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1605,11 +1605,33 @@ static const unsigned int avb_phy_int_mux[] = {
 	AVB_PHY_INT_MARK,
 };
 static const unsigned int avb_mdc_pins[] = {
-	/* AVB_MDC */
-	RCAR_GP_PIN(2, 9),
+	/* AVB_MDC, AVB_MDIO */
+	RCAR_GP_PIN(2, 9), PIN_NUMBER('A', 9),
 };
 static const unsigned int avb_mdc_mux[] = {
-	AVB_MDC_MARK,
+	AVB_MDC_MARK, AVB_MDIO_MARK,
+};
+static const unsigned int avb_mii_pins[] = {
+	/*
+	 * AVB_TX_CTL, AVB_TXC, AVB_TD0,
+	 * AVB_TD1, AVB_TD2, AVB_TD3,
+	 * AVB_RX_CTL, AVB_RXC, AVB_RD0,
+	 * AVB_RD1, AVB_RD2, AVB_RD3,
+	 * AVB_TXCREFCLK
+	 */
+	PIN_NUMBER('A', 8), PIN_NUMBER('A', 19), PIN_NUMBER('A', 18),
+	PIN_NUMBER('B', 18), PIN_NUMBER('A', 17), PIN_NUMBER('B', 17),
+	PIN_NUMBER('A', 16), PIN_NUMBER('B', 19), PIN_NUMBER('A', 13),
+	PIN_NUMBER('B', 13), PIN_NUMBER('A', 14), PIN_NUMBER('B', 14),
+	PIN_NUMBER('A', 12),
+
+};
+static const unsigned int avb_mii_mux[] = {
+	AVB_TX_CTL_MARK, AVB_TXC_MARK, AVB_TD0_MARK,
+	AVB_TD1_MARK, AVB_TD2_MARK, AVB_TD3_MARK,
+	AVB_RX_CTL_MARK, AVB_RXC_MARK, AVB_RD0_MARK,
+	AVB_RD1_MARK, AVB_RD2_MARK, AVB_RD3_MARK,
+	AVB_TXCREFCLK_MARK,
 };
 static const unsigned int avb_avtp_pps_pins[] = {
 	/* AVB_AVTP_PPS */
@@ -3381,6 +3403,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_magic),
 	SH_PFC_PIN_GROUP(avb_phy_int),
 	SH_PFC_PIN_GROUP(avb_mdc),
+	SH_PFC_PIN_GROUP(avb_mii),
 	SH_PFC_PIN_GROUP(avb_avtp_pps),
 	SH_PFC_PIN_GROUP(avb_avtp_match_a),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
@@ -3627,6 +3650,7 @@ static const char * const avb_groups[] = {
 	"avb_magic",
 	"avb_phy_int",
 	"avb_mdc",
+	"avb_mii",
 	"avb_avtp_pps",
 	"avb_avtp_match_a",
 	"avb_avtp_capture_a",
-- 
2.7.4
