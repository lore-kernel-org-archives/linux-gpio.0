From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 163/182] mfd: htc-egpio: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:33:53 +0000
Message-ID: <20151210103353.GG17876@x1>
References: <1449668857-6260-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:33107 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753248AbbLJKd5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:33:57 -0500
Received: by mail-wm0-f54.google.com with SMTP id c201so25896341wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:33:57 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668857-6260-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Philipp Zabel <philipp.zabel@gmail.com>

On Wed, 09 Dec 2015, Linus Walleij wrote:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
> Philipp: should this driver move to drivers/gpio? Looks like
> so to me.
> ---
>  drivers/mfd/htc-egpio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
> index d334e7d8a77d..2e066fe66ca7 100644
> --- a/drivers/mfd/htc-egpio.c
> +++ b/drivers/mfd/htc-egpio.c
> @@ -155,7 +155,7 @@ static int egpio_get(struct gpio_chip *chip, unsi=
gned offset)
> =20
>  	pr_debug("egpio_get_value(%d)\n", chip->base + offset);
> =20
> -	egpio =3D container_of(chip, struct egpio_chip, chip);
> +	egpio =3D gpiochip_get_data(chip);
>  	ei    =3D dev_get_drvdata(egpio->dev);
>  	bit   =3D egpio_bit(ei, offset);
>  	reg   =3D egpio->reg_start + egpio_pos(ei, offset);
> @@ -170,7 +170,7 @@ static int egpio_direction_input(struct gpio_chip=
 *chip, unsigned offset)
>  {
>  	struct egpio_chip *egpio;
> =20
> -	egpio =3D container_of(chip, struct egpio_chip, chip);
> +	egpio =3D gpiochip_get_data(chip);
>  	return test_bit(offset, &egpio->is_out) ? -EINVAL : 0;
>  }
> =20
> @@ -192,7 +192,7 @@ static void egpio_set(struct gpio_chip *chip, uns=
igned offset, int value)
>  	pr_debug("egpio_set(%s, %d(%d), %d)\n",
>  			chip->label, offset, offset+chip->base, value);
> =20
> -	egpio =3D container_of(chip, struct egpio_chip, chip);
> +	egpio =3D gpiochip_get_data(chip);
>  	ei    =3D dev_get_drvdata(egpio->dev);
>  	bit   =3D egpio_bit(ei, offset);
>  	pos   =3D egpio_pos(ei, offset);
> @@ -216,7 +216,7 @@ static int egpio_direction_output(struct gpio_chi=
p *chip,
>  {
>  	struct egpio_chip *egpio;
> =20
> -	egpio =3D container_of(chip, struct egpio_chip, chip);
> +	egpio =3D gpiochip_get_data(chip);
>  	if (test_bit(offset, &egpio->is_out)) {
>  		egpio_set(chip, offset, value);
>  		return 0;
> @@ -330,7 +330,7 @@ static int __init egpio_probe(struct platform_dev=
ice *pdev)
>  		chip->base            =3D pdata->chip[i].gpio_base;
>  		chip->ngpio           =3D pdata->chip[i].num_gpios;
> =20
> -		gpiochip_add(chip);
> +		gpiochip_add_data(chip, &ei->chip[i]);
>  	}
> =20
>  	/* Set initial pin values */

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
