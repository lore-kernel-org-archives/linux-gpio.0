From: weiyj_lk@163.com
Subject: [PATCH -next] gpio: Fix return value check in xgene_gpio_probe()
Date: Fri, 12 Sep 2014 07:12:14 +0800
Message-ID: <1410477134-5556-1-git-send-email-weiyj_lk@163.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from m12-15.163.com ([220.181.12.15]:58419 "EHLO m12-15.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751215AbaIKXMb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 11 Sep 2014 19:12:31 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function devm_ioremap_nocache() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-xgene.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index e25ba14..cf751f5 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -182,8 +182,8 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	gpio->base = devm_ioremap_nocache(&pdev->dev, res->start,
 							resource_size(res));
-	if (IS_ERR(gpio->base)) {
-		err = PTR_ERR(gpio->base);
+	if (!gpio->base) {
+		err = -ENOMEM;
 		goto err;
 	}
 

