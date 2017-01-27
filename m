From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] gpiolib: Fix a WARN_ON that can never trigger
Date: Fri, 27 Jan 2017 12:56:42 +0100
Message-ID: <20170127115642.19174-1-christophe.jaillet@wanadoo.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:27205 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934735AbdA0L5o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2017 06:57:44 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

"if (!x) WARN_ON(x)" can never trigger.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59d3d960ccd4..1e8bda36b73e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1422,8 +1422,7 @@ void devm_gpiochip_remove(struct device *dev, struct gpio_chip *chip)
 
 	ret = devres_release(dev, devm_gpio_chip_release,
 			     devm_gpio_chip_match, chip);
-	if (!ret)
-		WARN_ON(ret);
+	WARN_ON(ret);
 }
 EXPORT_SYMBOL_GPL(devm_gpiochip_remove);
 
-- 
2.9.3

