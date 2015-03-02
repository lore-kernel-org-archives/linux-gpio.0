From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] pinctrl: at91: simplify probe error handling
Date: Mon,  2 Mar 2015 19:28:45 +0200
Message-ID: <2adab2d9a86d0e44051541052ace08527bdcc045.1425317325.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:58257 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756404AbbCBR3p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 2 Mar 2015 12:29:45 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

There is no code ender the 'err' label. Just return the error code directly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/pinctrl/pinctrl-at91.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index f4cd0b9b2438..6cfe534ab27e 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1240,8 +1240,7 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 
 	if (!info->pctl) {
 		dev_err(&pdev->dev, "could not register AT91 pinctrl driver\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	/* We will handle a range of GPIO pins */
@@ -1252,9 +1251,6 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
 
 	return 0;
-
-err:
-	return ret;
 }
 
 static int at91_pinctrl_remove(struct platform_device *pdev)
-- 
2.1.4

