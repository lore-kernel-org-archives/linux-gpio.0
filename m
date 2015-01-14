From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH] gpio-generic: add bgpio_set_multiple functions
Date: Wed, 14 Jan 2015 14:18:39 +0100
Message-ID: <1434420.1kjsRXqHkx@pcimr>
References: <1474325.ElrvNqxI5B@pcimr> <CAAVeFu+qctx7q_rQ5h4+msHwfkGGjoxf0m+wEPwoNby32E3PWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:45335 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbbANNSm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 08:18:42 -0500
In-Reply-To: <CAAVeFu+qctx7q_rQ5h4+msHwfkGGjoxf0m+wEPwoNby32E3PWA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wednesday 14 January 2015 11:43:54 Alexandre Courbot wrote:
> On Tue, Jan 13, 2015 at 7:37 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> > Add set_multiple functions to the generic driver for memory-mapped GPIO
> > controllers to improve performance when setting multiple outputs
> > simultaneously.
> 
> Great idea ; this driver is an obvious candidate to support this.
> 
> >
> > Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> > ---
> >  drivers/gpio/gpio-generic.c |   79 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> > index 16f6115..cb6d0b7 100644
> > --- a/drivers/gpio/gpio-generic.c
> > +++ b/drivers/gpio/gpio-generic.c
> > @@ -160,6 +160,31 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >         spin_unlock_irqrestore(&bgc->lock, flags);
> >  }
> >
> > +static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> > +                              unsigned long *bits)
> > +{
> > +       struct bgpio_chip *bgc = to_bgpio_chip(gc);
> > +       unsigned long flags;
> > +       int i;
> > +
> > +       spin_lock_irqsave(&bgc->lock, flags);
> > +
> > +       for (i = 0; i < bgc->bits; i++) {
> > +               if (*mask == 0)
> > +                       break;
> > +               if (__test_and_clear_bit(i, mask)) {
> > +                       if (test_bit(i, bits))
> > +                               bgc->data |= bgc->pin2mask(bgc, i);
> > +                       else
> > +                               bgc->data &= ~bgc->pin2mask(bgc, i);
> > +               }
> > +       }
> > +
> > +       bgc->write_reg(bgc->reg_dat, bgc->data);
> > +
> > +       spin_unlock_irqrestore(&bgc->lock, flags);
> > +}
> > +
> >  static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> >                                  int val)
> >  {
> > @@ -172,6 +197,32 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> >                 bgc->write_reg(bgc->reg_clr, mask);
> >  }
> >
> > +static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > +                                         unsigned long *mask,
> > +                                         unsigned long *bits)
> > +{
> > +       struct bgpio_chip *bgc = to_bgpio_chip(gc);
> > +       unsigned long set_mask = 0;
> > +       unsigned long clear_mask = 0;
> > +       int i;
> > +
> > +       for (i = 0; i < bgc->bits; i++) {
> > +               if (*mask == 0)
> > +                       break;
> > +               if (__test_and_clear_bit(i, mask)) {
> > +                       if (test_bit(i, bits))
> > +                               set_mask |= bgc->pin2mask(bgc, i);
> > +                       else
> > +                               clear_mask |= bgc->pin2mask(bgc, i);
> > +               }
> > +       }
> > +
> > +       if (set_mask)
> > +               bgc->write_reg(bgc->reg_set, set_mask);
> > +       if (clear_mask)
> > +               bgc->write_reg(bgc->reg_clr, clear_mask);
> > +}
> 
> Isn't this function missing spinlock protection?
> 

I followed the lead of the bgpio_set_with_clear function which also does not
use a spinlock. With dedicated set and clear registers it shouldn't be
necessary.

> > +
> >  static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >  {
> >         struct bgpio_chip *bgc = to_bgpio_chip(gc);
> > @@ -190,6 +241,31 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >         spin_unlock_irqrestore(&bgc->lock, flags);
> >  }
> >
> > +static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> > +                                  unsigned long *bits)
> > +{
> > +       struct bgpio_chip *bgc = to_bgpio_chip(gc);
> > +       unsigned long flags;
> > +       int i;
> > +
> > +       spin_lock_irqsave(&bgc->lock, flags);
> > +
> > +       for (i = 0; i < bgc->bits; i++) {
> > +               if (*mask == 0)
> > +                       break;
> > +               if (__test_and_clear_bit(i, mask)) {
> > +                       if (test_bit(i, bits))
> > +                               bgc->data |= bgc->pin2mask(bgc, i);
> > +                       else
> > +                               bgc->data &= ~bgc->pin2mask(bgc, i);
> > +               }
> > +       }
> > +
> > +       bgc->write_reg(bgc->reg_set, bgc->data);
> > +
> > +       spin_unlock_irqrestore(&bgc->lock, flags);
> > +}
> 
> Couldn't it be possible to factorize a great deal of these 3 functions?
> 
> The only difference between bgpio_set_multiple() and
> bgpio_set_multiple_set() is the register that is written. In
> bgpio_set_multiple_set(), you only handle the set and cleared bits in
> different variables.
> 
> How about a private function that looks like this:
> 
> static void __bgpio_multiple_get_masks(struct bgpio_chip *bgc,
>                                        unsigned long *mask, unsigned long *bits,
>                                        unsigned long *set_mask,
>                                        unsigned long *clear_mask)
> {
>        int i;
> 
>        *set_mask = 0;
>        *clear_mask = 0;
> 
>        for (i = 0; i < bgc->bits; i++) {
>                if (*mask == 0)
>                        break;
>                if (__test_and_clear_bit(i, mask)) {
>                        if (test_bit(i, bits))
>                                *set_mask |= bgc->pin2mask(bgc, i);
>                        else
>                                *clear_mask |= bgc->pin2mask(bgc, i);
>                }
>        }
> }
> 
> Then, you could have:
> 
> static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
>                                          unsigned long *mask,
>                                          unsigned long *bits)
> {
>        struct bgpio_chip *bgc = to_bgpio_chip(gc);
>        unsigned long flags;
>        unsigned long set_mask, clear_mask;
> 
>        spin_lock_irqsave(&bgc->lock, flags);
> 
>        __bgpio_multiple_get_masks(bgc, mask, bits, &set_mask, &clear_mask);
> 
>        if (set_mask)
>                bgc->write_reg(bgc->reg_set, set_mask);
>        if (clear_mask)
>                bgc->write_reg(bgc->reg_clr, clear_mask);
> 
>        spin_unlock_irqrestore(&bgc->lock, flags);
> }
> 
> and:
> 
> static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>                               unsigned long *bits)
> {
>        struct bgpio_chip *bgc = to_bgpio_chip(gc);
>        unsigned long flags;
>        unsigned long set_mask, clear_mask;
> 
>        spin_lock_irqsave(&bgc->lock, flags);
> 
>        __bgpio_multiple_get_masks(bgc, mask, bits, &set_mask, &clear_mask);
> 
>        bgc->data |= set_mask;
>        bgc->data &= ~clear_mask;
> 
>        bgc->write_reg(bgc->reg_dat, bgc->data);
> 
>        spin_unlock_irqrestore(&bgc->lock, flags);
> }
> 
> ... and something similar for __bgpio_multiple_get_masks. This would
> probably result in a smaller patch on top or reducing duplicate code.

You are right, of course. I'll post a revised version.

