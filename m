From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 11/26] gpio: tps6586x: use platform based module init
Date: Tue, 9 Sep 2014 15:59:36 +0530
Message-ID: <1410258591-28248-12-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:49417 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932426AbaIIKaR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:17 -0400
In-Reply-To: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@linaro.org>

Convert *_initcall based probing of GPIO drivers to regular
module_init based probe.

Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
---
 drivers/gpio/gpio-tps6586x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 9c9238e..f1a5221 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -147,18 +147,7 @@ static struct platform_driver tps6586x_gpio_driver = {
 	.probe		= tps6586x_gpio_probe,
 	.remove		= tps6586x_gpio_remove,
 };
-
-static int __init tps6586x_gpio_init(void)
-{
-	return platform_driver_register(&tps6586x_gpio_driver);
-}
-subsys_initcall(tps6586x_gpio_init);
-
-static void __exit tps6586x_gpio_exit(void)
-{
-	platform_driver_unregister(&tps6586x_gpio_driver);
-}
-module_exit(tps6586x_gpio_exit);
+module_platform_driver(tps6586x_gpio_driver);
 
 MODULE_ALIAS("platform:tps6586x-gpio");
 MODULE_DESCRIPTION("GPIO interface for TPS6586X PMIC");
-- 
1.9.1

