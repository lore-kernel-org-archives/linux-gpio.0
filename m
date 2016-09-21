From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: aspeed: remove redundant return value check of platform_get_resource()
Date: Wed, 21 Sep 2016 15:07:56 +0000
Message-ID: <1474470476-2257-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:35160 "EHLO
        mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756289AbcIUPID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2016 11:08:03 -0400
Received: by mail-pa0-f65.google.com with SMTP id hi10so2401958pac.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2016 08:08:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Remove unneeded error handling on the result of a call
to platform_get_resource() when the value is passed to
devm_ioremap_resource().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 8aa3406..03a5925 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -409,9 +409,6 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENXIO;
-
 	gpio->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);

