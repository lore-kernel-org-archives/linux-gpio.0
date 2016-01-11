From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 47/54] mfd: htc-egpio: Be sure to clamp return value
Date: Mon, 11 Jan 2016 07:45:23 +0000
Message-ID: <20160111074523.GF3331@x1>
References: <1450795659-28262-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35792 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932069AbcAKHp1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2016 02:45:27 -0500
Received: by mail-wm0-f54.google.com with SMTP id f206so200132177wmf.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jan 2016 23:45:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450795659-28262-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Philipp Zabel <philipp.zabel@gmail.com>

On Tue, 22 Dec 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.
> ---
>  drivers/mfd/htc-egpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
> index d334e7d8a77d..c636b5f83cfb 100644
> --- a/drivers/mfd/htc-egpio.c
> +++ b/drivers/mfd/htc-egpio.c
> @@ -163,7 +163,7 @@ static int egpio_get(struct gpio_chip *chip, unsi=
gned offset)
>  	value =3D egpio_readw(ei, reg);
>  	pr_debug("readw(%p + %x) =3D %x\n",
>  			ei->base_addr, reg << ei->bus_shift, value);
> -	return value & bit;
> +	return !!(value & bit);
>  }
> =20
>  static int egpio_direction_input(struct gpio_chip *chip, unsigned of=
fset)

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
