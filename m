From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc3589x: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:07:11 +0200
Message-ID: <1381511231-5668-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:37903 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab3JKRHQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:07:16 -0400
Received: by mail-wi0-f170.google.com with SMTP id l12so1496582wiv.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:07:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 4a5de27..ddb5fef 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -96,27 +96,27 @@ static int tc3589x_gpio_direction_input(struct gpio_chip *chip,
 }
 
 /**
- * tc3589x_gpio_irq_get_virq(): Map an interrupt on a chip to a virtual IRQ
+ * tc3589x_gpio_irq_get_irq(): Map a hardware IRQ on a chip to a Linux IRQ
  *
  * @tc3589x_gpio: tc3589x_gpio_irq controller to operate on.
- * @irq: index of the interrupt requested in the chip IRQs
+ * @irq: index of the hardware interrupt requested in the chip IRQs
  *
  * Useful for drivers to request their own IRQs.
  */
-static int tc3589x_gpio_irq_get_virq(struct tc3589x_gpio *tc3589x_gpio,
-				     int irq)
+static int tc3589x_gpio_irq_get_irq(struct tc3589x_gpio *tc3589x_gpio,
+				     int hwirq)
 {
 	if (!tc3589x_gpio)
 		return -EINVAL;
 
-	return irq_create_mapping(tc3589x_gpio->domain, irq);
+	return irq_create_mapping(tc3589x_gpio->domain, hwirq);
 }
 
 static int tc3589x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(chip);
 
-	return tc3589x_gpio_irq_get_virq(tc3589x_gpio, offset);
+	return tc3589x_gpio_irq_get_irq(tc3589x_gpio, offset);
 }
 
 static struct gpio_chip template_chip = {
@@ -242,9 +242,9 @@ static irqreturn_t tc3589x_gpio_irq(int irq, void *dev)
 		while (stat) {
 			int bit = __ffs(stat);
 			int line = i * 8 + bit;
-			int virq = tc3589x_gpio_irq_get_virq(tc3589x_gpio, line);
+			int irq = tc3589x_gpio_irq_get_irq(tc3589x_gpio, line);
 
-			handle_nested_irq(virq);
+			handle_nested_irq(irq);
 			stat &= ~(1 << bit);
 		}
 
@@ -254,31 +254,31 @@ static irqreturn_t tc3589x_gpio_irq(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int tc3589x_gpio_irq_map(struct irq_domain *d, unsigned int virq,
+static int tc3589x_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 				irq_hw_number_t hwirq)
 {
 	struct tc3589x *tc3589x_gpio = d->host_data;
 
-	irq_set_chip_data(virq, tc3589x_gpio);
-	irq_set_chip_and_handler(virq, &tc3589x_gpio_irq_chip,
+	irq_set_chip_data(irq, tc3589x_gpio);
+	irq_set_chip_and_handler(irq, &tc3589x_gpio_irq_chip,
 				handle_simple_irq);
-	irq_set_nested_thread(virq, 1);
+	irq_set_nested_thread(irq, 1);
 #ifdef CONFIG_ARM
-	set_irq_flags(virq, IRQF_VALID);
+	set_irq_flags(irq, IRQF_VALID);
 #else
-	irq_set_noprobe(virq);
+	irq_set_noprobe(irq);
 #endif
 
 	return 0;
 }
 
-static void tc3589x_gpio_irq_unmap(struct irq_domain *d, unsigned int virq)
+static void tc3589x_gpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 #ifdef CONFIG_ARM
-	set_irq_flags(virq, 0);
+	set_irq_flags(irq, 0);
 #endif
-	irq_set_chip_and_handler(virq, NULL, NULL);
-	irq_set_chip_data(virq, NULL);
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
 }
 
 static struct irq_domain_ops tc3589x_irq_ops = {
-- 
1.8.3.1

