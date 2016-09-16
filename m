From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/3] gpiolib: Make it possible to exclude GPIOs from IRQ domain
Date: Fri, 16 Sep 2016 13:52:41 +0300
Message-ID: <20160916105243.93933-2-mika.westerberg@linux.intel.com>
References: <20160916105243.93933-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:64628 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1764885AbcIPKxS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Sep 2016 06:53:18 -0400
In-Reply-To: <20160916105243.93933-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When using GPIO irqchip helpers to setup irqchip for a gpiolib based
driver, it is not possible to select which GPIOs to add to the IRQ domain.
Instead it just adds all GPIOs which is not always desired. For example
there might be GPIOs that for some reason cannot generated normal
interrupts at all.

To support this we add a new function gpiochip_irqchip_exclude_irq() that
can be used to exclude selected GPIOs from being added to the IRQ domain of
the gpiochip in question.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Thomas, instead of adding flag to struct gpio_chip, I decided to provide an
API function that drivers can call. It allocates irq_valid_mask on the fly.

Let me know if you prefer a flag instead.

 Documentation/gpio/driver.txt |  5 +++
 drivers/gpio/gpiolib.c        | 72 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/gpio/driver.h   |  5 +++
 3 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 6cb35a78eff4..d12b2ca6fa8e 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -256,6 +256,11 @@ associated irqdomain and resource allocation callbacks, the gpiolib has
 some helpers that can be enabled by selecting the GPIOLIB_IRQCHIP Kconfig
 symbol:
 
+* gpiochip_irqchip_exclude_irq(): excludes given GPIO from IRQ domain
+  created for the gpiochip. This is useful if the GPIO for some reason
+  cannot be used as IRQ at all. Note this must be called before
+  gpiochip_irqchip_add().
+
 * gpiochip_irqchip_add(): adds an irqchip to a gpiochip. It will pass
   the struct gpio_chip* for the chip to all IRQ callbacks, so the callbacks
   need to embed the gpio_chip in its state container and obtain a pointer
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 53ff25ac66d8..31e18dde0ff7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1402,6 +1402,58 @@ static struct gpio_chip *find_chip_by_name(const char *name)
  */
 
 /**
+ * gpiochip_irqchip_exclude_irq() - Exclude a GPIO from IRQ domain of gpiochip
+ * @gpiochip: the gpiochip whose IRQ to exclude
+ * @offset: GPIO number to exclude
+ *
+ * Normally all GPIOs in a gpiochip are added to the IRQ domain created for
+ * that chip. Calling this function allows driver to exclude certain GPIOs
+ * if for instance the GPIO simply cannot generate interrupts.
+ *
+ * This must be called before gpiochip_irqchip_add().
+ *
+ * Return: %0 in case of success, negative errno in case of error.
+ */
+int gpiochip_irqchip_exclude_irq(struct gpio_chip *gpiochip,
+				 unsigned int offset)
+{
+	if (WARN_ON_ONCE(gpiochip->irqdomain))
+		return -EINVAL;
+
+	if (offset >= gpiochip->ngpio)
+		return -EINVAL;
+
+	if (!gpiochip->irq_valid_mask) {
+		unsigned long *mask;
+		int i;
+
+		mask = kcalloc(BITS_TO_LONGS(gpiochip->ngpio), sizeof(long),
+			       GFP_KERNEL);
+		if (!mask)
+			return -ENOMEM;
+
+		/* Assume by default all GPIOs are valid */
+		for (i = 0; i < gpiochip->ngpio; i++)
+			set_bit(i, mask);
+
+		gpiochip->irq_valid_mask = mask;
+	}
+
+	clear_bit(offset, gpiochip->irq_valid_mask);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gpiochip_irqchip_exclude_irq);
+
+static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
+				       unsigned int offset)
+{
+	/* No mask means all valid */
+	if (!gpiochip->irq_valid_mask)
+		return true;
+	return test_bit(offset, gpiochip->irq_valid_mask);
+}
+
+/**
  * gpiochip_set_chained_irqchip() - sets a chained irqchip to a gpiochip
  * @gpiochip: the gpiochip to set the irqchip chain to
  * @irqchip: the irqchip to chain to the gpiochip
@@ -1442,9 +1494,12 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
-	for (offset = 0; offset < gpiochip->ngpio; offset++)
+	for (offset = 0; offset < gpiochip->ngpio; offset++) {
+		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
+			continue;
 		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
 			       parent_irq);
+	}
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
 
@@ -1551,9 +1606,12 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	/* Remove all IRQ mappings and delete the domain */
 	if (gpiochip->irqdomain) {
-		for (offset = 0; offset < gpiochip->ngpio; offset++)
+		for (offset = 0; offset < gpiochip->ngpio; offset++) {
+			if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
+				continue;
 			irq_dispose_mapping(
 				irq_find_mapping(gpiochip->irqdomain, offset));
+		}
 		irq_domain_remove(gpiochip->irqdomain);
 	}
 
@@ -1562,6 +1620,9 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		gpiochip->irqchip->irq_release_resources = NULL;
 		gpiochip->irqchip = NULL;
 	}
+
+	kfree(gpiochip->irq_valid_mask);
+	gpiochip->irq_valid_mask = NULL;
 }
 
 /**
@@ -1597,6 +1658,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 			  struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
+	bool irq_base_set = false;
 	unsigned int offset;
 	unsigned irq_base = 0;
 
@@ -1646,13 +1708,17 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	 * necessary to allocate descriptors for all IRQs.
 	 */
 	for (offset = 0; offset < gpiochip->ngpio; offset++) {
+		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
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
index 50882e09289b..c8a4f5511b37 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -112,6 +112,8 @@ enum single_ended_mode {
  *	initialization, provided by GPIO driver
  * @irq_parent: GPIO IRQ chip parent/bank linux irq number,
  *	provided by GPIO driver
+ * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
+ *	be included in IRQ domain of the chip
  * @lock_key: per GPIO IRQ chip lockdep class
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
@@ -190,6 +192,7 @@ struct gpio_chip {
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	int			irq_parent;
+	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
 #endif
 
@@ -260,6 +263,8 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
+int gpiochip_irqchip_exclude_irq(struct gpio_chip *gpiochip,
+				 unsigned int offset);
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		int parent_irq,
-- 
2.9.3

