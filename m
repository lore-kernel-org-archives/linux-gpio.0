From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add EtherAVB pins, groups and function
Date: Fri,  9 Jun 2017 13:51:23 +0200
Message-ID: <1497009083-4369-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41036 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751545AbdFILv3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 07:51:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Add pins, groups, and a function for EtherAVB on R-Car H3 ES2.0.

Extracted from a big patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.13.

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 111 +++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index c31881ba4f8de9c7..f220bf124ca17f96 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1576,6 +1576,93 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
 };
 
+/* - EtherAVB --------------------------------------------------------------- */
+static const unsigned int avb_link_pins[] = {
+	/* AVB_LINK */
+	RCAR_GP_PIN(2, 12),
+};
+static const unsigned int avb_link_mux[] = {
+	AVB_LINK_MARK,
+};
+static const unsigned int avb_magic_pins[] = {
+	/* AVB_MAGIC_ */
+	RCAR_GP_PIN(2, 10),
+};
+static const unsigned int avb_magic_mux[] = {
+	AVB_MAGIC_MARK,
+};
+static const unsigned int avb_phy_int_pins[] = {
+	/* AVB_PHY_INT */
+	RCAR_GP_PIN(2, 11),
+};
+static const unsigned int avb_phy_int_mux[] = {
+	AVB_PHY_INT_MARK,
+};
+static const unsigned int avb_mdc_pins[] = {
+	/* AVB_MDC, AVB_MDIO */
+	RCAR_GP_PIN(2, 9), PIN_NUMBER('A', 9),
+};
+static const unsigned int avb_mdc_mux[] = {
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
+};
+static const unsigned int avb_avtp_pps_pins[] = {
+	/* AVB_AVTP_PPS */
+	RCAR_GP_PIN(2, 6),
+};
+static const unsigned int avb_avtp_pps_mux[] = {
+	AVB_AVTP_PPS_MARK,
+};
+static const unsigned int avb_avtp_match_a_pins[] = {
+	/* AVB_AVTP_MATCH_A */
+	RCAR_GP_PIN(2, 13),
+};
+static const unsigned int avb_avtp_match_a_mux[] = {
+	AVB_AVTP_MATCH_A_MARK,
+};
+static const unsigned int avb_avtp_capture_a_pins[] = {
+	/* AVB_AVTP_CAPTURE_A */
+	RCAR_GP_PIN(2, 14),
+};
+static const unsigned int avb_avtp_capture_a_mux[] = {
+	AVB_AVTP_CAPTURE_A_MARK,
+};
+static const unsigned int avb_avtp_match_b_pins[] = {
+	/*  AVB_AVTP_MATCH_B */
+	RCAR_GP_PIN(1, 8),
+};
+static const unsigned int avb_avtp_match_b_mux[] = {
+	AVB_AVTP_MATCH_B_MARK,
+};
+static const unsigned int avb_avtp_capture_b_pins[] = {
+	/* AVB_AVTP_CAPTURE_B */
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int avb_avtp_capture_b_mux[] = {
+	AVB_AVTP_CAPTURE_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -1790,6 +1877,16 @@ static const unsigned int scif_clk_b_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb_link),
+	SH_PFC_PIN_GROUP(avb_magic),
+	SH_PFC_PIN_GROUP(avb_phy_int),
+	SH_PFC_PIN_GROUP(avb_mdc),
+	SH_PFC_PIN_GROUP(avb_mii),
+	SH_PFC_PIN_GROUP(avb_avtp_pps),
+	SH_PFC_PIN_GROUP(avb_avtp_match_a),
+	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
+	SH_PFC_PIN_GROUP(avb_avtp_match_b),
+	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1821,6 +1918,19 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif_clk_b),
 };
 
+static const char * const avb_groups[] = {
+	"avb_link",
+	"avb_magic",
+	"avb_phy_int",
+	"avb_mdc",
+	"avb_mii",
+	"avb_avtp_pps",
+	"avb_avtp_match_a",
+	"avb_avtp_capture_a",
+	"avb_avtp_match_b",
+	"avb_avtp_capture_b",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -1872,6 +1982,7 @@ static const char * const scif_clk_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.7.4

