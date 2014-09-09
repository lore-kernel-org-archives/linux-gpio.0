From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 08/26] gpio: SPEAr: use platform based module init
Date: Tue, 9 Sep 2014 15:59:33 +0530
Message-ID: <1410258591-28248-9-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:36487 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932400AbaIIKaA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:30:00 -0400
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
 drivers/gpio/gpio-spear-spics.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 353263c..fe27b6d 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -196,12 +196,7 @@ static struct platform_driver spics_gpio_driver = {
 		.of_match_table = spics_gpio_of_match,
 	},
 };
-
-static int __init spics_gpio_init(void)
-{
-	return platform_driver_register(&spics_gpio_driver);
-}
-subsys_initcall(spics_gpio_init);
+module_platform_driver(spics_gpio_driver);
 
 MODULE_AUTHOR("Shiraz Hashim <shiraz.linux.kernel@gmail.com>");
 MODULE_DESCRIPTION("ST Microlectronics SPEAr SPI Chip Select Abstraction");
-- 
1.9.1

