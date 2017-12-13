From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: Add helpers to determin direction of gpiods
Date: Wed, 13 Dec 2017 11:15:04 +0100
Message-ID: <CAMuHMdWv3en=ScDpydwmGuHDMxo-RW_88SqkFk++hPNifj0BqQ@mail.gmail.com>
References: <20171210002340.18460-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:45307 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752632AbdLMKPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Dec 2017 05:15:07 -0500
Received: by mail-lf0-f65.google.com with SMTP id f13so1969055lff.12
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2017 02:15:06 -0800 (PST)
In-Reply-To: <20171210002340.18460-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

Hi Linus,

On Sun, Dec 10, 2017 at 1:23 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The gpiod_get_direction() returns 1 for input and 0 for output
> but it's pretty hard to remember which one is which and generally
> unintuitive and messy to provide #defines so let's simply add
> two static inlines to do the job.
>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/gpio/consumer.txt | 14 +++++++++++---
>  include/linux/gpio/consumer.h   | 25 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index 63e1bd1d88e3..c4b8e3d8c29f 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt

> @@ -184,7 +184,15 @@ A driver can also query the current direction of a GPIO:
>
>         int gpiod_get_direction(const struct gpio_desc *desc)
>
> -This function will return either GPIOF_DIR_IN or GPIOF_DIR_OUT.
> +This function will return either 1 (input) or 0 (output). There are also
> +these convenience helpers:
> +
> +       bool gpiod_is_input(const struct gpio_desc *desc)
> +       bool gpiod_is_output(const struct gpio_desc *desc)
> +
> +These will not provide the same level of error fallbacks: if they fail to
> +obtain the direction, they will print an error and report as input since this
> +is usually safest.

Leaving a pin configured as input is indeed the safest, from a hardware
point of view.
But I don't know if reporting to software that it is input is safe ;-)

Can this actually fail?

> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -487,6 +487,31 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
>
>  #endif /* CONFIG_GPIOLIB */
>
> +/*
> + * Helpers that quickly tell whether a line is input or output.
> + */
> +static inline bool gpiod_is_input(struct gpio_desc *desc)
> +{
> +       int ret = gpiod_get_direction(desc);
> +       if (ret < 0) {
> +               pr_err("GPIO: failed to get direction\n");

Do we really want a copy of this string in every module using this function?
If you want to keep the error message, the function should be moved to
the GPIO code, I think.

> +               /* It is usually safest to assume we are input */
> +               return true;
> +       }
> +       return !!ret;
> +}
> +
> +static inline bool gpiod_is_output(struct gpio_desc *desc)
> +{
> +       int ret = gpiod_get_direction(desc);
> +       if (ret < 0) {
> +               pr_err("GPIO: failed to get direction\n");

Likewise.

> +               /* It is usually safest to assume we are input */
> +               return false;
> +       }
> +       return !ret;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
