From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: clps711x: Add missing .owner to struct gpio_chip
Date: Tue, 04 Feb 2014 22:25:27 +0800
Message-ID: <1391523927.21522.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:62780 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaBDOZd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2014 09:25:33 -0500
Received: by mail-pd0-f175.google.com with SMTP id w10so8239992pde.34
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2014 06:25:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, linux-gpio@vger.kernel.org

Add missing .owner of struct gpio_chip. This prevents the
module from being removed from underneath its users.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-clps711x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index 3c2ba2ad..e1e8612 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -65,6 +65,7 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	}
 
 	bgc->gc.base = id * 8;
+	bgc->gc.owner = THIS_MODULE;
 	platform_set_drvdata(pdev, bgc);
 
 	return gpiochip_add(&bgc->gc);
-- 
1.8.1.2



