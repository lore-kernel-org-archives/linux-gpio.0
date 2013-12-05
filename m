From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] gpio: driver for Xtensa GPIO32
Date: Thu, 5 Dec 2013 07:43:27 +0200
Message-ID: <20131205054327.GH32492@tarshish>
References: <9b46369ab60c23a6bd9f1930c4ff6c2fec57e798.1386057874.git.baruch@tkos.co.il>
 <CACRpkdb7nLg6op+_oi=PB2FnVcErQGDhHk82PHk7Os9rG1XVKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:52721 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734Ab3LEFna (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 5 Dec 2013 00:43:30 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdb7nLg6op+_oi=PB2FnVcErQGDhHk82PHk7Os9rG1XVKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

Hi Linus,

Thanks for taking the time to review the code.

On Wed, Dec 04, 2013 at 02:18:01PM +0100, Linus Walleij wrote:
> On Tue, Dec 3, 2013 at 9:04 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> This is a pretty terse commit message for an entirely new driver.
> For example I have no clue which architecture this is and what
> machine/platforms in that arch that may use this, or if it's some
> softcore or ... you know, such basic things a simple GPIO maintainer
> can't be expected to know.

I'll add a more verbose commit log.

> > +config GPIO_XTENSA
> > +       bool "Xtensa GPIO32 support"
> > +       depends on XTENSA
> > +       help
> > +         Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
> > +         and EXPSTATE (output) ports
> 
> If there is also going to be 16 or 64 bit versions of this thing
> you better call the Kconfig symbol GPIO_XTENSA32 or
> something.

Not likely. This is a standard optional extension to the xtensa core 
architecture that is referred to in the documentation as GPIO32. This 
extension adds a few instructions to read into and write out from the core 
32bit general purpose registers. I believe that future 16 or 64 bit versions 
are very unlikely.

Anyway, given that xtensa is the name of the architecture, naming the driver 
gpio-xtensa32 would just confuse users.

> > +obj-$(CONFIG_GPIO_XTENSA)      += gpio-xtensa.o
> 
> And this gpio-xtensa32.o
> 
> > +++ b/drivers/gpio/gpio-xtensa.c
> 
> > +#include <asm/coprocessor.h>
> 
> Hm so it seems we are using some coprocessor instructions
> to get at the GPIO, don't be shy, write a few comments on it :-)

Will do.

> > +#define ENABLE_CP()                                    \
> > +{                                                      \
> > +       unsigned long flags, cpenable;                  \
> > +       local_irq_save(flags);                          \
> > +       RSR_CPENABLE(cpenable);                         \
> > +       WSR_CPENABLE(cpenable | XCHAL_CP_PORT_MASK);
> > +
> > +#define DISABLE_CP()                                   \
> > +       WSR_CPENABLE(cpenable);                         \
> > +       local_irq_restore(flags);                       \
> > +}
> 
> Rewrite these to static inlines.

We need to preserve the irq flags. Let me know if the following is OK:

static inline unsigned long enable_cp(void)
{
	unsigned long flags, cpenable;

	local_irq_save(flags);
	RSR_CPENABLE(cpenable);
	WSR_CPENABLE(cpenable | XCHAL_CP_PORT_MASK);

	return flags;
}

static inline void disable_cp(unsigned long flags)
{
	WSR_CPENABLE(cpenable);
	local_irq_restore(flags);
}

	...

	unsigned long flags;

	flags = enable_cp()
	...
	disable_cp(flags);

> 
> > +static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       return 1;
> > +}
> 
> Ummm.... explain this. Alll lines are always inputs?

Exactly. I'll add a comment.

> > +static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       u32 impwire;
> > +
> > +       ENABLE_CP();
> > +       __asm__ __volatile__("read_impwire %0" : "=a" (impwire));
> > +       DISABLE_CP();
> > +
> > +       return !!(impwire & (1 << offset));
> 
> Use this pattern everywhere you do (1 << offset):
> 
> #include <linux/bitops.h>
> 
> s/(1 << offset)/BIT(offset)/g

Will do.

> > +static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
> > +                                   int value)
> > +{
> > +}
> 
> This is a rather nasty implementation for something that will always
> fail. What about putting an dev_err(gc->dev, "..."); in that set_value?

This is an input only device, so this callback should never run. Ideally it 
would be nice to just have it NULL, but the core gpiolib doesn't support that. 
Are you sure bloating the kernel with an error message that never displays is 
worth it?

> > +static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
> 
> What is an expstate?

This is how this extension specific register is called. I'll add a comment.

> 
> > +{
> > +       return 0;
> > +}
> 
> So all lines are always outputs? (Comment in the code thx.)

Yes. Will do.

> > +static int __init xtensa_gpio_init(void)
> > +{
> > +       struct platform_device *pdev;
> > +
> > +       pdev = platform_device_register_simple("xtensa-gpio", 0, NULL, 0);
> > +       if (IS_ERR(pdev))
> > +               return PTR_ERR(pdev);
> > +
> > +       return platform_driver_register(&xtensa_gpio_driver);
> > +}
> > +subsys_initcall(xtensa_gpio_init);
> 
> Why not device_initcall()? (i.e. same as module_init())
> Do you need it very early?

The main use case for this driver is for intra-core signaling, so it might be 
needed quite early I guess. I don't need any specific need for it to be 
available early at the moment, so I can change it device_initcall() if you 
prefer that.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
