From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 49/54] mfd: tps65010: Be sure to clamp return value
Date: Mon, 11 Jan 2016 07:43:36 +0000
Message-ID: <20160111074336.GC3331@x1>
References: <1450795693-28364-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38161 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758602AbcAKHnk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2016 02:43:40 -0500
Received: by mail-wm0-f49.google.com with SMTP id b14so253932675wmb.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jan 2016 23:43:39 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450795693-28364-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

On Tue, 22 Dec 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> This also start to propagate the negative error code from the
> smbus call if there is one, as the last commit of this series
> will make the gpiolib core deal with that properly.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.
> ---
>  drivers/mfd/tps65010.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
> index b96847491277..83e615ed100a 100644
> --- a/drivers/mfd/tps65010.c
> +++ b/drivers/mfd/tps65010.c
> @@ -499,11 +499,11 @@ static int tps65010_gpio_get(struct gpio_chip *=
chip, unsigned offset)
>  	if (offset < 4) {
>  		value =3D i2c_smbus_read_byte_data(tps->client, TPS_DEFGPIO);
>  		if (value < 0)
> -			return 0;
> +			return value;
>  		if (value & (1 << (offset + 4)))	/* output */
>  			return !(value & (1 << offset));
>  		else					/* input */
> -			return (value & (1 << offset));
> +			return !!(value & (1 << offset));
>  	}
> =20
>  	/* REVISIT we *could* report LED1/nPG and LED2 state ... */

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
