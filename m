From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Add CAN support
Date: Fri, 10 Nov 2017 13:58:49 +0000
Message-ID: <20171110135850.32904-2-ramesh.shanmugasundaram@bp.renesas.com>
References: <20171110135850.32904-1-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:56963 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751610AbdKJOAI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Nov 2017 09:00:08 -0500
In-Reply-To: <20171110135850.32904-1-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, chris.paterson2@renesas.com, fabrizio.castro@bp.renesas.com, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

This patch adds CAN[0-1] pinmux support for R-Car H3 ES2.0. The pin
config is identical to H3 ES1.*.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index d1cec6d12e81..59249a990cef 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1781,6 +1781,38 @@ static const unsigned int avb_avtp_capture_b_mux[] = {
 	AVB_AVTP_CAPTURE_B_MARK,
 };
 
+/* - CAN ------------------------------------------------------------------ */
+static const unsigned int can0_data_a_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 23),	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int can0_data_a_mux[] = {
+	CAN0_TX_A_MARK,		CAN0_RX_A_MARK,
+};
+static const unsigned int can0_data_b_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(2, 0),	RCAR_GP_PIN(2, 1),
+};
+static const unsigned int can0_data_b_mux[] = {
+	CAN0_TX_B_MARK,		CAN0_RX_B_MARK,
+};
+static const unsigned int can1_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 22),	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int can1_data_mux[] = {
+	CAN1_TX_MARK,		CAN1_RX_MARK,
+};
+
+/* - CAN Clock -------------------------------------------------------------- */
+static const unsigned int can_clk_pins[] = {
+	/* CLK */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int can_clk_mux[] = {
+	CAN_CLK_MARK,
+};
+
 /* - DRIF0 --------------------------------------------------------------- */
 static const unsigned int drif0_ctrl_a_pins[] = {
 	/* CLK, SYNC */
@@ -3843,6 +3875,10 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
 	SH_PFC_PIN_GROUP(avb_avtp_match_b),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
+	SH_PFC_PIN_GROUP(can0_data_a),
+	SH_PFC_PIN_GROUP(can0_data_b),
+	SH_PFC_PIN_GROUP(can1_data),
+	SH_PFC_PIN_GROUP(can_clk),
 	SH_PFC_PIN_GROUP(drif0_ctrl_a),
 	SH_PFC_PIN_GROUP(drif0_data0_a),
 	SH_PFC_PIN_GROUP(drif0_data1_a),
@@ -4154,6 +4190,19 @@ static const char * const avb_groups[] = {
 	"avb_avtp_capture_b",
 };
 
+static const char * const can0_groups[] = {
+	"can0_data_a",
+	"can0_data_b",
+};
+
+static const char * const can1_groups[] = {
+	"can1_data",
+};
+
+static const char * const can_clk_groups[] = {
+	"can_clk",
+};
+
 static const char * const drif0_groups[] = {
 	"drif0_ctrl_a",
 	"drif0_data0_a",
@@ -4559,6 +4608,9 @@ static const char * const usb30_groups[] = {
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
+	SH_PFC_FUNCTION(can0),
+	SH_PFC_FUNCTION(can1),
+	SH_PFC_FUNCTION(can_clk),
 	SH_PFC_FUNCTION(drif0),
 	SH_PFC_FUNCTION(drif1),
 	SH_PFC_FUNCTION(drif2),
-- 
2.12.2

