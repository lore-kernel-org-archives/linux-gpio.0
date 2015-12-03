From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-idio-16: Clear pending interrupt in IRQ handler
Date: Wed, 2 Dec 2015 20:23:04 -0500
Message-ID: <20151203012303.GA13986@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f182.google.com ([209.85.160.182]:34182 "EHLO
	mail-yk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757963AbbLCBXR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2015 20:23:17 -0500
Received: by ykfs79 with SMTP id s79so69618121ykf.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Dec 2015 17:23:16 -0800 (PST)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org

The ACCES 104-IDIO-16 uses a single interrupt to indicate a possible
change-of-state in any of the digital input lines. As such, only a
single write to the device's "Clear Interrupt" register is necessary to
acknowledge the IRQ for all respective GPIO.

This patch moves the "Clear Interrupt" register write operation from the
irq_ack callback to the IRQ handler function, wherefore each interrupt
may be cleared respectively by executing a single outb call at the end
of the idio_16_irq_handler function, rather than multiple redundant outb
calls as a result of the generic_handle_irq call for each masked GPIO.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index efe3ff7..91c8b5b 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -117,15 +117,6 @@ static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static void idio_16_irq_ack(struct irq_data *data)
 {
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
-	unsigned long flags;
-
-	spin_lock_irqsave(&idio16gpio->lock, flags);
-
-	outb(0, idio16gpio->base + 1);
-
-	spin_unlock_irqrestore(&idio16gpio->lock, flags);
 }
 
 static void idio_16_irq_mask(struct irq_data *data)
@@ -159,7 +150,6 @@ static void idio_16_irq_unmask(struct irq_data *data)
 	if (!prev_irq_mask) {
 		spin_lock_irqsave(&idio16gpio->lock, flags);
 
-		outb(0, idio16gpio->base + 1);
 		inb(idio16gpio->base + 2);
 
 		spin_unlock_irqrestore(&idio16gpio->lock, flags);
@@ -193,6 +183,12 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 	for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
 		generic_handle_irq(irq_find_mapping(chip->irqdomain, gpio));
 
+	spin_lock(&idio16gpio->lock);
+
+	outb(0, idio16gpio->base + 1);
+
+	spin_unlock(&idio16gpio->lock);
+
 	return IRQ_HANDLED;
 }
 
@@ -244,6 +240,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 
 	/* Disable IRQ by default */
 	outb(0, base + 2);
+	outb(0, base + 1);
 
 	err = gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
 		handle_edge_irq, IRQ_TYPE_NONE);
-- 
2.4.10

