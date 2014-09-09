From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 16/26] gpio: wm8350: use platform based module init
Date: Tue, 9 Sep 2014 15:59:41 +0530
Message-ID: <1410258591-28248-17-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:59149 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756320AbaIIKa0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:26 -0400
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
 drivers/gpio/gpio-wm8350.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 060b893..7016eef 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -155,18 +155,7 @@ static struct platform_driver wm8350_gpio_driver = {
 	.probe		= wm8350_gpio_probe,
 	.remove		= wm8350_gpio_remove,
 };
-
-static int __init wm8350_gpio_init(void)
-{
-	return platform_driver_register(&wm8350_gpio_driver);
-}
-subsys_initcall(wm8350_gpio_init);
-
-static void __exit wm8350_gpio_exit(void)
-{
-	platform_driver_unregister(&wm8350_gpio_driver);
-}
-module_exit(wm8350_gpio_exit);
+module_platform_driver(wm8350_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM8350 PMICs");
-- 
1.9.1

