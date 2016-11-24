From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Configure pin as GPIO input when used
 directly through irqchip
Date: Thu, 24 Nov 2016 10:16:28 +0200
Message-ID: <20161124081628.GE1476@lahna.fi.intel.com>
References: <20161109112231.122700-1-mika.westerberg@linux.intel.com>
 <CACRpkdZ_dXVGhSxrDbe579Y76SYpmSvFaF3dQyVguNkw9dq8_g@mail.gmail.com>
 <20161115112304.GE1446@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:20539 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933775AbcKXIQd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Nov 2016 03:16:33 -0500
Content-Disposition: inline
In-Reply-To: <20161115112304.GE1446@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Nov 15, 2016 at 01:23:04PM +0200, Mika Westerberg wrote:
> On Tue, Nov 15, 2016 at 09:40:27AM +0100, Linus Walleij wrote:
> > On Wed, Nov 9, 2016 at 12:22 PM, Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > 
> > > If a pin is used directly through irqchip without requesting it first as
> > > GPIO, it might be in wrong mode (for example input buffer disabled). This
> > > means the user may never get any interrupts.
> > >
> > > Fix this by configuring the pin as GPIO input when its type is first set in
> > > irq_set_type().
> > >
> > > Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > > Since we probably need to do this for cherryview and baytrail pinctrl
> > > drivers as well, I'm thinking is this something that the GPIO core could do
> > > automatically?
> > 
> > No it is a property of the irqchip core to set up the lines it needs
> > to use with hardware-specific code. It is a part of the contract that
> > the irqchip should always set up all the hardware it needs.
> > 
> > >From Documentation/gpio/driver.txt:
> > 
> > -----8<--------------------------8<--------------------------
> > It is legal for any IRQ consumer to request an IRQ from any irqchip no matter
> > if that is a combined GPIO+IRQ driver. The basic premise is that gpio_chip and
> > irq_chip are orthogonal, and offering their services independent of each
> > other.
> > 
> > gpiod_to_irq() is just a convenience function to figure out the IRQ for a
> > certain GPIO line and should not be relied upon to have been called before
> > the IRQ is used.
> > 
> > So always prepare the hardware and make it ready for action in respective
> > callbacks from the GPIO and irqchip APIs. Do not rely on gpiod_to_irq() having
> > been called first.
> > (...)
> > -----8<--------------------------8<--------------------------
> 
> OK, thanks for the detailed description.
> 
> > And I agree you should check the other drivers for the same problem.
> > 
> > > +/* Called with pctrl->lock held */
> > > +static void intel_gpio_set_gpio_mode(struct intel_pinctrl *pctrl,
> > > +                                    void __iomem *padcfg0)
> > > +{
> > > +       u32 value;
> > > +
> > > +       /* Put the pad into GPIO mode */
> > > +       value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
> > > +       /* Disable SCI/SMI/NMI generation */
> > > +       value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
> > > +       value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
> > > +       /* Disable TX buffer and enable RX (this will be input) */
> > > +       value &= ~PADCFG0_GPIORXDIS;
> > > +       value |= PADCFG0_GPIOTXDIS;
> > > +       writel(value, padcfg0);
> > > +}
> > 
> > Looks good.
> > 
> > > @@ -762,8 +776,10 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
> > >
> > >         raw_spin_lock_irqsave(&pctrl->lock, flags);
> > >
> > > -       value = readl(reg);
> > > +       /* Make sure the pin is GPIO input */
> > 
> > You already KNOW it is set as input, because you are implementing
> > .get_direction() in your gpiochip and the gpio descriptor thus contains
> > the (cached) direction setting.
> > 
> > When the GPIOLIB_IRQCHIP calles its request resources hook
> > it uses the gpiochip_lock_as_irq() call which verifies that the
> > line is indeed an input. Else it would deny it to be used as an IRQ.
> 
> Actually it is not always input. The problem Jarkko reported happens
> because the pin is actually configured as output by the BIOS originally
> (or left untouched). The pin is wired to a pin header on Joule where the
> BIOS does not know in advance what will be connected to it.

To follow up on this.

Since we use acpi_dev_gpio_irq_get() to get ACPI GpioInt() resource and
convert that to a Linux IRQ number, I think we can configure the pin
there as well (since we know that it is supposed to be used as GPIO
interrupt anyway).

Andy (Cc'd) is working on this among other ACPI GPIO related things.
