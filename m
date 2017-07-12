From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] pinctrl: sh-pfc: r8a7796: Fix MSIOF3 SS2_E mux
Date: Wed, 12 Jul 2017 12:31:17 +0200
Message-ID: <1499855477-20818-6-git-send-email-geert+renesas@glider.be>
References: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:40962 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755760AbdGLKbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 06:31:22 -0400
In-Reply-To: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Fix a copy-and-paste bug in the MSIOF3 SS2_E mux array.

Fixes: 4753231cc9468390 ("pinctrl: sh-pfc: r8a7796: Add MSIOF pins, groups and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 0fd96f198b4dfae2..1ef8d90e48cef317 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -3082,7 +3082,7 @@ static const unsigned int msiof3_ss2_e_pins[] = {
 	RCAR_GP_PIN(2, 0),
 };
 static const unsigned int msiof3_ss2_e_mux[] = {
-	MSIOF3_SS1_E_MARK,
+	MSIOF3_SS2_E_MARK,
 };
 static const unsigned int msiof3_txd_e_pins[] = {
 	/* TXD */
-- 
2.7.4

