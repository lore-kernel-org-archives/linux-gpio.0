From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: moxart: Drop redundant code to set already
 initialized gpio_chip fields
Date: Fri, 26 Feb 2016 15:59:57 +0800
Message-ID: <1456473597.24027.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:33599 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753470AbcBZIAC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 03:00:02 -0500
Received: by mail-pf0-f179.google.com with SMTP id q63so48014003pfb.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2016 00:00:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

These fields are initialized by bgpio_init() with exactly the same settings
so remove the redundant code.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-moxart.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index ca60453..f7cf593 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -57,10 +57,7 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 	gc->label = "moxart-gpio";
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
-	gc->bgpio_data = gc->read_reg(gc->reg_set);
 	gc->base = 0;
-	gc->ngpio = 32;
-	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
 	ret = gpiochip_add_data(gc, NULL);
-- 
2.1.4



