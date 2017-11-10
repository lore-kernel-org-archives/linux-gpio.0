From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Add CAN FD support
Date: Fri, 10 Nov 2017 13:58:50 +0000
Message-ID: <20171110135850.32904-3-ramesh.shanmugasundaram@bp.renesas.com>
References: <20171110135850.32904-1-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171110135850.32904-1-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, chris.paterson2@renesas.com, fabrizio.castro@bp.renesas.com, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds CAN FD[0-1] pinmux support for R-Car H3 ES2.0. The pin
config is identical to H3 ES1.*.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 59249a990cef..34a2dc471e5a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1813,6 +1813,29 @@ static const unsigned int can_clk_mux[] = {
 	CAN_CLK_MARK,
 };
 
+/* - CAN FD --------------------------------------------------------------- */
+static const unsigned int canfd0_data_a_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 23),     RCAR_GP_PIN(1, 24),
+};
+static const unsigned int canfd0_data_a_mux[] = {
+	CANFD0_TX_A_MARK,       CANFD0_RX_A_MARK,
+};
+static const unsigned int canfd0_data_b_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(2, 0),      RCAR_GP_PIN(2, 1),
+};
+static const unsigned int canfd0_data_b_mux[] = {
+	CANFD0_TX_B_MARK,       CANFD0_RX_B_MARK,
+};
+static const unsigned int canfd1_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 22),     RCAR_GP_PIN(1, 26),
+};
+static const unsigned int canfd1_data_mux[] = {
+	CANFD1_TX_MARK,         CANFD1_RX_MARK,
+};
+
 /* - DRIF0 --------------------------------------------------------------- */
 static const unsigned int drif0_ctrl_a_pins[] = {
 	/* CLK, SYNC */
@@ -3879,6 +3902,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(can0_data_b),
 	SH_PFC_PIN_GROUP(can1_data),
 	SH_PFC_PIN_GROUP(can_clk),
+	SH_PFC_PIN_GROUP(canfd0_data_a),
+	SH_PFC_PIN_GROUP(canfd0_data_b),
+	SH_PFC_PIN_GROUP(canfd1_data),
 	SH_PFC_PIN_GROUP(drif0_ctrl_a),
 	SH_PFC_PIN_GROUP(drif0_data0_a),
 	SH_PFC_PIN_GROUP(drif0_data1_a),
@@ -4203,6 +4229,15 @@ static const char * const can_clk_groups[] = {
 	"can_clk",
 };
 
+static const char * const canfd0_groups[] = {
+	"canfd0_data_a",
+	"canfd0_data_b",
+};
+
+static const char * const canfd1_groups[] = {
+	"canfd1_data",
+};
+
 static const char * const drif0_groups[] = {
 	"drif0_ctrl_a",
 	"drif0_data0_a",
@@ -4611,6 +4646,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(can0),
 	SH_PFC_FUNCTION(can1),
 	SH_PFC_FUNCTION(can_clk),
+	SH_PFC_FUNCTION(canfd0),
+	SH_PFC_FUNCTION(canfd1),
 	SH_PFC_FUNCTION(drif0),
 	SH_PFC_FUNCTION(drif1),
 	SH_PFC_FUNCTION(drif2),
-- 
2.12.2
