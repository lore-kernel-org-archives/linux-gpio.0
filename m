From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/1] gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to raw_spinlock
Date: Tue, 21 Jul 2015 15:54:30 +0200
Message-ID: <1437486870-11135-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:36705 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754345AbbGUODN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 21 Jul 2015 10:03:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

mpc8xxx_gpio_chip.lock needs to be a real spinlock in preempt-rt.
Especially the interrupt related functions can not be converted to a
sleeping lock.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 48 ++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 20aa66f..72cc616 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -32,7 +32,7 @@
 
 struct mpc8xxx_gpio_chip {
 	struct of_mm_gpio_chip mm_gc;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 
 	/*
 	 * shadowed data register to be able to clear/set output pins in
@@ -95,7 +95,7 @@ static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
 	unsigned long flags;
 
-	spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
 	if (val)
 		mpc8xxx_gc->data |= mpc8xxx_gpio2mask(gpio);
@@ -104,7 +104,7 @@ static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);
 
-	spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
 
 static void mpc8xxx_gpio_set_multiple(struct gpio_chip *gc,
@@ -115,7 +115,7 @@ static void mpc8xxx_gpio_set_multiple(struct gpio_chip *gc,
 	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
 	for (i = 0; i < gc->ngpio; i++) {
 		if (*mask == 0)
@@ -130,7 +130,7 @@ static void mpc8xxx_gpio_set_multiple(struct gpio_chip *gc,
 
 	out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);
 
-	spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
 
 static int mpc8xxx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -139,11 +139,11 @@ static int mpc8xxx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
 	unsigned long flags;
 
-	spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
 	clrbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
 
-	spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 
 	return 0;
 }
@@ -156,11 +156,11 @@ static int mpc8xxx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val
 
 	mpc8xxx_gpio_set(gc, gpio, val);
 
-	spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
 	setbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
 
-	spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 
 	return 0;
 }
@@ -206,11 +206,11 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
 	struct of_mm_gpio_chip *mm = &mpc8xxx_gc->mm_gc;
 	unsigned long flags;
 
-	spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
 	setbits32(mm->regs + GPIO_IMR, mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
 
-	spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
 
 static void mpc8xxx_irq_mask(struct irq_data *d)
@@ -219,11 +219,11 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 	struct of_mm_gpio_chip *mm = &mpc8xxx_gc->mm_gc;
 	unsigned long flags;
 
-	spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
 	clrbits32(mm->regs + GPIO_IMR, mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
 
-	spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
 
 static void mpc8xxx_irq_ack(struct irq_data *d)
@@ -242,17 +242,17 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 
 	switch (flow_type) {
 	case IRQ_TYPE_EDGE_FALLING:
-		spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 		setbits32(mm->regs + GPIO_ICR,
 			  mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
-		spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
-		spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 		clrbits32(mm->regs + GPIO_ICR,
 			  mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
-		spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	default:
@@ -282,22 +282,22 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	switch (flow_type) {
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
-		spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 		clrsetbits_be32(reg, 3 << shift, 2 << shift);
-		spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_LEVEL_HIGH:
-		spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 		clrsetbits_be32(reg, 3 << shift, 1 << shift);
-		spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
-		spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 		clrbits32(reg, 3 << shift);
-		spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	default:
@@ -359,7 +359,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mpc8xxx_gc);
 
-	spin_lock_init(&mpc8xxx_gc->lock);
+	raw_spin_lock_init(&mpc8xxx_gc->lock);
 
 	mm_gc = &mpc8xxx_gc->mm_gc;
 	gc = &mm_gc->gc;
-- 
2.3.6

