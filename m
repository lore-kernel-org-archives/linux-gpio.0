From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/4] pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support
Date: Mon, 13 Mar 2017 18:12:47 +0100
Message-ID: <1489425167-22711-5-git-send-email-geert+renesas@glider.be>
References: <1489425167-22711-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1489425167-22711-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-Id: linux-gpio@vger.kernel.org

Add pins, groups, and a function for SCIF_CLK on R-Car H3 ES2.0.
SCIF_CLK is the external clock source for the Baud Rate Generator for
External Clock (BRG) on (H)SCIF serial ports.

Extracted from a big patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>
---
v2:
  - New.
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 996cacee99c3e8be..0454f31c08318c48 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1773,6 +1773,22 @@ static const unsigned int scif5_clk_b_mux[] = {
 	SCK5_B_MARK,
 };
 
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
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
@@ -1801,6 +1817,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif5_clk_a),
 	SH_PFC_PIN_GROUP(scif5_data_b),
 	SH_PFC_PIN_GROUP(scif5_clk_b),
+	SH_PFC_PIN_GROUP(scif_clk_a),
+	SH_PFC_PIN_GROUP(scif_clk_b),
 };
 
 static const char * const scif0_groups[] = {
@@ -1848,6 +1866,11 @@ static const char * const scif5_groups[] = {
 	"scif5_clk_b",
 };
 
+static const char * const scif_clk_groups[] = {
+	"scif_clk_a",
+	"scif_clk_b",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
@@ -1855,6 +1878,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif5),
+	SH_PFC_FUNCTION(scif_clk),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.7.4
