From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: set parent irq on chained handlers
Date: Fri, 26 Sep 2014 13:52:29 +0200
Message-ID: <1411732349-19178-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:35922 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753851AbaIZLwg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 07:52:36 -0400
Received: by mail-wg0-f45.google.com with SMTP id x13so8886189wgg.28
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2014 04:52:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

If the IRQ from the parent is nested the IRQ may need to be
resent under certain conditions. Currently the chained IRQ
handler in gpiolib does not handle connecting nested IRQs
but it is conceptually correct to indicate the actual parent
IRQ.

Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 550e575c6ffb..9362b5b817af 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -398,17 +398,30 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 				  int parent_irq,
 				  irq_flow_handler_t parent_handler)
 {
+	unsigned int offset;
+
 	if (gpiochip->can_sleep) {
 		chip_err(gpiochip, "you cannot have chained interrupts on a chip that may sleep\n");
 		return;
 	}
+	if (!gpiochip->irqdomain) {
+		chip_err(gpiochip, "called %s before setting up irqchip\n",
+			 __func__);
+		return;
+	}
 
 	irq_set_chained_handler(parent_irq, parent_handler);
+
 	/*
 	 * The parent irqchip is already using the chip_data for this
 	 * irqchip, so our callbacks simply use the handler_data.
 	 */
 	irq_set_handler_data(parent_irq, gpiochip);
+
+	/* Set the parent IRQ for all affected IRQs */
+	for (offset = 0; offset < gpiochip->ngpio; offset++)
+		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
+			       parent_irq);
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
 
-- 
1.9.3

