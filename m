From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Add USB 2.0 pins, groups and functions
Date: Wed, 26 Jul 2017 20:28:11 +0900
Message-ID: <1501068491-3926-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068491-3926-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501068491-3926-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: linux-gpio@vger.kernel.org

Add pins, groups, and functions for USB 2.0 on R-Car H3 ES2.0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 947abbd9..d5eddcc 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -2754,6 +2754,39 @@ enum {
 	SCIF_CLK_B_MARK,
 };
 
+/* - USB0 ------------------------------------------------------------------- */
+static const unsigned int usb0_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
+};
+static const unsigned int usb0_mux[] = {
+	USB0_PWEN_MARK, USB0_OVC_MARK,
+};
+/* - USB1 ------------------------------------------------------------------- */
+static const unsigned int usb1_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
+};
+static const unsigned int usb1_mux[] = {
+	USB1_PWEN_MARK, USB1_OVC_MARK,
+};
+/* - USB2 ------------------------------------------------------------------- */
+static const unsigned int usb2_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15),
+};
+static const unsigned int usb2_mux[] = {
+	USB2_PWEN_MARK, USB2_OVC_MARK,
+};
+/* - USB2_CH3 --------------------------------------------------------------- */
+static const unsigned int usb2_ch3_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 30), RCAR_GP_PIN(6, 31),
+};
+static const unsigned int usb2_ch3_mux[] = {
+	USB2_CH3_PWEN_MARK, USB2_CH3_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
@@ -2914,6 +2947,10 @@ enum {
 	SH_PFC_PIN_GROUP(scif5_clk_b),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
+	SH_PFC_PIN_GROUP(usb0),
+	SH_PFC_PIN_GROUP(usb1),
+	SH_PFC_PIN_GROUP(usb2),
+	SH_PFC_PIN_GROUP(usb2_ch3),
 };
 
 static const char * const avb_groups[] = {
@@ -3135,6 +3172,22 @@ enum {
 	"scif_clk_b",
 };
 
+static const char * const usb0_groups[] = {
+	"usb0",
+};
+
+static const char * const usb1_groups[] = {
+	"usb1",
+};
+
+static const char * const usb2_groups[] = {
+	"usb2",
+};
+
+static const char * const usb2_ch3_groups[] = {
+	"usb2_ch3",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(du),
@@ -3156,6 +3209,10 @@ enum {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif5),
 	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(usb0),
+	SH_PFC_FUNCTION(usb1),
+	SH_PFC_FUNCTION(usb2),
+	SH_PFC_FUNCTION(usb2_ch3),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
