From: Daniel Axtens <dja@axtens.net>
Subject: [PATCH] gpio: ath79: add MODULE_LICENSE
Date: Fri,  1 Dec 2017 12:44:58 +1100
Message-ID: <20171201014458.8809-1-dja@axtens.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:37508 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751217AbdLABpZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 20:45:25 -0500
Received: by mail-pl0-f65.google.com with SMTP id v41so5358586plg.4
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 17:45:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: albeu@free.fr, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: trivial@kernel.org, Daniel Axtens <dja@axtens.net>

This fixes the following warning on an allmodconf build:
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ath79.o

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 drivers/gpio/gpio-ath79.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 5fad89dfab7e..f97c32b873b9 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -324,3 +324,5 @@ static struct platform_driver ath79_gpio_driver = {
 };
 
 module_platform_driver(ath79_gpio_driver);
+
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

