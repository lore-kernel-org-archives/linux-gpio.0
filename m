From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Thu, 1 May 2014 15:24:08 +0900
Message-ID: <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:59389 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942AbaEAGY3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 1 May 2014 02:24:29 -0400
Received: by mail-ve0-f175.google.com with SMTP id oz11so3402672veb.20
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2014 23:24:28 -0700 (PDT)
In-Reply-To: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Apr 29, 2014 at 9:38 PM, Robert ABEL
<rabel@cit-ec.uni-bielefeld.de> wrote:
> GPIO descriptions were assumed to be initialized with correct flags
> by GPIO chips. Hence, DT flags were being ignored.
> Translate flags from DTS flags to GPIOD flags when of_get_*gpiod_* is
> called.

This considerably changes the behavior of of_get_named_gpiod_flags(),
and makes it apply DT flags to the GPIO descriptor no matter what. In
effect, it makes the flags argument completely unneeded.

of_get_named_gpiod_flags() ought to be gpiolib-private actually (I
still need to send a patch fixing that) since its only user is
of_find_gpio(), which correctly applies the flags.

We have users of of_get_named_gpio_flags() that could at first sight
benefit from your change. However, your change will return them a GPIO
which will behave differently from what they expect since the
active_low property will be set on its GPIO descriptor. Callers of
of_get_named_gpio_flags(), working on integer GPIOs, typically manage
that property themselves. This will result in the active_low property
being applied twice, effectively canceling its effect.

So the real solution to this issue is to make
of_get_named_gpiod_flags() private and encourage GPIO users to switch
to the descriptor interface. I'm afraid we cannot accept this patch
for the reasons given above.

Also, for future contributions could you use "gpiod:of: " in your
patch subject to keep the style consistent with existing practices in
drivers/gpio?

Short review follows.

>
> Signed-off-by: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
> ---
>  drivers/gpio/gpiolib-of.c     | 12 ++++++++----
>  drivers/gpio/gpiolib.c        | 12 ++++++++++++
>  include/linux/gpio/consumer.h |  4 ++++
>  3 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2024d45..03f261c 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -66,18 +66,21 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
>  struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
>                      const char *propname, int index, enum of_gpio_flags *flags)
>  {
> +
> +       enum of_gpio_flags tmp_flags;
> +       enum of_gpio_flags* priv_flags = flags ? : &tmp_flags;
> +
>         /* Return -EPROBE_DEFER to support probe() functions to be called
>          * later when the GPIO actually becomes available
>          */
>         struct gg_data gg_data = {
> -               .flags = flags,
> +               .flags = priv_flags,
>                 .out_gpio = ERR_PTR(-EPROBE_DEFER)
>         };
>         int ret;
>
>         /* .of_xlate might decide to not fill in the flags, so clear it. */
> -       if (flags)
> -               *flags = 0;
> +       *priv_flags = 0;
>
>         ret = of_parse_phandle_with_args(np, propname, "#gpio-cells", index,
>                                          &gg_data.gpiospec);
> @@ -87,7 +90,8 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
>                 return ERR_PTR(ret);
>         }
>
> -       gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
> +       if (gpiochip_find(&gg_data, of_gpiochip_find_and_xlate))
> +               gpiod_translate_flags(gg_data.out_gpio, gg_data.flags);
>
>         of_node_put(gg_data.gpiospec.np);
>         pr_debug("%s exited with status %d\n", __func__,
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f48817d..8bd4dbb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -187,6 +187,18 @@ int desc_to_gpio(const struct gpio_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(desc_to_gpio);
>
> +#if defined(CONFIG_OF)
> +void gpiod_translate_flags(struct gpio_desc *desc, enum of_gpio_flags *flags)

This function translates device tree flags - not just any tag. Its
name should reflect that.

> +{
> +
> +       desc->flags = 0;
> +
> +       if (*flags & OF_GPIO_ACTIVE_LOW)
> +               set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +
> +}

You could also use this function to set the flags in of_find_gpio(),
since the code is the same.

> +EXPORT_SYMBOL_GPL(gpiod_translate_flags);

I don't think this function should have been exported. It is only to
be used in gpiolib-of.o, which will always be linked to gpiolib.o
anyway.

> +#endif /* CONFIG_OF */
>
>  /* Warn when drivers omit gpio_request() calls -- legal but ill-advised
>   * when setting direction, and otherwise illegal.  Until board setup code
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index bed128e..4d120dc 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -59,6 +59,10 @@ int gpiod_to_irq(const struct gpio_desc *desc);
>  /* Convert between the old gpio_ and new gpiod_ interfaces */
>  struct gpio_desc *gpio_to_desc(unsigned gpio);
>  int desc_to_gpio(const struct gpio_desc *desc);
> +#if defined(CONFIG_OF)
> +enum of_gpio_flags;
> +void gpiod_translate_flags(struct gpio_desc *desc, enum of_gpio_flags *flags);
> +#endif /* CONFIG_OF */

Again, this should not be part of the public API. These declarations
should have be moved into the gpiolib.h header.

>
>  #else /* CONFIG_GPIOLIB */
>
> --
> 1.9.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
