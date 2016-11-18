From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] gpio: etraxfs: use builtin_platform_driver
Date: Fri, 18 Nov 2016 22:12:27 +0800
Message-ID: <aca97aa85827e34e2c8803ca842fe7f44ed5cdaa.1479456696.git.geliangtang@gmail.com>
References: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34567 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752115AbcKROPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2016 09:15:25 -0500
In-Reply-To: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Use builtin_platform_driver() helper to simplify the code.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/gpio/gpio-etraxfs.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index 00b022c..a254d5b 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -471,9 +471,4 @@ static struct platform_driver etraxfs_gpio_driver = {
 	.probe	= etraxfs_gpio_probe,
 };
 
-static int __init etraxfs_gpio_init(void)
-{
-	return platform_driver_register(&etraxfs_gpio_driver);
-}
-
-device_initcall(etraxfs_gpio_init);
+builtin_platform_driver(etraxfs_gpio_driver);
-- 
2.9.3

