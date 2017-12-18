From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 5/6] pinctrl: sh-pfc: r8a7791: Add tpu groups and function
Date: Mon, 18 Dec 2017 17:52:07 +0000
Message-ID: <1513619528-12060-6-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1513619528-12060-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513619528-12060-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds tpu groups and function to r8a7743/r8a7791/r8a7793.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
* Reworked sorting

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 42 ++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index c01ef02d..5811784 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -4145,6 +4145,32 @@ static const unsigned int ssi9_ctrl_b_mux[] = {
 	SSI_SCK9_B_MARK, SSI_WS9_B_MARK,
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
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_pins[] = {
 	RCAR_GP_PIN(7, 23), /* PWEN */
@@ -4431,7 +4457,7 @@ static const unsigned int vin2_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[342];
+	struct sh_pfc_pin_group common[346];
 	struct sh_pfc_pin_group r8a779x[9];
 } pinmux_groups = {
 	.common = {
@@ -4743,6 +4769,10 @@ static const struct {
 		SH_PFC_PIN_GROUP(ssi9_data_b),
 		SH_PFC_PIN_GROUP(ssi9_ctrl),
 		SH_PFC_PIN_GROUP(ssi9_ctrl_b),
+		SH_PFC_PIN_GROUP(tpu_to0),
+		SH_PFC_PIN_GROUP(tpu_to1),
+		SH_PFC_PIN_GROUP(tpu_to2),
+		SH_PFC_PIN_GROUP(tpu_to3),
 		SH_PFC_PIN_GROUP(usb0),
 		SH_PFC_PIN_GROUP(usb1),
 		VIN_DATA_PIN_GROUP(vin0_data, 24),
@@ -5278,6 +5308,13 @@ static const char * const ssi_groups[] = {
 	"ssi9_ctrl_b",
 };
 
+static const char * const tpu_groups[] = {
+	"tpu_to0",
+	"tpu_to1",
+	"tpu_to2",
+	"tpu_to3",
+};
+
 static const char * const usb0_groups[] = {
 	"usb0",
 };
@@ -5327,7 +5364,7 @@ static const char * const vin2_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[57];
+	struct sh_pfc_function common[58];
 	struct sh_pfc_function r8a779x[2];
 } pinmux_functions = {
 	.common = {
@@ -5383,6 +5420,7 @@ static const struct {
 		SH_PFC_FUNCTION(sdhi1),
 		SH_PFC_FUNCTION(sdhi2),
 		SH_PFC_FUNCTION(ssi),
+		SH_PFC_FUNCTION(tpu),
 		SH_PFC_FUNCTION(usb0),
 		SH_PFC_FUNCTION(usb1),
 		SH_PFC_FUNCTION(vin0),
-- 
2.7.4
