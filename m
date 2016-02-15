From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add support for INTC-EX IRQ pins
Date: Mon, 15 Feb 2016 21:17:19 +0900
Message-ID: <20160215121719.27056.43809.sendpatchset@little-apple>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, Magnus Damm <magnus.damm@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Most pins on the r8a7795 SoC can be configured in GPIO mode for
interrupt and GPIO functionality, while a couple of them can also
be routed to the INTC-EX hardware block (formerly known as IRQC).

On r8a7795 the INTC-EX hardware handles pins IRQ0 -> IRQ5 and
this patch adds support for them to the PFC driver as "intc_ex_irqN".

Tested on r8a7795 Salvator-X with an external loop back adapter on
EXIO_D that connects pin 9 (IRQ2/GP2_02) and pin 26 (ExA22/GP2_06).

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2016-02-09-v4.5-rc3

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c |   60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

--- 0001/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ work/drivers/pinctrl/sh-pfc/pfc-r8a7795.c	2016-02-15 21:05:24.500513000 +0900
@@ -1835,6 +1835,50 @@ static const unsigned int i2c6_c_mux[] =
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
@@ -3173,6 +3217,12 @@ static const struct sh_pfc_pin_group pin
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
@@ -3439,6 +3489,15 @@ static const char * const i2c6_groups[]
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
@@ -3686,6 +3745,7 @@ static const struct sh_pfc_function pinm
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c6),
+	SH_PFC_FUNCTION(intc_ex),
 	SH_PFC_FUNCTION(msiof0),
 	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(msiof2),
