From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2][v5] gpio-mpc8xxx: add mpc8xxx_gpio_set_multiple function
Date: Sat, 21 Jun 2014 16:11:30 +0900
Message-ID: <CAAVeFu+trpxyK9iY=uZiKRJr9HtpqmpB1WCKWkP_9-oo+f_LHQ@mail.gmail.com>
References: <4129438.bdYOBL4jO3@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:37946 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752525AbaFUHLu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Jun 2014 03:11:50 -0400
Received: by mail-vc0-f174.google.com with SMTP id hy4so4239046vcb.33
        for <linux-gpio@vger.kernel.org>; Sat, 21 Jun 2014 00:11:50 -0700 (PDT)
In-Reply-To: <4129438.bdYOBL4jO3@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Mon, Jun 16, 2014 at 10:51 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Add a set_multiple function to the MPC8xxx GPIO chip driver and thereby allow
> for actual performance improvements when setting multiple outputs
> simultaneously. In my case the time needed to configure an FPGA goes down from
> 48 s to 20 s.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>

IIRC I gave you my reviewed-by on the v4 of this patch. Don't forget
to carry the tags you received to the following revisions, otherwise
the maintainer will have to go through the history of your series to
see who approves your patches.

Just so Linus don't miss it:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

> ---
> This patch depends on my previous patch "gpiolib: allow simultaneous setting
> of multiple GPIO outputs".
>
> Change log:
>   v5: - no change
>   v4: - change interface of the set_multiple driver function to use
>         unsigned long as type for the bit fields
>       - use generic bitops (which also use unsigned long for bit fields)
>   v3: - change commit message
>   v2: - add this patch (v1 included only changes to gpiolib)
>
>  drivers/gpio/gpio-mpc8xxx.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index d7d6d72..d1ff879 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -105,6 +105,32 @@ static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>         spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
>  }
>
> +static void mpc8xxx_gpio_set_multiple(struct gpio_chip *gc,
> +                                     unsigned long *mask, unsigned long *bits)
> +{
> +       struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
> +       struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
> +       unsigned long flags;
> +       int i;
> +
> +       spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
> +
> +       for (i = 0; i < gc->ngpio; i++) {
> +               if (*mask == 0)
> +                       break;
> +               if (__test_and_clear_bit(i, mask)) {
> +                       if (test_bit(i, bits))
> +                               mpc8xxx_gc->data |= mpc8xxx_gpio2mask(i);
> +                       else
> +                               mpc8xxx_gc->data &= ~mpc8xxx_gpio2mask(i);
> +               }
> +       }
> +
> +       out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);
> +
> +       spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
> +}
> +
>  static int mpc8xxx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  {
>         struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
> @@ -344,6 +370,7 @@ static void __init mpc8xxx_add_controller(struct device_node *np)
>         gc->get = of_device_is_compatible(np, "fsl,mpc8572-gpio") ?
>                 mpc8572_gpio_get : mpc8xxx_gpio_get;
>         gc->set = mpc8xxx_gpio_set;
> +       gc->set_multiple = mpc8xxx_gpio_set_multiple;
>         gc->to_irq = mpc8xxx_gpio_to_irq;
>
>         ret = of_mm_gpiochip_add(np, mm_gc);
>
> --
> 1.8.5.5
