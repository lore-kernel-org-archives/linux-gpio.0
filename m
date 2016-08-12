From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add DU support
Date: Fri, 12 Aug 2016 12:14:28 +0300
Message-ID: <1470993268-11590-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Only the DU parallel RGB output signals are included, HDMI and TCON pins
will be added in separate groups.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

This patch has been tested on the Salvator-X board. As the boot loader already
configures the DU pins for proper display operation I can't rule out the
possibility of bugs, but it at least doesn't seem to break anything.

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index b74cdd310d83..3a9172728a67 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1871,6 +1871,86 @@ static const unsigned int drif3_data1_b_mux[] = {
 	RIF3_D1_B_MARK,
 };
 
+/* - DU --------------------------------------------------------------------- */
+static const unsigned int du_rgb666_pins[] = {
+	/* R[7:2], G[7:2], B[7:2] */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
+};
+static const unsigned int du_rgb666_mux[] = {
+	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
+	DU_DR3_MARK, DU_DR2_MARK,
+	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
+	DU_DG3_MARK, DU_DG2_MARK,
+	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
+	DU_DB3_MARK, DU_DB2_MARK,
+};
+static const unsigned int du_rgb888_pins[] = {
+	/* R[7:0], G[7:0], B[7:0] */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
+	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 8),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
+	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 0),
+};
+static const unsigned int du_rgb888_mux[] = {
+	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
+	DU_DR3_MARK, DU_DR2_MARK, DU_DR1_MARK, DU_DR0_MARK,
+	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
+	DU_DG3_MARK, DU_DG2_MARK, DU_DG1_MARK, DU_DG0_MARK,
+	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
+	DU_DB3_MARK, DU_DB2_MARK, DU_DB1_MARK, DU_DB0_MARK,
+};
+static const unsigned int du_clk_out_0_pins[] = {
+	/* CLKOUT */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int du_clk_out_0_mux[] = {
+	DU_DOTCLKOUT0_MARK
+};
+static const unsigned int du_clk_out_1_pins[] = {
+	/* CLKOUT */
+	RCAR_GP_PIN(2, 3),
+};
+static const unsigned int du_clk_out_1_mux[] = {
+	DU_DOTCLKOUT1_MARK
+};
+static const unsigned int du_sync_pins[] = {
+	/* EXVSYNC/VSYNC, EXHSYNC/HSYNC */
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 4),
+};
+static const unsigned int du_sync_mux[] = {
+	DU_EXVSYNC_DU_VSYNC_MARK, DU_EXHSYNC_DU_HSYNC_MARK
+};
+static const unsigned int du_oddf_pins[] = {
+	/* EXDISP/EXODDF/EXCDE */
+	RCAR_GP_PIN(2, 2),
+};
+static const unsigned int du_oddf_mux[] = {
+	DU_EXODDF_DU_ODDF_DISP_CDE_MARK,
+};
+static const unsigned int du_cde_pins[] = {
+	/* CDE */
+	RCAR_GP_PIN(2, 0),
+};
+static const unsigned int du_cde_mux[] = {
+	DU_CDE_MARK,
+};
+static const unsigned int du_disp_pins[] = {
+	/* DISP */
+	RCAR_GP_PIN(2, 1),
+};
+static const unsigned int du_disp_mux[] = {
+	DU_DISP_MARK,
+};
 /* - HSCIF0 ----------------------------------------------------------------- */
 static const unsigned int hscif0_data_pins[] = {
 	/* RX, TX */
@@ -3593,6 +3673,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(drif3_ctrl_b),
 	SH_PFC_PIN_GROUP(drif3_data0_b),
 	SH_PFC_PIN_GROUP(drif3_data1_b),
+	SH_PFC_PIN_GROUP(du_rgb666),
+	SH_PFC_PIN_GROUP(du_rgb888),
+	SH_PFC_PIN_GROUP(du_clk_out_0),
+	SH_PFC_PIN_GROUP(du_clk_out_1),
+	SH_PFC_PIN_GROUP(du_sync),
+	SH_PFC_PIN_GROUP(du_oddf),
+	SH_PFC_PIN_GROUP(du_cde),
+	SH_PFC_PIN_GROUP(du_disp),
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -3918,6 +4006,17 @@ static const char * const drif3_groups[] = {
 	"drif3_data1_b",
 };
 
+static const char * const du_groups[] = {
+	"du_rgb666",
+	"du_rgb888",
+	"du_clk_out_0",
+	"du_clk_out_1",
+	"du_sync",
+	"du_oddf",
+	"du_cde",
+	"du_disp",
+};
+
 static const char * const hscif0_groups[] = {
 	"hscif0_data",
 	"hscif0_clk",
@@ -4265,6 +4364,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(drif1),
 	SH_PFC_FUNCTION(drif2),
 	SH_PFC_FUNCTION(drif3),
+	SH_PFC_FUNCTION(du),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hscif2),
-- 
Regards,

Laurent Pinchart
