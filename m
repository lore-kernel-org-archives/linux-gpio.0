From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] gpio: convince line to become input in irq helper
Date: Wed, 22 Jun 2016 14:51:04 -0700
Message-ID: <20160622215104.GR1256@tuxbot>
References: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33082 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751209AbcFVVvN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2016 17:51:13 -0400
Received: by mail-pa0-f51.google.com with SMTP id b13so20466373pat.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2016 14:51:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Wed 22 Jun 14:25 PDT 2016, Linus Walleij wrote:

> The generic IRQ helper library just checks if the IRQ line is
> set as input before activating it for interrupts. As we
> recently started to check things better with .get_dir() it
> turns out that it's good to try to convince the line to become
> an input before attempting to lock it as IRQ.
>=20
> Cc: Bj=F6rn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Propagate the error from .direction_input() so we can rely on
>   it being used.
> ---
>  drivers/gpio/gpiolib.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5a21a6acf8af..b195ec406ff4 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1505,6 +1505,25 @@ static int gpiochip_irq_reqres(struct irq_data=
 *d)
>  	if (!try_module_get(chip->gpiodev->owner))
>  		return -ENODEV;
> =20
> +	/*
> +	 * If it is possible to switch this GPIO to an input
> +	 * this is a good time to do it.
> +	 */
> +	if (chip->direction_input) {
> +		struct gpio_desc *desc;
> +		int ret;
> +
> +		desc =3D gpiochip_get_desc(chip, d->hwirq);
> +		if (IS_ERR(desc))
> +			return PTR_ERR(desc);
> +
> +	        ret =3D chip->direction_input(chip, d->hwirq);
> +		if (ret)
> +			return ret;
> +
> +		clear_bit(FLAG_IS_OUT, &desc->flags);
> +	}
> +
>  	if (gpiochip_lock_as_irq(chip, d->hwirq)) {
>  		chip_err(chip,
>  			"unable to lock HW IRQ %lu for IRQ\n",
> --=20
> 2.4.11
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
