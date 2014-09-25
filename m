From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFC/RFT PATCH 2/2] gpiolib: irqchip: get rid of irq_base
Date: Thu, 25 Sep 2014 19:09:24 +0300
Message-ID: <1411661364-19620-2-git-send-email-grygorii.strashko@ti.com>
References: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:60897 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753636AbaIYQJh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Sep 2014 12:09:37 -0400
In-Reply-To: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Yalin.Wang@sonymobile.com, linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>

Remove irq_base from struct gpio_chip, as it is seems to
be unused.
Aslo, using this field by drivers is unsafe because it's
uncompatible with Sparse IRQ feature.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
Hi Linus,

I've not found users of this field in drivers/gpio/ folder,
so I've decided to created this patch to get more comments.

 drivers/gpio/gpiolib.c      | 9 +--------
 include/linux/gpio/driver.h | 1 -
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f6bf368..8aa84d5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -605,15 +605,8 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	 * any gpiochip calls. If the first_irq was zero, this is
 	 * necessary to allocate descriptors for all IRQs.
 	 */
-	for (offset = 0; offset < gpiochip->ngpio; offset++) {
+	for (offset = 0; offset < gpiochip->ngpio; offset++)
 		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
-		if (offset == 0)
-			/*
-			 * Store the base into the gpiochip to be used when
-			 * unmapping the irqs.
-			 */
-			gpiochip->irq_base = irq_base;
-	}
 
 	acpi_gpiochip_request_interrupts(gpiochip);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e78a237..976276a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -110,7 +110,6 @@ struct gpio_chip {
 	 */
 	struct irq_chip		*irqchip;
 	struct irq_domain	*irqdomain;
-	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 #endif
-- 
1.9.1

