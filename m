From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] gpiolib: Add possibility to mask which GPIOs are added to IRQ domain
Date: Thu, 15 Sep 2016 18:52:09 +0300
Message-ID: <20160915155210.94413-1-mika.westerberg@linux.intel.com>
References: <CACRpkdZBbcL87Hq94sFYdDOWnC7S_JGtArTNMimAps663UQNgw@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:10250 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751032AbcIOPwR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Sep 2016 11:52:17 -0400
In-Reply-To: <CACRpkdZBbcL87Hq94sFYdDOWnC7S_JGtArTNMimAps663UQNgw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When using GPIO irqchip helpers to setup irqchip for a gpiolib based
driver, it is not possible to select which GPIOs to add to the IRQ domain.
Instead it just adds all GPIOs which is not always desired. For example
there might be GPIOs that for some reason just cannot be used as interrupts
at all.

To make this possible we add valid_mask to each gpio_chip and by default
assume all GPIOs can be used as interrupts. Drivers can then tune this
using clear_bit() or similar before they call gpiochip_irqchip_add().

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib.c      | 32 +++++++++++++++++++++++++++++---
 include/linux/gpio/driver.h |  1 +
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 53ff25ac66d8..d84c23b47f44 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1186,6 +1186,18 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		if (status)
 			goto err_remove_chip;
 	}
+
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+	chip->valid_mask = kcalloc(BITS_TO_LONGS(chip->ngpio), sizeof(long),
+				   GFP_KERNEL);
+	if (!chip->valid_mask)
+		return -ENOMEM;
+
+	/* All GPIOs are valid interrupt sources by default */
+	for (i = 0; i < chip->ngpio; i++)
+		set_bit(i, chip->valid_mask);
+#endif
+
 	return 0;
 
 err_remove_chip:
@@ -1442,9 +1454,12 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
-	for (offset = 0; offset < gpiochip->ngpio; offset++)
+	for (offset = 0; offset < gpiochip->ngpio; offset++) {
+		if (!test_bit(offset, gpiochip->valid_mask))
+			continue;
 		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
 			       parent_irq);
+	}
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
 
@@ -1551,9 +1566,12 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	/* Remove all IRQ mappings and delete the domain */
 	if (gpiochip->irqdomain) {
-		for (offset = 0; offset < gpiochip->ngpio; offset++)
+		for (offset = 0; offset < gpiochip->ngpio; offset++) {
+			if (!test_bit(offset, gpiochip->valid_mask))
+				continue;
 			irq_dispose_mapping(
 				irq_find_mapping(gpiochip->irqdomain, offset));
+		}
 		irq_domain_remove(gpiochip->irqdomain);
 	}
 
@@ -1562,6 +1580,9 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		gpiochip->irqchip->irq_release_resources = NULL;
 		gpiochip->irqchip = NULL;
 	}
+
+	kfree(gpiochip->valid_mask);
+	gpiochip->valid_mask = NULL;
 }
 
 /**
@@ -1597,6 +1618,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 			  struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
+	bool irq_base_set = false;
 	unsigned int offset;
 	unsigned irq_base = 0;
 
@@ -1646,13 +1668,17 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	 * necessary to allocate descriptors for all IRQs.
 	 */
 	for (offset = 0; offset < gpiochip->ngpio; offset++) {
+		if (!test_bit(offset, gpiochip->valid_mask))
+			continue;
 		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
-		if (offset == 0)
+		if (!irq_base_set) {
 			/*
 			 * Store the base into the gpiochip to be used when
 			 * unmapping the irqs.
 			 */
 			gpiochip->irq_base = irq_base;
+			irq_base_set = true;
+		}
 	}
 
 	acpi_gpiochip_request_interrupts(gpiochip);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 50882e09289b..8a7430230562 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -191,6 +191,7 @@ struct gpio_chip {
 	unsigned int		irq_default_type;
 	int			irq_parent;
 	struct lock_class_key	*lock_key;
+	unsigned long		*valid_mask;
 #endif
 
 #if defined(CONFIG_OF_GPIO)
-- 
2.9.3

