From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] pinctrl: sh-pfc: emev2: Correct comment for CFI data pins
Date: Mon, 30 Nov 2015 14:59:54 +0100
Message-ID: <1448891996-5263-2-git-send-email-geert+renesas@glider.be>
References: <1448891996-5263-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:36788 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753973AbbK3N76 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 08:59:58 -0500
In-Reply-To: <1448891996-5263-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

The 8 data pins of the Compact Flash Interface are numbered 0..7, not
0..8.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-emev2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-emev2.c b/drivers/pinctrl/sh-pfc/pfc-emev2.c
index a3a4b67c5434163d..1cbbe04d7df657e8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-emev2.c
+++ b/drivers/pinctrl/sh-pfc/pfc-emev2.c
@@ -749,7 +749,7 @@ static const unsigned int cf_ctrl_mux[] = {
 };
 
 static const unsigned int cf_data8_pins[] = {
-	/* CF_D[0:8] */
+	/* CF_D[0:7] */
 	77, 78, 79, 80,
 	81, 82, 83, 84,
 };
-- 
1.9.1

