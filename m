From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Configure pin as GPIO input when used
 directly through irqchip
Date: Tue, 15 Nov 2016 13:23:04 +0200
Message-ID: <20161115112304.GE1446@lahna.fi.intel.com>
References: <20161109112231.122700-1-mika.westerberg@linux.intel.com>
 <CACRpkdZ_dXVGhSxrDbe579Y76SYpmSvFaF3dQyVguNkw9dq8_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:45342 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752837AbcKOLXI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Nov 2016 06:23:08 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZ_dXVGhSxrDbe579Y76SYpmSvFaF3dQyVguNkw9dq8_g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 15, 2016 at 09:40:27AM +0100, Linus Walleij wrote:
> On Wed, Nov 9, 2016 at 12:22 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > If a pin is used directly through irqchip without requesting it first as
> > GPIO, it might be in wrong mode (for example input buffer disabled). This
> > means the user may never get any interrupts.
> >
> > Fix this by configuring the pin as GPIO input when its type is first set in
> > irq_set_type().
> >
> > Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> > Since we probably need to do this for cherryview and baytrail pinctrl
> > drivers as well, I'm thinking is this something that the GPIO core could do
> > automatically?
> 
> No it is a property of the irqchip core to set up the lines it needs
> to use with hardware-specific code. It is a part of the contract that
> the irqchip should always set up all the hardware it needs.
> 
> >From Documentation/gpio/driver.txt:
> 
> -----8<--------------------------8<--------------------------
> It is legal for any IRQ consumer to request an IRQ from any irqchip no matter
> if that is a combined GPIO+IRQ driver. The basic premise is that gpio_chip and
> irq_chip are orthogonal, and offering their services independent of each
> other.
> 
> gpiod_to_irq() is just a convenience function to figure out the IRQ for a
> certain GPIO line and should not be relied upon to have been called before
> the IRQ is used.
> 
> So always prepare the hardware and make it ready for action in respective
> callbacks from the GPIO and irqchip APIs. Do not rely on gpiod_to_irq() having
> been called first.
> (...)
> -----8<--------------------------8<--------------------------

OK, thanks for the detailed description.

> And I agree you should check the other drivers for the same problem.
> 
> > +/* Called with pctrl->lock held */
> > +static void intel_gpio_set_gpio_mode(struct intel_pinctrl *pctrl,
> > +                                    void __iomem *padcfg0)
> > +{
> > +       u32 value;
> > +
> > +       /* Put the pad into GPIO mode */
> > +       value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
> > +       /* Disable SCI/SMI/NMI generation */
> > +       value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
> > +       value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
> > +       /* Disable TX buffer and enable RX (this will be input) */
> > +       value &= ~PADCFG0_GPIORXDIS;
> > +       value |= PADCFG0_GPIOTXDIS;
> > +       writel(value, padcfg0);
> > +}
> 
> Looks good.
> 
> > @@ -762,8 +776,10 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
> >
> >         raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> > -       value = readl(reg);
> > +       /* Make sure the pin is GPIO input */
> 
> You already KNOW it is set as input, because you are implementing
> .get_direction() in your gpiochip and the gpio descriptor thus contains
> the (cached) direction setting.
> 
> When the GPIOLIB_IRQCHIP calles its request resources hook
> it uses the gpiochip_lock_as_irq() call which verifies that the
> line is indeed an input. Else it would deny it to be used as an IRQ.

Actually it is not always input. The problem Jarkko reported happens
because the pin is actually configured as output by the BIOS originally
(or left untouched). The pin is wired to a pin header on Joule where the
BIOS does not know in advance what will be connected to it.

> > +       intel_gpio_set_gpio_mode(pctrl, reg);
> >
> > +       value = readl(reg);
> >         value &= ~(PADCFG0_RXEVCFG_MASK | PADCFG0_RXINV);
> 
> Why is this setting done in .irq_set_type() rather than .irq_enable()
> from the irqchip? I'd say implement .irq_enable() with just this call to
> intel_gpio_set_gpio_mode() in it.

OK, I'll move it to .irq_enable() instead.
