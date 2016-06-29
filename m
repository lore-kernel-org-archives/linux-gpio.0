From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio: convince line to become input in irq helper
Date: Wed, 29 Jun 2016 14:17:07 +0900
Message-ID: <CAAVeFuLxsLhsV7AXmdq6FMYbUU0krqBRs5tQEGh5POxdJx76LA@mail.gmail.com>
References: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36679 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbcF2FSF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 01:18:05 -0400
Received: by mail-io0-f195.google.com with SMTP id s63so4144317ioi.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2016 22:17:27 -0700 (PDT)
In-Reply-To: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>

On Thu, Jun 23, 2016 at 6:25 AM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> The generic IRQ helper library just checks if the IRQ line is
> set as input before activating it for interrupts. As we
> recently started to check things better with .get_dir() it
> turns out that it's good to try to convince the line to become
> an input before attempting to lock it as IRQ.
>
> Cc: Bj=C3=B6rn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Propagate the error from .direction_input() so we can rely on
>   it being used.
> ---
>  drivers/gpio/gpiolib.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5a21a6acf8af..b195ec406ff4 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1505,6 +1505,25 @@ static int gpiochip_irq_reqres(struct irq_data=
 *d)
>         if (!try_module_get(chip->gpiodev->owner))
>                 return -ENODEV;
>
> +       /*
> +        * If it is possible to switch this GPIO to an input
> +        * this is a good time to do it.
> +        */
> +       if (chip->direction_input) {
> +               struct gpio_desc *desc;
> +               int ret;
> +
> +               desc =3D gpiochip_get_desc(chip, d->hwirq);
> +               if (IS_ERR(desc))
> +                       return PTR_ERR(desc);
> +
> +               ret =3D chip->direction_input(chip, d->hwirq);
> +               if (ret)
> +                       return ret;
> +
> +               clear_bit(FLAG_IS_OUT, &desc->flags);
> +       }
> +

This looks like a good idea.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
