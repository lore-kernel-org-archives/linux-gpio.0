From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/1] pinctrl: baytrail: Add spinlock usage to all read/write access
Date: Thu, 26 Jan 2017 15:14:18 +0100
Message-ID: <20170126141418.5624-1-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:43528 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752181AbdAZOOi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 09:14:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

According to VLI64 Intel Atom E3800 Specification Update (#329901)
concurrent read accesses may result in returning 0xffffffff and write
accesses may be dropped silently.
To workaround all accesses must be protected by locks.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
I actually had the case where the read access in byt_irq_unmask returned
0xffffffff. After OR'ing the trigger bits and writing 0xffffffff back to
BYT_CONF0_REG things started to act strange.

 drivers/pinctrl/intel/pinctrl-baytrail.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 6cce314..7294c88 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1594,6 +1594,7 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 	void __iomem *reg;
 	unsigned long pending;
 	unsigned int virq;
+	unsigned long flags;
 
 	/* check from GPIO controller which pin triggered the interrupt */
 	for (base = 0; base < vg->chip.ngpio; base += 32) {
@@ -1606,7 +1607,9 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 			continue;
 		}
 
+		raw_spin_lock_irqsave(&vg->lock, flags);
 		pending = readl(reg);
+		raw_spin_unlock_irqrestore(&vg->lock, flags);
 		for_each_set_bit(pin, &pending, 32) {
 			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
 			generic_handle_irq(virq);
@@ -1620,6 +1623,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 	void __iomem *reg;
 	u32 base, value;
 	int i;
+	unsigned long flags;
 
 	/*
 	 * Clear interrupt triggers for all pins that are GPIOs and
@@ -1637,7 +1641,9 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 			continue;
 		}
 
+		raw_spin_lock_irqsave(&vg->lock, flags);
 		value = readl(reg);
+		raw_spin_unlock_irqrestore(&vg->lock, flags);
 		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i) &&
 		    !(value & BYT_DIRECT_IRQ_EN)) {
 			byt_gpio_clear_triggering(vg, i);
@@ -1656,10 +1662,12 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 			continue;
 		}
 
+		raw_spin_lock_irqsave(&vg->lock, flags);
 		writel(0xffffffff, reg);
 		/* make sure trigger bits are cleared, if not then a pin
 		   might be misconfigured in bios */
 		value = readl(reg);
+		raw_spin_unlock_irqrestore(&vg->lock, flags);
 		if (value)
 			dev_err(&vg->pdev->dev,
 				"GPIO interrupt error, pins misconfigured\n");
@@ -1828,7 +1836,9 @@ static int byt_gpio_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct byt_gpio *vg = platform_get_drvdata(pdev);
 	int i;
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&vg->lock, flags);
 	for (i = 0; i < vg->soc_data->npins; i++) {
 		void __iomem *reg;
 		u32 value;
@@ -1848,6 +1858,7 @@ static int byt_gpio_suspend(struct device *dev)
 		value = readl(reg) & BYT_VAL_RESTORE_MASK;
 		vg->saved_context[i].val = value;
 	}
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	return 0;
 }
@@ -1857,7 +1868,9 @@ static int byt_gpio_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct byt_gpio *vg = platform_get_drvdata(pdev);
 	int i;
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&vg->lock, flags);
 	for (i = 0; i < vg->soc_data->npins; i++) {
 		void __iomem *reg;
 		u32 value;
@@ -1894,6 +1907,7 @@ static int byt_gpio_resume(struct device *dev)
 			}
 		}
 	}
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	return 0;
 }
-- 
2.10.2

