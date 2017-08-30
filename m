From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Re-add DRIF support
Date: Wed, 30 Aug 2017 10:05:48 +0200
Message-ID: <20170830080548.17383-1-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dirk Behme <dirk.behme@de.bosch.com>
List-Id: linux-gpio@vger.kernel.org

DRIF support for r8a7795 was initially added with commit 2d775831988
("pinctrl: sh-pfc: r8a7795: Add DRIF support") and later dropped from
the new pfc-r8a7795.c while re-naming the initial pfc-r8a7795.c to
pfc-r8a7795-es1.c in commit b205914c8f8 ("pinctrl: sh-pfc: r8a7795:
Add support for R-Car H3 ES2.0"). As the DRIF doesn't differ, re-add
it here.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Patch based on sh-pfc-for-v4.14-tag1 

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 291 +++++++++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index b225bc2f9bea..9e420f7fed72 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1659,6 +1659,221 @@ static const unsigned int avb_avtp_capture_b_mux[] = {
 	AVB_AVTP_CAPTURE_B_MARK,
 };
 
+/* - DRIF0 --------------------------------------------------------------- */
+static const unsigned int drif0_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
+};
+static const unsigned int drif0_ctrl_a_mux[] = {
+	RIF0_CLK_A_MARK, RIF0_SYNC_A_MARK,
+};
+static const unsigned int drif0_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int drif0_data0_a_mux[] = {
+	RIF0_D0_A_MARK,
+};
+static const unsigned int drif0_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 7),
+};
+static const unsigned int drif0_data1_a_mux[] = {
+	RIF0_D1_A_MARK,
+};
+static const unsigned int drif0_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
+};
+static const unsigned int drif0_ctrl_b_mux[] = {
+	RIF0_CLK_B_MARK, RIF0_SYNC_B_MARK,
+};
+static const unsigned int drif0_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 1),
+};
+static const unsigned int drif0_data0_b_mux[] = {
+	RIF0_D0_B_MARK,
+};
+static const unsigned int drif0_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 2),
+};
+static const unsigned int drif0_data1_b_mux[] = {
+	RIF0_D1_B_MARK,
+};
+static const unsigned int drif0_ctrl_c_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 15),
+};
+static const unsigned int drif0_ctrl_c_mux[] = {
+	RIF0_CLK_C_MARK, RIF0_SYNC_C_MARK,
+};
+static const unsigned int drif0_data0_c_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 13),
+};
+static const unsigned int drif0_data0_c_mux[] = {
+	RIF0_D0_C_MARK,
+};
+static const unsigned int drif0_data1_c_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 14),
+};
+static const unsigned int drif0_data1_c_mux[] = {
+	RIF0_D1_C_MARK,
+};
+/* - DRIF1 --------------------------------------------------------------- */
+static const unsigned int drif1_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
+};
+static const unsigned int drif1_ctrl_a_mux[] = {
+	RIF1_CLK_A_MARK, RIF1_SYNC_A_MARK,
+};
+static const unsigned int drif1_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 19),
+};
+static const unsigned int drif1_data0_a_mux[] = {
+	RIF1_D0_A_MARK,
+};
+static const unsigned int drif1_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 20),
+};
+static const unsigned int drif1_data1_a_mux[] = {
+	RIF1_D1_A_MARK,
+};
+static const unsigned int drif1_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 3),
+};
+static const unsigned int drif1_ctrl_b_mux[] = {
+	RIF1_CLK_B_MARK, RIF1_SYNC_B_MARK,
+};
+static const unsigned int drif1_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 7),
+};
+static const unsigned int drif1_data0_b_mux[] = {
+	RIF1_D0_B_MARK,
+};
+static const unsigned int drif1_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 8),
+};
+static const unsigned int drif1_data1_b_mux[] = {
+	RIF1_D1_B_MARK,
+};
+static const unsigned int drif1_ctrl_c_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 11),
+};
+static const unsigned int drif1_ctrl_c_mux[] = {
+	RIF1_CLK_C_MARK, RIF1_SYNC_C_MARK,
+};
+static const unsigned int drif1_data0_c_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(5, 6),
+};
+static const unsigned int drif1_data0_c_mux[] = {
+	RIF1_D0_C_MARK,
+};
+static const unsigned int drif1_data1_c_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(5, 10),
+};
+static const unsigned int drif1_data1_c_mux[] = {
+	RIF1_D1_C_MARK,
+};
+/* - DRIF2 --------------------------------------------------------------- */
+static const unsigned int drif2_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
+};
+static const unsigned int drif2_ctrl_a_mux[] = {
+	RIF2_CLK_A_MARK, RIF2_SYNC_A_MARK,
+};
+static const unsigned int drif2_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 7),
+};
+static const unsigned int drif2_data0_a_mux[] = {
+	RIF2_D0_A_MARK,
+};
+static const unsigned int drif2_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int drif2_data1_a_mux[] = {
+	RIF2_D1_A_MARK,
+};
+static const unsigned int drif2_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
+};
+static const unsigned int drif2_ctrl_b_mux[] = {
+	RIF2_CLK_B_MARK, RIF2_SYNC_B_MARK,
+};
+static const unsigned int drif2_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 30),
+};
+static const unsigned int drif2_data0_b_mux[] = {
+	RIF2_D0_B_MARK,
+};
+static const unsigned int drif2_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 31),
+};
+static const unsigned int drif2_data1_b_mux[] = {
+	RIF2_D1_B_MARK,
+};
+/* - DRIF3 --------------------------------------------------------------- */
+static const unsigned int drif3_ctrl_a_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
+};
+static const unsigned int drif3_ctrl_a_mux[] = {
+	RIF3_CLK_A_MARK, RIF3_SYNC_A_MARK,
+};
+static const unsigned int drif3_data0_a_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 19),
+};
+static const unsigned int drif3_data0_a_mux[] = {
+	RIF3_D0_A_MARK,
+};
+static const unsigned int drif3_data1_a_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 20),
+};
+static const unsigned int drif3_data1_a_mux[] = {
+	RIF3_D1_A_MARK,
+};
+static const unsigned int drif3_ctrl_b_pins[] = {
+	/* CLK, SYNC */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
+};
+static const unsigned int drif3_ctrl_b_mux[] = {
+	RIF3_CLK_B_MARK, RIF3_SYNC_B_MARK,
+};
+static const unsigned int drif3_data0_b_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(6, 28),
+};
+static const unsigned int drif3_data0_b_mux[] = {
+	RIF3_D0_B_MARK,
+};
+static const unsigned int drif3_data1_b_pins[] = {
+	/* D1 */
+	RCAR_GP_PIN(6, 29),
+};
+static const unsigned int drif3_data1_b_mux[] = {
+	RIF3_D1_B_MARK,
+};
+
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -3001,6 +3216,36 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
 	SH_PFC_PIN_GROUP(avb_avtp_match_b),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
+	SH_PFC_PIN_GROUP(drif0_ctrl_a),
+	SH_PFC_PIN_GROUP(drif0_data0_a),
+	SH_PFC_PIN_GROUP(drif0_data1_a),
+	SH_PFC_PIN_GROUP(drif0_ctrl_b),
+	SH_PFC_PIN_GROUP(drif0_data0_b),
+	SH_PFC_PIN_GROUP(drif0_data1_b),
+	SH_PFC_PIN_GROUP(drif0_ctrl_c),
+	SH_PFC_PIN_GROUP(drif0_data0_c),
+	SH_PFC_PIN_GROUP(drif0_data1_c),
+	SH_PFC_PIN_GROUP(drif1_ctrl_a),
+	SH_PFC_PIN_GROUP(drif1_data0_a),
+	SH_PFC_PIN_GROUP(drif1_data1_a),
+	SH_PFC_PIN_GROUP(drif1_ctrl_b),
+	SH_PFC_PIN_GROUP(drif1_data0_b),
+	SH_PFC_PIN_GROUP(drif1_data1_b),
+	SH_PFC_PIN_GROUP(drif1_ctrl_c),
+	SH_PFC_PIN_GROUP(drif1_data0_c),
+	SH_PFC_PIN_GROUP(drif1_data1_c),
+	SH_PFC_PIN_GROUP(drif2_ctrl_a),
+	SH_PFC_PIN_GROUP(drif2_data0_a),
+	SH_PFC_PIN_GROUP(drif2_data1_a),
+	SH_PFC_PIN_GROUP(drif2_ctrl_b),
+	SH_PFC_PIN_GROUP(drif2_data0_b),
+	SH_PFC_PIN_GROUP(drif2_data1_b),
+	SH_PFC_PIN_GROUP(drif3_ctrl_a),
+	SH_PFC_PIN_GROUP(drif3_data0_a),
+	SH_PFC_PIN_GROUP(drif3_data1_a),
+	SH_PFC_PIN_GROUP(drif3_ctrl_b),
+	SH_PFC_PIN_GROUP(drif3_data0_b),
+	SH_PFC_PIN_GROUP(drif3_data1_b),
 	SH_PFC_PIN_GROUP(du_rgb666),
 	SH_PFC_PIN_GROUP(du_rgb888),
 	SH_PFC_PIN_GROUP(du_clk_out_0),
@@ -3195,6 +3440,48 @@ static const char * const avb_groups[] = {
 	"avb_avtp_capture_b",
 };
 
+static const char * const drif0_groups[] = {
+	"drif0_ctrl_a",
+	"drif0_data0_a",
+	"drif0_data1_a",
+	"drif0_ctrl_b",
+	"drif0_data0_b",
+	"drif0_data1_b",
+	"drif0_ctrl_c",
+	"drif0_data0_c",
+	"drif0_data1_c",
+};
+
+static const char * const drif1_groups[] = {
+	"drif1_ctrl_a",
+	"drif1_data0_a",
+	"drif1_data1_a",
+	"drif1_ctrl_b",
+	"drif1_data0_b",
+	"drif1_data1_b",
+	"drif1_ctrl_c",
+	"drif1_data0_c",
+	"drif1_data1_c",
+};
+
+static const char * const drif2_groups[] = {
+	"drif2_ctrl_a",
+	"drif2_data0_a",
+	"drif2_data1_a",
+	"drif2_ctrl_b",
+	"drif2_data0_b",
+	"drif2_data1_b",
+};
+
+static const char * const drif3_groups[] = {
+	"drif3_ctrl_a",
+	"drif3_data0_a",
+	"drif3_data1_a",
+	"drif3_ctrl_b",
+	"drif3_data0_b",
+	"drif3_data1_b",
+};
+
 static const char * const du_groups[] = {
 	"du_rgb666",
 	"du_rgb888",
@@ -3457,6 +3744,10 @@ static const char * const usb2_ch3_groups[] = {
 
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
+	SH_PFC_FUNCTION(drif0),
+	SH_PFC_FUNCTION(drif1),
+	SH_PFC_FUNCTION(drif2),
+	SH_PFC_FUNCTION(drif3),
 	SH_PFC_FUNCTION(du),
 	SH_PFC_FUNCTION(msiof0),
 	SH_PFC_FUNCTION(msiof1),
-- 
2.14.1
