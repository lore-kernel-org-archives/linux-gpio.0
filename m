From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Restore sort order
Date: Mon, 13 Mar 2017 17:41:42 +0100
Message-ID: <1489423302-21296-3-git-send-email-geert+renesas@glider.be>
References: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Somehow the QSPI and SCIF_CLK fragments were inserted at the wrong
positions.  Restore sort order (alphabetically, per group).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 171 ++++++++++++++++++-----------------
 1 file changed, 86 insertions(+), 85 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 6ba7ed15a4610366..3d1c32cca16a0398 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3101,6 +3101,55 @@ static const unsigned int pwm6_b_mux[] = {
 	PWM6_B_MARK,
 };
 
+/* - QSPI0 ------------------------------------------------------------------ */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* QSPI0_SPCLK, QSPI0_SSL */
+	PIN_NUMBER('W', 3), PIN_NUMBER('Y', 3),
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int qspi0_data2_pins[] = {
+	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
+	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
+};
+static const unsigned int qspi0_data2_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+};
+static const unsigned int qspi0_data4_pins[] = {
+	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1, QSPI0_IO2, QSPI0_IO3 */
+	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
+	PIN_NUMBER('Y', 6), PIN_A_NUMBER('B', 6),
+};
+static const unsigned int qspi0_data4_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
+};
+/* - QSPI1 ------------------------------------------------------------------ */
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* QSPI1_SPCLK, QSPI1_SSL */
+	PIN_NUMBER('V', 3), PIN_NUMBER('V', 5),
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int qspi1_data2_pins[] = {
+	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
+	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
+};
+static const unsigned int qspi1_data2_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+};
+static const unsigned int qspi1_data4_pins[] = {
+	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1, QSPI1_IO2, QSPI1_IO3 */
+	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
+	PIN_A_NUMBER('E', 4), PIN_A_NUMBER('C', 3),
+};
+static const unsigned int qspi1_data4_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
+};
+
 /* - SATA --------------------------------------------------------------------*/
 static const unsigned int sata0_devslp_a_pins[] = {
 	/* DEVSLP */
@@ -3299,6 +3348,23 @@ static const unsigned int scif5_clk_pins[] = {
 static const unsigned int scif5_clk_mux[] = {
 	SCK5_MARK,
 };
+
+/* - SCIF Clock ------------------------------------------------------------- */
+static const unsigned int scif_clk_a_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(6, 23),
+};
+static const unsigned int scif_clk_a_mux[] = {
+	SCIF_CLK_A_MARK,
+};
+static const unsigned int scif_clk_b_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(5, 9),
+};
+static const unsigned int scif_clk_b_mux[] = {
+	SCIF_CLK_B_MARK,
+};
+
 /* - SDHI0 ------------------------------------------------------------------ */
 static const unsigned int sdhi0_data1_pins[] = {
 	/* D0 */
@@ -3506,22 +3572,6 @@ static const unsigned int sdhi3_ds_mux[] = {
 	SD3_DS_MARK,
 };
 
-/* - SCIF Clock ------------------------------------------------------------- */
-static const unsigned int scif_clk_a_pins[] = {
-	/* SCIF_CLK */
-	RCAR_GP_PIN(6, 23),
-};
-static const unsigned int scif_clk_a_mux[] = {
-	SCIF_CLK_A_MARK,
-};
-static const unsigned int scif_clk_b_pins[] = {
-	/* SCIF_CLK */
-	RCAR_GP_PIN(5, 9),
-};
-static const unsigned int scif_clk_b_mux[] = {
-	SCIF_CLK_B_MARK,
-};
-
 /* - SSI -------------------------------------------------------------------- */
 static const unsigned int ssi0_data_pins[] = {
 	/* SDATA */
@@ -3724,55 +3774,6 @@ static const unsigned int usb2_mux[] = {
 	USB2_PWEN_MARK, USB2_OVC_MARK,
 };
 
-/* - QSPI0 ------------------------------------------------------------------ */
-static const unsigned int qspi0_ctrl_pins[] = {
-	/* QSPI0_SPCLK, QSPI0_SSL */
-	PIN_NUMBER('W', 3), PIN_NUMBER('Y', 3),
-};
-static const unsigned int qspi0_ctrl_mux[] = {
-	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
-};
-static const unsigned int qspi0_data2_pins[] = {
-	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
-	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
-};
-static const unsigned int qspi0_data2_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-};
-static const unsigned int qspi0_data4_pins[] = {
-	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1, QSPI0_IO2, QSPI0_IO3 */
-	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
-	PIN_NUMBER('Y', 6), PIN_A_NUMBER('B', 6),
-};
-static const unsigned int qspi0_data4_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
-};
-/* - QSPI1 ------------------------------------------------------------------ */
-static const unsigned int qspi1_ctrl_pins[] = {
-	/* QSPI1_SPCLK, QSPI1_SSL */
-	PIN_NUMBER('V', 3), PIN_NUMBER('V', 5),
-};
-static const unsigned int qspi1_ctrl_mux[] = {
-	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
-};
-static const unsigned int qspi1_data2_pins[] = {
-	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
-	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
-};
-static const unsigned int qspi1_data2_mux[] = {
-	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
-};
-static const unsigned int qspi1_data4_pins[] = {
-	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1, QSPI1_IO2, QSPI1_IO3 */
-	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
-	PIN_A_NUMBER('E', 4), PIN_A_NUMBER('C', 3),
-};
-static const unsigned int qspi1_data4_mux[] = {
-	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
-	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
-};
-
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a_a),
 	SH_PFC_PIN_GROUP(audio_clk_a_b),
@@ -3990,6 +3991,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pwm5_b),
 	SH_PFC_PIN_GROUP(pwm6_a),
 	SH_PFC_PIN_GROUP(pwm6_b),
+	SH_PFC_PIN_GROUP(qspi0_ctrl),
+	SH_PFC_PIN_GROUP(qspi0_data2),
+	SH_PFC_PIN_GROUP(qspi0_data4),
+	SH_PFC_PIN_GROUP(qspi1_ctrl),
+	SH_PFC_PIN_GROUP(qspi1_data2),
+	SH_PFC_PIN_GROUP(qspi1_data4),
 	SH_PFC_PIN_GROUP(sata0_devslp_a),
 	SH_PFC_PIN_GROUP(sata0_devslp_b),
 	SH_PFC_PIN_GROUP(scif0_data),
@@ -4073,12 +4080,6 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb2),
-	SH_PFC_PIN_GROUP(qspi0_ctrl),
-	SH_PFC_PIN_GROUP(qspi0_data2),
-	SH_PFC_PIN_GROUP(qspi0_data4),
-	SH_PFC_PIN_GROUP(qspi1_ctrl),
-	SH_PFC_PIN_GROUP(qspi1_data2),
-	SH_PFC_PIN_GROUP(qspi1_data4),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4393,6 +4394,18 @@ static const char * const pwm6_groups[] = {
 	"pwm6_b",
 };
 
+static const char * const qspi0_groups[] = {
+	"qspi0_ctrl",
+	"qspi0_data2",
+	"qspi0_data4",
+};
+
+static const char * const qspi1_groups[] = {
+	"qspi1_ctrl",
+	"qspi1_data2",
+	"qspi1_data4",
+};
+
 static const char * const sata0_groups[] = {
 	"sata0_devslp_a",
 	"sata0_devslp_b",
@@ -4524,18 +4537,6 @@ static const char * const usb2_groups[] = {
 	"usb2",
 };
 
-static const char * const qspi0_groups[] = {
-	"qspi0_ctrl",
-	"qspi0_data2",
-	"qspi0_data4",
-};
-
-static const char * const qspi1_groups[] = {
-	"qspi1_ctrl",
-	"qspi1_data2",
-	"qspi1_data4",
-};
-
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -4569,6 +4570,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(pwm4),
 	SH_PFC_FUNCTION(pwm5),
 	SH_PFC_FUNCTION(pwm6),
+	SH_PFC_FUNCTION(qspi0),
+	SH_PFC_FUNCTION(qspi1),
 	SH_PFC_FUNCTION(sata0),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
@@ -4585,8 +4588,6 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb2),
-	SH_PFC_FUNCTION(qspi0),
-	SH_PFC_FUNCTION(qspi1),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.7.4
