From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: put GPIO IRQs into their own lock class
Date: Tue, 22 Apr 2014 14:43:21 +0200
Message-ID: <1398170601-2621-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:52189 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932152AbaDVMn2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 08:43:28 -0400
Received: by mail-we0-f177.google.com with SMTP id u57so4828227wes.22
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 05:43:27 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

Another feature that is duplicated in a number of GPIO irqchips
is that these cascades IRQs are assigned their own lock class
so as to avoid warnings about lockdep recursions. Do this also
in the generic GPIO irqchip helpers for smooth transition to
this core infrastructure.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c12fe9dfd2db..ee1819fdcf35 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1377,6 +1377,12 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
 
+/*
+ * This lock class tells lockdep that GPIO irqs are in a different
+ * category than their parents, so it won't report false recursion.
+ */
+static struct lock_class_key gpiochip_irq_lock_class;
+
 /**
  * gpiochip_irq_map() - maps an IRQ into a GPIO irqchip
  * @d: the irqdomain used by this irqchip
@@ -1393,6 +1399,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	struct gpio_chip *chip = d->host_data;
 
 	irq_set_chip_data(irq, chip);
+	irq_set_lockdep_class(irq, &gpiochip_irq_lock_class);
 	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
 	/* Chips that can sleep need nested thread handlers */
 	if (chip->can_sleep)
-- 
1.9.0

