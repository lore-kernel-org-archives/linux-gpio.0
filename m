From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7740: Fix typo SCIFAB in comment
Date: Mon,  4 May 2015 16:40:46 +0200
Message-ID: <1430750446-8302-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:57640 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751545AbbEDOkv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 10:40:51 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

The last serial port is called "SCIFB", not "SCIFAB".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
index b486e9d20cc2f7cb..d0bb1459783a16d2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
@@ -258,7 +258,7 @@ enum {
 	/* SCIFA7 */
 	SCIFA7_TXD_MARK,	SCIFA7_RXD_MARK,
 
-	/* SCIFAB */
+	/* SCIFB */
 	SCIFB_SCK_PORT190_MARK, /* MSEL5CR_17_0 */
 	SCIFB_RXD_PORT191_MARK,
 	SCIFB_TXD_PORT192_MARK,
-- 
1.9.1

