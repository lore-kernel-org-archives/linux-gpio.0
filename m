From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] Revert "pinctrl: digicolor: add missing platform_set_drvdata() call"
Date: Sat, 18 Jun 2016 23:01:06 +0300
Message-ID: <8ee4285e8b0e2602ac5cec9845a937895147c5cb.1466280066.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:44477 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751042AbcFRUBt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 18 Jun 2016 16:01:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Masahiro Yamada <yamada.masahiro@socionext.com>, Paul Gortmaker <paul.gortmaker@windriver.com>

This reverts commit 8b2b3dcb343bf8cb62efc1bd6a9dbe850005e2ac.

Commit 546c6d79301 (pinctrl: digicolor: make it explicitly non-modular) removed
the platform_get_drvdata() call, so platform_set_drvdata() is no longer needed.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/pinctrl/pinctrl-digicolor.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index aba3da5ee844..639a57ecc7c2 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -332,8 +332,6 @@ static int dc_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pmap->pctl);
 	}
 
-	platform_set_drvdata(pdev, pmap);
-
 	return dc_gpiochip_add(pmap, pdev->dev.of_node);
 }
 
-- 
2.8.1

