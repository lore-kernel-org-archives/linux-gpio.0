From: <grygorii.strashko@linaro.org>
Subject: [PATCH 1/2] gpio: omap: irq_shutdown: remove unnecessary call of gpiochip_unlock_as_irq
Date: Fri,  6 Mar 2015 21:26:56 +0200
Message-ID: <1425670017-19598-1-git-send-email-grygorii.strashko@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:32856 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755684AbbCFT1I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 14:27:08 -0500
Received: by lbdu14 with SMTP id u14so38559478lbd.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 11:27:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, ssantosh@kernel.org, Javier Martinez Canillas <javier@dowhile0.org>, tony@atomide.com
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>

From: Grygorii Strashko <grygorii.strashko@linaro.org>

GPIOLib core implemnts irqchip->irq_request/release_resources callbacks
internally and these callbacks already contain clalls of
gpiochip_lock/unlock_as_irq().

Hence, remove unnecessary call of gpiochip_unlock_as_irq() from
omap_gpio_irq_shutdown().

Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
---
 drivers/gpio/gpio-omap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index f476ae2..2b2fc4b 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -826,7 +826,6 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 	unsigned offset = GPIO_INDEX(bank, gpio);
 
 	spin_lock_irqsave(&bank->lock, flags);
-	gpiochip_unlock_as_irq(&bank->chip, offset);
 	bank->irq_usage &= ~(BIT(offset));
 	omap_disable_gpio_module(bank, offset);
 	omap_reset_gpio(bank, gpio);
-- 
1.9.1

