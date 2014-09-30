From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: staticize xway_stp_init()
Date: Tue, 30 Sep 2014 09:12:00 +0200
Message-ID: <1412061120-20557-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:57633 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbaI3HMG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Sep 2014 03:12:06 -0400
Received: by mail-we0-f175.google.com with SMTP id q59so3238219wes.20
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2014 00:12:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This initcall is only called from the driver itself, staticize it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stp-xway.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 04882a911b65..7e359b7cce1b 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -292,7 +292,7 @@ static struct platform_driver xway_stp_driver = {
 	},
 };
 
-int __init xway_stp_init(void)
+static int __init xway_stp_init(void)
 {
 	return platform_driver_register(&xway_stp_driver);
 }
-- 
1.9.3

