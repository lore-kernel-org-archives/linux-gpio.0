From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH resend] pinctrl: sh-pfc: r8a7792: add QSPI pin groups
Date: Sat, 03 Sep 2016 00:50:30 +0300
Message-ID: <4521660.ueRdz9Zt8E@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

Add QSPI pin groups to the R8A7792 PFC driver.

Based  on the original (and large) patch by Vladimir Barinov
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
repo...

Disregard the patch just posted with the stale subject please.

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -1034,6 +1034,29 @@ static const unsigned int lbsc_ex_cs5_pi
 static const unsigned int lbsc_ex_cs5_mux[] = {
 	EX_CS5_N_MARK,
 };
+/* - QSPI ------------------------------------------------------------------- */
+static const unsigned int qspi_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(3, 25), RCAR_GP_PIN(3, 26),
+};
+static const unsigned int qspi_ctrl_mux[] = {
+	SPCLK_MARK, SSL_MARK,
+};
+static const unsigned int qspi_data2_pins[] = {
+	/* MOSI_IO0, MISO_IO1 */
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+};
+static const unsigned int qspi_data2_mux[] = {
+	MOSI_IO0_MARK, MISO_IO1_MARK,
+};
+static const unsigned int qspi_data4_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 23),
+	RCAR_GP_PIN(3, 24),
+};
+static const unsigned int qspi_data4_mux[] = {
+	MOSI_IO0_MARK, MISO_IO1_MARK, IO2_MARK,	IO3_MARK,
+};
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -1585,6 +1608,9 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(lbsc_ex_cs3),
 	SH_PFC_PIN_GROUP(lbsc_ex_cs4),
 	SH_PFC_PIN_GROUP(lbsc_ex_cs5),
+	SH_PFC_PIN_GROUP(qspi_ctrl),
+	SH_PFC_PIN_GROUP(qspi_data2),
+	SH_PFC_PIN_GROUP(qspi_data4),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1708,6 +1734,12 @@ static const char * const lbsc_groups[]
 	"lbsc_ex_cs5",
 };
 
+static const char * const qspi_groups[] = {
+	"qspi_ctrl",
+	"qspi_data2",
+	"qspi_data4",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -1808,6 +1840,7 @@ static const struct sh_pfc_function pinm
 	SH_PFC_FUNCTION(du1),
 	SH_PFC_FUNCTION(intc),
 	SH_PFC_FUNCTION(lbsc),
+	SH_PFC_FUNCTION(qspi),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(sdhi0),
