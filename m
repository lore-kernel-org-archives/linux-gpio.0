From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 164/182] mfd: htc-i2cpld: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:35:51 +0000
Message-ID: <20151210103551.GM17876@x1>
References: <1449668865-6307-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:37818 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbbLJKfz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:35:55 -0500
Received: by wmww144 with SMTP id w144so18478183wmw.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:35:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668865-6307-1-git-send-email-linus.walleij@linaro.org>
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
>  drivers/mfd/htc-i2cpld.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
> index bd6b96d07ab8..3f9eee5f8fb9 100644
> --- a/drivers/mfd/htc-i2cpld.c
> +++ b/drivers/mfd/htc-i2cpld.c
> @@ -227,8 +227,7 @@ static irqreturn_t htcpld_handler(int irq, void *=
dev)
>  static void htcpld_chip_set(struct gpio_chip *chip, unsigned offset,=
 int val)
>  {
>  	struct i2c_client *client;
> -	struct htcpld_chip *chip_data =3D
> -		container_of(chip, struct htcpld_chip, chip_out);
> +	struct htcpld_chip *chip_data =3D gpiochip_get_data(chip);
>  	unsigned long flags;
> =20
>  	client =3D chip_data->client;
> @@ -257,14 +256,12 @@ static void htcpld_chip_set_ni(struct work_stru=
ct *work)
> =20
>  static int htcpld_chip_get(struct gpio_chip *chip, unsigned offset)
>  {
> -	struct htcpld_chip *chip_data;
> +	struct htcpld_chip *chip_data =3D gpiochip_get_data(chip);
>  	u8 cache;
> =20
>  	if (!strncmp(chip->label, "htcpld-out", 10)) {
> -		chip_data =3D container_of(chip, struct htcpld_chip, chip_out);
>  		cache =3D chip_data->cache_out;
>  	} else if (!strncmp(chip->label, "htcpld-in", 9)) {
> -		chip_data =3D container_of(chip, struct htcpld_chip, chip_in);
>  		cache =3D chip_data->cache_in;
>  	} else
>  		return -EINVAL;
> @@ -291,9 +288,7 @@ static int htcpld_direction_input(struct gpio_chi=
p *chip,
> =20
>  static int htcpld_chip_to_irq(struct gpio_chip *chip, unsigned offse=
t)
>  {
> -	struct htcpld_chip *chip_data;
> -
> -	chip_data =3D container_of(chip, struct htcpld_chip, chip_in);
> +	struct htcpld_chip *chip_data =3D gpiochip_get_data(chip);
> =20
>  	if (offset < chip_data->nirqs)
>  		return chip_data->irq_start + offset;
> @@ -451,14 +446,14 @@ static int htcpld_register_chip_gpio(
>  	gpio_chip->ngpio           =3D plat_chip_data->num_gpios;
> =20
>  	/* Add the GPIO chips */
> -	ret =3D gpiochip_add(&(chip->chip_out));
> +	ret =3D gpiochip_add_data(&(chip->chip_out), chip);
>  	if (ret) {
>  		dev_warn(dev, "Unable to register output GPIOs for 0x%x: %d\n",
>  			 plat_chip_data->addr, ret);
>  		return ret;
>  	}
> =20
> -	ret =3D gpiochip_add(&(chip->chip_in));
> +	ret =3D gpiochip_add_data(&(chip->chip_in), chip);
>  	if (ret) {
>  		dev_warn(dev, "Unable to register input GPIOs for 0x%x: %d\n",
>  			 plat_chip_data->addr, ret);

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
