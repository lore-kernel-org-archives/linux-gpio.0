From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/4] gpio: support threaded interrupts in irqchip helpers
Date: Wed,  9 Apr 2014 13:48:40 +0200
Message-ID: <1397044120-19222-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:50499 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932482AbaDILss (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Apr 2014 07:48:48 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so8701384wib.17
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2014 04:48:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

Some off-chip GPIO expanders need to be communicated by I2C or
SPI traffic, but may still support IRQs. By the sleeping nature
of such buses, such IRQ handlers need to be threaded. Support
such handlers in the gpiochip irqchip helpers by flagging IRQs
as threaded if the .can_sleep property of the gpiochip is
true.

Helpfully deny registration of chained IRQ handlers if the
.can_sleep property is set, as such chips will invariably need
a nested handler rather than a chained handler.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 12 ++++++++++++
 include/linux/gpio/driver.h |  5 ++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f48817d97480..5023541fefa0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1363,6 +1363,11 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 				  int parent_irq,
 				  irq_flow_handler_t parent_handler)
 {
+	if (chip->can_sleep) {
+		chip_err(gpiochip, "you cannot have chained interrupts on a chip that may sleep\n");
+		return;
+	}
+
 	irq_set_chained_handler(parent_irq, parent_handler);
 	/*
 	 * The parent irqchip is already using the chip_data for this
@@ -1389,6 +1394,9 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 
 	irq_set_chip_data(irq, chip);
 	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
+	/* Chips that can sleep need nested thread handlers */
+	if (chip->can_sleep)
+		irq_set_nested_thread(irq, 1);
 #ifdef CONFIG_ARM
 	set_irq_flags(irq, IRQF_VALID);
 #else
@@ -1401,9 +1409,13 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 
 static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
+	struct gpio_chip *chip = d->host_data;
+
 #ifdef CONFIG_ARM
 	set_irq_flags(irq, 0);
 #endif
+	if (chip->can_sleep)
+		irq_set_nested_thread(irq, 0);
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
 }
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 1827b43966d9..573e4f3243d0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -51,7 +51,10 @@ struct seq_file;
  *      format specifier for an unsigned int.  It is substituted by the actual
  *      number of the gpio.
  * @can_sleep: flag must be set iff get()/set() methods sleep, as they
- *	must while accessing GPIO expander chips over I2C or SPI
+ *	must while accessing GPIO expander chips over I2C or SPI. This
+ *	implies that if the chip supports IRQs, these IRQs need to be threaded
+ *	as the chip access may sleep when e.g. reading out the IRQ status
+ *	registers.
  * @exported: flags if the gpiochip is exported for use from sysfs. Private.
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
-- 
1.9.0

