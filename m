From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7795-es1: Restore sort order
Date: Thu,  5 Oct 2017 12:20:29 +0200
Message-ID: <1507198830-26128-2-git-send-email-geert+renesas@glider.be>
References: <1507198830-26128-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507198830-26128-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Move the USB30 pins where they belong.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 78c1acf60445340e..20f34e675c60327a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -3101,23 +3101,6 @@ static const unsigned int pwm6_b_mux[] = {
 	PWM6_B_MARK,
 };
 
-/* - USB30 ------------------------------------------------------------------ */
-static const unsigned int usb30_pins[] = {
-	/* PWEN, OVC */
-	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
-};
-static const unsigned int usb30_mux[] = {
-	USB30_PWEN_MARK, USB30_OVC_MARK,
-};
-/* - USB31 ------------------------------------------------------------------ */
-static const unsigned int usb31_pins[] = {
-	/* PWEN, OVC */
-	RCAR_GP_PIN(6, 30), RCAR_GP_PIN(6, 31),
-};
-static const unsigned int usb31_mux[] = {
-	USB31_PWEN_MARK, USB31_OVC_MARK,
-};
-
 /* - QSPI0 ------------------------------------------------------------------ */
 static const unsigned int qspi0_ctrl_pins[] = {
 	/* QSPI0_SPCLK, QSPI0_SSL */
@@ -3791,6 +3774,23 @@ static const unsigned int usb2_mux[] = {
 	USB2_PWEN_MARK, USB2_OVC_MARK,
 };
 
+/* - USB30 ------------------------------------------------------------------ */
+static const unsigned int usb30_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
+};
+static const unsigned int usb30_mux[] = {
+	USB30_PWEN_MARK, USB30_OVC_MARK,
+};
+/* - USB31 ------------------------------------------------------------------ */
+static const unsigned int usb31_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 30), RCAR_GP_PIN(6, 31),
+};
+static const unsigned int usb31_mux[] = {
+	USB31_PWEN_MARK, USB31_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a_a),
 	SH_PFC_PIN_GROUP(audio_clk_a_b),
-- 
2.7.4
