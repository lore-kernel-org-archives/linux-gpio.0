From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add PWM support
Date: Sat, 24 Jun 2017 13:18:54 +0300
Message-ID: <20170624101854.27655-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add pinctrl support for the PWM[0-6] pins.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 153 +++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

Hi Geert,

I've successfully tested the PWM1 channel with backlight on the Salvator-XS
board. The other channels remain untested, I have only verified that the pin
numbers match the datasheet.

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 75222a9b46b3..1656295af2b0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1744,6 +1744,105 @@ static const unsigned int du_disp_mux[] = {
 	DU_DISP_MARK,
 };
 
+/* - PWM0 --------------------------------------------------------------------*/
+static const unsigned int pwm0_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 6),
+};
+static const unsigned int pwm0_mux[] = {
+	PWM0_MARK,
+};
+/* - PWM1 --------------------------------------------------------------------*/
+static const unsigned int pwm1_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 7),
+};
+static const unsigned int pwm1_a_mux[] = {
+	PWM1_A_MARK,
+};
+static const unsigned int pwm1_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 8),
+};
+static const unsigned int pwm1_b_mux[] = {
+	PWM1_B_MARK,
+};
+/* - PWM2 --------------------------------------------------------------------*/
+static const unsigned int pwm2_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 8),
+};
+static const unsigned int pwm2_a_mux[] = {
+	PWM2_A_MARK,
+};
+static const unsigned int pwm2_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int pwm2_b_mux[] = {
+	PWM2_B_MARK,
+};
+/* - PWM3 --------------------------------------------------------------------*/
+static const unsigned int pwm3_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int pwm3_a_mux[] = {
+	PWM3_A_MARK,
+};
+static const unsigned int pwm3_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 2),
+};
+static const unsigned int pwm3_b_mux[] = {
+	PWM3_B_MARK,
+};
+/* - PWM4 --------------------------------------------------------------------*/
+static const unsigned int pwm4_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int pwm4_a_mux[] = {
+	PWM4_A_MARK,
+};
+static const unsigned int pwm4_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 3),
+};
+static const unsigned int pwm4_b_mux[] = {
+	PWM4_B_MARK,
+};
+/* - PWM5 --------------------------------------------------------------------*/
+static const unsigned int pwm5_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int pwm5_a_mux[] = {
+	PWM5_A_MARK,
+};
+static const unsigned int pwm5_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 4),
+};
+static const unsigned int pwm5_b_mux[] = {
+	PWM5_B_MARK,
+};
+/* - PWM6 --------------------------------------------------------------------*/
+static const unsigned int pwm6_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int pwm6_a_mux[] = {
+	PWM6_A_MARK,
+};
+static const unsigned int pwm6_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 5),
+};
+static const unsigned int pwm6_b_mux[] = {
+	PWM6_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -1976,6 +2075,19 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
+	SH_PFC_PIN_GROUP(pwm0),
+	SH_PFC_PIN_GROUP(pwm1_a),
+	SH_PFC_PIN_GROUP(pwm1_b),
+	SH_PFC_PIN_GROUP(pwm2_a),
+	SH_PFC_PIN_GROUP(pwm2_b),
+	SH_PFC_PIN_GROUP(pwm3_a),
+	SH_PFC_PIN_GROUP(pwm3_b),
+	SH_PFC_PIN_GROUP(pwm4_a),
+	SH_PFC_PIN_GROUP(pwm4_b),
+	SH_PFC_PIN_GROUP(pwm5_a),
+	SH_PFC_PIN_GROUP(pwm5_b),
+	SH_PFC_PIN_GROUP(pwm6_a),
+	SH_PFC_PIN_GROUP(pwm6_b),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2031,6 +2143,40 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1_a",
+	"pwm1_b",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2_a",
+	"pwm2_b",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3_a",
+	"pwm3_b",
+};
+
+static const char * const pwm4_groups[] = {
+	"pwm4_a",
+	"pwm4_b",
+};
+
+static const char * const pwm5_groups[] = {
+	"pwm5_a",
+	"pwm5_b",
+};
+
+static const char * const pwm6_groups[] = {
+	"pwm6_a",
+	"pwm6_b",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2084,6 +2230,13 @@ static const char * const scif_clk_groups[] = {
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(du),
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm4),
+	SH_PFC_FUNCTION(pwm5),
+	SH_PFC_FUNCTION(pwm6),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
Regards,

Laurent Pinchart
