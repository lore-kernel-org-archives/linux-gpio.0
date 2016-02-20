From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: ts4800: Drop redundant code to set already
 initialized gpio_chip fields
Date: Sat, 20 Feb 2016 14:22:46 +0800
Message-ID: <1455949366.14139.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36857 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757941AbcBTGWu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2016 01:22:50 -0500
Received: by mail-pa0-f52.google.com with SMTP id yy13so61923478pab.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 22:22:50 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Both chip->base and chip->label are correctly set by bgpio_init().

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-ts4800.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 9da79e4..1478245 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -54,8 +54,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 		return retval;
 	}
 
-	chip->base = -1;
-	chip->label = dev_name(&pdev->dev);
 	chip->ngpio = ngpios;
 
 	platform_set_drvdata(pdev, chip);
-- 
2.1.4



