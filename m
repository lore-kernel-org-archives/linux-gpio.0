From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 03/26] gpio: iop: use platform based module init
Date: Tue, 9 Sep 2014 15:59:28 +0530
Message-ID: <1410258591-28248-4-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:36487 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932391AbaIIK3v (ORCPT
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
 drivers/gpio/gpio-iop.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index 0a5e9d3..d646421 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -124,9 +124,4 @@ static struct platform_driver iop3xx_gpio_driver = {
 	},
 	.probe = iop3xx_gpio_probe,
 };
-
-static int __init iop3xx_gpio_init(void)
-{
-	return platform_driver_register(&iop3xx_gpio_driver);
-}
-arch_initcall(iop3xx_gpio_init);
+module_platform_driver(iop3xx_gpio_driver);
-- 
1.9.1

