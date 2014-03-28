From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: unmap gpio irqs properly
Date: Fri, 28 Mar 2014 20:44:18 +0100
Message-ID: <1396035858-23758-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:58478 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752003AbaC1ToX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Mar 2014 15:44:23 -0400
Received: by mail-wi0-f169.google.com with SMTP id hm4so1097008wib.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2014 12:44:22 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

When using the irqchip helper inside the gpiolib, make sure
the IRQs are unmapped/disposed before the irqdomain is removed
as part of removing the gpiochip.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 33 +++++++++++++++++++++++++++++----
 include/linux/gpio/driver.h |  1 +
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f41cb4f3d715..761013f8b82f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1399,8 +1399,18 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	return 0;
 }
 
+static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
+{
+#ifdef CONFIG_ARM
+	set_irq_flags(irq, 0);
+#endif
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
+	.unmap	= gpiochip_irq_unmap,
 	/* Virtually all GPIO irqchips are twocell:ed */
 	.xlate	= irq_domain_xlate_twocell,
 };
@@ -1438,8 +1448,14 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
  */
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 {
-	if (gpiochip->irqdomain)
+	unsigned int offset;
+
+	/* Remove all IRQ mappings and delete the domain */
+	if (gpiochip->irqdomain) {
+		for (offset = 0; offset < gpiochip->ngpio; offset++)
+			irq_dispose_mapping(gpiochip->irq_base + offset);
 		irq_domain_remove(gpiochip->irqdomain);
+	}
 
 	if (gpiochip->irqchip) {
 		gpiochip->irqchip->irq_request_resources = NULL;
@@ -1467,7 +1483,8 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
  * translation. The gpiochip will need to be initialized and registered
  * before calling this function.
  *
- * This function will handle two cell:ed simple IRQs. Everything else
+ * This function will handle two cell:ed simple IRQs and assumes all
+ * the pins on the gpiochip can generate a unique IRQ. Everything else
  * need to be open coded.
  */
 int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
@@ -1478,6 +1495,7 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 {
 	struct device_node *of_node;
 	unsigned int offset;
+	unsigned irq_base = 0;
 
 	if (!gpiochip || !irqchip)
 		return -EINVAL;
@@ -1514,8 +1532,15 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	 * any gpiochip calls. If the first_irq was zero, this is
 	 * necessary to allocate descriptors for all IRQs.
 	 */
-	for (offset = 0; offset < gpiochip->ngpio; offset++)
-		irq_create_mapping(gpiochip->irqdomain, offset);
+	for (offset = 0; offset < gpiochip->ngpio; offset++) {
+		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
+		if (offset == 0)
+			/*
+			 * Store the base into the gpiochip to be used when
+			 * unmapping the irqs.
+			 */
+			gpiochip->irq_base = irq_base;
+	}
 
 	return 0;
 }
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c1c5c2368fc8..1827b43966d9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -107,6 +107,7 @@ struct gpio_chip {
 	 */
 	struct irq_chip		*irqchip;
 	struct irq_domain	*irqdomain;
+	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 #endif
-- 
1.8.5.3

