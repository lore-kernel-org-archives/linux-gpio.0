From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7792: add SDHI pin groups
Date: Wed, 13 Jul 2016 00:40:03 +0300
Message-ID: <3437294.RhgABMHgKt@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35755 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbcGLVkN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2016 17:40:13 -0400
Received: by mail-lf0-f46.google.com with SMTP id f93so24257212lfi.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2016 14:40:11 -0700 (PDT)
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be

Add SDHI0 pin groups to the R8A7792 PFC driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
repo plus my 2 R8A7792 PFC patches posted before and the EtherAVB patch  just
reposted...

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c |   51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -932,6 +932,43 @@ static const unsigned int scif3_clk_pins
 static const unsigned int scif3_clk_mux[] = {
 	SCK3_MARK,
 };
+/* - SDHI0 ------------------------------------------------------------------ */
+static const unsigned int sdhi0_data1_pins[] = {
+	/* DAT0 */
+	RCAR_GP_PIN(11, 7),
+};
+static const unsigned int sdhi0_data1_mux[] = {
+	SD0_DAT0_MARK,
+};
+static const unsigned int sdhi0_data4_pins[] = {
+	/* DAT[0-3] */
+	RCAR_GP_PIN(11, 7), RCAR_GP_PIN(11, 8),
+	RCAR_GP_PIN(11, 9), RCAR_GP_PIN(11, 10),
+};
+static const unsigned int sdhi0_data4_mux[] = {
+	SD0_DAT0_MARK, SD0_DAT1_MARK, SD0_DAT2_MARK, SD0_DAT3_MARK,
+};
+static const unsigned int sdhi0_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(11, 5), RCAR_GP_PIN(11, 6),
+};
+static const unsigned int sdhi0_ctrl_mux[] = {
+	SD0_CLK_MARK, SD0_CMD_MARK,
+};
+static const unsigned int sdhi0_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(11, 11),
+};
+static const unsigned int sdhi0_cd_mux[] = {
+	SD0_CD_MARK,
+};
+static const unsigned int sdhi0_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(11, 12),
+};
+static const unsigned int sdhi0_wp_mux[] = {
+	SD0_WP_MARK,
+};
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
@@ -958,6 +995,11 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(scif0_ctrl),
 	SH_PFC_PIN_GROUP(scif3_data),
 	SH_PFC_PIN_GROUP(scif3_clk),
+	SH_PFC_PIN_GROUP(sdhi0_data1),
+	SH_PFC_PIN_GROUP(sdhi0_data4),
+	SH_PFC_PIN_GROUP(sdhi0_ctrl),
+	SH_PFC_PIN_GROUP(sdhi0_cd),
+	SH_PFC_PIN_GROUP(sdhi0_wp),
 };
 
 static const char * const avb_groups[] = {
@@ -999,12 +1041,21 @@ static const char * const scif3_groups[]
 	"scif3_clk",
 };
 
+static const char * const sdhi0_groups[] = {
+	"sdhi0_data1",
+	"sdhi0_data4",
+	"sdhi0_ctrl",
+	"sdhi0_cd",
+	"sdhi0_wp",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(intc),
 	SH_PFC_FUNCTION(lbsc),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif3),
+	SH_PFC_FUNCTION(sdhi0),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {

