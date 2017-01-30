From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/1] pinctrl: baytrail: Add spinlock usage to all
 read/write access
Date: Mon, 30 Jan 2017 11:26:58 +0200
Message-ID: <20170130092658.GH17297@lahna.fi.intel.com>
References: <20170126141418.5624-1-alexander.stein@systec-electronic.com>
 <20170126205219.GO17297@lahna.fi.intel.com>
 <2074921.aDOmsAzkmM@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:1797 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752550AbdA3J1C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Jan 2017 04:27:02 -0500
Content-Disposition: inline
In-Reply-To: <2074921.aDOmsAzkmM@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Mon, Jan 30, 2017 at 07:50:18AM +0100, Alexander Stein wrote:
> Hi,
> 
> On Thursday 26 January 2017 22:52:19, Mika Westerberg wrote:
> > On Thu, Jan 26, 2017 at 03:14:18PM +0100, Alexander Stein wrote:
> > > According to VLI64 Intel Atom E3800 Specification Update (#329901)
> > > concurrent read accesses may result in returning 0xffffffff and write
> > > accesses may be dropped silently.
> > > To workaround all accesses must be protected by locks.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> > > ---
> > > I actually had the case where the read access in byt_irq_unmask returned
> > > 0xffffffff. After OR'ing the trigger bits and writing 0xffffffff back to
> > > BYT_CONF0_REG things started to act strange.
> > > 
> > >  drivers/pinctrl/intel/pinctrl-baytrail.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c
> > > b/drivers/pinctrl/intel/pinctrl-baytrail.c index 6cce314..7294c88 100644
> > > --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> > > +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> > > @@ -1594,6 +1594,7 @@ static void byt_gpio_irq_handler(struct irq_desc
> > > *desc)> 
> > >  	void __iomem *reg;
> > >  	unsigned long pending;
> > >  	unsigned int virq;
> > > 
> > > +	unsigned long flags;
> > 
> > Can you move this variable after "pending" like:
> > 
> >   	unsigned long pending;
> > 	unsigned long flags;
> >   	unsigned int virq;
> 
> Sure, I understand why both unsigned longs are put together here...
> 
> > >  	/* check from GPIO controller which pin triggered the interrupt */
> > >  	for (base = 0; base < vg->chip.ngpio; base += 32) {
> > > 
> > [...]
> > > @@ -1620,6 +1623,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio
> > > *vg)
> > > 
> > >  	void __iomem *reg;
> > >  	u32 base, value;
> > >  	int i;
> > > 
> > > +	unsigned long flags;
> > 
> > Here also arrange it like
> > 
> > 	unsigned long flags;
> >   	void __iomem *reg;
> >   	u32 base, value;
> >   	int i;
> 
> but here I'm not so sure. What are the rules for variable declaration order?

Looks better that way.

> > >  	/*
> > >  	
> > >  	 * Clear interrupt triggers for all pins that are GPIOs and
> > > 
> > > @@ -1637,7 +1641,9 @@ static void byt_gpio_irq_init_hw(struct byt_gpio
> > > *vg)
> > > 
> > >  			continue;
> > >  		
> > >  		}
> > > 
> > > +		raw_spin_lock_irqsave(&vg->lock, flags);
> > 
> > Is this really necessary as we are initializing the driver?
> 
> I don't know. I guess this also depends if the previous call to 
> pinctrl_register (in byt_pinctrl_probe) could cause a call into that driver.
> In the end I just wrapped _all_ accesses with locks, even suspend/resume 
> although I don't know if that would be necessary.

OK, let's try to lock only where we know we need it. I guess both the
initializiation and suspend/resume does not need locking. Other places
do.
