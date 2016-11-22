From: Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7796: Add CAN support
Date: Tue, 22 Nov 2016 13:49:02 +0000
Message-ID: <1479822543-4804-2-git-send-email-chris.paterson2@renesas.com>
References: <1479822543-4804-1-git-send-email-chris.paterson2@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1479822543-4804-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, ramesh.shanmugasundaram@bp.renesas.com, Chris Paterson <chris.paterson2@renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds CAN[0-1] pinmux support to r8a7796 SoC.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 14b3512..f1f0026 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1649,6 +1649,38 @@ enum {
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
@@ -2612,6 +2644,10 @@ enum {
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
@@ -2751,6 +2787,19 @@ enum {
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
@@ -2950,6 +2999,9 @@ enum {
 
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
+	SH_PFC_FUNCTION(can0),
+	SH_PFC_FUNCTION(can1),
+	SH_PFC_FUNCTION(can_clk),
 	SH_PFC_FUNCTION(drif0),
 	SH_PFC_FUNCTION(drif1),
 	SH_PFC_FUNCTION(drif2),
-- 
1.9.1
