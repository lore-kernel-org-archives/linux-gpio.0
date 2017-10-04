From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: add I2C pin support
Date: Wed,  4 Oct 2017 17:52:52 +0200
Message-ID: <20171004155252.21080-1-wsa@the-dreams.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35744 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751148AbdJDPxB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Oct 2017 11:53:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Since pinmuxing for I2C is equal on H3 ES1.0 and later versions, copy
the I2C settings from ES1.0. Fixes this error in upstream for
Salvator-XS:

sh-pfc e6060000.pin-controller: function 'i2c2' not supported
sh-pfc e6060000.pin-controller: invalid function i2c2 in map table
i2c-rcar: probe of e6510000.i2c failed with error -22

Now, the bus works the same as with other Salvator boards.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch is based on top of Geert's sh-pfc branch. I'd think it is a bugfix
for the above reasons and it would be really great to have it in v4.14. But you
guys will have the final word, of course.

This patch took a day longer because I first wanted to incorporate the BSP patch
2caf6c5f77edc5 ("pinctrl: sh-pfc: r8a7795: Add I2C{0,3,5} pins, groups and functions")
into it, but finally considered this is a seperate issue. It needs fixing for ES1.0
as well.

I tested it with the on-board I2C2 bus. As far as I read the specs, I can't
test I2C6 (because the pull-ups are missing) and I2C1 (0 Ohm resistors not
stuffed, so not available on EXIO connector A). I checked the datasheets to ensure
the PFC settings are really equal to the best of my knowledge.

Please apply and/or comment. Thanks! :)


 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 351855b36f69e9..fe32aaccb56460 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1955,6 +1955,57 @@ static const unsigned int du_disp_mux[] = {
 	DU_DISP_MARK,
 };
 
+/* - I2C -------------------------------------------------------------------- */
+static const unsigned int i2c1_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 10),
+};
+static const unsigned int i2c1_a_mux[] = {
+	SDA1_A_MARK, SCL1_A_MARK,
+};
+static const unsigned int i2c1_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 23),
+};
+static const unsigned int i2c1_b_mux[] = {
+	SDA1_B_MARK, SCL1_B_MARK,
+};
+static const unsigned int i2c2_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
+};
+static const unsigned int i2c2_a_mux[] = {
+	SDA2_A_MARK, SCL2_A_MARK,
+};
+static const unsigned int i2c2_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 12),
+};
+static const unsigned int i2c2_b_mux[] = {
+	SDA2_B_MARK, SCL2_B_MARK,
+};
+static const unsigned int i2c6_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
+};
+static const unsigned int i2c6_a_mux[] = {
+	SDA6_A_MARK, SCL6_A_MARK,
+};
+static const unsigned int i2c6_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
+};
+static const unsigned int i2c6_b_mux[] = {
+	SDA6_B_MARK, SCL6_B_MARK,
+};
+static const unsigned int i2c6_c_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
+};
+static const unsigned int i2c6_c_mux[] = {
+	SDA6_C_MARK, SCL6_C_MARK,
+};
+
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
 	/* SCK */
@@ -3263,6 +3314,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
+	SH_PFC_PIN_GROUP(i2c1_a),
+	SH_PFC_PIN_GROUP(i2c1_b),
+	SH_PFC_PIN_GROUP(i2c2_a),
+	SH_PFC_PIN_GROUP(i2c2_b),
+	SH_PFC_PIN_GROUP(i2c6_a),
+	SH_PFC_PIN_GROUP(i2c6_b),
+	SH_PFC_PIN_GROUP(i2c6_c),
 	SH_PFC_PIN_GROUP(msiof0_clk),
 	SH_PFC_PIN_GROUP(msiof0_sync),
 	SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -3503,6 +3561,22 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
+static const char * const i2c1_groups[] = {
+	"i2c1_a",
+	"i2c1_b",
+};
+
+static const char * const i2c2_groups[] = {
+	"i2c2_a",
+	"i2c2_b",
+};
+
+static const char * const i2c6_groups[] = {
+	"i2c6_a",
+	"i2c6_b",
+	"i2c6_c",
+};
+
 static const char * const msiof0_groups[] = {
 	"msiof0_clk",
 	"msiof0_sync",
@@ -3763,6 +3837,9 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(drif2),
 	SH_PFC_FUNCTION(drif3),
 	SH_PFC_FUNCTION(du),
+	SH_PFC_FUNCTION(i2c1),
+	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c6),
 	SH_PFC_FUNCTION(msiof0),
 	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(msiof2),
-- 
2.11.0

