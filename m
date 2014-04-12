From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: kempld: Fix autoloading of module
Date: Sat, 12 Apr 2014 12:45:18 +0800
Message-ID: <1397277918.29335.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:42023 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003AbaDLEpY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Apr 2014 00:45:24 -0400
Received: by mail-vc0-f175.google.com with SMTP id lh14so5473758vcb.20
        for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2014 21:45:23 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Brunner <michael.brunner@kontron.com>, Guenter Roeck <linux@roeck-us.net>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Make the module alias match the platform device name, so gpio-kempld module
should now autoload correctly.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-kempld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index c6d8817..ebe1023 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -216,4 +216,4 @@ module_platform_driver(kempld_gpio_driver);
 MODULE_DESCRIPTION("KEM PLD GPIO Driver");
 MODULE_AUTHOR("Michael Brunner <michael.brunner@kontron.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:gpio-kempld");
+MODULE_ALIAS("platform:kempld-gpio");
-- 
1.8.3.2



