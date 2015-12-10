From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 167/182] mfd: tps65010: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:35:03 +0000
Message-ID: <20151210103503.GJ17876@x1>
References: <1449668889-6451-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36452 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbbLJKfI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:35:08 -0500
Received: by mail-wm0-f42.google.com with SMTP id w144so17617404wmw.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:35:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668889-6451-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Wed, 09 Dec 2015, Linus Walleij wrote:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
> ---
>  drivers/mfd/tps65010.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
> index b96847491277..1ffb8ebd7b2c 100644
> --- a/drivers/mfd/tps65010.c
> +++ b/drivers/mfd/tps65010.c
> @@ -34,7 +34,7 @@
> =20
>  #include <linux/i2c/tps65010.h>
> =20
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
> =20
> =20
>  /*------------------------------------------------------------------=
-------*/
> @@ -477,7 +477,7 @@ tps65010_output(struct gpio_chip *chip, unsigned =
offset, int value)
>  	if (offset < 4) {
>  		struct tps65010		*tps;
> =20
> -		tps =3D container_of(chip, struct tps65010, chip);
> +		tps =3D gpiochip_get_data(chip);
>  		if (!(tps->outmask & (1 << offset)))
>  			return -EINVAL;
>  		tps65010_set_gpio_out_value(offset + 1, value);
> @@ -494,7 +494,7 @@ static int tps65010_gpio_get(struct gpio_chip *ch=
ip, unsigned offset)
>  	int			value;
>  	struct tps65010		*tps;
> =20
> -	tps =3D container_of(chip, struct tps65010, chip);
> +	tps =3D gpiochip_get_data(chip);
> =20
>  	if (offset < 4) {
>  		value =3D i2c_smbus_read_byte_data(tps->client, TPS_DEFGPIO);
> @@ -651,7 +651,7 @@ static int tps65010_probe(struct i2c_client *clie=
nt,
>  		tps->chip.ngpio =3D 7;
>  		tps->chip.can_sleep =3D 1;
> =20
> -		status =3D gpiochip_add(&tps->chip);
> +		status =3D gpiochip_add_data(&tps->chip, tps);
>  		if (status < 0)
>  			dev_err(&client->dev, "can't add gpiochip, err %d\n",
>  					status);

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
