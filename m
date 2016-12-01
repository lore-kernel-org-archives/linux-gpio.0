From: Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2] pinctrl: sh-pfc: r8a7791: Add ADI pinconf support
Date: Thu,  1 Dec 2016 23:10:21 +0100
Message-ID: <1480630221-10741-1-git-send-email-jacopo@jmondi.org>
References: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: geert+renesas@glider.be, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
List-Id: linux-gpio@vger.kernel.org

Add pin configuration support for Gyro-ADC, named ADI on r8a7791 SoC.

The Gyro-ADC supports three different configurations:
a single ADC (adi and adi_b groups), 2 ADCs selectable through a single
channel select signal (adi_chsel1 and adi_chsel1_b groups), up to 4 ADCs
through 2 channel select signals (adi_chsel2 and adi_chsel2_b groups)
and up to 8 ADCs through 3 channel select signals (adi_chsel3 and
adi_chsel3_b groups)

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
Compiled only, not tested with an actual ADC.

For reference only, these are the changes introduced by Geert's private
review of first sketch of this patch:
    * separate ADI chsel in 3 overlapping groups:
      the user can now select how many pins to assign to channel selection
      function.

v1 -> v2:
    * let the user freely select the single CHS line to use.
      This requires the configuration to match the ADI mode in use, but
      allows users to select CHS1 or CHS2 lines alone, and dedicate other
      pins to other functions.

---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 7ca37c3..75c9882 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -1691,6 +1691,72 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - ADI -------------------------------------------------------------------- */
+static const unsigned int adi_common_pins[] = {
+	/* ADIDATA, ADICS/SAMP, ADICLK */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25), RCAR_GP_PIN(6, 26),
+};
+static const unsigned int adi_common_mux[] = {
+	/* ADIDATA, ADICS/SAMP, ADICLK */
+	ADIDATA_MARK, ADICS_SAMP_MARK, ADICLK_MARK,
+};
+static const unsigned int adi_chsel0_pins[] = {
+	/* ADICHS 0 */
+	RCAR_GP_PIN(6, 27),
+};
+static const unsigned int adi_chsel0_mux[] = {
+	/* ADICHS 0 */
+	ADICHS0_MARK,
+};
+static const unsigned int adi_chsel1_pins[] = {
+	/* ADICHS 1 */
+	RCAR_GP_PIN(6, 28),
+};
+static const unsigned int adi_chsel1_mux[] = {
+	/* ADICHS 1 */
+	ADICHS1_MARK,
+};
+static const unsigned int adi_chsel2_pins[] = {
+	/* ADICHS 2 */
+	RCAR_GP_PIN(6, 29),
+};
+static const unsigned int adi_chsel2_mux[] = {
+	/* ADICHS 2 */
+	ADICHS2_MARK,
+};
+static const unsigned int adi_common_b_pins[] = {
+	/* ADIDATA B, ADICS/SAMP B, ADICLK B */
+	RCAR_GP_PIN(5, 25), RCAR_GP_PIN(5, 26), RCAR_GP_PIN(5, 27),
+};
+static const unsigned int adi_common_b_mux[] = {
+	/* ADIDATA B, ADICS/SAMP B, ADICLK B */
+	ADIDATA_B_MARK, ADICS_SAMP_B_MARK, ADICLK_B_MARK,
+};
+static const unsigned int adi_chsel0_b_pins[] = {
+	/* ADICHS 0 B */
+	RCAR_GP_PIN(5, 28),
+};
+static const unsigned int adi_chsel0_b_mux[] = {
+	/* ADICHS 0 B */
+	ADICHS0_B_MARK,
+};
+static const unsigned int adi_chsel1_b_pins[] = {
+	/* ADICHS 1 B */
+	RCAR_GP_PIN(5, 29),
+};
+static const unsigned int adi_chsel1_b_mux[] = {
+	/* ADICHS 1 B */
+	ADICHS1_B_MARK,
+};
+static const unsigned int adi_chsel2_b_pins[] = {
+	/* ADICHS 2 B */
+	RCAR_GP_PIN(5, 30),
+};
+static const unsigned int adi_chsel2_b_mux[] = {
+	/* ADICHS 2 B */
+	ADICHS2_B_MARK,
+};
+
 /* - Audio Clock ------------------------------------------------------------ */
 static const unsigned int audio_clk_a_pins[] = {
 	/* CLK */
@@ -4343,6 +4409,14 @@ static const unsigned int vin2_clk_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(adi_common),
+	SH_PFC_PIN_GROUP(adi_chsel0),
+	SH_PFC_PIN_GROUP(adi_chsel1),
+	SH_PFC_PIN_GROUP(adi_chsel2),
+	SH_PFC_PIN_GROUP(adi_common_b),
+	SH_PFC_PIN_GROUP(adi_chsel0_b),
+	SH_PFC_PIN_GROUP(adi_chsel1_b),
+	SH_PFC_PIN_GROUP(adi_chsel2_b),
 	SH_PFC_PIN_GROUP(audio_clk_a),
 	SH_PFC_PIN_GROUP(audio_clk_b),
 	SH_PFC_PIN_GROUP(audio_clk_b_b),
@@ -4687,6 +4761,17 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(vin2_clk),
 };
 
+static const char * const adi_groups[] = {
+	"adi_common",
+	"adi_chsel0",
+	"adi_chsel1",
+	"adi_chsel2",
+	"adi_common_b",
+	"adi_chsel0_b",
+	"adi_chsel1_b",
+	"adi_chsel2_b",
+};
+
 static const char * const audio_clk_groups[] = {
 	"audio_clk_a",
 	"audio_clk_b",
@@ -5192,6 +5277,7 @@ static const char * const vin2_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(adi),
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(can0),
-- 
2.7.4
