From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] pinctrl: intel: Add support for multiple GPIO chips sharing the interrupt
Date: Wed, 21 Oct 2015 13:08:43 +0300
Message-ID: <1445422125-72075-2-git-send-email-mika.westerberg@linux.intel.com>
References: <1445422125-72075-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445422125-72075-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Intel Broxton the GPIO hardware consists of several chips that all share
the parent interrupt. It is not possible to handle this by setting chained
handler for each chip (as they will overwrite each other).

To overcome this we need to request the interrupt using devm_request_irq()
and pass IRQF_SHARED with the flags.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 52 +++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 54848b8decef..53e9ababdb95 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -12,6 +12,7 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/acpi.h>
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -803,9 +804,11 @@ static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
-static void intel_gpio_community_irq_handler(struct gpio_chip *gc,
+static irqreturn_t intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 	const struct intel_community *community)
 {
+	struct gpio_chip *gc = &pctrl->chip;
+	irqreturn_t ret = IRQ_NONE;
 	int gpp;
 
 	for (gpp = 0; gpp < community->ngpps; gpp++) {
@@ -832,24 +835,28 @@ static void intel_gpio_community_irq_handler(struct gpio_chip *gc,
 			irq = irq_find_mapping(gc->irqdomain,
 					       community->pin_base + padno);
 			generic_handle_irq(irq);
+
+			ret |= IRQ_HANDLED;
 		}
 	}
+
+	return ret;
 }
 
-static void intel_gpio_irq_handler(struct irq_desc *desc)
+static irqreturn_t intel_gpio_irq(int irq, void *data)
 {
-	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct intel_community *community;
+	struct intel_pinctrl *pctrl = data;
+	irqreturn_t ret = IRQ_NONE;
 	int i;
 
-	chained_irq_enter(chip, desc);
-
 	/* Need to check all communities for pending interrupts */
-	for (i = 0; i < pctrl->ncommunities; i++)
-		intel_gpio_community_irq_handler(gc, &pctrl->communities[i]);
+	for (i = 0; i < pctrl->ncommunities; i++) {
+		community = &pctrl->communities[i];
+		ret |= intel_gpio_community_irq_handler(pctrl, community);
+	}
 
-	chained_irq_exit(chip, desc);
+	return ret;
 }
 
 static struct irq_chip intel_gpio_irqchip = {
@@ -902,21 +909,36 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 				     0, 0, pctrl->soc->npins);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add GPIO pin range\n");
-		gpiochip_remove(&pctrl->chip);
-		return ret;
+		goto fail;
+	}
+
+	/*
+	 * We need to request the interrupt here (instead of providing chip
+	 * to the irq directly) because on some platforms several GPIO
+	 * controllers share the same interrupt line.
+	 */
+	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq, IRQF_SHARED,
+			       dev_name(pctrl->dev), pctrl);
+	if (ret) {
+		dev_err(pctrl->dev, "failed to request interrupt\n");
+		goto fail;
 	}
 
 	ret = gpiochip_irqchip_add(&pctrl->chip, &intel_gpio_irqchip, 0,
 				   handle_simple_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add irqchip\n");
-		gpiochip_remove(&pctrl->chip);
-		return ret;
+		goto fail;
 	}
 
 	gpiochip_set_chained_irqchip(&pctrl->chip, &intel_gpio_irqchip, irq,
-				     intel_gpio_irq_handler);
+				     NULL);
 	return 0;
+
+fail:
+	gpiochip_remove(&pctrl->chip);
+
+	return ret;
 }
 
 static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
-- 
2.6.1
