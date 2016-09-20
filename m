From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 1/3] gpiolib: Make it possible to exclude GPIOs from IRQ domain
Date: Tue, 20 Sep 2016 15:15:21 +0300
Message-ID: <20160920121523.170293-2-mika.westerberg@linux.intel.com>
References: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:43886 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754506AbcITMQK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Sep 2016 08:16:10 -0400
In-Reply-To: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When using GPIO irqchip helpers to setup irqchip for a gpiolib based
driver, it is not possible to select which GPIOs to add to the IRQ domain.
Instead it just adds all GPIOs which is not always desired. For example
there might be GPIOs that for some reason cannot generated normal
interrupts at all.

To support this we add a flag irq_need_valid_mask to struct gpio_chip. When
this flag is set the core allocates irq_valid_mask that holds one bit for
each GPIO the chip has. By default all bits are set but drivers can
manipulate this using set_bit() and clear_bit() accordingly.

Then when gpiochip_irqchip_add() is called, this mask is checked and all
GPIOs with bit is set are added to the IRQ domain created for the GPIO
chip.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 Documentation/gpio/driver.txt |  6 ++++
 drivers/gpio/gpiolib.c        | 66 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/gpio/driver.h   |  6 ++++
 3 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 6cb35a78eff4..368d5a294d89 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -262,6 +262,12 @@ symbol:
   to the container using container_of().
   (See Documentation/driver-model/design-patterns.txt)
 
+  If there is a need to exclude certain GPIOs from the IRQ domain, one can
+  set .irq_need_valid_mask of the gpiochip before gpiochip_add_data() is
+  called. This allocates .irq_valid_mask with as many bits set as there are
+  GPIOs in the chip. Drivers can exclude GPIOs by clearing bits from this
+  mask. The mask must be filled in before gpiochip_irqchip_add() is called.
+
 * gpiochip_set_chained_irqchip(): sets up a chained irq handler for a
   gpio_chip from a parent IRQ and passes the struct gpio_chip* as handler
   data. (Notice handler data, since the irqchip data is likely used by the
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 53ff25ac66d8..23be4daefeed 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -71,6 +71,8 @@ LIST_HEAD(gpio_devices);
 
 static void gpiochip_free_hogs(struct gpio_chip *chip);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
+static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
+static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
 
 static bool gpiolib_initialized;
 
@@ -1167,6 +1169,10 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (status)
 		goto err_remove_from_list;
 
+	status = gpiochip_irqchip_init_valid_mask(chip);
+	if (status)
+		goto err_remove_from_list;
+
 	status = of_gpiochip_add(chip);
 	if (status)
 		goto err_remove_chip;
@@ -1192,6 +1198,7 @@ err_remove_chip:
 	acpi_gpiochip_remove(chip);
 	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
+	gpiochip_irqchip_free_valid_mask(chip);
 err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&gdev->list);
@@ -1401,6 +1408,40 @@ static struct gpio_chip *find_chip_by_name(const char *name)
  * The following is irqchip helper code for gpiochips.
  */
 
+static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
+{
+	int i;
+
+	if (!gpiochip->irq_need_valid_mask)
+		return 0;
+
+	gpiochip->irq_valid_mask = kcalloc(BITS_TO_LONGS(gpiochip->ngpio),
+					   sizeof(long), GFP_KERNEL);
+	if (!gpiochip->irq_valid_mask)
+		return -ENOMEM;
+
+	/* Assume by default all GPIOs are valid */
+	for (i = 0; i < gpiochip->ngpio; i++)
+		set_bit(i, gpiochip->irq_valid_mask);
+
+	return 0;
+}
+
+static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
+{
+	kfree(gpiochip->irq_valid_mask);
+	gpiochip->irq_valid_mask = NULL;
+}
+
+static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
+				       unsigned int offset)
+{
+	/* No mask means all valid */
+	if (likely(!gpiochip->irq_valid_mask))
+		return true;
+	return test_bit(offset, gpiochip->irq_valid_mask);
+}
+
 /**
  * gpiochip_set_chained_irqchip() - sets a chained irqchip to a gpiochip
  * @gpiochip: the gpiochip to set the irqchip chain to
@@ -1442,9 +1483,12 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
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
 
@@ -1551,9 +1595,12 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
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
 
@@ -1562,6 +1609,8 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		gpiochip->irqchip->irq_release_resources = NULL;
 		gpiochip->irqchip = NULL;
 	}
+
+	gpiochip_irqchip_free_valid_mask(gpiochip);
 }
 
 /**
@@ -1597,6 +1646,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 			  struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
+	bool irq_base_set = false;
 	unsigned int offset;
 	unsigned irq_base = 0;
 
@@ -1646,13 +1696,17 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
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
@@ -1664,6 +1718,12 @@ EXPORT_SYMBOL_GPL(_gpiochip_irqchip_add);
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
+static inline int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
+{
+	return 0;
+}
+static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
+{ }
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 50882e09289b..420b837f2aa7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -112,6 +112,10 @@ enum single_ended_mode {
  *	initialization, provided by GPIO driver
  * @irq_parent: GPIO IRQ chip parent/bank linux irq number,
  *	provided by GPIO driver
+ * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
+ *	bits set to one
+ * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
+ *	be included in IRQ domain of the chip
  * @lock_key: per GPIO IRQ chip lockdep class
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
@@ -190,6 +194,8 @@ struct gpio_chip {
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	int			irq_parent;
+	bool			irq_need_valid_mask;
+	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
 #endif
 
-- 
2.9.3

