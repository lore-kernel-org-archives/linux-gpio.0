From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: cherryview: Use raw_spinlock for locking
Date: Mon, 17 Aug 2015 16:13:30 +0300
Message-ID: <1439817210-38828-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:35290 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752767AbbHQNNe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 17 Aug 2015 09:13:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When running -rt kernel and an interrupt happens on a GPIO line controlled by
Intel Cherryview/Braswell pinctrl driver we get:

 BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:917
 in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swapper/0
 Preemption disabled at:[<ffffffff81092e9f>] cpu_startup_entry+0x17f/0x480

 CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.1.5-rt5 #16
  ...
 Call Trace:
  <IRQ>  [<ffffffff816283c6>] dump_stack+0x4a/0x61
  [<ffffffff81077e17>] ___might_sleep+0xe7/0x170
  [<ffffffff8162d6cf>] rt_spin_lock+0x1f/0x50
  [<ffffffff812e52ed>] chv_gpio_irq_ack+0x3d/0xa0
  [<ffffffff810a72f5>] handle_edge_irq+0x75/0x180
  [<ffffffff810a3457>] generic_handle_irq+0x27/0x40
  [<ffffffff812e57de>] chv_gpio_irq_handler+0x7e/0x110
  [<ffffffff810050aa>] handle_irq+0xaa/0x190
  ...

This is because desc->lock is raw_spinlock and is held when chv_gpio_irq_ack()
is called by the genirq core. chv_gpio_irq_ack() in turn takes pctrl->lock
which in -rt is an rt-mutex causing might_sleep() rightfully to complain about
sleeping function called from invalid context.

In order to keep -rt happy but at the same time make sure that register
accesses get serialized, convert the driver to use raw_spinlock instead.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 70 +++++++++++++++---------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index eaaede70d4de..70b7b41e40a9 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -174,7 +174,7 @@ struct chv_pinctrl {
 	struct pinctrl_dev *pctldev;
 	struct gpio_chip chip;
 	void __iomem *regs;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	unsigned intr_lines[16];
 	const struct chv_community *community;
 	u32 saved_intmask;
@@ -720,13 +720,13 @@ static void chv_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 	u32 ctrl0, ctrl1;
 	bool locked;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	ctrl0 = readl(chv_padreg(pctrl, offset, CHV_PADCTRL0));
 	ctrl1 = readl(chv_padreg(pctrl, offset, CHV_PADCTRL1));
 	locked = chv_pad_locked(pctrl, offset);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	if (ctrl0 & CHV_PADCTRL0_GPIOEN) {
 		seq_puts(s, "GPIO ");
@@ -789,14 +789,14 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 
 	grp = &pctrl->community->groups[group];
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	/* Check first that the pad is not locked */
 	for (i = 0; i < grp->npins; i++) {
 		if (chv_pad_locked(pctrl, grp->pins[i])) {
 			dev_warn(pctrl->dev, "unable to set mode for locked pin %u\n",
 				 grp->pins[i]);
-			spin_unlock_irqrestore(&pctrl->lock, flags);
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 			return -EBUSY;
 		}
 	}
@@ -839,7 +839,7 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 			pin, altfunc->mode, altfunc->invert_oe ? "" : "not ");
 	}
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -853,13 +853,13 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 	void __iomem *reg;
 	u32 value;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	if (chv_pad_locked(pctrl, offset)) {
 		value = readl(chv_padreg(pctrl, offset, CHV_PADCTRL0));
 		if (!(value & CHV_PADCTRL0_GPIOEN)) {
 			/* Locked so cannot enable */
-			spin_unlock_irqrestore(&pctrl->lock, flags);
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 			return -EBUSY;
 		}
 	} else {
@@ -899,7 +899,7 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 		chv_writel(value, reg);
 	}
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -913,13 +913,13 @@ static void chv_gpio_disable_free(struct pinctrl_dev *pctldev,
 	void __iomem *reg;
 	u32 value;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	reg = chv_padreg(pctrl, offset, CHV_PADCTRL0);
 	value = readl(reg) & ~CHV_PADCTRL0_GPIOEN;
 	chv_writel(value, reg);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -931,7 +931,7 @@ static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
 	unsigned long flags;
 	u32 ctrl0;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	ctrl0 = readl(reg) & ~CHV_PADCTRL0_GPIOCFG_MASK;
 	if (input)
@@ -940,7 +940,7 @@ static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
 		ctrl0 |= CHV_PADCTRL0_GPIOCFG_GPO << CHV_PADCTRL0_GPIOCFG_SHIFT;
 	chv_writel(ctrl0, reg);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -965,10 +965,10 @@ static int chv_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 	u16 arg = 0;
 	u32 term;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	ctrl0 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
 	ctrl1 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL1));
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	term = (ctrl0 & CHV_PADCTRL0_TERM_MASK) >> CHV_PADCTRL0_TERM_SHIFT;
 
@@ -1042,7 +1042,7 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
 	unsigned long flags;
 	u32 ctrl0, pull;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	ctrl0 = readl(reg);
 
 	switch (param) {
@@ -1065,7 +1065,7 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
 			pull = CHV_PADCTRL0_TERM_20K << CHV_PADCTRL0_TERM_SHIFT;
 			break;
 		default:
-			spin_unlock_irqrestore(&pctrl->lock, flags);
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 			return -EINVAL;
 		}
 
@@ -1083,7 +1083,7 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
 			pull = CHV_PADCTRL0_TERM_20K << CHV_PADCTRL0_TERM_SHIFT;
 			break;
 		default:
-			spin_unlock_irqrestore(&pctrl->lock, flags);
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 			return -EINVAL;
 		}
 
@@ -1091,12 +1091,12 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
 		break;
 
 	default:
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 		return -EINVAL;
 	}
 
 	chv_writel(ctrl0, reg);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -1172,9 +1172,9 @@ static int chv_gpio_get(struct gpio_chip *chip, unsigned offset)
 	unsigned long flags;
 	u32 ctrl0, cfg;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	ctrl0 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	cfg = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
 	cfg >>= CHV_PADCTRL0_GPIOCFG_SHIFT;
@@ -1192,7 +1192,7 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	void __iomem *reg;
 	u32 ctrl0;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	reg = chv_padreg(pctrl, pin, CHV_PADCTRL0);
 	ctrl0 = readl(reg);
@@ -1204,7 +1204,7 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	chv_writel(ctrl0, reg);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -1214,9 +1214,9 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	u32 ctrl0, direction;
 	unsigned long flags;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	ctrl0 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	direction = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
 	direction >>= CHV_PADCTRL0_GPIOCFG_SHIFT;
@@ -1254,14 +1254,14 @@ static void chv_gpio_irq_ack(struct irq_data *d)
 	int pin = chv_gpio_offset_to_pin(pctrl, irqd_to_hwirq(d));
 	u32 intr_line;
 
-	spin_lock(&pctrl->lock);
+	raw_spin_lock(&pctrl->lock);
 
 	intr_line = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
 	intr_line &= CHV_PADCTRL0_INTSEL_MASK;
 	intr_line >>= CHV_PADCTRL0_INTSEL_SHIFT;
 	chv_writel(BIT(intr_line), pctrl->regs + CHV_INTSTAT);
 
-	spin_unlock(&pctrl->lock);
+	raw_spin_unlock(&pctrl->lock);
 }
 
 static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
@@ -1272,7 +1272,7 @@ static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 	u32 value, intr_line;
 	unsigned long flags;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	intr_line = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
 	intr_line &= CHV_PADCTRL0_INTSEL_MASK;
@@ -1285,7 +1285,7 @@ static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 		value |= BIT(intr_line);
 	chv_writel(value, pctrl->regs + CHV_INTMASK);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static void chv_gpio_irq_mask(struct irq_data *d)
@@ -1319,7 +1319,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 		unsigned long flags;
 		u32 intsel, value;
 
-		spin_lock_irqsave(&pctrl->lock, flags);
+		raw_spin_lock_irqsave(&pctrl->lock, flags);
 		intsel = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
 		intsel &= CHV_PADCTRL0_INTSEL_MASK;
 		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
@@ -1334,7 +1334,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 			__irq_set_handler_locked(d->irq, handler);
 			pctrl->intr_lines[intsel] = offset;
 		}
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 	}
 
 	chv_gpio_irq_unmask(d);
@@ -1350,7 +1350,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned type)
 	unsigned long flags;
 	u32 value;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	/*
 	 * Pins which can be used as shared interrupt are configured in
@@ -1399,7 +1399,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned type)
 	else if (type & IRQ_TYPE_LEVEL_MASK)
 		__irq_set_handler_locked(d->irq, handle_level_irq);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -1511,7 +1511,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	if (i == ARRAY_SIZE(chv_communities))
 		return -ENODEV;
 
-	spin_lock_init(&pctrl->lock);
+	raw_spin_lock_init(&pctrl->lock);
 	pctrl->dev = &pdev->dev;
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.5.0

