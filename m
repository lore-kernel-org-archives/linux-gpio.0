From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 11/14] pinctrl: sh-pfc: r8a7796: Fix to delete SATA_DEVSLP_B pins function definitions
Date: Thu, 13 Jul 2017 01:55:44 +0900
Message-ID: <1499878547-3452-12-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35787 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932146AbdGLQ4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 12:56:34 -0400
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the macro definitions of SATA_DEVSLP_B pins function
deleted.

This is a correction to the incorrect implementation of IPSR register
pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index cec3a8a..e2c6a51 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -296,7 +296,7 @@
 #define IP9_15_12	FM(SD2_DAT1)		F_(0, 0)	FM(NFDATA11)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP9_19_16	FM(SD2_DAT2)		F_(0, 0)	FM(NFDATA12)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP9_23_20	FM(SD2_DAT3)		F_(0, 0)	FM(NFDATA13)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_27_24	FM(SD2_DS)		F_(0, 0)	FM(NFALE)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(SATA_DEVSLP_B)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_27_24	FM(SD2_DS)		F_(0, 0)	FM(NFALE)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP9_31_28	FM(SD3_CLK)		F_(0, 0)	FM(NFWE_N)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP10_3_0	FM(SD3_CMD)		F_(0, 0)	FM(NFRE_N)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP10_7_4	FM(SD3_DAT0)		F_(0, 0)	FM(NFDATA0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-- 
1.9.1

