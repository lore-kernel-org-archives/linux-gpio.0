From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: aspeed: fix return value check in aspeed_gpio_probe()
Date: Thu, 15 Sep 2016 01:30:32 +0000
Message-ID: <1473903032-20524-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:33698 "EHLO
        mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755183AbcIOBbA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 21:31:00 -0400
Received: by mail-pa0-f68.google.com with SMTP id oz2so1411658pac.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2016 18:30:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9f7266e..8aa3406 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -413,8 +413,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		return -ENXIO;
 
 	gpio->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!gpio->base)
-		return -ENOMEM;
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
 
 	spin_lock_init(&gpio->lock);
 



