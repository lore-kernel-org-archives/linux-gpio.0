From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: mvebu: remove unused variable
Date: Mon, 23 Jan 2017 13:17:25 +0100
Message-ID: <20170123121751.3218467-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:59777 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdAWMS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2017 07:18:26 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <rmk+kernel@armlinux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

A cleanup caused a harmless warning:

drivers/pinctrl/mvebu/pinctrl-kirkwood.c: In function 'kirkwood_pinctrl_probe':
drivers/pinctrl/mvebu/pinctrl-kirkwood.c:460:19: error: unused variable 'res' [-Werror=unused-variable]

The obvious fix is to remove the declaration of the now unused
variable.

Fixes: ad9ec4ecee68 ("pinctrl: mvebu: switch drivers to generic simple mmio")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
index dad38d6dc646..be12b6d569a0 100644
--- a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
+++ b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
@@ -457,7 +457,6 @@ static const struct of_device_id kirkwood_pinctrl_of_match[] = {
 
 static int kirkwood_pinctrl_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	const struct of_device_id *match =
 		of_match_device(kirkwood_pinctrl_of_match, &pdev->dev);
 
-- 
2.9.0

