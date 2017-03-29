From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal
Date: Wed, 29 Mar 2017 21:36:51 +0300
Message-ID: <20170329183658.618942497@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33833 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932219AbdC2ShE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2017 14:37:04 -0400
Received: by mail-lf0-f46.google.com with SMTP id z15so14424734lfd.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2017 11:37:03 -0700 (PDT)
Content-Disposition: inline; filename=pinctrl-sh-pfc-r8a7791-add-missing-DVC_MUTE-signal.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

The R8A7791 PFC driver  was apparently based on the preliminary revisions
of  the user's  manual, which  omitted the DVC_MUTE signal  altogether in
the PFC section. The modern manual has the signal described,  so just add
the necassary data to the driver...

Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -203,7 +203,7 @@ enum {
 
 	/* IPSR6 */
 	FN_AUDIO_CLKB, FN_STP_OPWM_0_B, FN_MSIOF1_SCK_B,
-	FN_SCIF_CLK, FN_BPFCLK_E,
+	FN_SCIF_CLK, FN_DVC_MUTE, FN_BPFCLK_E,
 	FN_AUDIO_CLKC, FN_SCIFB0_SCK_C, FN_MSIOF1_SYNC_B, FN_RX2,
 	FN_SCIFA2_RXD, FN_FMIN_E,
 	FN_AUDIO_CLKOUT, FN_MSIOF1_SS1_B, FN_TX2, FN_SCIFA2_TXD,
@@ -573,7 +573,7 @@ enum {
 
 	/* IPSR6 */
 	AUDIO_CLKB_MARK, STP_OPWM_0_B_MARK, MSIOF1_SCK_B_MARK,
-	SCIF_CLK_MARK, BPFCLK_E_MARK,
+	SCIF_CLK_MARK, DVC_MUTE_MARK, BPFCLK_E_MARK,
 	AUDIO_CLKC_MARK, SCIFB0_SCK_C_MARK, MSIOF1_SYNC_B_MARK, RX2_MARK,
 	SCIFA2_RXD_MARK, FMIN_E_MARK,
 	AUDIO_CLKOUT_MARK, MSIOF1_SS1_B_MARK, TX2_MARK, SCIFA2_TXD_MARK,
@@ -1093,6 +1093,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP6_2_0, STP_OPWM_0_B, SEL_SSP_1),
 	PINMUX_IPSR_MSEL(IP6_2_0, MSIOF1_SCK_B, SEL_SOF1_1),
 	PINMUX_IPSR_MSEL(IP6_2_0, SCIF_CLK, SEL_SCIF_0),
+	PINMUX_IPSR_GPSR(IP6_2_0, DVC_MUTE),
 	PINMUX_IPSR_MSEL(IP6_2_0, BPFCLK_E, SEL_FM_4),
 	PINMUX_IPSR_GPSR(IP6_5_3, AUDIO_CLKC),
 	PINMUX_IPSR_MSEL(IP6_5_3, SCIFB0_SCK_C, SEL_SCIFB_2),
@@ -5899,7 +5900,7 @@ static const struct pinmux_cfg_reg pinmu
 		0, 0,
 		/* IP6_2_0 [3] */
 		FN_AUDIO_CLKB, FN_STP_OPWM_0_B, FN_MSIOF1_SCK_B,
-		FN_SCIF_CLK, 0, FN_BPFCLK_E,
+		FN_SCIF_CLK, FN_DVC_MUTE, FN_BPFCLK_E,
 		0, 0, }
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606003C, 32,

