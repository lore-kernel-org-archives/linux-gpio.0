From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7796: Add USB3.0 host pins, groups and functions
Date: Wed,  2 Aug 2017 21:51:10 +0900
Message-ID: <1501678270-922-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501678270-922-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:29891 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751600AbdHBMyW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 08:54:22 -0400
In-Reply-To: <1501678270-922-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB30 (USB3.0 host) pin, group and function to R8A7796
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 2a831d3..200e1f4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -3805,6 +3805,15 @@ enum {
 	USB1_PWEN_MARK, USB1_OVC_MARK,
 };
 
+/* - USB30 ------------------------------------------------------------------ */
+static const unsigned int usb30_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
+};
+static const unsigned int usb30_mux[] = {
+	USB30_PWEN_MARK, USB30_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a_a),
 	SH_PFC_PIN_GROUP(audio_clk_a_b),
@@ -4107,6 +4116,7 @@ enum {
 	SH_PFC_PIN_GROUP(ssi9_ctrl_b),
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
+	SH_PFC_PIN_GROUP(usb30),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4545,6 +4555,10 @@ enum {
 	"usb1",
 };
 
+static const char * const usb30_groups[] = {
+	"usb30",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -4591,6 +4605,7 @@ enum {
 	SH_PFC_FUNCTION(ssi),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
+	SH_PFC_FUNCTION(usb30),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1

