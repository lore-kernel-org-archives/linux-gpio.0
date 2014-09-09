From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 10/26] gpio: tc3589x: use platform based module init
Date: Tue, 9 Sep 2014 15:59:35 +0530
Message-ID: <1410258591-28248-11-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:49377 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932424AbaIIKaQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:16 -0400
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
 drivers/gpio/gpio-tc3589x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 7324869..b67016f 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -328,18 +328,7 @@ static struct platform_driver tc3589x_gpio_driver = {
 	.probe		= tc3589x_gpio_probe,
 	.remove		= tc3589x_gpio_remove,
 };
-
-static int __init tc3589x_gpio_init(void)
-{
-	return platform_driver_register(&tc3589x_gpio_driver);
-}
-subsys_initcall(tc3589x_gpio_init);
-
-static void __exit tc3589x_gpio_exit(void)
-{
-	platform_driver_unregister(&tc3589x_gpio_driver);
-}
-module_exit(tc3589x_gpio_exit);
+module_platform_driver(tc3589x_gpio_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("TC3589x GPIO driver");
-- 
1.9.1

