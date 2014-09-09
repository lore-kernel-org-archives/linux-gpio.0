From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 07/26] gpio: palmas: use platform based module init
Date: Tue, 9 Sep 2014 15:59:32 +0530
Message-ID: <1410258591-28248-8-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:52390 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932389AbaIIK36 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:29:58 -0400
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
 drivers/gpio/gpio-palmas.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 171a638..e593d42 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -221,18 +221,7 @@ static struct platform_driver palmas_gpio_driver = {
 	.probe		= palmas_gpio_probe,
 	.remove		= palmas_gpio_remove,
 };
-
-static int __init palmas_gpio_init(void)
-{
-	return platform_driver_register(&palmas_gpio_driver);
-}
-subsys_initcall(palmas_gpio_init);
-
-static void __exit palmas_gpio_exit(void)
-{
-	platform_driver_unregister(&palmas_gpio_driver);
-}
-module_exit(palmas_gpio_exit);
+module_platform_driver(palmas_gpio_driver);
 
 MODULE_ALIAS("platform:palmas-gpio");
 MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
-- 
1.9.1

