From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 3/4] pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
Date: Thu,  3 Nov 2016 17:15:29 +0100
Message-ID: <20161103161530.11763-4-niklas.soderlund+renesas@ragnatech.se>
References: <20161103161530.11763-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161103161530.11763-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: linux-gpio@vger.kernel.org

Group the AVB pins into similar groups found in other sh-pfc drivers.
The pins can not be muxed between functions other then AVB but their
drive strength can be controlled.

The group avb_mdc containing ADV_MDC and ADV_MDIO are on other SoCs
called avb_mdio. In pfc-r8a7795 the avb_mdc group already existed and
is in use in DT. Therefore add the ADV_MDIO pin to the existing group
instead of renaming it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 1bccf41..c503f97 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1647,11 +1647,33 @@ static const unsigned int avb_phy_int_mux[] = {
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
+	 * AVB_TXREFCLK
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
+	AVB_TXREFCLK_MARK,
 };
 static const unsigned int avb_avtp_pps_pins[] = {
 	/* AVB_AVTP_PPS */
@@ -3719,6 +3741,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_magic),
 	SH_PFC_PIN_GROUP(avb_phy_int),
 	SH_PFC_PIN_GROUP(avb_mdc),
+	SH_PFC_PIN_GROUP(avb_mii),
 	SH_PFC_PIN_GROUP(avb_avtp_pps),
 	SH_PFC_PIN_GROUP(avb_avtp_match_a),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
@@ -4023,6 +4046,7 @@ static const char * const avb_groups[] = {
 	"avb_magic",
 	"avb_phy_int",
 	"avb_mdc",
+	"avb_mii",
 	"avb_avtp_pps",
 	"avb_avtp_match_a",
 	"avb_avtp_capture_a",
-- 
2.10.2
