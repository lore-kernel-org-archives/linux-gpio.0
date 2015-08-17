From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: baytrail: Use raw_spinlock for locking
Date: Mon, 17 Aug 2015 16:03:17 +0300
Message-ID: <1439816597-60259-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:23164 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751427AbbHQND0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 17 Aug 2015 09:03:26 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The Intel Baytrail pinctrl driver implements irqchip callbacks which are
called with desc->lock raw_spinlock held. In mainline this is fine because
spinlock resolves to raw_spinlock. However, running the same code in -rt we
get:

 BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:917
 in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swapper/0
 Preemption disabled at:[<ffffffff81092e9f>] cpu_startup_entry+0x17f/0x480

 CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.1.5-rt5 #13
  ...
 Call Trace:
  <IRQ>  [<ffffffff816283c6>] dump_stack+0x4a/0x61
  [<ffffffff81077e17>] ___might_sleep+0xe7/0x170
  [<ffffffff8162d6cf>] rt_spin_lock+0x1f/0x50
  [<ffffffff812e3b88>] byt_gpio_clear_triggering+0x38/0x60
  [<ffffffff812e3bc1>] byt_irq_mask+0x11/0x20
  [<ffffffff810a7013>] handle_level_irq+0x83/0x150
  [<ffffffff810a3457>] generic_handle_irq+0x27/0x40
  [<ffffffff812e3a5f>] byt_gpio_irq_handler+0x7f/0xc0
  [<ffffffff810050aa>] handle_irq+0xaa/0x190
  ...

This is because in -rt spinlocks are preemptible so taking the driver
private spinlock in irqchip callbacks causes might_sleep() to trigger.

In order to keep -rt happy but at the same time make sure that register
accesses get serialized, convert the driver to use raw_spinlock instead.

Also shorten the critical section a bit in few places.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 50 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index f80a1bee6981..3e012bb22231 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -141,7 +141,7 @@ struct byt_gpio_pin_context {
 struct byt_gpio {
 	struct gpio_chip		chip;
 	struct platform_device		*pdev;
-	spinlock_t			lock;
+	raw_spinlock_t			lock;
 	void __iomem			*reg_base;
 	struct pinctrl_gpio_range	*range;
 	struct byt_gpio_pin_context	*saved_context;
@@ -169,11 +169,11 @@ static void byt_gpio_clear_triggering(struct byt_gpio *vg, unsigned offset)
 	unsigned long flags;
 	u32 value;
 
-	spin_lock_irqsave(&vg->lock, flags);
+	raw_spin_lock_irqsave(&vg->lock, flags);
 	value = readl(reg);
 	value &= ~(BYT_TRIG_POS | BYT_TRIG_NEG | BYT_TRIG_LVL);
 	writel(value, reg);
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 }
 
 static u32 byt_get_gpio_mux(struct byt_gpio *vg, unsigned offset)
@@ -198,7 +198,7 @@ static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 	u32 value, gpio_mux;
 	unsigned long flags;
 
-	spin_lock_irqsave(&vg->lock, flags);
+	raw_spin_lock_irqsave(&vg->lock, flags);
 
 	/*
 	 * In most cases, func pin mux 000 means GPIO function.
@@ -220,7 +220,7 @@ static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 			 "pin %u forcibly re-configured as GPIO\n", offset);
 	}
 
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	pm_runtime_get(&vg->pdev->dev);
 
@@ -246,7 +246,7 @@ static int byt_irq_type(struct irq_data *d, unsigned type)
 	if (offset >= vg->chip.ngpio)
 		return -EINVAL;
 
-	spin_lock_irqsave(&vg->lock, flags);
+	raw_spin_lock_irqsave(&vg->lock, flags);
 	value = readl(reg);
 
 	WARN(value & BYT_DIRECT_IRQ_EN,
@@ -265,7 +265,7 @@ static int byt_irq_type(struct irq_data *d, unsigned type)
 	else if (type & IRQ_TYPE_LEVEL_MASK)
 		__irq_set_handler_locked(d->irq, handle_level_irq);
 
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	return 0;
 }
@@ -277,9 +277,9 @@ static int byt_gpio_get(struct gpio_chip *chip, unsigned offset)
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&vg->lock, flags);
+	raw_spin_lock_irqsave(&vg->lock, flags);
 	val = readl(reg);
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	return val & BYT_LEVEL;
 }
@@ -291,7 +291,7 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	unsigned long flags;
 	u32 old_val;
 
-	spin_lock_irqsave(&vg->lock, flags);
+	raw_spin_lock_irqsave(&vg->lock, flags);
 
 	old_val = readl(reg);
 
@@ -300,7 +300,7 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		writel(old_val & ~BYT_LEVEL, reg);
 
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 }
 
 static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -310,13 +310,13 @@ static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	unsigned long flags;
 	u32 value;
 
-	spin_lock_irqsave(&vg->lock, flags);
+	raw_spin_lock_irqsave(&vg->lock, flags);
 
 	value = readl(reg) | BYT_DIR_MASK;
 	value &= ~BYT_INPUT_EN;		/* active low */
 	writel(value, reg);
 
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	return 0;
 }
@@ -330,7 +330,7 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
 	unsigned long flags;
 	u32 reg_val;
 
-	spin_lock_irqsave(&vg->lock, flags);
+	raw_spin_lock_irqsave(&vg->lock, flags);
 
 	/*
 	 * Before making any direction modifications, do a check if gpio
@@ -349,7 +349,7 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
 	else
 		writel(reg_val & ~BYT_LEVEL, reg);
 
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	return 0;
 }
@@ -358,18 +358,19 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	struct byt_gpio *vg = to_byt_gpio(chip);
 	int i;
-	unsigned long flags;
 	u32 conf0, val, offs;
 
-	spin_lock_irqsave(&vg->lock, flags);
-
 	for (i = 0; i < vg->chip.ngpio; i++) {
 		const char *pull_str = NULL;
 		const char *pull = NULL;
+		unsigned long flags;
 		const char *label;
 		offs = vg->range->pins[i] * 16;
+
+		raw_spin_lock_irqsave(&vg->lock, flags);
 		conf0 = readl(vg->reg_base + offs + BYT_CONF0_REG);
 		val = readl(vg->reg_base + offs + BYT_VAL_REG);
+		raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 		label = gpiochip_is_requested(chip, i);
 		if (!label)
@@ -422,7 +423,6 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		seq_puts(s, "\n");
 	}
-	spin_unlock_irqrestore(&vg->lock, flags);
 }
 
 static void byt_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
@@ -454,10 +454,10 @@ static void byt_irq_ack(struct irq_data *d)
 	unsigned offset = irqd_to_hwirq(d);
 	void __iomem *reg;
 
-	spin_lock(&vg->lock);
+	raw_spin_lock(&vg->lock);
 	reg = byt_gpio_reg(&vg->chip, offset, BYT_INT_STAT_REG);
 	writel(BIT(offset % 32), reg);
-	spin_unlock(&vg->lock);
+	raw_spin_unlock(&vg->lock);
 }
 
 static void byt_irq_unmask(struct irq_data *d)
@@ -469,9 +469,9 @@ static void byt_irq_unmask(struct irq_data *d)
 	void __iomem *reg;
 	u32 value;
 
-	spin_lock_irqsave(&vg->lock, flags);
-
 	reg = byt_gpio_reg(&vg->chip, offset, BYT_CONF0_REG);
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
 	value = readl(reg);
 
 	switch (irqd_get_trigger_type(d)) {
@@ -492,7 +492,7 @@ static void byt_irq_unmask(struct irq_data *d)
 
 	writel(value, reg);
 
-	spin_unlock_irqrestore(&vg->lock, flags);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 }
 
 static void byt_irq_mask(struct irq_data *d)
@@ -584,7 +584,7 @@ static int byt_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(vg->reg_base))
 		return PTR_ERR(vg->reg_base);
 
-	spin_lock_init(&vg->lock);
+	raw_spin_lock_init(&vg->lock);
 
 	gc = &vg->chip;
 	gc->label = dev_name(&pdev->dev);
-- 
2.5.0

