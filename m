From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7795-es1: Add USB3.0 host support
Date: Mon,  2 Oct 2017 18:45:24 +0900
Message-ID: <1506937525-16965-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506937525-16965-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:38459 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751036AbdJBJtM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2017 05:49:12 -0400
In-Reply-To: <1506937525-16965-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB3{0,1} (USB3.0 host) pinmux support to R8A7795 ES1.x
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 95fd099..78c1acf6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -3101,6 +3101,23 @@ enum {
 	PWM6_B_MARK,
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
 /* - QSPI0 ------------------------------------------------------------------ */
 static const unsigned int qspi0_ctrl_pins[] = {
 	/* QSPI0_SPCLK, QSPI0_SSL */
@@ -4080,6 +4097,8 @@ enum {
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb2),
+	SH_PFC_PIN_GROUP(usb30),
+	SH_PFC_PIN_GROUP(usb31),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4537,6 +4556,14 @@ enum {
 	"usb2",
 };
 
+static const char * const usb30_groups[] = {
+	"usb30",
+};
+
+static const char * const usb31_groups[] = {
+	"usb31",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -4588,6 +4615,8 @@ enum {
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb2),
+	SH_PFC_FUNCTION(usb30),
+	SH_PFC_FUNCTION(usb31),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1

