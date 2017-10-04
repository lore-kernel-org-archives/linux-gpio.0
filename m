From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77995: Add PWM pins, groups and functions
Date: Wed,  4 Oct 2017 19:22:39 +0900
Message-ID: <1507112560-9802-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds support for PWM on r8a77995.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the renesas-drivers.git /
renesas-drivers-2017-10-03-v4.14-rc3 tag.

 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 152 ++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 442ff0f..3f67b8d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -1111,6 +1111,118 @@ enum {
 	MMC_CLK_MARK, MMC_CMD_MARK,
 };
 
+/* - PWM0 ------------------------------------------------------------------ */
+static const unsigned int pwm0_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 1),
+};
+
+static const unsigned int pwm0_a_mux[] = {
+	PWM0_A_MARK,
+};
+
+static const unsigned int pwm0_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 18),
+};
+
+static const unsigned int pwm0_b_mux[] = {
+	PWM0_B_MARK,
+};
+
+static const unsigned int pwm0_c_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 29),
+};
+
+static const unsigned int pwm0_c_mux[] = {
+	PWM0_C_MARK,
+};
+
+/* - PWM1 ------------------------------------------------------------------ */
+static const unsigned int pwm1_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 2),
+};
+
+static const unsigned int pwm1_a_mux[] = {
+	PWM1_A_MARK,
+};
+
+static const unsigned int pwm1_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 19),
+};
+
+static const unsigned int pwm1_b_mux[] = {
+	PWM1_B_MARK,
+};
+
+static const unsigned int pwm1_c_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 30),
+};
+
+static const unsigned int pwm1_c_mux[] = {
+	PWM1_C_MARK,
+};
+
+/* - PWM2 ------------------------------------------------------------------ */
+static const unsigned int pwm2_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 3),
+};
+
+static const unsigned int pwm2_a_mux[] = {
+	PWM2_A_MARK,
+};
+
+static const unsigned int pwm2_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 22),
+};
+
+static const unsigned int pwm2_b_mux[] = {
+	PWM2_B_MARK,
+};
+
+static const unsigned int pwm2_c_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 31),
+};
+
+static const unsigned int pwm2_c_mux[] = {
+	PWM2_C_MARK,
+};
+
+/* - PWM3 ------------------------------------------------------------------ */
+static const unsigned int pwm3_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 4),
+};
+
+static const unsigned int pwm3_a_mux[] = {
+	PWM3_A_MARK,
+};
+
+static const unsigned int pwm3_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 27),
+};
+
+static const unsigned int pwm3_b_mux[] = {
+	PWM3_B_MARK,
+};
+
+static const unsigned int pwm3_c_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(4, 0),
+};
+
+static const unsigned int pwm3_c_mux[] = {
+	PWM3_C_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
 	/* RX, TX */
@@ -1326,6 +1438,18 @@ enum {
 	SH_PFC_PIN_GROUP(mmc_data4),
 	SH_PFC_PIN_GROUP(mmc_data8),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
+	SH_PFC_PIN_GROUP(pwm0_a),
+	SH_PFC_PIN_GROUP(pwm0_b),
+	SH_PFC_PIN_GROUP(pwm0_c),
+	SH_PFC_PIN_GROUP(pwm1_a),
+	SH_PFC_PIN_GROUP(pwm1_b),
+	SH_PFC_PIN_GROUP(pwm1_c),
+	SH_PFC_PIN_GROUP(pwm2_a),
+	SH_PFC_PIN_GROUP(pwm2_b),
+	SH_PFC_PIN_GROUP(pwm2_c),
+	SH_PFC_PIN_GROUP(pwm3_a),
+	SH_PFC_PIN_GROUP(pwm3_b),
+	SH_PFC_PIN_GROUP(pwm3_c),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_clk_a),
 	SH_PFC_PIN_GROUP(scif0_data_b),
@@ -1392,6 +1516,30 @@ enum {
 	"mmc_ctrl",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0_a",
+	"pwm0_b",
+	"pwm0_c",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1_a",
+	"pwm1_b",
+	"pwm1_c",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2_a",
+	"pwm2_b",
+	"pwm2_c",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3_a",
+	"pwm3_b",
+	"pwm3_c",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data_a",
 	"scif0_clk_a",
@@ -1449,6 +1597,10 @@ enum {
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c3),
 	SH_PFC_FUNCTION(mmc),
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
1.9.1
