From: Julia Cartwright <julia@ni.com>
Subject: [PATCH 11/19] gpio: zx: make use of raw_spinlock variants
Date: Thu, 9 Mar 2017 10:21:58 -0600
Message-ID: <5198486738fd89f8187b911256ddd3f09a7f9188.1489015238.git.julia@ni.com>
References: <cover.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:47597 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932635AbdCIQzA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2017 11:55:00 -0500
In-Reply-To: <cover.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org

The zx gpio driver currently implements an irq_chip for handling
interrupts; due to how irq_chip handling is done, it's necessary for the
irq_chip methods to be invoked from hardirq context, even on a a
real-time kernel.  Because the spinlock_t type becomes a "sleeping"
spinlock w/ RT kernels, it is not suitable to be used with irq_chips.

A quick audit of the operations under the lock reveal that they do only
minimal, bounded work, and are therefore safe to do under a raw spinlock.

Signed-off-by: Julia Cartwright <julia@ni.com>
---
 drivers/gpio/gpio-zx.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 93de8be0d885..be3a87da8438 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -41,7 +41,7 @@
 #define ZX_GPIO_NR	16
 
 struct zx_gpio {
-	spinlock_t		lock;
+	raw_spinlock_t		lock;
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
@@ -56,11 +56,11 @@ static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
 	if (offset >= gc->ngpio)
 		return -EINVAL;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 	gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
 	gpiodir &= ~BIT(offset);
 	writew_relaxed(gpiodir, chip->base + ZX_GPIO_DIR);
-	spin_unlock_irqrestore(&chip->lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	return 0;
 }
@@ -75,7 +75,7 @@ static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
 	if (offset >= gc->ngpio)
 		return -EINVAL;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 	gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
 	gpiodir |= BIT(offset);
 	writew_relaxed(gpiodir, chip->base + ZX_GPIO_DIR);
@@ -84,7 +84,7 @@ static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
 		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO1);
 	else
 		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO0);
-	spin_unlock_irqrestore(&chip->lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	return 0;
 }
@@ -118,7 +118,7 @@ static int zx_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= ZX_GPIO_NR)
 		return -EINVAL;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 
 	gpioiev = readw_relaxed(chip->base + ZX_GPIO_IV);
 	gpiois = readw_relaxed(chip->base + ZX_GPIO_IVE);
@@ -151,7 +151,7 @@ static int zx_irq_type(struct irq_data *d, unsigned trigger)
 	writew_relaxed(gpioi_epos, chip->base + ZX_GPIO_IEP);
 	writew_relaxed(gpioi_eneg, chip->base + ZX_GPIO_IEN);
 	writew_relaxed(gpioiev, chip->base + ZX_GPIO_IV);
-	spin_unlock_irqrestore(&chip->lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	return 0;
 }
@@ -184,12 +184,12 @@ static void zx_irq_mask(struct irq_data *d)
 	u16 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
 	u16 gpioie;
 
-	spin_lock(&chip->lock);
+	raw_spin_lock(&chip->lock);
 	gpioie = readw_relaxed(chip->base + ZX_GPIO_IM) | mask;
 	writew_relaxed(gpioie, chip->base + ZX_GPIO_IM);
 	gpioie = readw_relaxed(chip->base + ZX_GPIO_IE) & ~mask;
 	writew_relaxed(gpioie, chip->base + ZX_GPIO_IE);
-	spin_unlock(&chip->lock);
+	raw_spin_unlock(&chip->lock);
 }
 
 static void zx_irq_unmask(struct irq_data *d)
@@ -199,12 +199,12 @@ static void zx_irq_unmask(struct irq_data *d)
 	u16 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
 	u16 gpioie;
 
-	spin_lock(&chip->lock);
+	raw_spin_lock(&chip->lock);
 	gpioie = readw_relaxed(chip->base + ZX_GPIO_IM) & ~mask;
 	writew_relaxed(gpioie, chip->base + ZX_GPIO_IM);
 	gpioie = readw_relaxed(chip->base + ZX_GPIO_IE) | mask;
 	writew_relaxed(gpioie, chip->base + ZX_GPIO_IE);
-	spin_unlock(&chip->lock);
+	raw_spin_unlock(&chip->lock);
 }
 
 static struct irq_chip zx_irqchip = {
@@ -230,7 +230,7 @@ static int zx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	spin_lock_init(&chip->lock);
+	raw_spin_lock_init(&chip->lock);
 	if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
 		chip->gc.request = gpiochip_generic_request;
 		chip->gc.free = gpiochip_generic_free;
-- 
2.11.1

