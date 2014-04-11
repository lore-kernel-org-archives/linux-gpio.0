From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: rdc321x: Fix off-by-one for ngpio setting
Date: Fri, 11 Apr 2014 14:14:45 +0800
Message-ID: <1397196885.12922.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:58578 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaDKGOv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Apr 2014 02:14:51 -0400
Received: by mail-vc0-f177.google.com with SMTP id if17so4266989vcb.36
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 23:14:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Florian Fainelli <florian@openwrt.org>, linux-gpio@vger.kernel.org

The valid gpio is GPIO0 ~ GPIO58, so ngpio should be RDC321X_MAX_GPIO + 1.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-rdc321x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index 88577c3..9e7da2d 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -176,7 +176,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 	rdc321x_gpio_dev->chip.get = rdc_gpio_get_value;
 	rdc321x_gpio_dev->chip.set = rdc_gpio_set_value;
 	rdc321x_gpio_dev->chip.base = 0;
-	rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios;
+	rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios + 1;
 
 	platform_set_drvdata(pdev, rdc321x_gpio_dev);
 
-- 
1.8.3.2



