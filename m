From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7792: add MSIOF pin groups
Date: Mon, 05 Sep 2016 23:17:31 +0300
Message-ID: <2011444.8BtcIjeJf3@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

Add MSIOF0/1 pin groups to the R8A7792 PFC driver.

Based  on the original (and large) patch by Vladimir Barinov
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
repo plus the QSPI patch last week...

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c |   82 +++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -1034,6 +1034,64 @@ static const unsigned int lbsc_ex_cs5_pi
 static const unsigned int lbsc_ex_cs5_mux[] = {
 	EX_CS5_N_MARK,
 };
+/* - MSIOF0 ----------------------------------------------------------------- */
+static const unsigned int msiof0_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(10, 0),
+};
+static const unsigned int msiof0_clk_mux[] = {
+	MSIOF0_SCK_MARK,
+};
+static const unsigned int msiof0_sync_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(10, 1),
+};
+static const unsigned int msiof0_sync_mux[] = {
+	MSIOF0_SYNC_MARK,
+};
+static const unsigned int msiof0_rx_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(10, 4),
+};
+static const unsigned int msiof0_rx_mux[] = {
+	MSIOF0_RXD_MARK,
+};
+static const unsigned int msiof0_tx_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(10, 3),
+};
+static const unsigned int msiof0_tx_mux[] = {
+	MSIOF0_TXD_MARK,
+};
+/* - MSIOF1 ----------------------------------------------------------------- */
+static const unsigned int msiof1_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(10, 5),
+};
+static const unsigned int msiof1_clk_mux[] = {
+	MSIOF1_SCK_MARK,
+};
+static const unsigned int msiof1_sync_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(10, 6),
+};
+static const unsigned int msiof1_sync_mux[] = {
+	MSIOF1_SYNC_MARK,
+};
+static const unsigned int msiof1_rx_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(10, 9),
+};
+static const unsigned int msiof1_rx_mux[] = {
+	MSIOF1_RXD_MARK,
+};
+static const unsigned int msiof1_tx_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(10, 8),
+};
+static const unsigned int msiof1_tx_mux[] = {
+	MSIOF1_TXD_MARK,
+};
 /* - QSPI ------------------------------------------------------------------- */
 static const unsigned int qspi_ctrl_pins[] = {
 	/* SPCLK, SSL */
@@ -1608,6 +1666,14 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(lbsc_ex_cs3),
 	SH_PFC_PIN_GROUP(lbsc_ex_cs4),
 	SH_PFC_PIN_GROUP(lbsc_ex_cs5),
+	SH_PFC_PIN_GROUP(msiof0_clk),
+	SH_PFC_PIN_GROUP(msiof0_sync),
+	SH_PFC_PIN_GROUP(msiof0_rx),
+	SH_PFC_PIN_GROUP(msiof0_tx),
+	SH_PFC_PIN_GROUP(msiof1_clk),
+	SH_PFC_PIN_GROUP(msiof1_sync),
+	SH_PFC_PIN_GROUP(msiof1_rx),
+	SH_PFC_PIN_GROUP(msiof1_tx),
 	SH_PFC_PIN_GROUP(qspi_ctrl),
 	SH_PFC_PIN_GROUP(qspi_data2),
 	SH_PFC_PIN_GROUP(qspi_data4),
@@ -1734,6 +1800,20 @@ static const char * const lbsc_groups[]
 	"lbsc_ex_cs5",
 };
 
+static const char * const msiof0_groups[] = {
+	"msiof0_clk",
+	"msiof0_sync",
+	"msiof0_rx",
+	"msiof0_tx",
+};
+
+static const char * const msiof1_groups[] = {
+	"msiof1_clk",
+	"msiof1_sync",
+	"msiof1_rx",
+	"msiof1_tx",
+};
+
 static const char * const qspi_groups[] = {
 	"qspi_ctrl",
 	"qspi_data2",
@@ -1840,6 +1920,8 @@ static const struct sh_pfc_function pinm
 	SH_PFC_FUNCTION(du1),
 	SH_PFC_FUNCTION(intc),
 	SH_PFC_FUNCTION(lbsc),
+	SH_PFC_FUNCTION(msiof0),
+	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(qspi),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif3),
