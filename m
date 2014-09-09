From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 25/26] gpio: tz1090-pdc: use platform based module init
Date: Tue, 9 Sep 2014 15:59:50 +0530
Message-ID: <1410258591-28248-26-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:24220 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756722AbaIIKae (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:34 -0400
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
 drivers/gpio/gpio-tz1090-pdc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pdc.c
index f512da2..7eeebe9 100644
--- a/drivers/gpio/gpio-tz1090-pdc.c
+++ b/drivers/gpio/gpio-tz1090-pdc.c
@@ -235,9 +235,4 @@ static struct platform_driver tz1090_pdc_gpio_driver = {
 	},
 	.probe		= tz1090_pdc_gpio_probe,
 };
-
-static int __init tz1090_pdc_gpio_init(void)
-{
-	return platform_driver_register(&tz1090_pdc_gpio_driver);
-}
-subsys_initcall(tz1090_pdc_gpio_init);
+module_platform_driver(tz1090_pdc_gpio_driver);
-- 
1.9.1

