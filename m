From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: moxart: remove redundant dev_err call in moxart_gpio_probe()
Date: Wed, 4 Dec 2013 08:38:11 +0800
Message-ID: <CAPgLHd8tig4hJuxUe=iWs4xJPuvATK9YWfETQudfbEz71Ta=fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:43635 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754361Ab3LDAiM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2013 19:38:12 -0500
Received: by mail-bk0-f54.google.com with SMTP id v16so6287562bkz.41
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2013 16:38:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-moxart.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index d662cde..8179e35 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -124,11 +124,8 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mgc->moxart_gpio_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(mgc->moxart_gpio_base)) {
-		dev_err(dev, "%s: devm_ioremap_resource res_gpio failed\n",
-			dev->of_node->full_name);
+	if (IS_ERR(mgc->moxart_gpio_base))
 		return PTR_ERR(mgc->moxart_gpio_base);
-	}
 
 	mgc->gpio.dev = dev;
 

