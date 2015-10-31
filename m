From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: Add IRQ support to ACCES 104-IDIO-16 driver
Date: Sat, 31 Oct 2015 09:43:09 -0400
Message-ID: <5634C56D.1030007@gmail.com>
References: <20151030000406.GA8699@sophia>
 <CACRpkdboA=2oFiT-ucfCenDphgO7nNqaQQP4cVYJFY6JOiYQ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:33283 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbbJaNnL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Oct 2015 09:43:11 -0400
Received: by ykft191 with SMTP id t191so101357605ykf.0
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2015 06:43:10 -0700 (PDT)
In-Reply-To: <CACRpkdboA=2oFiT-ucfCenDphgO7nNqaQQP4cVYJFY6JOiYQ7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 10/30/2015 10:36 AM, Linus Walleij wrote:
> With GPIOLIB_IRQCHIP the <linux/gpio/driver.h> take in so many headers that
> all of these are seldom needed. Try to trim it down to what is actually needed,
> I think only <linux/interrupt.h> should be needed.

I checked out <linux/gpio/driver.h> and it looks like it unconditionally
includes <linux/irq.h> and <linux/irqdomain.h>. I'll remove those includes from
my patch and leave <linux/interrupt.h> and <linux/irqdesc.h>.

> This with specifying IRQ as module parameter feels very, very retro.

You are absolutely correct: it is very retro. PC/104 was released in the late
'80s and lacks the functionality to probe for device configurations. Both the
base address and IRQ line are configured via physical jumpers on the ACCES
104-IDIO-16 board. It's essentially a living relic, but it's still popular in the
embedded computing industry so I'd like to support it.

>> +static void idio_16_irq_mask(struct irq_data *data)
>> +{
>> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
>> +       struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
>> +       const unsigned long GPIO_MASK = 1UL << irqd_to_hwirq(data);
> 
> Why const? Why uppercase GPIO_MASK, just lowercase "mask"
> works fine.

I'll rename the symbol to lowercase "mask" since I can see how uppercase can lead
to confusion between variables and preprocessor macros.

I'm hesitant to remove the const. Upon initialization, this variable is constant
for the entirety of its life, and the const qualifier shows that intent to both compilers and future readers. What is your justification for removing it?

> Looks more like you should prefer to just update the shadow registers
> idio16gpio->irq_mask etc in the mask/unmask calls, and write to the
> ports in the .irq_bus_lock() and .irq_bus_sync_unlock() callbacks.

I'm somewhat new to the irqchip API so correct me if I'm wrong. The irq_bus_lock
and irq_bus_sync_unlock callbacks are used for locking/unlocking access to slow
bus (i2c) chips. The port I/O operations I perform in the irq_mask and irq_unmask
callbacks are to respectively disable and enable interrupts. It appears more
appropriate to leave those port operations in irq_mask/irq_unmask since I want to
disable/enable interrupts, rather than to lock out access to the device.

> Please do not use implicit conventions.

I'll make the comparison explicit and add a comment.

> To me it looks very strange when you start handling all IRQs without
> actually reading any status register. Now you fire off *every* unmasked
> IRQ meaning their IRQ handlers will be called unconditionally.
> 
> Care to explain how this works?

When enabled, the change-of-state detection interrupt provided by the ACCES
104-IDIO-16 will fire off if *any* input line goes from low to high or high to
low. Unfortunately, the device provides no hardware means to differentiate
which input caused the interrupt to fire. My software solution is to maintain a
mask (irq_mask) which tracks which GPIO lines have been selected by the user to
be affected the interrupt (via the set_type callback) -- furthermore, disabling interrupts entirely when no GPIO are any longer selected by the user.

The downside to this approach is that if multiple GPIO lines are selected, then
all of those GPIO IRQ handlers are called; I don't believe this can be avoided in
software since there is no hardware differentiation. What are your thoughts?

>> +       spin_lock(&idio16gpio->lock);
>> +
>> +       outb(0, idio16gpio->base + 1);
> 
> What happens here?

This is an IRQ acknowledgment sent to the device in order to clear the pending
interrupt. I'll move it to the more appropriate irq_ack callback.

>> +       err = gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
>> +               handle_simple_irq, IRQ_TYPE_NONE);
> 
> I think you want to specify handle_edge_irq() and for that to work you also
> need to implement .irq_ack() on the irqchip.
> 
> You just specified above that this chip only handles edge IRQs, so it makes
> no sense that you do not use handle_edge_irq.

Agreed. I'll update my patch to provide an implementation for irq_ack and to pass handle_edge_irq.

Sincerely,

William Breathitt Gray
