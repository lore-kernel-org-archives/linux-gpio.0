From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2] gpio: bcm-kona: lock IRQs when starting them
Date: Tue, 26 Nov 2013 12:04:15 +0100
Message-ID: <CABxcv=nLVaaEHyeRZzo+uBVYtYr_1r+ZYpmr8=DtfY7YvmHnQw@mail.gmail.com>
References: <1385460703-31889-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:35151 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755495Ab3KZLEQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 06:04:16 -0500
Received: by mail-wg0-f42.google.com with SMTP id a1so2982168wgh.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 03:04:15 -0800 (PST)
In-Reply-To: <1385460703-31889-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux GPIO List <linux-gpio@vger.kernel.org>, Markus Mayer <markus.mayer@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Christian Daudt <csd@broadcom.com>, Grygorii Strashko <grygorii.strashko@ti.com>

On Tue, Nov 26, 2013 at 11:11 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
>
> Cc: Markus Mayer <markus.mayer@linaro.org>
> Cc: Christian Daudt <csd@broadcom.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Make sure we call .unmask() and .mask() functions from the
>   .startup() and .shutdown() callbacks so the implicit semantics
>   are satisfied.
> ---
>  drivers/gpio/gpio-bcm-kona.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 72c927dc3be1..3437414eaef2 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -449,12 +449,34 @@ static void bcm_kona_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
>         chained_irq_exit(chip, desc);
>  }
>
> +static unsigned int bcm_kona_gpio_irq_startup(struct irq_data *d)
> +{
> +       struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +
> +       if (gpio_lock_as_irq(&kona_gpio->gpio_chip, d->hwirq))
> +               dev_err(kona_gpio->gpio_chip.dev,
> +                       "unable to lock HW IRQ %lu for IRQ\n",
> +                       d->hwirq);
> +       bcm_kona_gpio_irq_unmask(d);
> +       return 0;
> +}
> +
> +static void bcm_kona_gpio_irq_shutdown(struct irq_data *d)
> +{
> +       struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +
> +       bcm_kona_gpio_irq_mask(d);
> +       gpio_unlock_as_irq(&kona_gpio->gpio_chip, d->hwirq);
> +}
> +
>  static struct irq_chip bcm_gpio_irq_chip = {
>         .name = "bcm-kona-gpio",
>         .irq_ack = bcm_kona_gpio_irq_ack,
>         .irq_mask = bcm_kona_gpio_irq_mask,
>         .irq_unmask = bcm_kona_gpio_irq_unmask,
>         .irq_set_type = bcm_kona_gpio_irq_set_type,
> +       .irq_startup = bcm_kona_gpio_irq_startup,
> +       .irq_shutdown = bcm_kona_gpio_irq_shutdown,
>  };
>
>  static struct __initconst of_device_id bcm_kona_gpio_of_match[] = {
> --
> 1.8.3.1
>

Looks good to me now.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
