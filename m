From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Add DU support
Date: Fri, 11 Nov 2016 21:40:03 +0100
Message-ID: <20161111204003.4022-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:59074 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934727AbcKKUlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2016 15:41:01 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Only the DU parallel RGB output signals are included, HDMI and TCON pins
will be added in separate groups. Based on a similar patch from Laurent
Pinchart for the r8a7795 PFC driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index dc9b671..70e81ab 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1489,6 +1489,86 @@ static const u16 pinmux_data[] = {
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
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
 
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
@@ -1912,6 +1992,14 @@ static const unsigned int sdhi3_ds_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
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
@@ -1969,6 +2057,17 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sdhi3_ds),
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
@@ -2058,6 +2157,7 @@ static const char * const sdhi3_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(du),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.10.2

