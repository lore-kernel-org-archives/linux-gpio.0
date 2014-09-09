From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 12/26] gpio: tps65910: use platform based module init
Date: Tue, 9 Sep 2014 15:59:37 +0530
Message-ID: <1410258591-28248-13-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:35709 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932425AbaIIKaQ (ORCPT
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
 drivers/gpio/gpio-tps65910.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 88f1f5f..a5e6665 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -200,18 +200,7 @@ static struct platform_driver tps65910_gpio_driver = {
 	.probe		= tps65910_gpio_probe,
 	.remove		= tps65910_gpio_remove,
 };
-
-static int __init tps65910_gpio_init(void)
-{
-	return platform_driver_register(&tps65910_gpio_driver);
-}
-subsys_initcall(tps65910_gpio_init);
-
-static void __exit tps65910_gpio_exit(void)
-{
-	platform_driver_unregister(&tps65910_gpio_driver);
-}
-module_exit(tps65910_gpio_exit);
+module_platform_driver(tps65910_gpio_driver);
 
 MODULE_AUTHOR("Graeme Gregory <gg@slimlogic.co.uk>");
 MODULE_AUTHOR("Jorge Eduardo Candelaria jedu@slimlogic.co.uk>");
-- 
1.9.1

