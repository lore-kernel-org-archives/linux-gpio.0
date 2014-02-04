From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: clps711x: Add module alias to support module auto
 loading
Date: Tue, 04 Feb 2014 17:39:15 +0800
Message-ID: <1391506755.21056.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:45369 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374AbaBDJjW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2014 04:39:22 -0500
Received: by mail-pd0-f170.google.com with SMTP id p10so8019249pdj.29
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2014 01:39:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, linux-gpio@vger.kernel.org

commit 55fe14ab872a "GPIO: clps711x: Rewrite driver for using generic GPIO code"
allows this driver to be built as a module.
Thus add module alias to support module auto loading.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-clps711x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index d355027..3c2ba2ad 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -97,3 +97,4 @@ module_platform_driver(clps711x_gpio_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
 MODULE_DESCRIPTION("CLPS711X GPIO driver");
+MODULE_ALIAS("platform:clps711x-gpio");
-- 
1.8.1.2



