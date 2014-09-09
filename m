From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 09/26] gpio: stmpe: use platform based module init
Date: Tue, 9 Sep 2014 15:59:34 +0530
Message-ID: <1410258591-28248-10-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:19219 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932405AbaIIKaE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:04 -0400
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
 drivers/gpio/gpio-stmpe.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 845025a..1504476 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -372,18 +372,7 @@ static struct platform_driver stmpe_gpio_driver = {
 	.probe		= stmpe_gpio_probe,
 	.remove		= stmpe_gpio_remove,
 };
-
-static int __init stmpe_gpio_init(void)
-{
-	return platform_driver_register(&stmpe_gpio_driver);
-}
-subsys_initcall(stmpe_gpio_init);
-
-static void __exit stmpe_gpio_exit(void)
-{
-	platform_driver_unregister(&stmpe_gpio_driver);
-}
-module_exit(stmpe_gpio_exit);
+module_platform_driver(stmpe_gpio_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("STMPExxxx GPIO driver");
-- 
1.9.1

