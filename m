From: Julia Cartwright <julia@ni.com>
Subject: [PATCH 06/19] gpio: ath79: make use of raw_spinlock variants
Date: Thu, 9 Mar 2017 10:21:53 -0600
Message-ID: <1774d7bad8bbc672372480f540dfc8f3d1592533.1489015238.git.julia@ni.com>
References: <cover.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1489015238.git.julia@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The ath79 gpio driver currently implements an irq_chip for handling
interrupts; due to how irq_chip handling is done, it's necessary for the
irq_chip methods to be invoked from hardirq context, even on a a
real-time kernel.  Because the spinlock_t type becomes a "sleeping"
spinlock w/ RT kernels, it is not suitable to be used with irq_chips.

A quick audit of the operations under the lock reveal that they do only
minimal, bounded work, and are therefore safe to do under a raw spinlock.

Signed-off-by: Julia Cartwright <julia@ni.com>
---
 drivers/gpio/gpio-ath79.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index dc37dbe4b46d..f33d4a5fe671 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -32,7 +32,7 @@
 struct ath79_gpio_ctrl {
 	struct gpio_chip gc;
 	void __iomem *base;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	unsigned long both_edges;
 };
 
@@ -74,9 +74,9 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_mask(struct irq_data *data)
@@ -85,9 +85,9 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -96,10 +96,10 @@ static void ath79_gpio_irq_enable(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_disable(struct irq_data *data)
@@ -108,10 +108,10 @@ static void ath79_gpio_irq_disable(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static int ath79_gpio_irq_set_type(struct irq_data *data,
@@ -140,7 +140,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
 
 	if (flow_type == IRQ_TYPE_EDGE_BOTH) {
 		ctrl->both_edges |= mask;
@@ -165,7 +165,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		ath79_gpio_update_bits(
 			ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 
 	return 0;
 }
@@ -191,7 +191,7 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(irqchip, desc);
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
 
 	pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
 
@@ -203,7 +203,7 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 				both_edges, ~state);
 	}
 
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 
 	if (pending) {
 		for_each_set_bit(irq, &pending, gc->ngpio)
@@ -262,7 +262,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (!ctrl->base)
 		return -ENOMEM;
 
-	spin_lock_init(&ctrl->lock);
+	raw_spin_lock_init(&ctrl->lock);
 	err = bgpio_init(&ctrl->gc, &pdev->dev, 4,
 			ctrl->base + AR71XX_GPIO_REG_IN,
 			ctrl->base + AR71XX_GPIO_REG_SET,
-- 
2.11.1
