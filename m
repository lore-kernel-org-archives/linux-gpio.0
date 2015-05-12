From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] gpiolib: cleanup chained handler and data
Date: Tue, 12 May 2015 20:12:23 +0300
Message-ID: <1431450743-25528-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:34991 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932918AbbELRMg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 13:12:36 -0400
Received: by widdi4 with SMTP id di4so163452346wid.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 10:12:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

Clean up chained handler and handler data if they were set by
gpiochip_set_chained_irqchip().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/gpio/gpiolib.c      | 7 +++++++
 include/linux/gpio/driver.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59eaa23..0f40a7f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -439,6 +439,8 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		 */
 		irq_set_handler_data(parent_irq, gpiochip);
 		irq_set_chained_handler(parent_irq, parent_handler);
+
+		gpiochip->irq_parent = parent_irq;
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
@@ -547,6 +549,11 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
+	if (gpiochip->irq_parent) {
+		irq_set_chained_handler(gpiochip->irq_parent, NULL);
+		irq_set_handler_data(gpiochip->irq_parent, NULL);
+	}
+
 	/* Remove all IRQ mappings and delete the domain */
 	if (gpiochip->irqdomain) {
 		for (offset = 0; offset < gpiochip->ngpio; offset++)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f1b3659..d656577 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -121,6 +121,7 @@ struct gpio_chip {
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
+	int			irq_parent;
 #endif
 
 #if defined(CONFIG_OF_GPIO)
-- 
2.1.4

