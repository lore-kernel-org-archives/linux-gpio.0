From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Add EtherAVB pins, groups and functions
Date: Mon, 31 Oct 2016 14:46:28 +0100
Message-ID: <1477921588-2326-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52123 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S943203AbcJaNq0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2016 09:46:26 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds AVB_LINK, AVB_MAGIC, AVB_PHY_INT, AVB_MDC, AVB_AVTP_PPS,
AVB_AVTP_MATCH, AVB_AVTP_CAPTURE pins, groups and functions to R8A7796
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 87 ++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index c7b8811fbab554bb..16773e580a902edc 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1490,6 +1490,71 @@ enum {
 	PINMUX_GPIO_GP_ALL(),
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
+	/* AVB_MDC */
+	RCAR_GP_PIN(2, 9),
+};
+static const unsigned int avb_mdc_mux[] = {
+	AVB_MDC_MARK,
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
 /* - DRIF0 --------------------------------------------------------------- */
 static const unsigned int drif0_ctrl_a_pins[] = {
 	/* CLK, SYNC */
@@ -2363,6 +2428,15 @@ enum {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb_link),
+	SH_PFC_PIN_GROUP(avb_magic),
+	SH_PFC_PIN_GROUP(avb_phy_int),
+	SH_PFC_PIN_GROUP(avb_mdc),
+	SH_PFC_PIN_GROUP(avb_avtp_pps),
+	SH_PFC_PIN_GROUP(avb_avtp_match_a),
+	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
+	SH_PFC_PIN_GROUP(avb_avtp_match_b),
+	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
 	SH_PFC_PIN_GROUP(drif0_ctrl_a),
 	SH_PFC_PIN_GROUP(drif0_data0_a),
 	SH_PFC_PIN_GROUP(drif0_data1_a),
@@ -2564,6 +2638,18 @@ enum {
 	"hscif4_data_b",
 };
 
+static const char * const avb_groups[] = {
+	"avb_link",
+	"avb_magic",
+	"avb_phy_int",
+	"avb_mdc",
+	"avb_avtp_pps",
+	"avb_avtp_match_a",
+	"avb_avtp_capture_a",
+	"avb_avtp_match_b",
+	"avb_avtp_capture_b",
+};
+
 static const char * const i2c1_groups[] = {
 	"i2c1_a",
 	"i2c1_b",
@@ -2669,6 +2755,7 @@ enum {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(drif0),
 	SH_PFC_FUNCTION(drif1),
 	SH_PFC_FUNCTION(drif2),
-- 
1.9.1

