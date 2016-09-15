From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/2] gpiolib: Add possibility to mask which GPIOs are
 added to IRQ domain
Date: Thu, 15 Sep 2016 20:50:31 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609152048170.5483@nanos>
References: <CACRpkdZBbcL87Hq94sFYdDOWnC7S_JGtArTNMimAps663UQNgw@mail.gmail.com> <20160915155210.94413-1-mika.westerberg@linux.intel.com> <57DAC75E.5080203@arm.com> <20160915181244.GI1811@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160915181244.GI1811@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 15 Sep 2016, Mika Westerberg wrote:
> On Thu, Sep 15, 2016 at 05:07:58PM +0100, Marc Zyngier wrote:
> > Mika,
> > 
> > On 15/09/16 16:52, Mika Westerberg wrote:
> > > When using GPIO irqchip helpers to setup irqchip for a gpiolib based
> > > driver, it is not possible to select which GPIOs to add to the IRQ domain.
> > > Instead it just adds all GPIOs which is not always desired. For example
> > > there might be GPIOs that for some reason just cannot be used as interrupts
> > > at all.
> > > 
> > > To make this possible we add valid_mask to each gpio_chip and by default
> > > assume all GPIOs can be used as interrupts. Drivers can then tune this
> > > using clear_bit() or similar before they call gpiochip_irqchip_add().
> > > 
> > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > >  drivers/gpio/gpiolib.c      | 32 +++++++++++++++++++++++++++++---
> > >  include/linux/gpio/driver.h |  1 +
> > >  2 files changed, 30 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index 53ff25ac66d8..d84c23b47f44 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -1186,6 +1186,18 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
> > >  		if (status)
> > >  			goto err_remove_chip;
> > >  	}
> > > +
> > > +#ifdef CONFIG_GPIOLIB_IRQCHIP
> > > +	chip->valid_mask = kcalloc(BITS_TO_LONGS(chip->ngpio), sizeof(long),
> > > +				   GFP_KERNEL);
> > 
> > Do we really want to make this a mandatory thing? In most cases, I'd
> > expect this valid_mask to have all bits set, so you might as well not
> > allocate it at all in that case (and only allocate it if you actually
> > need it).
> 
> We can make drivers to allocate it and only if set use it in core.

Make it a flag in gpio_chip which allocates it here when requested so we
don't end up with driver writers getting the alloc/free/error handling
wrong over and over.

Thanks,

	tglx
