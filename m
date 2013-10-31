From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: tb10x: Convert to use module_platform_driver
Date: Thu, 31 Oct 2013 10:03:02 +0800
Message-ID: <1383184982.13635.3.camel@phoenix>
References: <1383184905.13635.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:42025 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730Ab3JaCDL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2013 22:03:11 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so1819470pab.34
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2013 19:03:10 -0700 (PDT)
In-Reply-To: <1383184905.13635.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, linux-gpio@vger.kernel.org

Use module_platform_driver to simplify the code.
In additional, this is a DT only driver, thus also remove of_match_ptr.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tb10x.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 45bfed1..a0391bc 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -311,23 +311,13 @@ static struct platform_driver tb10x_gpio_driver = {
 	.remove		= tb10x_gpio_remove,
 	.driver = {
 		.name	= "tb10x-gpio",
-		.of_match_table = of_match_ptr(tb10x_gpio_dt_ids),
+		.of_match_table = tb10x_gpio_dt_ids,
 		.owner	= THIS_MODULE,
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
+module_platform_driver(tb10x_gpio_driver);
 
-module_init(ab_gpio_init);
-module_exit(ab_gpio_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("tb10x gpio.");
 MODULE_VERSION("0.0.1");
-- 
1.8.1.2



