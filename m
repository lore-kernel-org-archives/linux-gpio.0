From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins, groups and functions
Date: Thu, 14 Sep 2017 08:52:42 +0900
Message-ID: <1505346762-3666-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 About AVB'0', I don't get any feedback from HW team... So, I'd like to follow
 the current PFC section in the manual.

 Changes from v1:
  - Changes the groups like other SoCs (r8a7795 and r8a7796).

 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 119 ++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 4f5ee1d..0e803e9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -936,6 +936,99 @@ enum {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - EtherAVB --------------------------------------------------------------- */
+static const unsigned int avb0_link_pins[] = {
+	/* AVB0_LINK */
+	RCAR_GP_PIN(5, 20),
+};
+static const unsigned int avb0_link_mux[] = {
+	AVB0_LINK_MARK,
+};
+static const unsigned int avb0_magic_pins[] = {
+	/* AVB0_MAGIC */
+	RCAR_GP_PIN(5, 18),
+};
+static const unsigned int avb0_magic_mux[] = {
+	AVB0_MAGIC_MARK,
+};
+static const unsigned int avb0_phy_int_pins[] = {
+	/* AVB0_PHY_INT */
+	RCAR_GP_PIN(5, 19),
+};
+static const unsigned int avb0_phy_int_mux[] = {
+	AVB0_PHY_INT_MARK,
+};
+static const unsigned int avb0_mdc_pins[] = {
+	/* AVB0_MDC, AVB_MDIO */
+	RCAR_GP_PIN(5, 17), RCAR_GP_PIN(5, 16),
+};
+static const unsigned int avb0_mdc_mux[] = {
+	AVB0_MDC_MARK, AVB0_MDIO_MARK,
+};
+static const unsigned int avb0_mii_pins[] = {
+	/*
+	 * AVB0_TX_CTL, AVB0_TXC, AVB0_TD0,
+	 * AVB0_TD1, AVB0_TD2, AVB0_TD3,
+	 * AVB0_RX_CTL, AVB0_RXC, AVB0_RD0,
+	 * AVB0_RD1, AVB0_RD2, AVB0_RD3,
+	 * AVB0_TXCREFCLK
+	 */
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13), RCAR_GP_PIN(5, 14),
+	RCAR_GP_PIN(5, 3), RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 5),
+	RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7), RCAR_GP_PIN(5, 8),
+	RCAR_GP_PIN(5, 15),
+};
+static const unsigned int avb0_mii_mux[] = {
+	AVB0_TX_CTL_MARK, AVB0_TXC_MARK, AVB0_TD0_MARK,
+	AVB0_TD1_MARK, AVB0_TD2_MARK, AVB0_TD3_MARK,
+	AVB0_RX_CTL_MARK, AVB0_RXC_MARK, AVB0_RD0_MARK,
+	AVB0_RD1_MARK, AVB0_RD2_MARK, AVB0_RD3_MARK,
+	AVB0_TXCREFCLK_MARK,
+};
+static const unsigned int avb0_avtp_pps_a_pins[] = {
+	/* AVB0_AVTP_PPS_A */
+	RCAR_GP_PIN(5, 2),
+};
+static const unsigned int avb0_avtp_pps_a_mux[] = {
+	AVB0_AVTP_PPS_A_MARK,
+};
+static const unsigned int avb0_avtp_match_a_pins[] = {
+	/* AVB0_AVTP_MATCH_A */
+	RCAR_GP_PIN(5, 1),
+};
+static const unsigned int avb0_avtp_match_a_mux[] = {
+	AVB0_AVTP_MATCH_A_MARK,
+};
+static const unsigned int avb0_avtp_capture_a_pins[] = {
+	/* AVB0_AVTP_CAPTURE_A */
+	RCAR_GP_PIN(5, 0),
+};
+static const unsigned int avb0_avtp_capture_a_mux[] = {
+	AVB0_AVTP_CAPTURE_A_MARK,
+};
+static const unsigned int avb0_avtp_pps_b_pins[] = {
+	/* AVB0_AVTP_PPS_B */
+	RCAR_GP_PIN(4, 16),
+};
+static const unsigned int avb0_avtp_pps_b_mux[] = {
+	AVB0_AVTP_PPS_B_MARK,
+};
+static const unsigned int avb0_avtp_match_b_pins[] = {
+	/*  AVB0_AVTP_MATCH_B */
+	RCAR_GP_PIN(4, 18),
+};
+static const unsigned int avb0_avtp_match_b_mux[] = {
+	AVB0_AVTP_MATCH_B_MARK,
+};
+static const unsigned int avb0_avtp_capture_b_pins[] = {
+	/* AVB0_AVTP_CAPTURE_B */
+	RCAR_GP_PIN(4, 17),
+};
+static const unsigned int avb0_avtp_capture_b_mux[] = {
+	AVB0_AVTP_CAPTURE_B_MARK,
+};
+
 /* - I2C -------------------------------------------------------------------- */
 static const unsigned int i2c0_pins[] = {
 	/* SCL, SDA */
@@ -1203,6 +1296,17 @@ enum {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb0_link),
+	SH_PFC_PIN_GROUP(avb0_magic),
+	SH_PFC_PIN_GROUP(avb0_phy_int),
+	SH_PFC_PIN_GROUP(avb0_mdc),
+	SH_PFC_PIN_GROUP(avb0_mii),
+	SH_PFC_PIN_GROUP(avb0_avtp_pps_a),
+	SH_PFC_PIN_GROUP(avb0_avtp_match_a),
+	SH_PFC_PIN_GROUP(avb0_avtp_capture_a),
+	SH_PFC_PIN_GROUP(avb0_avtp_pps_b),
+	SH_PFC_PIN_GROUP(avb0_avtp_match_b),
+	SH_PFC_PIN_GROUP(avb0_avtp_capture_b),
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
 	SH_PFC_PIN_GROUP(i2c2_a),
@@ -1240,6 +1344,20 @@ enum {
 	SH_PFC_PIN_GROUP(scif_clk),
 };
 
+static const char * const avb0_groups[] = {
+	"avb0_link",
+	"avb0_magic",
+	"avb0_phy_int",
+	"avb0_mdc",
+	"avb0_mii",
+	"avb0_avtp_pps_a",
+	"avb0_avtp_match_a",
+	"avb0_avtp_capture_a",
+	"avb0_avtp_pps_b",
+	"avb0_avtp_match_b",
+	"avb0_avtp_capture_b",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -1311,6 +1429,7 @@ enum {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
1.9.1
