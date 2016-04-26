From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Kill unused variable in sh_pfc_remove()
Date: Tue, 26 Apr 2016 12:30:26 +0200
Message-ID: <1461666626-24805-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:43737 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcDZKac (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 06:30:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

If CONFIG_PINCTRL_SH_PFC_GPIO=n:

    drivers/pinctrl/sh-pfc/core.c: In function 'sh_pfc_remove':
    drivers/pinctrl/sh-pfc/core.c:649:17: warning: unused variable 'pfc' [-Wunused-variable]

Fixes: 67ec8d7b48463904 ("pinctrl: ish-pfc: Use devm_pinctrl_register() for pinctrl registration")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I won't queue this up in sh-pfc-for-v4.7, as the offending commit is not in
that branch.

 drivers/pinctrl/sh-pfc/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index bde726977a3b4f02..fe931c2be38a2f3f 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -646,10 +646,8 @@ pr_info("%s:     PUD5 now is 0x%08x\n", __func__, data);
 
 static int sh_pfc_remove(struct platform_device *pdev)
 {
-	struct sh_pfc *pfc = platform_get_drvdata(pdev);
-
 #ifdef CONFIG_PINCTRL_SH_PFC_GPIO
-	sh_pfc_unregister_gpiochip(pfc);
+	sh_pfc_unregister_gpiochip(platform_get_drvdata(pdev));
 #endif
 
 	return 0;
-- 
1.9.1

