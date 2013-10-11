From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: rcar: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:44:49 +0200
Message-ID: <1381513489-8044-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:33526 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752330Ab3JKRpP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:45:15 -0400
Received: by mail-we0-f172.google.com with SMTP id q58so4527510wes.17
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:45:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus.

Cc: Magnus Damm <damm@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-rcar.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index e3745eb..65dbf87 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -266,16 +266,16 @@ static int gpio_rcar_to_irq(struct gpio_chip *chip, unsigned offset)
 	return irq_create_mapping(gpio_to_priv(chip)->irq_domain, offset);
 }
 
-static int gpio_rcar_irq_domain_map(struct irq_domain *h, unsigned int virq,
-				 irq_hw_number_t hw)
+static int gpio_rcar_irq_domain_map(struct irq_domain *h, unsigned int irq,
+				 irq_hw_number_t hwirq)
 {
 	struct gpio_rcar_priv *p = h->host_data;
 
-	dev_dbg(&p->pdev->dev, "map hw irq = %d, virq = %d\n", (int)hw, virq);
+	dev_dbg(&p->pdev->dev, "map hw irq = %d, irq = %d\n", (int)hwirq, irq);
 
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

