From: Shaveta Leekha <shaveta@freescale.com>
Subject: [PATCH 1/3] drivers/gpio: Port gpio driver to ls1021a-qds platform
Date: Thu, 30 Jul 2015 12:57:17 +0530
Message-ID: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bbn0104.outbound.protection.outlook.com ([157.56.111.104]:56544
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751301AbbG3H12 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 30 Jul 2015 03:27:28 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: r64188@freescale.com, gnurou@gmail.com, linus.walleij@linaro.org, Shaveta Leekha <shaveta@freescale.com>

LS1021a-qds has the same ip block/controller as
GPIO on powerpc platform(MPC8XXX).

So use portable i/o accessors, as in_be32/out_be32
accessors are Power architecture specific whereas
ioread/writebe32 are available in other architectures.

GPIO controller's registers are big endian, the
accessors ioread32be/iowrite32be matches this one
and portable on powerpc as well on ARM.

Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
---
Tested on Freescale SDK 1.8, as LS1021aQDS support is not yet complete in upstream

 drivers/gpio/gpio-mpc8xxx.c |   53 ++++++++++++++++++++++++++----------------
 1 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 8ef7a12..9cd90e8 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -1,5 +1,5 @@
 /*
- * GPIOs on MPC512x/8349/8572/8610 and compatible
+ * GPIOs on MPC512x/8349/8572/8610/LS1020A and compatible
  *
  * Copyright (C) 2008 Peter Korsgaard <jacmet@sunsite.dk>
  *
@@ -19,6 +19,7 @@
 #include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 
 #define MPC8XXX_GPIO_PINS	32
 
@@ -59,9 +60,17 @@ static void mpc8xxx_gpio_save_regs(struct of_mm_gpio_chip *mm)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
 
-	mpc8xxx_gc->data = in_be32(mm->regs + GPIO_DAT);
+	mpc8xxx_gc->data = ioread32be(mm->regs + GPIO_DAT);
 }
 
+/* Generic set and clear bits accessor ports */
+#define bgpio_setbits32(_addr, _v) \
+		iowrite32be(ioread32be(_addr) |  (_v), (_addr))
+#define bgpio_clrbits32(_addr, _v) \
+		iowrite32be(ioread32be(_addr) & ~(_v), (_addr))
+#define bgpio_clrsetbits32(addr, clear, set) \
+		iowrite32be((ioread32be(addr) & ~(clear)) | (set), (addr))
+
 /* Workaround GPIO 1 errata on MPC8572/MPC8536. The status of GPIOs
  * defined as output cannot be determined by reading GPDAT register,
  * so we use shadow data register instead. The status of input pins
@@ -74,9 +83,9 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
 	u32 out_mask, out_shadow;
 
-	out_mask = in_be32(mm->regs + GPIO_DIR);
+	out_mask = ioread32be(mm->regs + GPIO_DIR);
 
-	val = in_be32(mm->regs + GPIO_DAT) & ~out_mask;
+	val = ioread32be(mm->regs + GPIO_DAT) & ~out_mask;
 	out_shadow = mpc8xxx_gc->data & out_mask;
 
 	return (val | out_shadow) & mpc8xxx_gpio2mask(gpio);
@@ -86,7 +95,7 @@ static int mpc8xxx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
 
-	return in_be32(mm->regs + GPIO_DAT) & mpc8xxx_gpio2mask(gpio);
+	return ioread32be(mm->regs + GPIO_DAT) & mpc8xxx_gpio2mask(gpio);
 }
 
 static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -102,7 +111,7 @@ static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		mpc8xxx_gc->data &= ~mpc8xxx_gpio2mask(gpio);
 
-	out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);
+	iowrite32be(mpc8xxx_gc->data, mm->regs + GPIO_DAT);
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
@@ -128,7 +137,7 @@ static void mpc8xxx_gpio_set_multiple(struct gpio_chip *gc,
 		}
 	}
 
-	out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);
+	iowrite32be(mpc8xxx_gc->data, mm->regs + GPIO_DAT);
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
@@ -141,7 +150,7 @@ static int mpc8xxx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	clrbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
+	bgpio_clrbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 
@@ -158,7 +167,7 @@ static int mpc8xxx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	setbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
+	bgpio_setbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 
@@ -201,7 +210,8 @@ static void mpc8xxx_gpio_irq_cascade(unsigned int irq, struct irq_desc *desc)
 	struct of_mm_gpio_chip *mm = &mpc8xxx_gc->mm_gc;
 	unsigned int mask;
 
-	mask = in_be32(mm->regs + GPIO_IER) & in_be32(mm->regs + GPIO_IMR);
+	mask = ioread32be(mm->regs + GPIO_IER)
+		& ioread32be(mm->regs + GPIO_IMR);
 	if (mask)
 		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
 						     32 - ffs(mask)));
@@ -217,7 +227,8 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	setbits32(mm->regs + GPIO_IMR, mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
+	bgpio_setbits32(mm->regs + GPIO_IMR,
+			mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
@@ -230,7 +241,8 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	clrbits32(mm->regs + GPIO_IMR, mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
+	bgpio_clrbits32(mm->regs + GPIO_IMR,
+			mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
@@ -240,7 +252,7 @@ static void mpc8xxx_irq_ack(struct irq_data *d)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
 	struct of_mm_gpio_chip *mm = &mpc8xxx_gc->mm_gc;
 
-	out_be32(mm->regs + GPIO_IER, mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
+	iowrite32be(mpc8xxx_gpio2mask(irqd_to_hwirq(d)), mm->regs + GPIO_IER);
 }
 
 static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
@@ -252,14 +264,14 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	switch (flow_type) {
 	case IRQ_TYPE_EDGE_FALLING:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		setbits32(mm->regs + GPIO_ICR,
+		bgpio_setbits32(mm->regs + GPIO_ICR,
 			  mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		clrbits32(mm->regs + GPIO_ICR,
+		bgpio_clrbits32(mm->regs + GPIO_ICR,
 			  mpc8xxx_gpio2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
@@ -292,20 +304,20 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		clrsetbits_be32(reg, 3 << shift, 2 << shift);
+		bgpio_clrsetbits32(reg, 3 << shift, 2 << shift);
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_LEVEL_HIGH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		clrsetbits_be32(reg, 3 << shift, 1 << shift);
+		bgpio_clrsetbits32(reg, 3 << shift, 1 << shift);
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		clrbits32(reg, 3 << shift);
+		bgpio_clrbits32(reg, 3 << shift);
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
@@ -373,6 +385,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
 	{ .compatible = "fsl,pq3-gpio",     },
 	{ .compatible = "fsl,qoriq-gpio",   },
+	{ .compatible = "fsl,ls1021a-gpio",   },
 	{}
 };
 
@@ -435,8 +448,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		mpc8xxx_gc->of_dev_id_data = id->data;
 
 	/* ack and mask all irqs */
-	out_be32(mm_gc->regs + GPIO_IER, 0xffffffff);
-	out_be32(mm_gc->regs + GPIO_IMR, 0);
+	iowrite32be(0xffffffff, mm_gc->regs + GPIO_IER);
+	iowrite32be(0, mm_gc->regs + GPIO_IMR);
 
 	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
 					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
-- 
1.7.7.4

