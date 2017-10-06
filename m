From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Add support for INTC-EX IRQ pins
Date: Fri,  6 Oct 2017 13:57:37 +0200
Message-ID: <1507291057-23678-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Most pins on the r8a7796 SoC can be configured in GPIO mode for
interrupt and GPIO functionality, while a couple of them can also
be routed to the INTC-EX hardware block (formerly known as IRQC).

On r8a7795 the INTC-EX hardware handles pins IRQ0 -> IRQ5 and
this patch adds support for them to the PFC driver as "intc_ex_irqN".

[takeshi.kihara.df: Ported from commit bb46f6f3f3bf ("pinctrl: sh-pfc:
 r8a7795: Add support for INTC-EX IRQ pins")
 to drivers/pinctrl/sh-pfc/pfc-r8a7796.c]
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.15.

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 34fc7f7dbd4c1a40..aaf8cc2c157bff1a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -2393,6 +2393,50 @@ static const unsigned int i2c6_c_mux[] = {
 	SDA6_C_MARK, SCL6_C_MARK,
 };
 
+/* - INTC-EX ---------------------------------------------------------------- */
+static const unsigned int intc_ex_irq0_pins[] = {
+	/* IRQ0 */
+	RCAR_GP_PIN(2, 0),
+};
+static const unsigned int intc_ex_irq0_mux[] = {
+	IRQ0_MARK,
+};
+static const unsigned int intc_ex_irq1_pins[] = {
+	/* IRQ1 */
+	RCAR_GP_PIN(2, 1),
+};
+static const unsigned int intc_ex_irq1_mux[] = {
+	IRQ1_MARK,
+};
+static const unsigned int intc_ex_irq2_pins[] = {
+	/* IRQ2 */
+	RCAR_GP_PIN(2, 2),
+};
+static const unsigned int intc_ex_irq2_mux[] = {
+	IRQ2_MARK,
+};
+static const unsigned int intc_ex_irq3_pins[] = {
+	/* IRQ3 */
+	RCAR_GP_PIN(2, 3),
+};
+static const unsigned int intc_ex_irq3_mux[] = {
+	IRQ3_MARK,
+};
+static const unsigned int intc_ex_irq4_pins[] = {
+	/* IRQ4 */
+	RCAR_GP_PIN(2, 4),
+};
+static const unsigned int intc_ex_irq4_mux[] = {
+	IRQ4_MARK,
+};
+static const unsigned int intc_ex_irq5_pins[] = {
+	/* IRQ5 */
+	RCAR_GP_PIN(2, 5),
+};
+static const unsigned int intc_ex_irq5_mux[] = {
+	IRQ5_MARK,
+};
+
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
 	/* SCK */
@@ -3923,6 +3967,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c6_a),
 	SH_PFC_PIN_GROUP(i2c6_b),
 	SH_PFC_PIN_GROUP(i2c6_c),
+	SH_PFC_PIN_GROUP(intc_ex_irq0),
+	SH_PFC_PIN_GROUP(intc_ex_irq1),
+	SH_PFC_PIN_GROUP(intc_ex_irq2),
+	SH_PFC_PIN_GROUP(intc_ex_irq3),
+	SH_PFC_PIN_GROUP(intc_ex_irq4),
+	SH_PFC_PIN_GROUP(intc_ex_irq5),
 	SH_PFC_PIN_GROUP(msiof0_clk),
 	SH_PFC_PIN_GROUP(msiof0_sync),
 	SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -4287,6 +4337,15 @@ static const char * const i2c6_groups[] = {
 	"i2c6_c",
 };
 
+static const char * const intc_ex_groups[] = {
+	"intc_ex_irq0",
+	"intc_ex_irq1",
+	"intc_ex_irq2",
+	"intc_ex_irq3",
+	"intc_ex_irq4",
+	"intc_ex_irq5",
+};
+
 static const char * const msiof0_groups[] = {
 	"msiof0_clk",
 	"msiof0_sync",
@@ -4581,6 +4640,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c6),
+	SH_PFC_FUNCTION(intc_ex),
 	SH_PFC_FUNCTION(msiof0),
 	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(msiof2),
-- 
2.7.4
