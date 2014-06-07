From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2][v4] gpio-mpc8xxx: add mpc8xxx_gpio_set_multiple function
Date: Sat, 7 Jun 2014 22:34:36 +0900
Message-ID: <CAAVeFuKzH_ck4B6Hn-8w5ywBt67fqFZFdMQpOWEvEa5=U9OPEA@mail.gmail.com>
References: <3886036.Jvsi0lpL2C@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:52139 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369AbaFGNe5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Jun 2014 09:34:57 -0400
Received: by mail-ve0-f181.google.com with SMTP id pa12so4653194veb.26
        for <linux-gpio@vger.kernel.org>; Sat, 07 Jun 2014 06:34:56 -0700 (PDT)
In-Reply-To: <3886036.Jvsi0lpL2C@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Tue, Jun 3, 2014 at 12:29 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Add a set_multiple function to the MPC8xxx GPIO chip driver and thereby allow
> for actual performance improvements when setting multiple outputs
> simultaneously. In my case the time needed to configure an FPGA goes down from
> 48 s to 20 s.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> This patch depends on my previous patch "gpiolib: allow simultaneous setting
> of multiple GPIO outputs".
>
> Change log:
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

Ok, so this works because presentely you can only have 32 GPIOs max on
this chip. But you cannot be sure that future revisions won't extend
that number ; and if this happens this function won't work as-is
anymore. I won't take much more code to make it more generic, so
please do it now to avoid hours of horrendous debugging to your future
self.

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
