From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 20/26] gpio: lynxpoint: use platform based module init
Date: Tue, 9 Sep 2014 15:59:45 +0530
Message-ID: <1410258591-28248-21-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:16234 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756722AbaIIKac (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:32 -0400
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
 drivers/gpio/gpio-lynxpoint.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index fa945ec..1b676f3 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -455,19 +455,7 @@ static struct platform_driver lp_gpio_driver = {
 		.acpi_match_table = ACPI_PTR(lynxpoint_gpio_acpi_match),
 	},
 };
-
-static int __init lp_gpio_init(void)
-{
-	return platform_driver_register(&lp_gpio_driver);
-}
-
-static void __exit lp_gpio_exit(void)
-{
-	platform_driver_unregister(&lp_gpio_driver);
-}
-
-subsys_initcall(lp_gpio_init);
-module_exit(lp_gpio_exit);
+module_platform_driver(lp_gpio_driver);
 
 MODULE_AUTHOR("Mathias Nyman (Intel)");
 MODULE_DESCRIPTION("GPIO interface for Intel Lynxpoint");
-- 
1.9.1

