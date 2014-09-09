From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 02/26] gpio: ep93xx: use platform based module init
Date: Tue, 9 Sep 2014 15:59:27 +0530
Message-ID: <1410258591-28248-3-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:22604 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932389AbaIIK3v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:29:51 -0400
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
 drivers/gpio/gpio-ep93xx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index dcc2bb4..f7ae051 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -378,12 +378,7 @@ static struct platform_driver ep93xx_gpio_driver = {
 	},
 	.probe		= ep93xx_gpio_probe,
 };
-
-static int __init ep93xx_gpio_init(void)
-{
-	return platform_driver_register(&ep93xx_gpio_driver);
-}
-postcore_initcall(ep93xx_gpio_init);
+module_platform_driver(ep93xx_gpio_driver);
 
 MODULE_AUTHOR("Ryan Mallon <ryan@bluewatersys.com> "
 		"H Hartley Sweeten <hsweeten@visionengravers.com>");
-- 
1.9.1

