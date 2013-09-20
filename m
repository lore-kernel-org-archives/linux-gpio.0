From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: bcm-kona: only use set_irq_flags() on ARM
Date: Fri, 20 Sep 2013 23:19:38 +0200
Message-ID: <1379711978-10973-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:58984 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752949Ab3ITVTo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 17:19:44 -0400
Received: by mail-ee0-f51.google.com with SMTP id c1so506678eek.24
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 14:19:43 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Markus Mayer <mmayer@broadcom.com>

As per the pattern from other GPIO drivers, use set_irq_flags()
on ARM only, use irq_set_noprobe() on other archs.

Also rename the argument "virq" to just "irq", this IRQ isn't
any more "virtual" than any other Linux IRQ number, we use
"hwirq" for the actual hw-numbers, "virq" is just bogus.

Cc: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Forgot a second place the code was using set_irq_flags()...
---
 drivers/gpio/gpio-bcm-kona.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index f7d932a..c0751a8 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -468,18 +468,22 @@ MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
  */
 static struct lock_class_key gpio_lock_class;
 
-static int bcm_kona_gpio_irq_map(struct irq_domain *d, unsigned int virq,
+static int bcm_kona_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 				 irq_hw_number_t hwirq)
 {
 	int ret;
 
-	ret = irq_set_chip_data(virq, d->host_data);
+	ret = irq_set_chip_data(irq, d->host_data);
 	if (ret < 0)
 		return ret;
-	irq_set_lockdep_class(virq, &gpio_lock_class);
-	irq_set_chip_and_handler(virq, &bcm_gpio_irq_chip, handle_simple_irq);
-	irq_set_nested_thread(virq, 1);
-	set_irq_flags(virq, IRQF_VALID);
+	irq_set_lockdep_class(irq, &gpio_lock_class);
+	irq_set_chip_and_handler(irq, &bcm_gpio_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(irq, 1);
+#ifdef CONFIG_ARM
+	set_irq_flags(irq, IRQF_VALID);
+#else
+	irq_set_noprobe(irq);
+#endif
 
 	return 0;
 }
@@ -598,7 +602,11 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 		irq_set_lockdep_class(irq, &gpio_lock_class);
 		irq_set_chip_and_handler(irq, &bcm_gpio_irq_chip,
 					 handle_simple_irq);
+#ifdef CONFIG_ARM
 		set_irq_flags(irq, IRQF_VALID);
+#else
+		irq_set_noprobe(irq);
+#endif
 	}
 	for (i = 0; i < kona_gpio->num_bank; i++) {
 		bank = &kona_gpio->banks[i];
-- 
1.8.3.1

