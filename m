From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: lynxpoint: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:34:20 +0200
Message-ID: <1381512860-7129-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:40545 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752228Ab3JKRe3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:34:29 -0400
Received: by mail-wi0-f176.google.com with SMTP id l12so1235379wiv.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:34:28 -0700 (PDT)
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
 drivers/gpio/gpio-lynxpoint.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 2d9ca60..8e5d7ce 100644
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
-- 
1.8.3.1

