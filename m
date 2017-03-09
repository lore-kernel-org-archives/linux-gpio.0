From: Julia Cartwright <julia@ni.com>
Subject: [PATCH 02/19] gpio: altera: make use of raw_spinlock variants
Date: Thu, 9 Mar 2017 10:21:49 -0600
Message-ID: <f655096ca76ca81032ab07e67412da0a116bbbb6.1489015238.git.julia@ni.com>
References: <cover.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:48440 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753277AbdCIRAx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2017 12:00:53 -0500
In-Reply-To: <cover.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org

The altera gpio driver currently implements an irq_chip for handling
interrupts; due to how irq_chip handling is done, it's necessary for the
irq_chip methods to be invoked from hardirq context, even on a a real-time
kernel.  Because the spinlock_t type becomes a "sleeping" spinlock w/ RT
kernels, it is not suitable to be used with irq_chips.

A quick audit of the operations under the lock reveal that they do only
minimal, bounded work, and are therefore safe to do under a raw spinlock.

Signed-off-by: Julia Cartwright <julia@ni.com>
---
 drivers/gpio/gpio-altera.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 3fe6a21e05a5..17485dc20384 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -38,7 +38,7 @@
 */
 struct altera_gpio_chip {
 	struct of_mm_gpio_chip mmchip;
-	spinlock_t gpio_lock;
+	raw_spinlock_t gpio_lock;
 	int interrupt_trigger;
 	int mapped_irq;
 };
@@ -53,12 +53,12 @@ static void altera_gpio_irq_unmask(struct irq_data *d)
 	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	mm_gc = &altera_gc->mmchip;
 
-	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
+	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
 	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
 	/* Set ALTERA_GPIO_IRQ_MASK bit to unmask */
 	intmask |= BIT(irqd_to_hwirq(d));
 	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
-	spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
 }
 
 static void altera_gpio_irq_mask(struct irq_data *d)
@@ -71,12 +71,12 @@ static void altera_gpio_irq_mask(struct irq_data *d)
 	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	mm_gc = &altera_gc->mmchip;
 
-	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
+	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
 	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
 	/* Clear ALTERA_GPIO_IRQ_MASK bit to mask */
 	intmask &= ~BIT(irqd_to_hwirq(d));
 	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
-	spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
 }
 
 /**
@@ -140,14 +140,14 @@ static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	mm_gc = to_of_mm_gpio_chip(gc);
 	chip = gpiochip_get_data(gc);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
 	if (value)
 		data_reg |= BIT(offset);
 	else
 		data_reg &= ~BIT(offset);
 	writel(data_reg, mm_gc->regs + ALTERA_GPIO_DATA);
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -160,12 +160,12 @@ static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 	mm_gc = to_of_mm_gpio_chip(gc);
 	chip = gpiochip_get_data(gc);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 	/* Set pin as input, assumes software controlled IP */
 	gpio_ddr = readl(mm_gc->regs + ALTERA_GPIO_DIR);
 	gpio_ddr &= ~BIT(offset);
 	writel(gpio_ddr, mm_gc->regs + ALTERA_GPIO_DIR);
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -181,7 +181,7 @@ static int altera_gpio_direction_output(struct gpio_chip *gc,
 	mm_gc = to_of_mm_gpio_chip(gc);
 	chip = gpiochip_get_data(gc);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 	/* Sets the GPIO value */
 	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
 	if (value)
@@ -194,7 +194,7 @@ static int altera_gpio_direction_output(struct gpio_chip *gc,
 	gpio_ddr = readl(mm_gc->regs + ALTERA_GPIO_DIR);
 	gpio_ddr |= BIT(offset);
 	writel(gpio_ddr, mm_gc->regs + ALTERA_GPIO_DIR);
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -262,7 +262,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	if (!altera_gc)
 		return -ENOMEM;
 
-	spin_lock_init(&altera_gc->gpio_lock);
+	raw_spin_lock_init(&altera_gc->gpio_lock);
 
 	if (of_property_read_u32(node, "altr,ngpio", &reg))
 		/* By default assume maximum ngpio */
-- 
2.11.1

