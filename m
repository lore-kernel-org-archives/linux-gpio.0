From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 14/26] gpio: twl4030: use platform based module init
Date: Tue, 9 Sep 2014 15:59:39 +0530
Message-ID: <1410258591-28248-15-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:38042 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756319AbaIIKa1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:27 -0400
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
 drivers/gpio/gpio-twl4030.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 118828b..b6aa502 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -611,18 +611,7 @@ static struct platform_driver gpio_twl4030_driver = {
 	.probe		= gpio_twl4030_probe,
 	.remove		= gpio_twl4030_remove,
 };
-
-static int __init gpio_twl4030_init(void)
-{
-	return platform_driver_register(&gpio_twl4030_driver);
-}
-subsys_initcall(gpio_twl4030_init);
-
-static void __exit gpio_twl4030_exit(void)
-{
-	platform_driver_unregister(&gpio_twl4030_driver);
-}
-module_exit(gpio_twl4030_exit);
+module_platform_driver(gpio_twl4030_driver);
 
 MODULE_AUTHOR("Texas Instruments, Inc.");
 MODULE_DESCRIPTION("GPIO interface for TWL4030");
-- 
1.9.1

