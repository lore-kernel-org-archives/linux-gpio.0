From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/4] pinctrl: baytrail: Rework interrupt handling
Date: Mon, 23 Feb 2015 14:53:12 +0200
Message-ID: <1424695993-43707-4-git-send-email-mika.westerberg@linux.intel.com>
References: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Instead of handling everything in the driver's first level interrupt
handler, we can take advantage of already existing flow handlers that are
provided by the IRQ core.

This changes the functionality a bit also. Previously the driver looped
over pending interrupts in a single loop, restarting the loop if some
interrupt changed state. This caused problem with Lenovo Thinkpad 10
digitizer that it was not able to deassert the interrupt before the driver
disabled the interrupt for good (looplimit was exhausted).

Rework the interrupt handling logic a bit so that we provide proper mask,
ack and unmask operations in terms of Baytrail GPIO hardware and loop over
pending interrupts only once. If the interrupt remains asserted the first
level handler will be re-triggered automatically.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 100 +++++++++++++++++--------------
 1 file changed, 56 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index d264b099182d..2318057a309b 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -252,23 +252,13 @@ static int byt_irq_type(struct irq_data *d, unsigned type)
 	value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS | BYT_TRIG_NEG |
 		   BYT_TRIG_LVL);
 
-	switch (type) {
-	case IRQ_TYPE_LEVEL_HIGH:
-		value |= BYT_TRIG_LVL;
-	case IRQ_TYPE_EDGE_RISING:
-		value |= BYT_TRIG_POS;
-		break;
-	case IRQ_TYPE_LEVEL_LOW:
-		value |= BYT_TRIG_LVL;
-	case IRQ_TYPE_EDGE_FALLING:
-		value |= BYT_TRIG_NEG;
-		break;
-	case IRQ_TYPE_EDGE_BOTH:
-		value |= (BYT_TRIG_NEG | BYT_TRIG_POS);
-		break;
-	}
 	writel(value, reg);
 
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		__irq_set_handler_locked(d->irq, handle_edge_irq);
+	else if (type & IRQ_TYPE_LEVEL_MASK)
+		__irq_set_handler_locked(d->irq, handle_level_irq);
+
 	spin_unlock_irqrestore(&vg->lock, flags);
 
 	return 0;
@@ -426,58 +416,80 @@ static void byt_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	struct byt_gpio *vg = to_byt_gpio(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
-	u32 base, pin, mask;
+	u32 base, pin;
 	void __iomem *reg;
-	u32 pending;
+	unsigned long pending;
 	unsigned virq;
-	int looplimit = 0;
 
 	/* check from GPIO controller which pin triggered the interrupt */
 	for (base = 0; base < vg->chip.ngpio; base += 32) {
-
 		reg = byt_gpio_reg(&vg->chip, base, BYT_INT_STAT_REG);
-
-		while ((pending = readl(reg))) {
-			pin = __ffs(pending);
-			mask = BIT(pin);
-			/* Clear before handling so we can't lose an edge */
-			writel(mask, reg);
-
+		pending = readl(reg);
+		for_each_set_bit(pin, &pending, 32) {
 			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
 			generic_handle_irq(virq);
-
-			/* In case bios or user sets triggering incorretly a pin
-			 * might remain in "interrupt triggered" state.
-			 */
-			if (looplimit++ > 32) {
-				dev_err(&vg->pdev->dev,
-					"Gpio %d interrupt flood, disabling\n",
-					base + pin);
-
-				reg = byt_gpio_reg(&vg->chip, base + pin,
-						   BYT_CONF0_REG);
-				mask = readl(reg);
-				mask &= ~(BYT_TRIG_NEG | BYT_TRIG_POS |
-					  BYT_TRIG_LVL);
-				writel(mask, reg);
-				mask = readl(reg); /* flush */
-				break;
-			}
 		}
 	}
 	chip->irq_eoi(data);
 }
 
+static void byt_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct byt_gpio *vg = to_byt_gpio(gc);
+	unsigned offset = irqd_to_hwirq(d);
+	void __iomem *reg;
+
+	reg = byt_gpio_reg(&vg->chip, offset, BYT_INT_STAT_REG);
+	writel(BIT(offset % 32), reg);
+}
+
 static void byt_irq_unmask(struct irq_data *d)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct byt_gpio *vg = to_byt_gpio(gc);
+	unsigned offset = irqd_to_hwirq(d);
+	unsigned long flags;
+	void __iomem *reg;
+	u32 value;
+
+	spin_lock_irqsave(&vg->lock, flags);
+
+	reg = byt_gpio_reg(&vg->chip, offset, BYT_CONF0_REG);
+	value = readl(reg);
+
+	switch (irqd_get_trigger_type(d)) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= BYT_TRIG_LVL;
+	case IRQ_TYPE_EDGE_RISING:
+		value |= BYT_TRIG_POS;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		value |= BYT_TRIG_LVL;
+	case IRQ_TYPE_EDGE_FALLING:
+		value |= BYT_TRIG_NEG;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		value |= (BYT_TRIG_NEG | BYT_TRIG_POS);
+		break;
+	}
+
+	writel(value, reg);
+
+	spin_unlock_irqrestore(&vg->lock, flags);
 }
 
 static void byt_irq_mask(struct irq_data *d)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct byt_gpio *vg = to_byt_gpio(gc);
+
+	byt_gpio_clear_triggering(vg, irqd_to_hwirq(d));
 }
 
 static struct irq_chip byt_irqchip = {
 	.name = "BYT-GPIO",
+	.irq_ack = byt_irq_ack,
 	.irq_mask = byt_irq_mask,
 	.irq_unmask = byt_irq_unmask,
 	.irq_set_type = byt_irq_type,
-- 
2.1.4
