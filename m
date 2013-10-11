From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: stmpe: drop references to "virtual" IRQ, fix bug
Date: Fri, 11 Oct 2013 19:57:03 +0200
Message-ID: <1381514223-8515-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36889 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753172Ab3JKR5K (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:57:10 -0400
Received: by mail-wi0-f173.google.com with SMTP id hq15so1510072wib.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:57:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Vipul Kumar Samar <vipulkumar.samar@st.com>, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@st.com>, Jean-Nicolas Graux <jean-nicolas.graux@st.com>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus.

When doing this I see that the hwirq argument is used
for mapping rather than the Linux IRQ in the map function.
This doesn't look right. Use the Linux IRQ instead.

Cc: Vipul Kumar Samar <vipulkumar.samar@st.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Gabriel Fernandez <gabriel.fernandez@st.com>
Cc: Jean-Nicolas Graux <jean-nicolas.graux@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I cannot test this patch so I don't know if the mapping change
is correct, however since absolutely every other driver does
it the other way around this doesn't look sound at all. Please
help out with review.
---
 drivers/gpio/gpio-stmpe.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index b33bad1..2647e24 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -254,9 +254,10 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 		while (stat) {
 			int bit = __ffs(stat);
 			int line = bank * 8 + bit;
-			int virq = irq_find_mapping(stmpe_gpio->domain, line);
+			int child_irq = irq_find_mapping(stmpe_gpio->domain,
+							 line);
 
-			handle_nested_irq(virq);
+			handle_nested_irq(child_irq);
 			stat &= ~(1 << bit);
 		}
 
@@ -271,7 +272,7 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int stmpe_gpio_irq_map(struct irq_domain *d, unsigned int virq,
+static int stmpe_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
 	struct stmpe_gpio *stmpe_gpio = d->host_data;
@@ -279,26 +280,26 @@ static int stmpe_gpio_irq_map(struct irq_domain *d, unsigned int virq,
 	if (!stmpe_gpio)
 		return -EINVAL;
 
-	irq_set_chip_data(hwirq, stmpe_gpio);
-	irq_set_chip_and_handler(hwirq, &stmpe_gpio_irq_chip,
+	irq_set_chip_data(irq, stmpe_gpio);
+	irq_set_chip_and_handler(irq, &stmpe_gpio_irq_chip,
 				 handle_simple_irq);
-	irq_set_nested_thread(hwirq, 1);
+	irq_set_nested_thread(irq, 1);
 #ifdef CONFIG_ARM
-	set_irq_flags(hwirq, IRQF_VALID);
+	set_irq_flags(irq, IRQF_VALID);
 #else
-	irq_set_noprobe(hwirq);
+	irq_set_noprobe(irq);
 #endif
 
 	return 0;
 }
 
-static void stmpe_gpio_irq_unmap(struct irq_domain *d, unsigned int virq)
+static void stmpe_gpio_irq_unmap(struct irq_domain *d, unsigned int irq)
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
 
 static const struct irq_domain_ops stmpe_gpio_irq_simple_ops = {
-- 
1.8.3.1

