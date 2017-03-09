From: Julia Cartwright <julia@ni.com>
Subject: [PATCH 09/19] gpio: pl061: make use of raw_spinlock variants
Date: Thu, 9 Mar 2017 10:21:56 -0600
Message-ID: <393599ef5e6ee95b6d143f56c4be47a21599b7b5.1489015238.git.julia@ni.com>
References: <cover.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1489015238.git.julia@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The pl061 gpio driver currently implements an irq_chip for handling
interrupts; due to how irq_chip handling is done, it's necessary for the
irq_chip methods to be invoked from hardirq context, even on a a
real-time kernel.  Because the spinlock_t type becomes a "sleeping"
spinlock w/ RT kernels, it is not suitable to be used with irq_chips.

A quick audit of the operations under the lock reveal that they do only
minimal, bounded work, and are therefore safe to do under a raw spinlock.

Signed-off-by: Julia Cartwright <julia@ni.com>
---
 drivers/gpio/gpio-pl061.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 0a6bfd2b06e5..3d3d6b6645a7 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -50,7 +50,7 @@ struct pl061_context_save_regs {
 #endif
 
 struct pl061 {
-	spinlock_t		lock;
+	raw_spinlock_t		lock;
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
@@ -74,11 +74,11 @@ static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 	unsigned long flags;
 	unsigned char gpiodir;
 
-	spin_lock_irqsave(&pl061->lock, flags);
+	raw_spin_lock_irqsave(&pl061->lock, flags);
 	gpiodir = readb(pl061->base + GPIODIR);
 	gpiodir &= ~(BIT(offset));
 	writeb(gpiodir, pl061->base + GPIODIR);
-	spin_unlock_irqrestore(&pl061->lock, flags);
+	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
 }
@@ -90,7 +90,7 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 	unsigned long flags;
 	unsigned char gpiodir;
 
-	spin_lock_irqsave(&pl061->lock, flags);
+	raw_spin_lock_irqsave(&pl061->lock, flags);
 	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
 	gpiodir = readb(pl061->base + GPIODIR);
 	gpiodir |= BIT(offset);
@@ -101,7 +101,7 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 	 * a gpio pin before configuring it in OUT mode.
 	 */
 	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
-	spin_unlock_irqrestore(&pl061->lock, flags);
+	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
 }
@@ -143,7 +143,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	}
 
 
-	spin_lock_irqsave(&pl061->lock, flags);
+	raw_spin_lock_irqsave(&pl061->lock, flags);
 
 	gpioiev = readb(pl061->base + GPIOIEV);
 	gpiois = readb(pl061->base + GPIOIS);
@@ -203,7 +203,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	writeb(gpioibe, pl061->base + GPIOIBE);
 	writeb(gpioiev, pl061->base + GPIOIEV);
 
-	spin_unlock_irqrestore(&pl061->lock, flags);
+	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
 }
@@ -235,10 +235,10 @@ static void pl061_irq_mask(struct irq_data *d)
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 	u8 gpioie;
 
-	spin_lock(&pl061->lock);
+	raw_spin_lock(&pl061->lock);
 	gpioie = readb(pl061->base + GPIOIE) & ~mask;
 	writeb(gpioie, pl061->base + GPIOIE);
-	spin_unlock(&pl061->lock);
+	raw_spin_unlock(&pl061->lock);
 }
 
 static void pl061_irq_unmask(struct irq_data *d)
@@ -248,10 +248,10 @@ static void pl061_irq_unmask(struct irq_data *d)
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 	u8 gpioie;
 
-	spin_lock(&pl061->lock);
+	raw_spin_lock(&pl061->lock);
 	gpioie = readb(pl061->base + GPIOIE) | mask;
 	writeb(gpioie, pl061->base + GPIOIE);
-	spin_unlock(&pl061->lock);
+	raw_spin_unlock(&pl061->lock);
 }
 
 /**
@@ -268,9 +268,9 @@ static void pl061_irq_ack(struct irq_data *d)
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 
-	spin_lock(&pl061->lock);
+	raw_spin_lock(&pl061->lock);
 	writeb(mask, pl061->base + GPIOIC);
-	spin_unlock(&pl061->lock);
+	raw_spin_unlock(&pl061->lock);
 }
 
 static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
@@ -304,7 +304,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	if (IS_ERR(pl061->base))
 		return PTR_ERR(pl061->base);
 
-	spin_lock_init(&pl061->lock);
+	raw_spin_lock_init(&pl061->lock);
 	if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
 		pl061->gc.request = gpiochip_generic_request;
 		pl061->gc.free = gpiochip_generic_free;
-- 
2.11.1
