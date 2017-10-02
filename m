From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Add USB3.0 host support
Date: Mon,  2 Oct 2017 18:45:25 +0900
Message-ID: <1506937525-16965-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506937525-16965-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1506937525-16965-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB3.0 ch0 pinmux support to R8A7795 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 9e420f7..39772ac 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3205,6 +3205,16 @@ enum {
 	USB2_CH3_PWEN_MARK, USB2_CH3_OVC_MARK,
 };
 
+/* - USB30 ------------------------------------------------------------------ */
+static const unsigned int usb30_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
+};
+
+static const unsigned int usb30_mux[] = {
+	USB30_PWEN_MARK, USB30_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
@@ -3425,6 +3435,7 @@ enum {
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb2),
 	SH_PFC_PIN_GROUP(usb2_ch3),
+	SH_PFC_PIN_GROUP(usb30),
 };
 
 static const char * const avb_groups[] = {
@@ -3742,6 +3753,10 @@ enum {
 	"usb2_ch3",
 };
 
+static const char * const usb30_groups[] = {
+	"usb30",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(drif0),
@@ -3775,6 +3790,7 @@ enum {
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb2),
 	SH_PFC_FUNCTION(usb2_ch3),
+	SH_PFC_FUNCTION(usb30),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
