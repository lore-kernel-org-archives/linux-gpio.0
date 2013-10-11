From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: lynxpoint: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:36:00 +0200
Message-ID: <1381512960-7356-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:40369 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752654Ab3JKRgI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:36:08 -0400
Received: by mail-we0-f177.google.com with SMTP id x55so4398669wes.8
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:36:06 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus. Take this
opportunity to sink a variable into a loop.

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Actually fix all occurences.
---
 drivers/gpio/gpio-lynxpoint.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 2d9ca60..21603e6 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -242,26 +242,27 @@ static int lp_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 	return irq_create_mapping(lg->domain, offset);
 }
 
-static void lp_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
+static void lp_gpio_irq_handler(unsigned hwirq, struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	struct lp_gpio *lg = irq_data_get_irq_handler_data(data);
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
 	u32 base, pin, mask;
 	unsigned long reg, pending;
-	unsigned virq;
 
 	/* check from GPIO controller which pin triggered the interrupt */
 	for (base = 0; base < lg->chip.ngpio; base += 32) {
 		reg = lp_gpio_reg(&lg->chip, base, LP_INT_STAT);
 
 		while ((pending = inl(reg))) {
+			unsigned irq;
+
 			pin = __ffs(pending);
 			mask = BIT(pin);
 			/* Clear before handling so we don't lose an edge */
 			outl(mask, reg);
-			virq = irq_find_mapping(lg->domain, base + pin);
-			generic_handle_irq(virq);
+			irq = irq_find_mapping(lg->domain, base + pin);
+			generic_handle_irq(irq);
 		}
 	}
 	chip->irq_eoi(data);
@@ -324,15 +325,15 @@ static void lp_gpio_irq_init_hw(struct lp_gpio *lg)
 	}
 }
 
-static int lp_gpio_irq_map(struct irq_domain *d, unsigned int virq,
-			    irq_hw_number_t hw)
+static int lp_gpio_irq_map(struct irq_domain *d, unsigned int irq,
+			    irq_hw_number_t hwirq)
 {
 	struct lp_gpio *lg = d->host_data;
 
-	irq_set_chip_and_handler_name(virq, &lp_irqchip, handle_simple_irq,
+	irq_set_chip_and_handler_name(irq, &lp_irqchip, handle_simple_irq,
 				      "demux");
-	irq_set_chip_data(virq, lg);
-	irq_set_irq_type(virq, IRQ_TYPE_NONE);
+	irq_set_chip_data(irq, lg);
+	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 
 	return 0;
 }
-- 
1.8.3.1

