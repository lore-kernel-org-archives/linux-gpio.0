From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 22/26] gpio: msic: use platform based module init
Date: Tue, 9 Sep 2014 15:59:47 +0530
Message-ID: <1410258591-28248-23-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:38042 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756719AbaIIKad (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:33 -0400
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
 drivers/gpio/gpio-msic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 8f70ded..6d0f5ec 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -325,13 +325,7 @@ static struct platform_driver platform_msic_gpio_driver = {
 	},
 	.probe		= platform_msic_gpio_probe,
 };
-
-static int __init platform_msic_gpio_init(void)
-{
-	return platform_driver_register(&platform_msic_gpio_driver);
-}
-
-subsys_initcall(platform_msic_gpio_init);
+module_platform_driver(platform_msic_gpio_driver);
 
 MODULE_AUTHOR("Mathias Nyman <mathias.nyman@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Medfield MSIC GPIO driver");
-- 
1.9.1

