From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v4 4/6] pinctrl: baytrail: Update irq chip operations
Date: Fri,  1 Apr 2016 14:00:05 +0300
Message-ID: <1459508407-22011-5-git-send-email-cristina.ciocan@intel.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:12256 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759105AbcDAK5A (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 1 Apr 2016 06:57:00 -0400
In-Reply-To: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>

This patch updates the irq chip implementation in order to interact with
the pin control chip model: the chip contains reference to SOC data and
pin/group/community information is retrieved through the SOC reference.

Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 97 +++++++++++++++++---------------
 1 file changed, 51 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index a24b51e..f7c752b 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1120,41 +1120,6 @@ static int byt_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	return 0;
 }
 
-static int byt_irq_type(struct irq_data *d, unsigned type)
-{
-	struct byt_gpio *vg = gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	u32 offset = irqd_to_hwirq(d);
-	u32 value;
-	unsigned long flags;
-	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
-
-	if (offset >= vg->chip.ngpio)
-		return -EINVAL;
-
-	raw_spin_lock_irqsave(&vg->lock, flags);
-	value = readl(reg);
-
-	WARN(value & BYT_DIRECT_IRQ_EN,
-	     "Bad pad config for io mode, force direct_irq_en bit clearing");
-
-	/* For level trigges the BYT_TRIG_POS and BYT_TRIG_NEG bits
-	 * are used to indicate high and low level triggering
-	 */
-	value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS | BYT_TRIG_NEG |
-		   BYT_TRIG_LVL);
-
-	writel(value, reg);
-
-	if (type & IRQ_TYPE_EDGE_BOTH)
-		irq_set_handler_locked(d, handle_edge_irq);
-	else if (type & IRQ_TYPE_LEVEL_MASK)
-		irq_set_handler_locked(d, handle_level_irq);
-
-	raw_spin_unlock_irqrestore(&vg->lock, flags);
-
-	return 0;
-}
-
 static void byt_get_pull_strength(u32 reg, u16 *strength)
 {
 	switch (reg & BYT_PULL_STR_MASK) {
@@ -1565,12 +1530,23 @@ static void byt_irq_ack(struct irq_data *d)
 	unsigned offset = irqd_to_hwirq(d);
 	void __iomem *reg;
 
-	raw_spin_lock(&vg->lock);
 	reg = byt_gpio_reg(vg, offset, BYT_INT_STAT_REG);
+	if (!reg)
+		return;
+
+	raw_spin_lock(&vg->lock);
 	writel(BIT(offset % 32), reg);
 	raw_spin_unlock(&vg->lock);
 }
 
+static void byt_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct byt_gpio *vg = gpiochip_get_data(gc);
+
+	byt_gpio_clear_triggering(vg, irqd_to_hwirq(d));
+}
+
 static void byt_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -1581,6 +1557,8 @@ static void byt_irq_unmask(struct irq_data *d)
 	u32 value;
 
 	reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
+	if (!reg)
+		return;
 
 	raw_spin_lock_irqsave(&vg->lock, flags);
 	value = readl(reg);
@@ -1606,21 +1584,48 @@ static void byt_irq_unmask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&vg->lock, flags);
 }
 
-static void byt_irq_mask(struct irq_data *d)
+static int byt_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct byt_gpio *vg = gpiochip_get_data(gc);
+	struct byt_gpio *vg = gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	u32 offset = irqd_to_hwirq(d);
+	u32 value;
+	unsigned long flags;
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 
-	byt_gpio_clear_triggering(vg, irqd_to_hwirq(d));
+	if (!reg || offset >= vg->chip.ngpio)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
+	value = readl(reg);
+
+	WARN(value & BYT_DIRECT_IRQ_EN,
+	     "Bad pad config for io mode, force direct_irq_en bit clearing");
+
+	/* For level trigges the BYT_TRIG_POS and BYT_TRIG_NEG bits
+	 * are used to indicate high and low level triggering
+	 */
+	value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS | BYT_TRIG_NEG |
+		   BYT_TRIG_LVL);
+
+	writel(value, reg);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
+
+	return 0;
 }
 
 static struct irq_chip byt_irqchip = {
-	.name = "BYT-GPIO",
-	.irq_ack = byt_irq_ack,
-	.irq_mask = byt_irq_mask,
-	.irq_unmask = byt_irq_unmask,
-	.irq_set_type = byt_irq_type,
-	.flags = IRQCHIP_SKIP_SET_WAKE,
+	.name		= "BYT-GPIO",
+	.irq_ack	= byt_irq_ack,
+	.irq_mask	= byt_irq_mask,
+	.irq_unmask	= byt_irq_unmask,
+	.irq_set_type	= byt_irq_type,
+	.flags		= IRQCHIP_SKIP_SET_WAKE,
 };
 
 static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
-- 
1.9.1

