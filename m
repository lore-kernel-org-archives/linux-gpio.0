From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs dynamically
Date: Fri, 21 Jul 2017 11:49:00 -0500
Message-ID: <20170721164900.7070-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Now IRQ mappings are always created for all (allowed) GPIOs in gpiochip in
gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
as result, leads to:
 - increasing of memory consumption for IRQ descriptors most of which will
never ever be used (espessially on platform with a high number of GPIOs).
(sizeof(struct irq_desc) == 256 on my tested platforms)
 - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
GPIO IRQ functionality as IRQ crossbar/router which has only limited
number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
IRQs).

Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
instead replace irq_find_mapping() with irq_create_mapping() in
gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
in gpiochip_to_irq() and gpiochip_irq_map().

After this change gpio2irq mapping will happen the following way when GPIO
irqchip APIs are used by gpio driver:
 - IRQ mappings will be created statically if driver passes first_irq>0
vlaue in gpiochip_irqchip_add_key().
 - IRQ mappings will be created dynamically from gpio_to_irq() or
of_irq_get().

Tested on am335x-evm and dra72-evm-revc.
- dra72-evm-revc: number of created irq mappings decreased from 402 -> 135
  Mem savings 267*256 = 68352 (66kB)
- am335x-evm: number of created irq mappings decreased from 188 -> 63
  Mem savings 125*256 = 32000 (31kB)

[1] https://lkml.org/lkml/2017/6/15/428
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
Changes in v2:
- restored struct gpio_chip->irq_base to fix buld of gpio-mockup.c
Link on v1:
- https://patchwork.kernel.org/patch/9831565/

 drivers/gpio/gpiolib.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9568708..ee6ba07 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1605,6 +1605,9 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct gpio_chip *chip = d->host_data;
 
+	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
+		return -ENXIO;
+
 	irq_set_chip_data(irq, chip);
 	/*
 	 * This lock class tells lockdep that GPIO irqs are in a different
@@ -1671,7 +1674,9 @@ static void gpiochip_irq_relres(struct irq_data *d)
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return irq_find_mapping(chip->irqdomain, offset);
+	if (!gpiochip_irqchip_irq_valid(chip, offset))
+		return -ENXIO;
+	return irq_create_mapping(chip->irqdomain, offset);
 }
 
 /**
@@ -1747,9 +1752,6 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
-	bool irq_base_set = false;
-	unsigned int offset;
-	unsigned irq_base = 0;
 
 	if (!gpiochip || !irqchip)
 		return -EINVAL;
@@ -1806,25 +1808,6 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		irqchip->irq_release_resources = gpiochip_irq_relres;
 	}
 
-	/*
-	 * Prepare the mapping since the irqchip shall be orthogonal to
-	 * any gpiochip calls. If the first_irq was zero, this is
-	 * necessary to allocate descriptors for all IRQs.
-	 */
-	for (offset = 0; offset < gpiochip->ngpio; offset++) {
-		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
-			continue;
-		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
-		if (!irq_base_set) {
-			/*
-			 * Store the base into the gpiochip to be used when
-			 * unmapping the irqs.
-			 */
-			gpiochip->irq_base = irq_base;
-			irq_base_set = true;
-		}
-	}
-
 	acpi_gpiochip_request_interrupts(gpiochip);
 
 	return 0;
-- 
2.10.1
