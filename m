From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] pinctrl: pistachio: Drop pinctrl_unregister for devm_ registered device
Date: Tue, 26 Jul 2016 14:52:57 +0000
Message-ID: <1469544777-32102-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:34721 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754762AbcGZOxO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2016 10:53:14 -0400
Received: by mail-pa0-f66.google.com with SMTP id hh10so107868pac.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2016 07:53:13 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, linux-gpio@vger.kernel.org

It's not necessary to unregister pin controller device registered
with devm_pinctrl_register() and using pinctrl_unregister() leads
to a double free.

This is detected by Coccinelle semantic patch.

Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
---
 drivers/pinctrl/pinctrl-pistachio.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index c6d410e..7bad200 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1432,7 +1432,6 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 {
 	struct pistachio_pinctrl *pctl;
 	struct resource *res;
-	int ret;
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
@@ -1464,13 +1463,7 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctl->pctldev);
 	}
 
-	ret = pistachio_gpio_register(pctl);
-	if (ret < 0) {
-		pinctrl_unregister(pctl->pctldev);
-		return ret;
-	}
-
-	return 0;
+	return pistachio_gpio_register(pctl);
 }
 
 static struct platform_driver pistachio_pinctrl_driver = {

