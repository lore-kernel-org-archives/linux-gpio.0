From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add SATA pins, groups, and functions
Date: Wed, 20 Dec 2017 22:59:22 +0100
Message-ID: <20171220215922.22473-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:51777 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754303AbdLTV7p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Dec 2017 16:59:45 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested with a Salvator-XS and H3 ES2.0.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Note: To repeat the test you must:
a) switch pin7 from SW12 to OFF
b) set an external GPIO to 0 by using these commands:
	i2cset -y 4 0x20 3 0x7f (set pin to output)
	i2cset -y 4 0x20 1 0x7f (set pin to 0)

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 7eddd0f2f84713..18aeee592fdcf2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3227,6 +3227,22 @@ static const unsigned int pwm6_b_mux[] = {
 	PWM6_B_MARK,
 };
 
+/* - SATA --------------------------------------------------------------------*/
+static const unsigned int sata0_devslp_a_pins[] = {
+	/* DEVSLP */
+	RCAR_GP_PIN(6, 16),
+};
+static const unsigned int sata0_devslp_a_mux[] = {
+	SATA_DEVSLP_A_MARK,
+};
+static const unsigned int sata0_devslp_b_pins[] = {
+	/* DEVSLP */
+	RCAR_GP_PIN(4, 6),
+};
+static const unsigned int sata0_devslp_b_mux[] = {
+	SATA_DEVSLP_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -4092,6 +4108,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pwm5_b),
 	SH_PFC_PIN_GROUP(pwm6_a),
 	SH_PFC_PIN_GROUP(pwm6_b),
+	SH_PFC_PIN_GROUP(sata0_devslp_a),
+	SH_PFC_PIN_GROUP(sata0_devslp_b),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -4500,6 +4518,11 @@ static const char * const pwm6_groups[] = {
 	"pwm6_b",
 };
 
+static const char * const sata0_groups[] = {
+	"sata0_devslp_a",
+	"sata0_devslp_b",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -4669,6 +4692,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(pwm4),
 	SH_PFC_FUNCTION(pwm5),
 	SH_PFC_FUNCTION(pwm6),
+	SH_PFC_FUNCTION(sata0),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.11.0

