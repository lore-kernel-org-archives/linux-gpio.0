From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: set data first, then chip and handler
Date: Wed,  9 Apr 2014 13:43:44 +0200
Message-ID: <1397043824-17518-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35960 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932748AbaDILnv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Apr 2014 07:43:51 -0400
Received: by mail-wi0-f170.google.com with SMTP id bs8so9361294wib.5
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2014 04:43:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

During irq mapping, in irq_set_chip_and_handler() the process
of setting this up may incur calls to lock the irqchip, which
in turn may need to dereference and use the chip data. So set
the data first, then set the chip and handler.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 761013f8b82f..f48817d97480 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1387,8 +1387,8 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct gpio_chip *chip = d->host_data;
 
-	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
 	irq_set_chip_data(irq, chip);
+	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
 #ifdef CONFIG_ARM
 	set_irq_flags(irq, IRQF_VALID);
 #else
-- 
1.9.0

