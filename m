From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: loongson1: remove redundant return value check of platform_get_resource()
Date: Wed, 21 Sep 2016 15:07:39 +0000
Message-ID: <1474470459-2124-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33346 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754998AbcIUPHt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2016 11:07:49 -0400
Received: by mail-pf0-f196.google.com with SMTP id q2so2503020pfj.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2016 08:07:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keguang Zhang <keguang.zhang@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Remove unneeded error handling on the result of a call
to platform_get_resource() when the value is passed to
devm_ioremap_resource().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-loongson1.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.c
index ad0a595..72b6403 100644
--- a/drivers/gpio/gpio-loongson1.c
+++ b/drivers/gpio/gpio-loongson1.c
@@ -56,11 +56,6 @@ static int ls1x_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get I/O memory\n");
-		return -EINVAL;
-	}
-
 	gpio_reg_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(gpio_reg_base))
 		return PTR_ERR(gpio_reg_base);

