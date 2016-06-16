From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] pinctrl: intel: Use raw_spinlock for locking
Date: Thu, 16 Jun 2016 11:25:36 +0300
Message-ID: <1466065537-82027-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:9144 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751275AbcFPIZl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 16 Jun 2016 04:25:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kim Tatt Chuah <kim.tatt.chuah@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>

When running -rt kernel and GPIO interrupt happens we get following

 BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:931
 in_atomic(): 1, irqs_disabled(): 0, pid: 530, name: irq/14-INT3452:
 Preemption disabled at:[<ffffffff810b4dab>] handle_edge_irq+0x1b/0x190

 CPU: 0 PID: 530 Comm: irq/14-INT3452: Not tainted 4.6.2-rt5 #1060
  0000000000000000 ffff88007a257d58 ffffffff812d8494 0000000000000000
  ffff88017a330000 ffff88007a257d78 ffffffff81083a11 ffff88007a252430
  ffff88007a252430 ffff88007a257d90 ffffffff8167ef20 000000000000001a
 Call Trace:
  [<ffffffff812d8494>] dump_stack+0x4f/0x6b
  [<ffffffff81083a11>] ___might_sleep+0xe1/0x160
  [<ffffffff8167ef20>] rt_spin_lock+0x20/0x50
  [<ffffffff81308c6d>] intel_gpio_irq_ack+0x2d/0x80
  [<ffffffff810b4e0b>] handle_edge_irq+0x7b/0x190
  [<ffffffff810b0d82>] generic_handle_irq+0x22/0x30
  [<ffffffff81307abc>] intel_gpio_irq+0xdc/0x150
  [<ffffffff810b2293>] irq_forced_thread_fn+0x23/0x70
  [<ffffffff810b250b>] irq_thread+0x13b/0x1d0
  [<ffffffff8167b844>] ? __schedule+0x2e4/0x5a0
  [<ffffffff810b2270>] ? irq_finalize_oneshot.part.37+0xd0/0xd0
  [<ffffffff810b25a0>] ? irq_thread+0x1d0/0x1d0
  [<ffffffff810b23d0>] ? wake_threads_waitq+0x30/0x30
  [<ffffffff8107e624>] kthread+0xd4/0xf0
  [<ffffffff8167ec27>] ? _raw_spin_unlock_irq+0x17/0x40
  [<ffffffff8167f592>] ret_from_fork+0x22/0x40
  [<ffffffff8107e550>] ? kthread_worker_fn+0x190/0x190

The reason why this happens is because intel_gpio_irq_ack() is called with
desc->lock raw_spinlock locked which cannot sleep but our normal spinlock
(which is converted to rtmutex in -rt) is allowed to sleep. This causes
might_sleep() to trigger.

Fix this by converting the normal spinlock to a raw_spinlock.

Reported-by: Kim Tatt Chuah <kim.tatt.chuah@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 44 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 3584e50fa2c6..f1b14f256001 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -89,7 +89,7 @@ struct intel_pinctrl_context {
  */
 struct intel_pinctrl {
 	struct device *dev;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	struct pinctrl_desc pctldesc;
 	struct pinctrl_dev *pctldev;
 	struct gpio_chip chip;
@@ -318,7 +318,7 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	/*
 	 * All pins in the groups needs to be accessible and writable
@@ -326,7 +326,7 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	 */
 	for (i = 0; i < grp->npins; i++) {
 		if (!intel_pad_usable(pctrl, grp->pins[i])) {
-			spin_unlock_irqrestore(&pctrl->lock, flags);
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 			return -EBUSY;
 		}
 	}
@@ -345,7 +345,7 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 		writel(value, padcfg0);
 	}
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -359,10 +359,10 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	unsigned long flags;
 	u32 value;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	if (!intel_pad_usable(pctrl, pin)) {
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 		return -EBUSY;
 	}
 
@@ -377,7 +377,7 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	value |= PADCFG0_GPIOTXDIS;
 	writel(value, padcfg0);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -391,7 +391,7 @@ static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
 	unsigned long flags;
 	u32 value;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
 
@@ -402,7 +402,7 @@ static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
 		value &= ~PADCFG0_GPIOTXDIS;
 	writel(value, padcfg0);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -490,7 +490,7 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 	int ret = 0;
 	u32 value;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	padcfg1 = intel_get_padcfg(pctrl, pin, PADCFG1);
 	value = readl(padcfg1);
@@ -544,7 +544,7 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 	if (!ret)
 		writel(value, padcfg1);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return ret;
 }
@@ -611,14 +611,14 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 		unsigned long flags;
 		u32 padcfg0;
 
-		spin_lock_irqsave(&pctrl->lock, flags);
+		raw_spin_lock_irqsave(&pctrl->lock, flags);
 		padcfg0 = readl(reg);
 		if (value)
 			padcfg0 |= PADCFG0_GPIOTXSTATE;
 		else
 			padcfg0 &= ~PADCFG0_GPIOTXSTATE;
 		writel(padcfg0, reg);
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 	}
 }
 
@@ -651,7 +651,7 @@ static void intel_gpio_irq_ack(struct irq_data *d)
 	const struct intel_community *community;
 	unsigned pin = irqd_to_hwirq(d);
 
-	spin_lock(&pctrl->lock);
+	raw_spin_lock(&pctrl->lock);
 
 	community = intel_get_community(pctrl, pin);
 	if (community) {
@@ -662,7 +662,7 @@ static void intel_gpio_irq_ack(struct irq_data *d)
 		writel(BIT(gpp_offset), community->regs + GPI_IS + gpp * 4);
 	}
 
-	spin_unlock(&pctrl->lock);
+	raw_spin_unlock(&pctrl->lock);
 }
 
 static void intel_gpio_irq_enable(struct irq_data *d)
@@ -673,7 +673,7 @@ static void intel_gpio_irq_enable(struct irq_data *d)
 	unsigned pin = irqd_to_hwirq(d);
 	unsigned long flags;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	community = intel_get_community(pctrl, pin);
 	if (community) {
@@ -691,7 +691,7 @@ static void intel_gpio_irq_enable(struct irq_data *d)
 		writel(value, community->regs + community->ie_offset + gpp * 4);
 	}
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
@@ -702,7 +702,7 @@ static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 	unsigned pin = irqd_to_hwirq(d);
 	unsigned long flags;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	community = intel_get_community(pctrl, pin);
 	if (community) {
@@ -721,7 +721,7 @@ static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 		writel(value, reg);
 	}
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static void intel_gpio_irq_mask(struct irq_data *d)
@@ -757,7 +757,7 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 		return -EPERM;
 	}
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	value = readl(reg);
 
@@ -784,7 +784,7 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 	else if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -995,7 +995,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 
 	pctrl->dev = &pdev->dev;
 	pctrl->soc = soc_data;
-	spin_lock_init(&pctrl->lock);
+	raw_spin_lock_init(&pctrl->lock);
 
 	/*
 	 * Make a copy of the communities which we can use to hold pointers
-- 
2.8.1

