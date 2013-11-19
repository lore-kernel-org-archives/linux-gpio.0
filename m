From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: ucb1400: Add MODULE_ALIAS
Date: Tue, 19 Nov 2013 15:31:20 +0800
Message-ID: <1384846280.4900.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:57520 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833Ab3KSHb0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 02:31:26 -0500
Received: by mail-pb0-f48.google.com with SMTP id md12so1504719pbc.35
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 23:31:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marex@denx.de>, Jean Delvare <jdelvare@suse.de>, linux-gpio@vger.kernel.org

This driver can be built as a module now.
Add MODULE_ALIAS to support module auto-loading.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-ucb1400.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index 1a605f2..06fb5cf 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -105,3 +105,4 @@ module_platform_driver(ucb1400_gpio_driver);
 
 MODULE_DESCRIPTION("Philips UCB1400 GPIO driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ucb1400_gpio");
-- 
1.8.1.2



