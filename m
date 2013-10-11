From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: bcm_kona: rename confusing variables
Date: Fri, 11 Oct 2013 19:18:15 +0200
Message-ID: <1381511895-6401-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:38345 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163Ab3JKRSW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:18:22 -0400
Received: by mail-wg0-f47.google.com with SMTP id f12so4462673wgh.26
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:18:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Markus Mayer <markus.mayer@linaro.org>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus. Rename the
"gpio" variable to "hwirq" to reflect what it is. Rename one
instance of "virq" to "child_irq" that better describes what
it is.

Cc: Markus Mayer <markus.mayer@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index ff5c98e..58188ba 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -428,9 +428,10 @@ static void bcm_kona_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 	while ((sta = readl(reg_base + GPIO_INT_STATUS(bank_id)) &
 		    (~(readl(reg_base + GPIO_INT_MASK(bank_id)))))) {
 		for_each_set_bit(bit, &sta, 32) {
-			int gpio = GPIO_PER_BANK * bank_id + bit;
-			int virq = irq_find_mapping(bank->kona_gpio->irq_domain,
-						    gpio);
+			int hwirq = GPIO_PER_BANK * bank_id + bit;
+			int child_irq =
+				irq_find_mapping(bank->kona_gpio->irq_domain,
+						 hwirq);
 			/*
 			 * Clear interrupt before handler is called so we don't
 			 * miss any interrupt occurred during executing them.
@@ -438,7 +439,7 @@ static void bcm_kona_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 			writel(readl(reg_base + GPIO_INT_STATUS(bank_id)) |
 			       BIT(bit), reg_base + GPIO_INT_STATUS(bank_id));
 			/* Invoke interrupt handler */
-			generic_handle_irq(virq);
+			generic_handle_irq(child_irq);
 		}
 	}
 
@@ -487,10 +488,10 @@ static int bcm_kona_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 	return 0;
 }
 
-static void bcm_kona_gpio_irq_unmap(struct irq_domain *d, unsigned int virq)
+static void bcm_kona_gpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
-	irq_set_chip_and_handler(virq, NULL, NULL);
-	irq_set_chip_data(virq, NULL);
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
 }
 
 static struct irq_domain_ops bcm_kona_irq_ops = {
-- 
1.8.3.1

