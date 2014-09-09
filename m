From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 18/26] gpio: zynq: use platform based module init
Date: Tue, 9 Sep 2014 15:59:43 +0530
Message-ID: <1410258591-28248-19-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:16234 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756620AbaIIKaa (ORCPT
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
 drivers/gpio/gpio-zynq.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 31ad5df..a112600 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -695,17 +695,7 @@ static struct platform_driver zynq_gpio_driver = {
 	.probe = zynq_gpio_probe,
 	.remove = zynq_gpio_remove,
 };
-
-/**
- * zynq_gpio_init - Initial driver registration call
- *
- * Return: value from platform_driver_register
- */
-static int __init zynq_gpio_init(void)
-{
-	return platform_driver_register(&zynq_gpio_driver);
-}
-postcore_initcall(zynq_gpio_init);
+module_platform_driver(zynq_gpio_driver);
 
 MODULE_AUTHOR("Xilinx Inc.");
 MODULE_DESCRIPTION("Zynq GPIO driver");
-- 
1.9.1

