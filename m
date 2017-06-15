From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add DU parallel RGB output support
Date: Thu, 15 Jun 2017 10:30:31 +0300
Message-ID: <20170615073031.11199-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35623 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbdFOHaM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2017 03:30:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org

The H3 ES1.x and H3 ES2.0 have identical pinmuxing for the parallel RGB
output support.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

Hi Geert,

This patch is based on the sh-pfc-for-v4.13 branch from your renesas-drivers
tree. Please let me know if you would like me to pick another base.

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index f220bf124ca1..75222a9b46b3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1663,6 +1663,87 @@ static const unsigned int avb_avtp_capture_b_mux[] = {
 	AVB_AVTP_CAPTURE_B_MARK,
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
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -1887,6 +1968,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
 	SH_PFC_PIN_GROUP(avb_avtp_match_b),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
+	SH_PFC_PIN_GROUP(du_rgb666),
+	SH_PFC_PIN_GROUP(du_rgb888),
+	SH_PFC_PIN_GROUP(du_clk_out_0),
+	SH_PFC_PIN_GROUP(du_clk_out_1),
+	SH_PFC_PIN_GROUP(du_sync),
+	SH_PFC_PIN_GROUP(du_oddf),
+	SH_PFC_PIN_GROUP(du_cde),
+	SH_PFC_PIN_GROUP(du_disp),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1931,6 +2020,17 @@ static const char * const avb_groups[] = {
 	"avb_avtp_capture_b",
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
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -1983,6 +2083,7 @@ static const char * const scif_clk_groups[] = {
 
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
+	SH_PFC_FUNCTION(du),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
Regards,

Laurent Pinchart

