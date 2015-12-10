From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 161/182] mfd: asic3: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:37:04 +0000
Message-ID: <20151210103704.GA13538@x1>
References: <1449668842-6166-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:32982 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526AbbLJKhI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:37:08 -0500
Received: by mail-wm0-f42.google.com with SMTP id c201so26023975wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:37:07 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668842-6166-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Paul Parsons <lost.distance@yahoo.com>

On Wed, 09 Dec 2015, Linus Walleij wrote:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Paul Parsons <lost.distance@yahoo.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
>=20
> I want to try to optimistically merge these changes without any
> immutable branches, as I suspect other subsystem maintainers might
> not want to pull a branch with 200+ patches into each subsystem,
> but let's see what happens.
> ---
>  drivers/mfd/asic3.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
> index a726f01e3b02..013ba51de819 100644
> --- a/drivers/mfd/asic3.c
> +++ b/drivers/mfd/asic3.c
> @@ -447,7 +447,7 @@ static int asic3_gpio_direction(struct gpio_chip =
*chip,
>  	unsigned long flags;
>  	struct asic3 *asic;
> =20
> -	asic =3D container_of(chip, struct asic3, gpio);
> +	asic =3D gpiochip_get_data(chip);
>  	gpio_base =3D ASIC3_GPIO_TO_BASE(offset);
> =20
>  	if (gpio_base > ASIC3_GPIO_D_BASE) {
> @@ -493,7 +493,7 @@ static int asic3_gpio_get(struct gpio_chip *chip,
>  	u32 mask =3D ASIC3_GPIO_TO_MASK(offset);
>  	struct asic3 *asic;
> =20
> -	asic =3D container_of(chip, struct asic3, gpio);
> +	asic =3D gpiochip_get_data(chip);
>  	gpio_base =3D ASIC3_GPIO_TO_BASE(offset);
> =20
>  	if (gpio_base > ASIC3_GPIO_D_BASE) {
> @@ -513,7 +513,7 @@ static void asic3_gpio_set(struct gpio_chip *chip=
,
>  	unsigned long flags;
>  	struct asic3 *asic;
> =20
> -	asic =3D container_of(chip, struct asic3, gpio);
> +	asic =3D gpiochip_get_data(chip);
>  	gpio_base =3D ASIC3_GPIO_TO_BASE(offset);
> =20
>  	if (gpio_base > ASIC3_GPIO_D_BASE) {
> @@ -542,7 +542,7 @@ static void asic3_gpio_set(struct gpio_chip *chip=
,
> =20
>  static int asic3_gpio_to_irq(struct gpio_chip *chip, unsigned offset=
)
>  {
> -	struct asic3 *asic =3D container_of(chip, struct asic3, gpio);
> +	struct asic3 *asic =3D gpiochip_get_data(chip);
> =20
>  	return asic->irq_base + offset;
>  }
> @@ -597,7 +597,7 @@ static __init int asic3_gpio_probe(struct platfor=
m_device *pdev,
>  				     alt_reg[i]);
>  	}
> =20
> -	return gpiochip_add(&asic->gpio);
> +	return gpiochip_add_data(&asic->gpio, asic);
>  }
> =20
>  static int asic3_gpio_remove(struct platform_device *pdev)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
