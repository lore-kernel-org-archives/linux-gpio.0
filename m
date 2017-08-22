From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add SDHIx support
Date: Tue, 22 Aug 2017 08:32:45 +0200
Message-ID: <1503383565-13034-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: wsa@the-dreams.de, geert@linux-m68k.org, Dirk Behme <dirk.behme@de.bosch.com>
List-Id: linux-gpio@vger.kernel.org

Add SDHIx support for ES2.0. Taken from the Renesas BSP

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/tree/drivers/pinctrl/sh-pfc/pfc-r8a7795.c

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Note: Patch is generated against renesas-drivers-2017-08-16-v4.13-rc5

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 277 ++++++++++++++++++++++++++++++++++-
 1 file changed, 276 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 8b35772cda98..324d8ce8cdb4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -2734,6 +2734,213 @@ static const unsigned int scif5_clk_b_mux[] = {
 	SCK5_B_MARK,
 };
 
+/* - SDHI0 ------------------------------------------------------------------ */
+static const unsigned int sdhi0_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(3, 2),
+};
+static const unsigned int sdhi0_data1_mux[] = {
+	SD0_DAT0_MARK,
+};
+static const unsigned int sdhi0_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+};
+static const unsigned int sdhi0_data4_mux[] = {
+	SD0_DAT0_MARK, SD0_DAT1_MARK,
+	SD0_DAT2_MARK, SD0_DAT3_MARK,
+};
+static const unsigned int sdhi0_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
+};
+static const unsigned int sdhi0_ctrl_mux[] = {
+	SD0_CLK_MARK, SD0_CMD_MARK,
+};
+static const unsigned int sdhi0_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(3, 12),
+};
+static const unsigned int sdhi0_cd_mux[] = {
+	SD0_CD_MARK,
+};
+static const unsigned int sdhi0_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(3, 13),
+};
+static const unsigned int sdhi0_wp_mux[] = {
+	SD0_WP_MARK,
+};
+/* - SDHI1 ------------------------------------------------------------------ */
+static const unsigned int sdhi1_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(3, 8),
+};
+static const unsigned int sdhi1_data1_mux[] = {
+	SD1_DAT0_MARK,
+};
+static const unsigned int sdhi1_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(3, 8),  RCAR_GP_PIN(3, 9),
+	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
+};
+static const unsigned int sdhi1_data4_mux[] = {
+	SD1_DAT0_MARK, SD1_DAT1_MARK,
+	SD1_DAT2_MARK, SD1_DAT3_MARK,
+};
+static const unsigned int sdhi1_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+};
+static const unsigned int sdhi1_ctrl_mux[] = {
+	SD1_CLK_MARK, SD1_CMD_MARK,
+};
+static const unsigned int sdhi1_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(3, 14),
+};
+static const unsigned int sdhi1_cd_mux[] = {
+	SD1_CD_MARK,
+};
+static const unsigned int sdhi1_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(3, 15),
+};
+static const unsigned int sdhi1_wp_mux[] = {
+	SD1_WP_MARK,
+};
+/* - SDHI2 ------------------------------------------------------------------ */
+static const unsigned int sdhi2_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(4, 2),
+};
+static const unsigned int sdhi2_data1_mux[] = {
+	SD2_DAT0_MARK,
+};
+static const unsigned int sdhi2_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
+};
+static const unsigned int sdhi2_data4_mux[] = {
+	SD2_DAT0_MARK, SD2_DAT1_MARK,
+	SD2_DAT2_MARK, SD2_DAT3_MARK,
+};
+static const unsigned int sdhi2_data8_pins[] = {
+	/* D[0:7] */
+	RCAR_GP_PIN(4, 2),  RCAR_GP_PIN(4, 3),
+	RCAR_GP_PIN(4, 4),  RCAR_GP_PIN(4, 5),
+	RCAR_GP_PIN(3, 8),  RCAR_GP_PIN(3, 9),
+	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
+};
+static const unsigned int sdhi2_data8_mux[] = {
+	SD2_DAT0_MARK, SD2_DAT1_MARK,
+	SD2_DAT2_MARK, SD2_DAT3_MARK,
+	SD2_DAT4_MARK, SD2_DAT5_MARK,
+	SD2_DAT6_MARK, SD2_DAT7_MARK,
+};
+static const unsigned int sdhi2_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(4, 0), RCAR_GP_PIN(4, 1),
+};
+static const unsigned int sdhi2_ctrl_mux[] = {
+	SD2_CLK_MARK, SD2_CMD_MARK,
+};
+static const unsigned int sdhi2_cd_a_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(4, 13),
+};
+static const unsigned int sdhi2_cd_a_mux[] = {
+	SD2_CD_A_MARK,
+};
+static const unsigned int sdhi2_cd_b_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(5, 10),
+};
+static const unsigned int sdhi2_cd_b_mux[] = {
+	SD2_CD_B_MARK,
+};
+static const unsigned int sdhi2_wp_a_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(4, 14),
+};
+static const unsigned int sdhi2_wp_a_mux[] = {
+	SD2_WP_A_MARK,
+};
+static const unsigned int sdhi2_wp_b_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(5, 11),
+};
+static const unsigned int sdhi2_wp_b_mux[] = {
+	SD2_WP_B_MARK,
+};
+static const unsigned int sdhi2_ds_pins[] = {
+	/* DS */
+	RCAR_GP_PIN(4, 6),
+};
+static const unsigned int sdhi2_ds_mux[] = {
+	SD2_DS_MARK,
+};
+/* - SDHI3 ------------------------------------------------------------------ */
+static const unsigned int sdhi3_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(4, 9),
+};
+static const unsigned int sdhi3_data1_mux[] = {
+	SD3_DAT0_MARK,
+};
+static const unsigned int sdhi3_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 10),
+	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
+};
+static const unsigned int sdhi3_data4_mux[] = {
+	SD3_DAT0_MARK, SD3_DAT1_MARK,
+	SD3_DAT2_MARK, SD3_DAT3_MARK,
+};
+static const unsigned int sdhi3_data8_pins[] = {
+	/* D[0:7] */
+	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 10),
+	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
+	RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 14),
+	RCAR_GP_PIN(4, 15), RCAR_GP_PIN(4, 16),
+};
+static const unsigned int sdhi3_data8_mux[] = {
+	SD3_DAT0_MARK, SD3_DAT1_MARK,
+	SD3_DAT2_MARK, SD3_DAT3_MARK,
+	SD3_DAT4_MARK, SD3_DAT5_MARK,
+	SD3_DAT6_MARK, SD3_DAT7_MARK,
+};
+static const unsigned int sdhi3_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(4, 7), RCAR_GP_PIN(4, 8),
+};
+static const unsigned int sdhi3_ctrl_mux[] = {
+	SD3_CLK_MARK, SD3_CMD_MARK,
+};
+static const unsigned int sdhi3_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(4, 15),
+};
+static const unsigned int sdhi3_cd_mux[] = {
+	SD3_CD_MARK,
+};
+static const unsigned int sdhi3_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(4, 16),
+};
+static const unsigned int sdhi3_wp_mux[] = {
+	SD3_WP_MARK,
+};
+static const unsigned int sdhi3_ds_pins[] = {
+	/* DS */
+	RCAR_GP_PIN(4, 17),
+};
+static const unsigned int sdhi3_ds_mux[] = {
+	SD3_DS_MARK,
+};
+
 /* - SCIF Clock ------------------------------------------------------------- */
 static const unsigned int scif_clk_a_pins[] = {
 	/* SCIF_CLK */
@@ -2943,6 +3150,32 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif5_clk_b),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
+	SH_PFC_PIN_GROUP(sdhi0_data1),
+	SH_PFC_PIN_GROUP(sdhi0_data4),
+	SH_PFC_PIN_GROUP(sdhi0_ctrl),
+	SH_PFC_PIN_GROUP(sdhi0_cd),
+	SH_PFC_PIN_GROUP(sdhi0_wp),
+	SH_PFC_PIN_GROUP(sdhi1_data1),
+	SH_PFC_PIN_GROUP(sdhi1_data4),
+	SH_PFC_PIN_GROUP(sdhi1_ctrl),
+	SH_PFC_PIN_GROUP(sdhi1_cd),
+	SH_PFC_PIN_GROUP(sdhi1_wp),
+	SH_PFC_PIN_GROUP(sdhi2_data1),
+	SH_PFC_PIN_GROUP(sdhi2_data4),
+	SH_PFC_PIN_GROUP(sdhi2_data8),
+	SH_PFC_PIN_GROUP(sdhi2_ctrl),
+	SH_PFC_PIN_GROUP(sdhi2_cd_a),
+	SH_PFC_PIN_GROUP(sdhi2_wp_a),
+	SH_PFC_PIN_GROUP(sdhi2_cd_b),
+	SH_PFC_PIN_GROUP(sdhi2_wp_b),
+	SH_PFC_PIN_GROUP(sdhi2_ds),
+	SH_PFC_PIN_GROUP(sdhi3_data1),
+	SH_PFC_PIN_GROUP(sdhi3_data4),
+	SH_PFC_PIN_GROUP(sdhi3_data8),
+	SH_PFC_PIN_GROUP(sdhi3_ctrl),
+	SH_PFC_PIN_GROUP(sdhi3_cd),
+	SH_PFC_PIN_GROUP(sdhi3_wp),
+	SH_PFC_PIN_GROUP(sdhi3_ds),
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb2),
@@ -3168,6 +3401,44 @@ static const char * const scif_clk_groups[] = {
 	"scif_clk_b",
 };
 
+static const char * const sdhi0_groups[] = {
+	"sdhi0_data1",
+	"sdhi0_data4",
+	"sdhi0_ctrl",
+	"sdhi0_cd",
+	"sdhi0_wp",
+};
+
+static const char * const sdhi1_groups[] = {
+	"sdhi1_data1",
+	"sdhi1_data4",
+	"sdhi1_ctrl",
+	"sdhi1_cd",
+	"sdhi1_wp",
+};
+
+static const char * const sdhi2_groups[] = {
+	"sdhi2_data1",
+	"sdhi2_data4",
+	"sdhi2_data8",
+	"sdhi2_ctrl",
+	"sdhi2_cd_a",
+	"sdhi2_wp_a",
+	"sdhi2_cd_b",
+	"sdhi2_wp_b",
+	"sdhi2_ds",
+};
+
+static const char * const sdhi3_groups[] = {
+	"sdhi3_data1",
+	"sdhi3_data4",
+	"sdhi3_data8",
+	"sdhi3_ctrl",
+	"sdhi3_cd",
+	"sdhi3_wp",
+	"sdhi3_ds",
+};
+
 static const char * const usb0_groups[] = {
 	"usb0",
 };
@@ -3182,7 +3453,7 @@ static const char * const usb2_groups[] = {
 
 static const char * const usb2_ch3_groups[] = {
 	"usb2_ch3",
-};
+}
 
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
@@ -3205,6 +3476,10 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif5),
 	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(sdhi0),
+	SH_PFC_FUNCTION(sdhi1),
+	SH_PFC_FUNCTION(sdhi2),
+	SH_PFC_FUNCTION(sdhi3),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb2),
-- 
2.14.1
