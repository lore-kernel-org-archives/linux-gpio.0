From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Restore sort order
Date: Thu,  5 Oct 2017 12:20:30 +0200
Message-ID: <1507198830-26128-3-git-send-email-geert+renesas@glider.be>
References: <1507198830-26128-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507198830-26128-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Move the SCIF_CLK pins where they belong.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index df6a95bce4f8061a..9772a6c7b303b5b7 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3121,6 +3121,22 @@ static const unsigned int scif5_clk_b_mux[] = {
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
 /* - SDHI0 ------------------------------------------------------------------ */
 static const unsigned int sdhi0_data1_pins[] = {
 	/* D0 */
@@ -3505,22 +3521,6 @@ static const unsigned int ssi9_ctrl_b_mux[] = {
 	SSI_SCK9_B_MARK, SSI_WS9_B_MARK,
 };
 
-/* - SCIF Clock ------------------------------------------------------------- */
-static const unsigned int scif_clk_a_pins[] = {
-	/* SCIF_CLK */
-	RCAR_GP_PIN(6, 23),
-};
-static const unsigned int scif_clk_a_mux[] = {
-	SCIF_CLK_A_MARK,
-};
-static const unsigned int scif_clk_b_pins[] = {
-	/* SCIF_CLK */
-	RCAR_GP_PIN(5, 9),
-};
-static const unsigned int scif_clk_b_mux[] = {
-	SCIF_CLK_B_MARK,
-};
-
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_pins[] = {
 	/* PWEN, OVC */
-- 
2.7.4
