From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH 10/19] gpio: ws16c48: make use of raw_spinlock variants
Date: Thu, 9 Mar 2017 13:36:16 -0500
Message-ID: <20170309183616.GB10973@sophia>
References: <cover.1489015238.git.julia@ni.com>
 <90f09a1e378d9858c4d79bd02e31512b96ef8de3.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:36189 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750781AbdCISm1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2017 13:42:27 -0500
Content-Disposition: inline
In-Reply-To: <90f09a1e378d9858c4d79bd02e31512b96ef8de3.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org

On Thu, Mar 09, 2017 at 10:21:57AM -0600, Julia Cartwright wrote:
>The ws16c48 gpio driver currently implements an irq_chip for handling
>interrupts; due to how irq_chip handling is done, it's necessary for the
>irq_chip methods to be invoked from hardirq context, even on a a
>real-time kernel.  Because the spinlock_t type becomes a "sleeping"
>spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
>
>A quick audit of the operations under the lock reveal that they do only
>minimal, bounded work, and are therefore safe to do under a raw spinlock.
>
>Signed-off-by: Julia Cartwright <julia@ni.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

>---
> drivers/gpio/gpio-ws16c48.c | 46 ++++++++++++++++++++++-----------------------
> 1 file changed, 23 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
>index 901b5ccb032d..87d63695dfcf 100644
>--- a/drivers/gpio/gpio-ws16c48.c
>+++ b/drivers/gpio/gpio-ws16c48.c
>@@ -51,7 +51,7 @@ struct ws16c48_gpio {
> 	struct gpio_chip chip;
> 	unsigned char io_state[6];
> 	unsigned char out_state[6];
>-	spinlock_t lock;
>+	raw_spinlock_t lock;
> 	unsigned long irq_mask;
> 	unsigned long flow_mask;
> 	unsigned base;
>@@ -73,13 +73,13 @@ static int ws16c48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> 	const unsigned mask = BIT(offset % 8);
> 	unsigned long flags;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	ws16c48gpio->io_state[port] |= mask;
> 	ws16c48gpio->out_state[port] &= ~mask;
> 	outb(ws16c48gpio->out_state[port], ws16c48gpio->base + port);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 
> 	return 0;
> }
>@@ -92,7 +92,7 @@ static int ws16c48_gpio_direction_output(struct gpio_chip *chip,
> 	const unsigned mask = BIT(offset % 8);
> 	unsigned long flags;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	ws16c48gpio->io_state[port] &= ~mask;
> 	if (value)
>@@ -101,7 +101,7 @@ static int ws16c48_gpio_direction_output(struct gpio_chip *chip,
> 		ws16c48gpio->out_state[port] &= ~mask;
> 	outb(ws16c48gpio->out_state[port], ws16c48gpio->base + port);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 
> 	return 0;
> }
>@@ -114,17 +114,17 @@ static int ws16c48_gpio_get(struct gpio_chip *chip, unsigned offset)
> 	unsigned long flags;
> 	unsigned port_state;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	/* ensure that GPIO is set for input */
> 	if (!(ws16c48gpio->io_state[port] & mask)) {
>-		spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+		raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 		return -EINVAL;
> 	}
> 
> 	port_state = inb(ws16c48gpio->base + port);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 
> 	return !!(port_state & mask);
> }
>@@ -136,11 +136,11 @@ static void ws16c48_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> 	const unsigned mask = BIT(offset % 8);
> 	unsigned long flags;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	/* ensure that GPIO is set for output */
> 	if (ws16c48gpio->io_state[port] & mask) {
>-		spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+		raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 		return;
> 	}
> 
>@@ -150,7 +150,7 @@ static void ws16c48_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> 		ws16c48gpio->out_state[port] &= ~mask;
> 	outb(ws16c48gpio->out_state[port], ws16c48gpio->base + port);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> }
> 
> static void ws16c48_gpio_set_multiple(struct gpio_chip *chip,
>@@ -178,14 +178,14 @@ static void ws16c48_gpio_set_multiple(struct gpio_chip *chip,
> 		iomask = mask[BIT_WORD(i)] & ~ws16c48gpio->io_state[port];
> 		bitmask = iomask & bits[BIT_WORD(i)];
> 
>-		spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+		raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 		/* update output state data and set device gpio register */
> 		ws16c48gpio->out_state[port] &= ~iomask;
> 		ws16c48gpio->out_state[port] |= bitmask;
> 		outb(ws16c48gpio->out_state[port], ws16c48gpio->base + port);
> 
>-		spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+		raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 
> 		/* prepare for next gpio register set */
> 		mask[BIT_WORD(i)] >>= gpio_reg_size;
>@@ -207,7 +207,7 @@ static void ws16c48_irq_ack(struct irq_data *data)
> 	if (port > 2)
> 		return;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	port_state = ws16c48gpio->irq_mask >> (8*port);
> 
>@@ -216,7 +216,7 @@ static void ws16c48_irq_ack(struct irq_data *data)
> 	outb(port_state | mask, ws16c48gpio->base + 8 + port);
> 	outb(0xC0, ws16c48gpio->base + 7);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> }
> 
> static void ws16c48_irq_mask(struct irq_data *data)
>@@ -232,7 +232,7 @@ static void ws16c48_irq_mask(struct irq_data *data)
> 	if (port > 2)
> 		return;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	ws16c48gpio->irq_mask &= ~mask;
> 
>@@ -240,7 +240,7 @@ static void ws16c48_irq_mask(struct irq_data *data)
> 	outb(ws16c48gpio->irq_mask >> (8*port), ws16c48gpio->base + 8 + port);
> 	outb(0xC0, ws16c48gpio->base + 7);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> }
> 
> static void ws16c48_irq_unmask(struct irq_data *data)
>@@ -256,7 +256,7 @@ static void ws16c48_irq_unmask(struct irq_data *data)
> 	if (port > 2)
> 		return;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	ws16c48gpio->irq_mask |= mask;
> 
>@@ -264,7 +264,7 @@ static void ws16c48_irq_unmask(struct irq_data *data)
> 	outb(ws16c48gpio->irq_mask >> (8*port), ws16c48gpio->base + 8 + port);
> 	outb(0xC0, ws16c48gpio->base + 7);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> }
> 
> static int ws16c48_irq_set_type(struct irq_data *data, unsigned flow_type)
>@@ -280,7 +280,7 @@ static int ws16c48_irq_set_type(struct irq_data *data, unsigned flow_type)
> 	if (port > 2)
> 		return -EINVAL;
> 
>-	spin_lock_irqsave(&ws16c48gpio->lock, flags);
>+	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
> 
> 	switch (flow_type) {
> 	case IRQ_TYPE_NONE:
>@@ -292,7 +292,7 @@ static int ws16c48_irq_set_type(struct irq_data *data, unsigned flow_type)
> 		ws16c48gpio->flow_mask &= ~mask;
> 		break;
> 	default:
>-		spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+		raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 		return -EINVAL;
> 	}
> 
>@@ -300,7 +300,7 @@ static int ws16c48_irq_set_type(struct irq_data *data, unsigned flow_type)
> 	outb(ws16c48gpio->flow_mask >> (8*port), ws16c48gpio->base + 8 + port);
> 	outb(0xC0, ws16c48gpio->base + 7);
> 
>-	spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
> 
> 	return 0;
> }
>@@ -387,7 +387,7 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
> 	ws16c48gpio->chip.set_multiple = ws16c48_gpio_set_multiple;
> 	ws16c48gpio->base = base[id];
> 
>-	spin_lock_init(&ws16c48gpio->lock);
>+	raw_spin_lock_init(&ws16c48gpio->lock);
> 
> 	err = devm_gpiochip_add_data(dev, &ws16c48gpio->chip, ws16c48gpio);
> 	if (err) {
>-- 
>2.11.1
>
