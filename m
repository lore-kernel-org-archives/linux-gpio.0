From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 06/26] gpio: mxs: use platform based module init
Date: Tue, 9 Sep 2014 15:59:31 +0530
Message-ID: <1410258591-28248-7-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:10155 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932389AbaIIK34 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:29:56 -0400
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
 drivers/gpio/gpio-mxs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 8ffdd7d..8041445 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -344,12 +344,8 @@ static struct platform_driver mxs_gpio_driver = {
 	.probe		= mxs_gpio_probe,
 	.id_table	= mxs_gpio_ids,
 };
+module_platform_driver(mxs_gpio_driver);
 
-static int __init mxs_gpio_init(void)
-{
-	return platform_driver_register(&mxs_gpio_driver);
-}
-postcore_initcall(mxs_gpio_init);
 
 MODULE_AUTHOR("Freescale Semiconductor, "
 	      "Daniel Mack <danielncaiaq.de>, "
-- 
1.9.1

