From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: tb10x: fix return value check in tb10x_gpio_probe()
Date: Wed, 30 Oct 2013 11:09:15 +0800
Message-ID: <CAPgLHd8mw0-WGdqOdBRi=AWrn6OOgQ-DSiDqsPCMxpY9CrQS_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:63151 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498Ab3J3DJQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2013 23:09:16 -0400
Received: by mail-bk0-f53.google.com with SMTP id w11so241667bkz.26
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2013 20:09:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR(). Also remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-tb10x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 833d0f4..9587ddd 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -207,10 +207,8 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	spin_lock_init(&tb10x_gpio->spinlock);
 
 	tb10x_gpio->base = devm_ioremap_resource(&pdev->dev, mem);
-	if (!tb10x_gpio->base) {
-		dev_err(&pdev->dev, "Could not remap reg space.\n");
-		goto fail_ioremap;
-	}
+	if (IS_ERR(tb10x_gpio->base))
+		return PTR_ERR(tb10x_gpio->base);
 
 	tb10x_gpio->gc.label		= of_node_full_name(dn);
 	tb10x_gpio->gc.dev		= &pdev->dev;

