From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: tb10x: use module_platform_driver to simplify the code
Date: Wed, 30 Oct 2013 11:08:55 +0800
Message-ID: <CAPgLHd-sfR=W6DV=eu4VsuWN0b6WxBvXPnSuWvWZVbAGTXAaWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f42.google.com ([209.85.214.42]:52747 "EHLO
	mail-bk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751167Ab3J3DI5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2013 23:08:57 -0400
Received: by mail-bk0-f42.google.com with SMTP id my10so297198bkb.29
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2013 20:08:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

module_platform_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-tb10x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 833d0f4..af4975c 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -324,18 +324,7 @@ static struct platform_driver tb10x_gpio_driver = {
 	}
 };
 
-static int __init ab_gpio_init(void)
-{
-	return platform_driver_register(&tb10x_gpio_driver);
-}
-
-static void __exit ab_gpio_exit(void)
-{
-	platform_driver_unregister(&tb10x_gpio_driver);
-}
-
-module_init(ab_gpio_init);
-module_exit(ab_gpio_exit);
+module_platform_driver(tb10x_gpio_driver);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("tb10x gpio.");
 MODULE_VERSION("0.0.1");

