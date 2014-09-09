From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 17/26] gpio: wm8994: use platform based module init
Date: Tue, 9 Sep 2014 15:59:42 +0530
Message-ID: <1410258591-28248-18-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:38042 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756319AbaIIKaa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:30 -0400
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
 drivers/gpio/gpio-wm8994.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index 6f5e42d..4f4a488 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -295,18 +295,7 @@ static struct platform_driver wm8994_gpio_driver = {
 	.probe		= wm8994_gpio_probe,
 	.remove		= wm8994_gpio_remove,
 };
-
-static int __init wm8994_gpio_init(void)
-{
-	return platform_driver_register(&wm8994_gpio_driver);
-}
-subsys_initcall(wm8994_gpio_init);
-
-static void __exit wm8994_gpio_exit(void)
-{
-	platform_driver_unregister(&wm8994_gpio_driver);
-}
-module_exit(wm8994_gpio_exit);
+module_platform_driver(wm8994_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM8994");
-- 
1.9.1

