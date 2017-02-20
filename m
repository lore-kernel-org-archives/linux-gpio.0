From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 1/1] gpio: altera: Use handle_level_irq when configured as a level_high
Date: Mon, 20 Feb 2017 09:41:45 +0800
Message-ID: <1487554905-24714-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:35860 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751897AbdBTBm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Feb 2017 20:42:28 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: thloh@altera.com, linus.walleij@linaro.org, gnurou@gmail.com, preid@electromag.com.au, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com

When a threaded irq handler is chained attached to one of the gpio
pins when configure for level irq the altera_gpio_irq_leveL_high_handler
does not mask the interrupt while being handled by the chained irq.
This resulting in the threaded irq not getting enough cycles to complete
quickly enough before the irq was disabled as faulty. handle_level_irq
should be used in this situation instead of handle_simple_irq.

In gpiochip_irqchip_add set default handler to handle_bad_irq as
per Documentation/gpio/driver.txt. Then set the correct handler in
the set_type callback.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---

Notes:
    Change from v1:
    - As per hint from Andy.
      Set handler to handle_bad_irq in gpiochip_irqchip_add
      This is inline with documentation but not what most gpio drivers do.
      So I'm guessing this is now the correct way to do things.

 drivers/gpio/gpio-altera.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 5bddbd5..3fe6a21 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -90,21 +90,18 @@ static int altera_gpio_irq_set_type(struct irq_data *d,
 
 	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 
-	if (type == IRQ_TYPE_NONE)
+	if (type == IRQ_TYPE_NONE) {
+		irq_set_handler_locked(d, handle_bad_irq);
 		return 0;
-	if (type == IRQ_TYPE_LEVEL_HIGH &&
-		altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)
-		return 0;
-	if (type == IRQ_TYPE_EDGE_RISING &&
-		altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_RISING)
-		return 0;
-	if (type == IRQ_TYPE_EDGE_FALLING &&
-		altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_FALLING)
-		return 0;
-	if (type == IRQ_TYPE_EDGE_BOTH &&
-		altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_BOTH)
+	}
+	if (type == altera_gc->interrupt_trigger) {
+		if (type == IRQ_TYPE_LEVEL_HIGH)
+			irq_set_handler_locked(d, handle_level_irq);
+		else
+			irq_set_handler_locked(d, handle_simple_irq);
 		return 0;
-
+	}
+	irq_set_handler_locked(d, handle_bad_irq);
 	return -EINVAL;
 }
 
@@ -230,7 +227,6 @@ static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-
 static void altera_gpio_irq_leveL_high_handler(struct irq_desc *desc)
 {
 	struct altera_gpio_chip *altera_gc;
@@ -310,7 +306,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->interrupt_trigger = reg;
 
 	ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
-		handle_simple_irq, IRQ_TYPE_NONE);
+		handle_bad_irq, IRQ_TYPE_NONE);
 
 	if (ret) {
 		dev_err(&pdev->dev, "could not add irqchip\n");
-- 
1.8.3.1

