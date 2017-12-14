From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/4] pinctrl: sh-pfc: r8a7794: Add tpu groups and function
Date: Thu, 14 Dec 2017 10:57:05 +0000
Message-ID: <1513249026-26759-4-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1513249026-26759-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513249026-26759-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds tpu groups and function to r8a7745/r8a7794.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index dccc20a..455cb02 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -3254,6 +3254,79 @@ static const unsigned int sdhi2_wp_pins[] = {
 static const unsigned int sdhi2_wp_mux[] = {
 	SD2_WP_MARK,
 };
+/* - TPU -------------------------------------------------------------------- */
+static const unsigned int tpu_to0_pins[] = {
+	RCAR_GP_PIN(3, 31),
+};
+static const unsigned int tpu_to0_mux[] = {
+	TPUTO0_MARK,
+};
+static const unsigned int tpu_to0_b_pins[] = {
+	RCAR_GP_PIN(3, 30),
+};
+static const unsigned int tpu_to0_b_mux[] = {
+	TPUTO0_B_MARK,
+};
+static const unsigned int tpu_to0_c_pins[] = {
+	RCAR_GP_PIN(1, 18),
+};
+static const unsigned int tpu_to0_c_mux[] = {
+	TPUTO0_C_MARK,
+};
+static const unsigned int tpu_to1_pins[] = {
+	RCAR_GP_PIN(4, 9),
+};
+static const unsigned int tpu_to1_mux[] = {
+	TPUTO1_MARK,
+};
+static const unsigned int tpu_to1_b_pins[] = {
+	RCAR_GP_PIN(4, 0),
+};
+static const unsigned int tpu_to1_b_mux[] = {
+	TPUTO1_B_MARK,
+};
+static const unsigned int tpu_to1_c_pins[] = {
+	RCAR_GP_PIN(4, 4),
+};
+static const unsigned int tpu_to1_c_mux[] = {
+	TPUTO1_C_MARK,
+};
+static const unsigned int tpu_to2_pins[] = {
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int tpu_to2_mux[] = {
+	TPUTO2_MARK,
+};
+static const unsigned int tpu_to2_b_pins[] = {
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int tpu_to2_b_mux[] = {
+	TPUTO2_B_MARK,
+};
+static const unsigned int tpu_to2_c_pins[] = {
+	RCAR_GP_PIN(0, 22),
+};
+static const unsigned int tpu_to2_c_mux[] = {
+	TPUTO2_C_MARK,
+};
+static const unsigned int tpu_to3_pins[] = {
+	RCAR_GP_PIN(1, 14),
+};
+static const unsigned int tpu_to3_mux[] = {
+	TPUTO3_MARK,
+};
+static const unsigned int tpu_to3_b_pins[] = {
+	RCAR_GP_PIN(1, 13),
+};
+static const unsigned int tpu_to3_b_mux[] = {
+	TPUTO3_B_MARK,
+};
+static const unsigned int tpu_to3_c_pins[] = {
+	RCAR_GP_PIN(0, 21),
+};
+static const unsigned int tpu_to3_c_mux[] = {
+	TPUTO3_C_MARK,
+};
 /* - SSI -------------------------------------------------------------------- */
 static const unsigned int ssi0_data_pins[] = {
 	/* SDATA0 */
@@ -3892,6 +3965,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sdhi2_ctrl),
 	SH_PFC_PIN_GROUP(sdhi2_cd),
 	SH_PFC_PIN_GROUP(sdhi2_wp),
+	SH_PFC_PIN_GROUP(tpu_to0),
+	SH_PFC_PIN_GROUP(tpu_to0_b),
+	SH_PFC_PIN_GROUP(tpu_to0_c),
+	SH_PFC_PIN_GROUP(tpu_to1),
+	SH_PFC_PIN_GROUP(tpu_to1_b),
+	SH_PFC_PIN_GROUP(tpu_to1_c),
+	SH_PFC_PIN_GROUP(tpu_to2),
+	SH_PFC_PIN_GROUP(tpu_to2_b),
+	SH_PFC_PIN_GROUP(tpu_to2_c),
+	SH_PFC_PIN_GROUP(tpu_to3),
+	SH_PFC_PIN_GROUP(tpu_to3_b),
+	SH_PFC_PIN_GROUP(tpu_to3_c),
 	SH_PFC_PIN_GROUP(ssi0_data),
 	SH_PFC_PIN_GROUP(ssi0129_ctrl),
 	SH_PFC_PIN_GROUP(ssi1_data),
@@ -4351,6 +4436,21 @@ static const char * const sdhi2_groups[] = {
 	"sdhi2_wp",
 };
 
+static const char * const tpu_groups[] = {
+	"tpu_to0",
+	"tpu_to0_b",
+	"tpu_to0_c",
+	"tpu_to1",
+	"tpu_to1_b",
+	"tpu_to1_c",
+	"tpu_to2",
+	"tpu_to2_b",
+	"tpu_to2_c",
+	"tpu_to3",
+	"tpu_to3_b",
+	"tpu_to3_c",
+};
+
 static const char * const ssi_groups[] = {
 	"ssi0_data",
 	"ssi0129_ctrl",
@@ -4469,6 +4569,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(sdhi0),
 	SH_PFC_FUNCTION(sdhi1),
 	SH_PFC_FUNCTION(sdhi2),
+	SH_PFC_FUNCTION(tpu),
 	SH_PFC_FUNCTION(ssi),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
-- 
2.7.4
