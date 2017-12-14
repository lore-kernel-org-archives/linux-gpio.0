From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 5/6] pinctrl: sh-pfc: r8a7791: Add tpu groups and function
Date: Thu, 14 Dec 2017 10:56:15 +0000
Message-ID: <1513248976-26700-6-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1513248976-26700-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:41209 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751538AbdLNK4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Dec 2017 05:56:39 -0500
In-Reply-To: <1513248976-26700-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

This patch adds tpu groups and function to r8a7743/r8a7791/r8a7793.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 42 ++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index c01ef02d..88eb8d3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -3892,6 +3892,32 @@ static const unsigned int sdhi2_wp_mux[] = {
 	SD2_WP_MARK,
 };
 
+/* - TPU -------------------------------------------------------------------- */
+static const unsigned int tpu_to0_pins[] = {
+	RCAR_GP_PIN(6, 14),
+};
+static const unsigned int tpu_to0_mux[] = {
+	TPU_TO0_MARK,
+};
+static const unsigned int tpu_to1_pins[] = {
+	RCAR_GP_PIN(1, 17),
+};
+static const unsigned int tpu_to1_mux[] = {
+	TPU_TO1_MARK,
+};
+static const unsigned int tpu_to2_pins[] = {
+	RCAR_GP_PIN(1, 18),
+};
+static const unsigned int tpu_to2_mux[] = {
+	TPU_TO2_MARK,
+};
+static const unsigned int tpu_to3_pins[] = {
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int tpu_to3_mux[] = {
+	TPU_TO3_MARK,
+};
+
 /* - SSI -------------------------------------------------------------------- */
 static const unsigned int ssi0_data_pins[] = {
 	/* SDATA */
@@ -4431,7 +4457,7 @@ static const unsigned int vin2_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[342];
+	struct sh_pfc_pin_group common[346];
 	struct sh_pfc_pin_group r8a779x[9];
 } pinmux_groups = {
 	.common = {
@@ -4715,6 +4741,10 @@ static const struct {
 		SH_PFC_PIN_GROUP(sdhi2_ctrl),
 		SH_PFC_PIN_GROUP(sdhi2_cd),
 		SH_PFC_PIN_GROUP(sdhi2_wp),
+		SH_PFC_PIN_GROUP(tpu_to0),
+		SH_PFC_PIN_GROUP(tpu_to1),
+		SH_PFC_PIN_GROUP(tpu_to2),
+		SH_PFC_PIN_GROUP(tpu_to3),
 		SH_PFC_PIN_GROUP(ssi0_data),
 		SH_PFC_PIN_GROUP(ssi0_data_b),
 		SH_PFC_PIN_GROUP(ssi0129_ctrl),
@@ -5247,6 +5277,13 @@ static const char * const sdhi2_groups[] = {
 	"sdhi2_wp",
 };
 
+static const char * const tpu_groups[] = {
+	"tpu_to0",
+	"tpu_to1",
+	"tpu_to2",
+	"tpu_to3",
+};
+
 static const char * const ssi_groups[] = {
 	"ssi0_data",
 	"ssi0_data_b",
@@ -5327,7 +5364,7 @@ static const char * const vin2_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[57];
+	struct sh_pfc_function common[58];
 	struct sh_pfc_function r8a779x[2];
 } pinmux_functions = {
 	.common = {
@@ -5382,6 +5419,7 @@ static const struct {
 		SH_PFC_FUNCTION(sdhi0),
 		SH_PFC_FUNCTION(sdhi1),
 		SH_PFC_FUNCTION(sdhi2),
+		SH_PFC_FUNCTION(tpu),
 		SH_PFC_FUNCTION(ssi),
 		SH_PFC_FUNCTION(usb0),
 		SH_PFC_FUNCTION(usb1),
-- 
2.7.4

