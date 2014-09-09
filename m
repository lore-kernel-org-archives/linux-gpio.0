From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 01/26] gpio: em: use platform based module init
Date: Tue, 9 Sep 2014 15:59:26 +0530
Message-ID: <1410258591-28248-2-git-send-email-kamlakant.patel@linaro.org>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:10155 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932389AbaIIK3s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:29:48 -0400
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
 drivers/gpio/gpio-em.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index fe49ec3..c8df9b4 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -431,18 +431,7 @@ static struct platform_driver em_gio_device_driver = {
 		.owner		= THIS_MODULE,
 	}
 };
-
-static int __init em_gio_init(void)
-{
-	return platform_driver_register(&em_gio_device_driver);
-}
-postcore_initcall(em_gio_init);
-
-static void __exit em_gio_exit(void)
-{
-	platform_driver_unregister(&em_gio_device_driver);
-}
-module_exit(em_gio_exit);
+module_platform_driver(em_gio_device_driver);
 
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("Renesas Emma Mobile GIO Driver");
-- 
1.9.1

