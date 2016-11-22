From: Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7796: Add CAN FD support
Date: Tue, 22 Nov 2016 13:49:03 +0000
Message-ID: <1479822543-4804-3-git-send-email-chris.paterson2@renesas.com>
References: <1479822543-4804-1-git-send-email-chris.paterson2@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1479822543-4804-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, ramesh.shanmugasundaram@bp.renesas.com, Chris Paterson <chris.paterson2@renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds CAN FD[0-1] pinmux support to r8a7796 SoC.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index f1f0026..865f4b9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1681,6 +1681,29 @@ enum {
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
@@ -2648,6 +2671,9 @@ enum {
 	SH_PFC_PIN_GROUP(can0_data_b),
 	SH_PFC_PIN_GROUP(can1_data),
 	SH_PFC_PIN_GROUP(can_clk),
+	SH_PFC_PIN_GROUP(canfd0_data_a),
+	SH_PFC_PIN_GROUP(canfd0_data_b),
+	SH_PFC_PIN_GROUP(canfd1_data),
 	SH_PFC_PIN_GROUP(drif0_ctrl_a),
 	SH_PFC_PIN_GROUP(drif0_data0_a),
 	SH_PFC_PIN_GROUP(drif0_data1_a),
@@ -2800,6 +2826,15 @@ enum {
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
@@ -3002,6 +3037,8 @@ enum {
 	SH_PFC_FUNCTION(can0),
 	SH_PFC_FUNCTION(can1),
 	SH_PFC_FUNCTION(can_clk),
+	SH_PFC_FUNCTION(canfd0),
+	SH_PFC_FUNCTION(canfd1),
 	SH_PFC_FUNCTION(drif0),
 	SH_PFC_FUNCTION(drif1),
 	SH_PFC_FUNCTION(drif2),
-- 
1.9.1
