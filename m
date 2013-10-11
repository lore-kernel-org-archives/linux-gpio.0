From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: em: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:23:27 +0200
Message-ID: <1381512207-6651-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:35610 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab3JKRXe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:23:34 -0400
Received: by mail-wg0-f44.google.com with SMTP id n12so3654718wgh.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:23:33 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Ian Molton <ian.molton@codethink.co.uk>, Magnus Damm <damm@opensource.se>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus.

Cc: Ian Molton <ian.molton@codethink.co.uk>
Cc: Magnus Damm <damm@opensource.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-em.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 160d759..ec19036 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -232,16 +232,16 @@ static void em_gio_free(struct gpio_chip *chip, unsigned offset)
 	em_gio_direction_input(chip, offset);
 }
 
-static int em_gio_irq_domain_map(struct irq_domain *h, unsigned int virq,
-				 irq_hw_number_t hw)
+static int em_gio_irq_domain_map(struct irq_domain *h, unsigned int irq,
+				 irq_hw_number_t hwirq)
 {
 	struct em_gio_priv *p = h->host_data;
 
-	pr_debug("gio: map hw irq = %d, virq = %d\n", (int)hw, virq);
+	pr_debug("gio: map hw irq = %d, irq = %d\n", (int)hwirq, irq);
 
-	irq_set_chip_data(virq, h->host_data);
-	irq_set_chip_and_handler(virq, &p->irq_chip, handle_level_irq);
-	set_irq_flags(virq, IRQF_VALID); /* kill me now */
+	irq_set_chip_data(irq, h->host_data);
+	irq_set_chip_and_handler(irq, &p->irq_chip, handle_level_irq);
+	set_irq_flags(irq, IRQF_VALID); /* kill me now */
 	return 0;
 }
 
-- 
1.8.3.1

