From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Add CAN FD support
Date: Thu, 25 Feb 2016 16:48:53 +0000
Message-ID: <1456418933-3948-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1456418933-3948-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1456418933-3948-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, chris.paterson2@renesas.com, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds CANFD[0-1] pinmux support to r8a7795 SoC.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index fbe8e95..0e6fb18 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -2940,6 +2940,36 @@ static const unsigned int can1_data_pins[] = {
 static const unsigned int can1_data_mux[] = {
 	CAN1_TX_MARK,		CAN1_RX_MARK,
 };
+
+/* - RCAN FD --------------------------------------------------------------- */
+static const unsigned int canfd0_data_a_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 23),     RCAR_GP_PIN(1, 24),
+};
+
+static const unsigned int canfd0_data_a_mux[] = {
+	CANFD0_TX_A_MARK,       CANFD0_RX_A_MARK,
+};
+
+static const unsigned int canfd0_data_b_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(2, 0),      RCAR_GP_PIN(2, 1),
+};
+
+static const unsigned int canfd0_data_b_mux[] = {
+	CANFD0_TX_B_MARK,       CANFD0_RX_B_MARK,
+};
+
+static const unsigned int canfd1_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 22),     RCAR_GP_PIN(1, 26),
+};
+
+static const unsigned int canfd1_data_mux[] = {
+	CANFD1_TX_MARK,         CANFD1_RX_MARK,
+};
+
+
 /* - RCAN-CLK --------------------------------------------------------------- */
 static const unsigned int can_clk_pins[] = {
 	/* CLK */
@@ -3362,6 +3392,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(can0_data_a),
 	SH_PFC_PIN_GROUP(can0_data_b),
 	SH_PFC_PIN_GROUP(can1_data),
+	SH_PFC_PIN_GROUP(canfd0_data_a),
+	SH_PFC_PIN_GROUP(canfd0_data_b),
+	SH_PFC_PIN_GROUP(canfd1_data),
 	SH_PFC_PIN_GROUP(can_clk),
 };
 
@@ -3686,6 +3719,15 @@ static const char * const can1_groups[] = {
 	"can1_data",
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
 static const char * const can_clk_groups[] = {
 	"can_clk",
 };
@@ -3721,6 +3763,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(ssi),
 	SH_PFC_FUNCTION(can0),
 	SH_PFC_FUNCTION(can1),
+	SH_PFC_FUNCTION(canfd0),
+	SH_PFC_FUNCTION(canfd1),
 	SH_PFC_FUNCTION(can_clk),
 };
 
-- 
1.9.1
