From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH] regmap: regmap-irq/gpio-max77620: add level-irq support
Date: Tue, 11 Dec 2018 10:44:30 +0200
Message-ID: <20181211084430.GC32557@localhost.localdomain>
References: <20181210081437.GA32228@localhost.localdomain>
 <e378d050-01b4-9a6c-1c17-1f1ca04dd16e@mentor.com>
 <20181211063825.GA32557@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181211063825.GA32557@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: mazziesaccount@gmail.com, broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: linux-gpio@vger.kernel.org

Hello Again All,

Sorry for multiple posts but I had second look at this and...

On Tue, Dec 11, 2018 at 08:38:25AM +0200, Matti Vaittinen wrote:
> Hello Vladimir,
> 
> Thanks for the review.
> 
> On Mon, Dec 10, 2018 at 05:16:28PM +0200, Vladimir Zapolskiy wrote:
> > On 12/10/2018 10:14 AM, Matti Vaittinen wrote:
> > > Add level active IRQ support to regmap-irq irqchip. Change breaks
> > > existing regmap-irq type setting. Convert the existing drivers which
> > > use regmap-irq with trigger type setting (gpio-max77620) to work
> > > with this new approach. So we do not magically support level-active
> > > IRQs on gpio-max77620 - but add support to the regmap-irq for chips
> > > which support them =)
> > > 
> > > We do not support distinguishing situation where HW supports rising
> > > and falling edge detection but not both. Separating this would require
> > > inventing yet another flags for IRQ types.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > > I did both the regmap-irq and max77620 changes in same commit because
> > > I'd rather not cause spot where max77620 breaks. Besides the changes in
> > > max77620 driver are trivial. Please let me know if this is not Ok.
> > > 
> > > Reason why I submit this patch now - even though my driver which would
> > > use level active type setting with regmap-irq is not yet ready for
> > > being submited - is that I'd like to minimize amount of existing drivers
> > > we need to patch. And if we add level active irq support like this then
> > > we must patch all existing drivers using type setting with regmap-irq.
> > > So doing this now when only max77620 uses type setting may be easier
> > > than postponing this to the future.
> > > 
> > > And finally - I don't have max77620 so I have only done _wery_ limited
> > > testing. So I would really appreciate if someone had time to review this
> > > thoroughly - and even happier if someone had possibility to try this out
> > > with the max77620.
> > > 
> > 
> > [snip]
> > 
> > > diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> > > index a367d59c301d..91c431ad98c3 100644
> > > --- a/include/linux/regmap.h
> > > +++ b/include/linux/regmap.h
> > > @@ -1098,6 +1098,9 @@ int regmap_fields_update_bits_base(struct regmap_field *field,  unsigned int id,
> > >   * @type_reg_offset: Offset register for the irq type setting.
> > >   * @type_rising_mask: Mask bit to configure RISING type irq.
> > >   * @type_falling_mask: Mask bit to configure FALLING type irq.
> > > + * @type_level_low_mask: Mask bit to configure LEVEL_LOW type irq.
> > > + * @type_level_high_mask: Mask bit to configure LEVEL_HIGH type irq.
> > > + * @types_supported: logical OR of IRQ_TYPE_* flags indicating supported types.
> > 
> > While the existing interface is awful, you don't make it better.
> > 
> > .types_supported value is always derived from non-zero .type_*_mask values, so
> > it is simply not needed, as well as the whole change to gpio-max77620.c driver.
> 
> Right. I didn't consider the "type_inverted" flag in the struct
> regmap_irq_chip. I thought that "mask" is actually a register value -
> which could be zero for some HWs. Thanks for pointing that out. It will
> really make "types_supported" useless.

After second check - type_inverted won't help if we have case where
both the 'all bits set' and 'all bits zeroed' are valid type specifiers.
We *could* have HW register specified as:

IRQ Trigger control reg:

bits [7:2] reserved - don't touch, undocumented magic debug stuff
bits [1:0] IRQ trigger type:
  00 => Rising Edge
  01 => Falling Edge
  10 => Level Low
  11 => Level High.

For such setup we would have:

type_rising_mask = 0x0,
type_falling_mask = 0x1,
type_level_low_mask = 0x2,
type_level_high_mask = 0x3,

- and I see no way of tellng the type_rising_mask is valid.

I admit this is actually not pretty. We don't really give *mask* here
but we give the actual configuration value - and actually, for example
transitioning from falling to low would make HW to wrongly go to
type_level_high - if the values here were really regarded as *masks*.

But when we look at the implementation, we are treating these masks as
actual values - so code does the correct thing and zeroes the whole
'type area':

        d->type_buf[reg] &= ~(irq_data->type_falling_mask |
                              irq_data->type_rising_mask |
                              irq_data->type_level_low_mask |
                              irq_data->type_level_high_mask);

before applying the desired mask (value):

        switch (type) {
        case IRQ_TYPE_EDGE_FALLING:
                d->type_buf[reg] |= irq_data->type_falling_mask;
                break;
	...

So I would still go by adding the types_supported field to advertice
also those types which are set using value '0'. I would additionally
consider renaming the type_*_mask to type_*_val. What's your take on
this?

> 
> So please just drop this patch for now. There seems to be no need to
> touch the existing regmap-irq users after all so I can submit this patch
> together with the driver which needs to support the level active IRQs.
> 

So, it seems we still need to patch the gpio-max77620.c, right? So I
guess I could try submitting the next version prior the rest of the
driver.

> > 
> > >   */
> > >  struct regmap_irq {
> > >  	unsigned int reg_offset;
> > > @@ -1105,6 +1108,9 @@ struct regmap_irq {
> > >  	unsigned int type_reg_offset;
> > >  	unsigned int type_rising_mask;
> > >  	unsigned int type_falling_mask;
> > > +	unsigned int type_level_low_mask;
> > > +	unsigned int type_level_high_mask;
> > > +	unsigned int types_supported;
> > >  };
> > >  
> > >  #define REGMAP_IRQ_REG(_irq, _off, _mask)		\

-- 
Matti Vaittinen
ROHM Semiconductors

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
