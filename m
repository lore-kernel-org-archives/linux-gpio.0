From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio-generic: add bgpio_set_multiple functions
Date: Wed, 14 Jan 2015 11:43:54 +0900
Message-ID: <CAAVeFu+qctx7q_rQ5h4+msHwfkGGjoxf0m+wEPwoNby32E3PWA@mail.gmail.com>
References: <1474325.ElrvNqxI5B@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:53162 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046AbbANCoP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 21:44:15 -0500
Received: by mail-ig0-f182.google.com with SMTP id hn15so6709228igb.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 18:44:15 -0800 (PST)
In-Reply-To: <1474325.ElrvNqxI5B@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Jan 13, 2015 at 7:37 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Add set_multiple functions to the generic driver for memory-mapped GPIO
> controllers to improve performance when setting multiple outputs
> simultaneously.

Great idea ; this driver is an obvious candidate to support this.

>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
>  drivers/gpio/gpio-generic.c |   79 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index 16f6115..cb6d0b7 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -160,6 +160,31 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>         spin_unlock_irqrestore(&bgc->lock, flags);
>  }
>
> +static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +                              unsigned long *bits)
> +{
> +       struct bgpio_chip *bgc = to_bgpio_chip(gc);
> +       unsigned long flags;
> +       int i;
> +
> +       spin_lock_irqsave(&bgc->lock, flags);
> +
> +       for (i = 0; i < bgc->bits; i++) {
> +               if (*mask == 0)
> +                       break;
> +               if (__test_and_clear_bit(i, mask)) {
> +                       if (test_bit(i, bits))
> +                               bgc->data |= bgc->pin2mask(bgc, i);
> +                       else
> +                               bgc->data &= ~bgc->pin2mask(bgc, i);
> +               }
> +       }
> +
> +       bgc->write_reg(bgc->reg_dat, bgc->data);
> +
> +       spin_unlock_irqrestore(&bgc->lock, flags);
> +}
> +
>  static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
>                                  int val)
>  {
> @@ -172,6 +197,32 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
>                 bgc->write_reg(bgc->reg_clr, mask);
>  }
>
> +static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> +                                         unsigned long *mask,
> +                                         unsigned long *bits)
> +{
> +       struct bgpio_chip *bgc = to_bgpio_chip(gc);
> +       unsigned long set_mask = 0;
> +       unsigned long clear_mask = 0;
> +       int i;
> +
> +       for (i = 0; i < bgc->bits; i++) {
> +               if (*mask == 0)
> +                       break;
> +               if (__test_and_clear_bit(i, mask)) {
> +                       if (test_bit(i, bits))
> +                               set_mask |= bgc->pin2mask(bgc, i);
> +                       else
> +                               clear_mask |= bgc->pin2mask(bgc, i);
> +               }
> +       }
> +
> +       if (set_mask)
> +               bgc->write_reg(bgc->reg_set, set_mask);
> +       if (clear_mask)
> +               bgc->write_reg(bgc->reg_clr, clear_mask);
> +}

Isn't this function missing spinlock protection?

> +
>  static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>         struct bgpio_chip *bgc = to_bgpio_chip(gc);
> @@ -190,6 +241,31 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>         spin_unlock_irqrestore(&bgc->lock, flags);
>  }
>
> +static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> +                                  unsigned long *bits)
> +{
> +       struct bgpio_chip *bgc = to_bgpio_chip(gc);
> +       unsigned long flags;
> +       int i;
> +
> +       spin_lock_irqsave(&bgc->lock, flags);
> +
> +       for (i = 0; i < bgc->bits; i++) {
> +               if (*mask == 0)
> +                       break;
> +               if (__test_and_clear_bit(i, mask)) {
> +                       if (test_bit(i, bits))
> +                               bgc->data |= bgc->pin2mask(bgc, i);
> +                       else
> +                               bgc->data &= ~bgc->pin2mask(bgc, i);
> +               }
> +       }
> +
> +       bgc->write_reg(bgc->reg_set, bgc->data);
> +
> +       spin_unlock_irqrestore(&bgc->lock, flags);
> +}

Couldn't it be possible to factorize a great deal of these 3 functions?

The only difference between bgpio_set_multiple() and
bgpio_set_multiple_set() is the register that is written. In
bgpio_set_multiple_set(), you only handle the set and cleared bits in
different variables.

How about a private function that looks like this:

static void __bgpio_multiple_get_masks(struct bgpio_chip *bgc,
                                       unsigned long *mask, unsigned long *bits,
                                       unsigned long *set_mask,
                                       unsigned long *clear_mask)
{
       int i;

       *set_mask = 0;
       *clear_mask = 0;

       for (i = 0; i < bgc->bits; i++) {
               if (*mask == 0)
                       break;
               if (__test_and_clear_bit(i, mask)) {
                       if (test_bit(i, bits))
                               *set_mask |= bgc->pin2mask(bgc, i);
                       else
                               *clear_mask |= bgc->pin2mask(bgc, i);
               }
       }
}

Then, you could have:

static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
                                         unsigned long *mask,
                                         unsigned long *bits)
{
       struct bgpio_chip *bgc = to_bgpio_chip(gc);
       unsigned long flags;
       unsigned long set_mask, clear_mask;

       spin_lock_irqsave(&bgc->lock, flags);

       __bgpio_multiple_get_masks(bgc, mask, bits, &set_mask, &clear_mask);

       if (set_mask)
               bgc->write_reg(bgc->reg_set, set_mask);
       if (clear_mask)
               bgc->write_reg(bgc->reg_clr, clear_mask);

       spin_unlock_irqrestore(&bgc->lock, flags);
}

and:

static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
                              unsigned long *bits)
{
       struct bgpio_chip *bgc = to_bgpio_chip(gc);
       unsigned long flags;
       unsigned long set_mask, clear_mask;

       spin_lock_irqsave(&bgc->lock, flags);

       __bgpio_multiple_get_masks(bgc, mask, bits, &set_mask, &clear_mask);

       bgc->data |= set_mask;
       bgc->data &= ~clear_mask;

       bgc->write_reg(bgc->reg_dat, bgc->data);

       spin_unlock_irqrestore(&bgc->lock, flags);
}

... and something similar for __bgpio_multiple_get_masks. This would
probably result in a smaller patch on top or reducing duplicate code.
