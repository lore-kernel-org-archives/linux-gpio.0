From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH 05/19] gpio: 104-dio-48e: make use of raw_spinlock
 variants
Date: Thu, 9 Mar 2017 13:35:04 -0500
Message-ID: <20170309183455.GA10973@sophia>
References: <cover.1489015238.git.julia@ni.com>
 <b0ce23678fb1703f761a5b380746cb0412651f09.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:33840 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753051AbdCISfM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2017 13:35:12 -0500
Content-Disposition: inline
In-Reply-To: <b0ce23678fb1703f761a5b380746cb0412651f09.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org

On Thu, Mar 09, 2017 at 10:21:52AM -0600, Julia Cartwright wrote:
>The 104-dio-48e gpio driver currently implements an irq_chip for
>handling interrupts; due to how irq_chip handling is done, it's
>necessary for the irq_chip methods to be invoked from hardirq context,
>even on a a real-time kernel.  Because the spinlock_t type becomes a
>"sleeping" spinlock w/ RT kernels, it is not suitable to be used with
>irq_chips.
>
>A quick audit of the operations under the lock reveal that they do only
>minimal, bounded work, and are therefore safe to do under a raw spinlock.
>
>Signed-off-by: Julia Cartwright <julia@ni.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

>---
> drivers/gpio/gpio-104-dio-48e.c | 38 +++++++++++++++++++-------------------
> 1 file changed, 19 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
>index 17bd2ab4ebe2..61b50c40b87b 100644
>--- a/drivers/gpio/gpio-104-dio-48e.c
>+++ b/drivers/gpio/gpio-104-dio-48e.c
>@@ -55,7 +55,7 @@ struct dio48e_gpio {
> 	unsigned char io_state[6];
> 	unsigned char out_state[6];
> 	unsigned char control[2];
>-	spinlock_t lock;
>+	raw_spinlock_t lock;
> 	unsigned base;
> 	unsigned char irq_mask;
> };
>@@ -78,7 +78,7 @@ static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> 	unsigned long flags;
> 	unsigned control;
> 
>-	spin_lock_irqsave(&dio48egpio->lock, flags);
>+	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> 
> 	/* Check if configuring Port C */
> 	if (io_port == 2 || io_port == 5) {
>@@ -103,7 +103,7 @@ static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> 	control &= ~BIT(7);
> 	outb(control, control_addr);
> 
>-	spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> 
> 	return 0;
> }
>@@ -120,7 +120,7 @@ static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
> 	unsigned long flags;
> 	unsigned control;
> 
>-	spin_lock_irqsave(&dio48egpio->lock, flags);
>+	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> 
> 	/* Check if configuring Port C */
> 	if (io_port == 2 || io_port == 5) {
>@@ -153,7 +153,7 @@ static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
> 	control &= ~BIT(7);
> 	outb(control, control_addr);
> 
>-	spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> 
> 	return 0;
> }
>@@ -167,17 +167,17 @@ static int dio48e_gpio_get(struct gpio_chip *chip, unsigned offset)
> 	unsigned long flags;
> 	unsigned port_state;
> 
>-	spin_lock_irqsave(&dio48egpio->lock, flags);
>+	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> 
> 	/* ensure that GPIO is set for input */
> 	if (!(dio48egpio->io_state[port] & mask)) {
>-		spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+		raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> 		return -EINVAL;
> 	}
> 
> 	port_state = inb(dio48egpio->base + in_port);
> 
>-	spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> 
> 	return !!(port_state & mask);
> }
>@@ -190,7 +190,7 @@ static void dio48e_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> 	const unsigned out_port = (port > 2) ? port + 1 : port;
> 	unsigned long flags;
> 
>-	spin_lock_irqsave(&dio48egpio->lock, flags);
>+	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> 
> 	if (value)
> 		dio48egpio->out_state[port] |= mask;
>@@ -199,7 +199,7 @@ static void dio48e_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> 
> 	outb(dio48egpio->out_state[port], dio48egpio->base + out_port);
> 
>-	spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> }
> 
> static void dio48e_gpio_set_multiple(struct gpio_chip *chip,
>@@ -225,14 +225,14 @@ static void dio48e_gpio_set_multiple(struct gpio_chip *chip,
> 		out_port = (port > 2) ? port + 1 : port;
> 		bitmask = mask[BIT_WORD(i)] & bits[BIT_WORD(i)];
> 
>-		spin_lock_irqsave(&dio48egpio->lock, flags);
>+		raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> 
> 		/* update output state data and set device gpio register */
> 		dio48egpio->out_state[port] &= ~mask[BIT_WORD(i)];
> 		dio48egpio->out_state[port] |= bitmask;
> 		outb(dio48egpio->out_state[port], dio48egpio->base + out_port);
> 
>-		spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+		raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> 
> 		/* prepare for next gpio register set */
> 		mask[BIT_WORD(i)] >>= gpio_reg_size;
>@@ -255,7 +255,7 @@ static void dio48e_irq_mask(struct irq_data *data)
> 	if (offset != 19 && offset != 43)
> 		return;
> 
>-	spin_lock_irqsave(&dio48egpio->lock, flags);
>+	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> 
> 	if (offset == 19)
> 		dio48egpio->irq_mask &= ~BIT(0);
>@@ -266,7 +266,7 @@ static void dio48e_irq_mask(struct irq_data *data)
> 		/* disable interrupts */
> 		inb(dio48egpio->base + 0xB);
> 
>-	spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> }
> 
> static void dio48e_irq_unmask(struct irq_data *data)
>@@ -280,7 +280,7 @@ static void dio48e_irq_unmask(struct irq_data *data)
> 	if (offset != 19 && offset != 43)
> 		return;
> 
>-	spin_lock_irqsave(&dio48egpio->lock, flags);
>+	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> 
> 	if (!dio48egpio->irq_mask) {
> 		/* enable interrupts */
>@@ -293,7 +293,7 @@ static void dio48e_irq_unmask(struct irq_data *data)
> 	else
> 		dio48egpio->irq_mask |= BIT(1);
> 
>-	spin_unlock_irqrestore(&dio48egpio->lock, flags);
>+	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
> }
> 
> static int dio48e_irq_set_type(struct irq_data *data, unsigned flow_type)
>@@ -329,11 +329,11 @@ static irqreturn_t dio48e_irq_handler(int irq, void *dev_id)
> 		generic_handle_irq(irq_find_mapping(chip->irqdomain,
> 			19 + gpio*24));
> 
>-	spin_lock(&dio48egpio->lock);
>+	raw_spin_lock(&dio48egpio->lock);
> 
> 	outb(0x00, dio48egpio->base + 0xF);
> 
>-	spin_unlock(&dio48egpio->lock);
>+	raw_spin_unlock(&dio48egpio->lock);
> 
> 	return IRQ_HANDLED;
> }
>@@ -388,7 +388,7 @@ static int dio48e_probe(struct device *dev, unsigned int id)
> 	dio48egpio->chip.set_multiple = dio48e_gpio_set_multiple;
> 	dio48egpio->base = base[id];
> 
>-	spin_lock_init(&dio48egpio->lock);
>+	raw_spin_lock_init(&dio48egpio->lock);
> 
> 	err = devm_gpiochip_add_data(dev, &dio48egpio->chip, dio48egpio);
> 	if (err) {
>-- 
>2.11.1
>
