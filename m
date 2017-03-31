From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7791: fix IPSR comment typos
Date: Fri, 31 Mar 2017 23:29:23 +0300
Message-ID: <20170331202941.678985389@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33622 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755093AbdCaU3s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2017 16:29:48 -0400
Received: by mail-lf0-f46.google.com with SMTP id h125so49393371lfe.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2017 13:29:47 -0700 (PDT)
Content-Disposition: inline; filename=pinctrl-sh-pfc-r8a7791-fix-IPSR-comment-typos.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

The IPSR field names in the comments have been fat-fingered in a couple
places --  fix those silly typos...

Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'fixes' branch of Linus Walleij's 'linux-pinctrl.git'
repo plus  3 R8A7791 fixes posted in the last couple days...

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -5711,7 +5711,7 @@ static const struct pinmux_cfg_reg pinmu
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR2", 0xE6060028, 32,
 			     2, 3, 2, 2, 2, 2, 3, 3, 3, 3, 2, 2, 3) {
-		/* IP2_31_20 [2] */
+		/* IP2_31_30 [2] */
 		0, 0, 0, 0,
 		/* IP2_29_27 [3] */
 		FN_EX_CS3_N, FN_ATADIR0_N, FN_MSIOF2_TXD,
@@ -6042,7 +6042,7 @@ static const struct pinmux_cfg_reg pinmu
 		/* IP10_24_22 [3] */
 		FN_VI0_R1, FN_VI2_DATA2, FN_GLO_I1_B, FN_TS_SCK0_C, FN_ATAG1_N,
 		0, 0, 0,
-		/* IP10_21_29 [3] */
+		/* IP10_21_19 [3] */
 		FN_VI0_R0, FN_VI2_DATA1, FN_GLO_I0_B,
 		FN_TS_SDATA0_C, FN_ATACS11_N,
 		0, 0, 0,

