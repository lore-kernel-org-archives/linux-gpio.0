From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7791: fix SCIF2 pinmux data
Date: Thu, 30 Mar 2017 23:20:48 +0300
Message-ID: <20170330202059.050530179@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:32825 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934896AbdC3UVF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Mar 2017 16:21:05 -0400
Received: by mail-lf0-f43.google.com with SMTP id h125so33977305lfe.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Mar 2017 13:21:03 -0700 (PDT)
Content-Disposition: inline; filename=pinctrl-sh-pfc-r8a7791-fix-SCIF2-pinmux-data.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

PINMUX_IPSR_MSEL() macro invocation for the TX2 signal has apparently wrong
1st argument -- most probably a result of cut&paste programming...

Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'fixes' branch of Linus Walleij's 'linux-pinctrl.git'
repo plus  2 R8A7791 fixes posted yesterday.

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -1103,7 +1103,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP6_5_3, FMIN_E, SEL_FM_4),
 	PINMUX_IPSR_GPSR(IP6_7_6, AUDIO_CLKOUT),
 	PINMUX_IPSR_MSEL(IP6_7_6, MSIOF1_SS1_B, SEL_SOF1_1),
-	PINMUX_IPSR_MSEL(IP6_5_3, TX2, SEL_SCIF2_0),
+	PINMUX_IPSR_MSEL(IP6_7_6, TX2, SEL_SCIF2_0),
 	PINMUX_IPSR_MSEL(IP6_7_6, SCIFA2_TXD, SEL_SCIFA2_0),
 	PINMUX_IPSR_GPSR(IP6_9_8, IRQ0),
 	PINMUX_IPSR_MSEL(IP6_9_8, SCIFB1_RXD_D, SEL_SCIFB1_3),

