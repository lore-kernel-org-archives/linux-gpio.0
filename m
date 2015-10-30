From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add IRQ support to ACCES 104-IDIO-16 driver
Date: Fri, 30 Oct 2015 15:36:40 +0100
Message-ID: <CACRpkdboA=2oFiT-ucfCenDphgO7nNqaQQP4cVYJFY6JOiYQ7g@mail.gmail.com>
References: <20151030000406.GA8699@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35305 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759224AbbJ3Ogk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 10:36:40 -0400
Received: by oifu63 with SMTP id u63so60748492oif.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 07:36:40 -0700 (PDT)
In-Reply-To: <20151030000406.GA8699@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 30, 2015 at 1:04 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDIO-16 series offers Change-of-State detection interrupt
> functionality; if Change-of-State detection is enabled, an interrupt is
> fired off if any input line changes state (i.e. goes from low to high,
> or from high to low). This patch adds support to handle these interrupts
> and allows the user to mask which GPIO lines are affected. The interrupt
> line number for the device may be set via the idio_16_irq module
> parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Overall this is looking nice.

>  config GPIO_104_IDIO_16
>         tristate "ACCES 104-IDIO-16 GPIO support"
>         depends on X86
> +       select GPIOLIB_IRQCHIP

Thanks for using this helper library.

> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdesc.h>
> +#include <linux/irqdomain.h>

With GPIOLIB_IRQCHIP the <linux/gpio/driver.h> take in so many headers that
all of these are seldom needed. Try to trim it down to what is actually needed,
I think only <linux/interrupt.h> should be needed.

> +static unsigned idio_16_irq;
> +module_param(idio_16_irq, uint, 0);
> +MODULE_PARM_DESC(idio_16_irq, "ACCES 104-IDIO-16 interrupt line number");

This with specifying IRQ as module parameter feels very, very retro.

Is there no way to get the portbase and IRQ from the system *at all*?

Isn't things like ACPI supposed to do this...

I've seen this before so I just need to ask twice. I understand if this
is how you have to do it, but I wanna make sure.

> +static void idio_16_irq_mask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
> +       const unsigned long GPIO_MASK = 1UL << irqd_to_hwirq(data);

Why const? Why uppercase GPIO_MASK, just lowercase "mask"
works fine.

unsigned long mask = BIT(irqd_to_hwirq(data));

Should be equal.

> +       unsigned long flags;
> +
> +       idio16gpio->irq_mask &= ~GPIO_MASK;
> +
> +       if (!idio16gpio->irq_mask) {
> +               spin_lock_irqsave(&idio16gpio->lock, flags);
> +
> +               outb(0, idio16gpio->base + 2);
> +
> +               spin_unlock_irqrestore(&idio16gpio->lock, flags);
> +       }
> +}
> +
> +static void idio_16_irq_unmask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
> +       const unsigned long GPIO_MASK = 1UL << irqd_to_hwirq(data);
> +       const unsigned long PREV_IRQ_MASK = idio16gpio->irq_mask;
> +       unsigned long flags;
> +
> +       idio16gpio->irq_mask |= GPIO_MASK;
> +
> +       if (!PREV_IRQ_MASK) {
> +               spin_lock_irqsave(&idio16gpio->lock, flags);
> +
> +               outb(0, idio16gpio->base + 1);
> +               inb(idio16gpio->base + 2);
> +
> +               spin_unlock_irqrestore(&idio16gpio->lock, flags);
> +       }
> +}

Looks more like you should prefer to just update the shadow registers
idio16gpio->irq_mask etc in the mask/unmask calls, and write to the
ports in the .irq_bus_lock() and .irq_bus_sync_unlock() callbacks.

Thoughts on this?

> +static int idio_16_irq_set_type(struct irq_data *data, unsigned flow_type)
> +{
> +       if (flow_type && (flow_type & IRQ_TYPE_EDGE_BOTH) != IRQ_TYPE_EDGE_BOTH)

Please do not use implicit conventions.

if (flow_type != IRQ_TYPE_NODE && (...

is better. Then I understand what is going on.

What is clear is that either no type is specified or both edges, or it
doesn't work. You could add a comment on this, that is helpful.

> +static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
> +{
> +       struct idio_16_gpio *const idio16gpio = dev_id;
> +       struct gpio_chip *const chip = &idio16gpio->chip;
> +       int gpio;
> +
> +       for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
> +               generic_handle_irq(irq_find_mapping(chip->irqdomain, gpio));

To me it looks very strange when you start handling all IRQs without
actually reading any status register. Now you fire off *every* unmasked
IRQ meaning their IRQ handlers will be called unconditionally.

Care to explain how this works?

> +
> +       spin_lock(&idio16gpio->lock);
> +
> +       outb(0, idio16gpio->base + 1);

What happens here?

> +       err = gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
> +               handle_simple_irq, IRQ_TYPE_NONE);

I think you want to specify handle_edge_irq() and for that to work you also
need to implement .irq_ack() on the irqchip.

You just specified above that this chip only handles edge IRQs, so it makes
no sense that you do not use handle_edge_irq.

Yours,
Linus Walleij
