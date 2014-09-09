From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 19/26] gpio: da9055: use platform based module init
Date: Tue, 9 Sep 2014 15:59:44 +0530
Message-ID: <1410258591-28248-20-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:38042 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756718AbaIIKab (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:31 -0400
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
 drivers/gpio/gpio-da9055.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 9167c43..21c31b0 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -186,18 +186,7 @@ static struct platform_driver da9055_gpio_driver = {
 		.owner	= THIS_MODULE,
 	},
 };
-
-static int __init da9055_gpio_init(void)
-{
-	return platform_driver_register(&da9055_gpio_driver);
-}
-subsys_initcall(da9055_gpio_init);
-
-static void __exit da9055_gpio_exit(void)
-{
-	platform_driver_unregister(&da9055_gpio_driver);
-}
-module_exit(da9055_gpio_exit);
+module_platform_driver(da9055_gpio_driver);
 
 MODULE_AUTHOR("David Dajun Chen <dchen@diasemi.com>");
 MODULE_DESCRIPTION("DA9055 GPIO Device Driver");
-- 
1.9.1

