From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next v2] gpio: moxart: remove redundant dev_err call in moxart_gpio_probe()
Date: Mon, 16 Dec 2013 10:12:38 +0800
Message-ID: <CAPgLHd_vpHwJO1Wg08gUoJSUS62vaHKC8YAQ2vVbi7QLE+DSgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:58662 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461Ab3LPCMj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2013 21:12:39 -0500
Received: by mail-bk0-f44.google.com with SMTP id d7so2137452bkh.3
        for <linux-gpio@vger.kernel.org>; Sun, 15 Dec 2013 18:12:38 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, jonas.jensen@gmail.com
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
v1 -> v2: rebased and include Jonas.
---
 drivers/gpio/gpio-moxart.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 4ecd195..0311578 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -120,11 +120,8 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mgc->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(mgc->base)) {
-		dev_err(dev, "%s: devm_ioremap_resource res_gpio failed\n",
-			dev->of_node->full_name);
+	if (IS_ERR(mgc->base))
 		return PTR_ERR(mgc->base);
-	}
 
 	mgc->gpio.dev = dev;
 

