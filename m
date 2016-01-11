From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 45/54 v2] mfd: asic3: Be sure to clamp return value
Date: Mon, 11 Jan 2016 07:44:06 +0000
Message-ID: <20160111074406.GD3331@x1>
References: <1450825536-8830-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:34491 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758611AbcAKHoK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2016 02:44:10 -0500
Received: by mail-wm0-f46.google.com with SMTP id u188so202984075wmu.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jan 2016 23:44:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450825536-8830-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Paul Parsons <lost.distance@yahoo.com>

On Wed, 23 Dec 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Cc: Paul Parsons <lost.distance@yahoo.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2: fixed a compilation issue, I was hammering
> to much on parentheses sorry.
> ---
>  drivers/mfd/asic3.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
> index a726f01e3b02..927e2c2a9a39 100644
> --- a/drivers/mfd/asic3.c
> +++ b/drivers/mfd/asic3.c
> @@ -502,7 +502,8 @@ static int asic3_gpio_get(struct gpio_chip *chip,
>  		return -EINVAL;
>  	}
> =20
> -	return asic3_read_register(asic, gpio_base + ASIC3_GPIO_STATUS) & m=
ask;
> +	return !!(asic3_read_register(asic, gpio_base + ASIC3_GPIO_STATUS)
> +		  & mask);
>  }
> =20
>  static void asic3_gpio_set(struct gpio_chip *chip,

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
