From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio: lynxpoint: lock IRQs when starting them
Date: Tue, 26 Nov 2013 14:58:17 +0200
Message-ID: <20131126125817.GZ2281@intel.com>
References: <1385461419-5979-1-git-send-email-linus.walleij@linaro.org>
 <20131126114926.GY2281@intel.com>
 <CACRpkdZi-+cMnuCXCnX_zaEeAq+CSkZe7k50b09fHGnZbZG=Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:13041 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756346Ab3KZMvj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Nov 2013 07:51:39 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZi-+cMnuCXCnX_zaEeAq+CSkZe7k50b09fHGnZbZG=Mg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Nov 26, 2013 at 01:27:21PM +0100, Linus Walleij wrote:
> On Tue, Nov 26, 2013 at 12:49 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Tue, Nov 26, 2013 at 11:23:39AM +0100, Linus Walleij wrote:
> 
> >> +static unsigned int lp_irq_startup(struct irq_data *d)
> >> +{
> >> +     struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
> >> +
> >> +     if (gpio_lock_as_irq(&lg->chip, irqd_to_hwirq(d)))
> >> +             dev_err(lg->chip.dev,
> >> +                     "unable to lock HW IRQ %lu for IRQ\n",
> >> +                     irqd_to_hwirq(d));
> >> +     lp_irq_enable(d);
> >
> > I may be missing something but doesn't this now end up calling
> > lp_irq_enable() twice? First in ->irq_startup() and then later on in
> > ->irq_enable().
> 
> kernel/irq/chip.c:
> 
> int irq_startup(struct irq_desc *desc, bool resend)
> {
>         int ret = 0;
> 
>         irq_state_clr_disabled(desc);
>         desc->depth = 0;
> 
>         if (desc->irq_data.chip->irq_startup) {
>                 ret = desc->irq_data.chip->irq_startup(&desc->irq_data);
>                 irq_state_clr_masked(desc);
>         } else {
>                 irq_enable(desc);
>         }
>         if (resend)
>                 check_irq_resend(desc, desc->irq_data.irq);
>         return ret;
> }
> 
> If this hook exists, calls irq_startup() on the chip.
> Else, calls irq_enable() which looks like this:
> 
> void irq_enable(struct irq_desc *desc)
> {
>         irq_state_clr_disabled(desc);
>         if (desc->irq_data.chip->irq_enable)
>                 desc->irq_data.chip->irq_enable(&desc->irq_data);
>         else
>                 desc->irq_data.chip->irq_unmask(&desc->irq_data);
>         irq_state_clr_masked(desc);
> }
> 
> I.e. calls .enable() or .unmask().
> 
> So there is a strict semantic requirement that if you implement
> startup() it should perform the same as .enable(), or .unmask()
> depending on whether the former is implemented.

Thanks for the explanation, got it now :)

> I think this patch is OK ... can you test it on the Lynxpoint?

Tried on haswell/lynxpoint with a slightly modified i2c-hid driver (so that
it is able to use GPIOs as interrupts) and here's what I got:

# cat /sys/kernel/debug/gpio 
GPIOs 162-255, platform/INT33C7:00, INT33C7:00:
 gpio-217 (hid-irq             ) in  hi IRQ

Also the device itself works, so

Tested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
