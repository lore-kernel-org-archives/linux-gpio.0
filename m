From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pl061: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:42:07 +0200
Message-ID: <1381513327-7787-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:39716 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310Ab3JKRmN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:42:13 -0400
Received: by mail-wi0-f176.google.com with SMTP id l12so1241265wiv.9
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:42:12 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Baruch Siach <baruch@tkos.co.il>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus.

Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 4274e2e..f22f7f3 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -238,15 +238,15 @@ static struct irq_chip pl061_irqchip = {
 	.irq_set_type	= pl061_irq_type,
 };
 
-static int pl061_irq_map(struct irq_domain *d, unsigned int virq,
-			 irq_hw_number_t hw)
+static int pl061_irq_map(struct irq_domain *d, unsigned int irq,
+			 irq_hw_number_t hwirq)
 {
 	struct pl061_gpio *chip = d->host_data;
 
-	irq_set_chip_and_handler_name(virq, &pl061_irqchip, handle_simple_irq,
+	irq_set_chip_and_handler_name(irq, &pl061_irqchip, handle_simple_irq,
 				      "pl061");
-	irq_set_chip_data(virq, chip);
-	irq_set_irq_type(virq, IRQ_TYPE_NONE);
+	irq_set_chip_data(irq, chip);
+	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 
 	return 0;
 }
-- 
1.8.3.1

