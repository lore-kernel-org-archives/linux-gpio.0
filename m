From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 23/26] gpio: rc5t583: use platform based module init
Date: Tue, 9 Sep 2014 15:59:48 +0530
Message-ID: <1410258591-28248-24-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:16234 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756724AbaIIKae (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:34 -0400
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
 drivers/gpio/gpio-rc5t583.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index 769233d..1074f99 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -160,18 +160,7 @@ static struct platform_driver rc5t583_gpio_driver = {
 	.probe		= rc5t583_gpio_probe,
 	.remove		= rc5t583_gpio_remove,
 };
-
-static int __init rc5t583_gpio_init(void)
-{
-	return platform_driver_register(&rc5t583_gpio_driver);
-}
-subsys_initcall(rc5t583_gpio_init);
-
-static void __exit rc5t583_gpio_exit(void)
-{
-	platform_driver_unregister(&rc5t583_gpio_driver);
-}
-module_exit(rc5t583_gpio_exit);
+module_platform_driver(rc5t583_gpio_driver);
 
 MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
 MODULE_DESCRIPTION("GPIO interface for RC5T583");
-- 
1.9.1

