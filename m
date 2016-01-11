From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 48/54] mfd: tc6393xb: Be sure to clamp return value
Date: Mon, 11 Jan 2016 07:45:04 +0000
Message-ID: <20160111074504.GE3331@x1>
References: <1450795675-28314-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:36195 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758611AbcAKHpI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2016 02:45:08 -0500
Received: by mail-wm0-f43.google.com with SMTP id l65so199745761wmf.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jan 2016 23:45:07 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450795675-28314-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Tue, 22 Dec 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.
> ---
>  drivers/mfd/tc6393xb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
> index 8c84a513016b..1ecbfa40d1b3 100644
> --- a/drivers/mfd/tc6393xb.c
> +++ b/drivers/mfd/tc6393xb.c
> @@ -437,8 +437,8 @@ static int tc6393xb_gpio_get(struct gpio_chip *ch=
ip,
>  	struct tc6393xb *tc6393xb =3D container_of(chip, struct tc6393xb, g=
pio);
> =20
>  	/* XXX: does dsr also represent inputs? */
> -	return tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8))
> -		& TC_GPIO_BIT(offset);
> +	return !!(tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8))
> +		  & TC_GPIO_BIT(offset));
>  }
> =20
>  static void __tc6393xb_gpio_set(struct gpio_chip *chip,

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
