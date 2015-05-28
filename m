From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: tb10x: Drop unneeded free_irq() call
Date: Thu, 28 May 2015 17:26:10 +0800
Message-ID: <1432805170.22632.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:34217 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415AbbE1J0P (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2015 05:26:15 -0400
Received: by pdbki1 with SMTP id ki1so37821742pdb.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2015 02:26:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Current code uses devm_request_irq() in .probe, so drop the unneeded
free_irq() call in .remove.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tb10x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 46b8961..12c99d9 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -292,7 +292,6 @@ static int tb10x_gpio_remove(struct platform_device *pdev)
 					BIT(tb10x_gpio->gc.ngpio) - 1, 0, 0);
 		kfree(tb10x_gpio->domain->gc);
 		irq_domain_remove(tb10x_gpio->domain);
-		free_irq(tb10x_gpio->irq, tb10x_gpio);
 	}
 	gpiochip_remove(&tb10x_gpio->gc);
 
-- 
2.1.0



