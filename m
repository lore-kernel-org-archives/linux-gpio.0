From: Ken Xue <Ken.Xue@amd.com>
Subject: Re: [PATCH V2] pinctrl: add AMD GPIO driver support.
Date: Tue, 10 Mar 2015 14:43:31 +0800
Message-ID: <1425969811.14295.8.camel@kxue-X58A-UD3R>
References: <1422949788.18208.4.camel@kxue-X58A-UD3R>
	 <1423111885.18208.41.camel@kxue-X58A-UD3R>
	 <1425452005.24903.4.camel@kxue-X58A-UD3R>
	 <CACRpkdZiSaMUQxU5HHuMn0kZhdXqAX6OYVQGmoNriP0jamuHPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0131.outbound.protection.outlook.com ([65.55.169.131]:52175
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751531AbbCJHJq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Mar 2015 03:09:46 -0400
In-Reply-To: <CACRpkdZiSaMUQxU5HHuMn0kZhdXqAX6OYVQGmoNriP0jamuHPA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, 2015-03-09 at 16:02 +0100, Linus Walleij wrote:
> On Wed, Mar 4, 2015 at 7:53 AM, Ken Xue <Ken.Xue@amd.com> wrote:
> 
> > From c2258b4b550d8f61a5eb64fee25d4c0fdd3a1e91 Mon Sep 17 00:00:00 2001
> > From: Ken Xue <Ken.Xue@amd.com>
> > Date: Wed, 4 Mar 2015 14:48:36 +0800
> > Subject: [PATCH] pinctrl: add AMD GPIO driver support.
> >
> > KERNCZ GPIO is a new IP from AMD. it can be implemented in both x86 and ARM.
> > Current driver patch only support GPIO in x86.
> >
> > Signed-off-by: Ken Xue <Ken.Xue@amd.com>

> > +#include <linux/io.h>
> > +#include <linux/gpio.h>
> 
> Should still be #include <linux/gpio/driver.h>
> isn't it compiling like so?
> 
ok. i will change <linux/gpio.h> to <linux/gpio/driver.h>.
And then i shall add <linux/pinctrl/pinctrl.h> for macro PINCTRL_PIN and
add <asm-generic/gpio.h> for "gpiochip_add_pin_range".

> > +static void amd_gpio_irq_mask(struct irq_data *d)
> > +{
> > +       u32 pin_reg;
> > +       unsigned long flags;
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> > +
> > +       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +       pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> > +       pin_reg &= ~(1UL << INTERRUPT_MASK_OFF);
> > +       writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
> > +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> > +}
> > +
> > +static void amd_gpio_irq_unmask(struct irq_data *d)
> > +{
> > +       u32 pin_reg;
> > +       unsigned long flags;
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> > +
> > +       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +       pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> > +       pin_reg |= 1UL << INTERRUPT_MASK_OFF;
> > +       writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
> > +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> > +}
> 
> I don't know if it's necessary to implement both enable/disable
> and mask/unmask. I guess you should only mask in the
> mask() function and only enable in the enable() function then.
AMD GPIO interrupt is masked by default. I want to unmask GPIO interrupt
when irq is enabled. So that, interrupt can work right after driver
request_threaded_irq.


