From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 50/54] mfd: ucb1x00-core: Be sure to clamp return value
Date: Mon, 11 Jan 2016 07:43:07 +0000
Message-ID: <20160111074307.GB3331@x1>
References: <1450795713-28414-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:36854 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752956AbcAKHnL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2016 02:43:11 -0500
Received: by mail-wm0-f50.google.com with SMTP id l65so199696397wmf.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jan 2016 23:43:11 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450795713-28414-1-git-send-email-linus.walleij@linaro.org>
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
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.
> ---
>  drivers/mfd/ucb1x00-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
> index a6ec7cc0fac6..bcafe1ecd71c 100644
> --- a/drivers/mfd/ucb1x00-core.c
> +++ b/drivers/mfd/ucb1x00-core.c
> @@ -133,7 +133,7 @@ static int ucb1x00_gpio_get(struct gpio_chip *chi=
p, unsigned offset)
>  	val =3D ucb1x00_reg_read(ucb, UCB_IO_DATA);
>  	ucb1x00_disable(ucb);
> =20
> -	return val & (1 << offset);
> +	return !!(val & (1 << offset));
>  }
> =20
>  static int ucb1x00_gpio_direction_input(struct gpio_chip *chip, unsi=
gned offset)

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
