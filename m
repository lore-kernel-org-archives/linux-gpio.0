From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] gpiolib: Replace WARN_ON with WARN_ON_ONCE
Date: Thu, 28 Nov 2013 16:16:56 -0300
Message-ID: <20131128191655.GC13182@localhost>
References: <1385296665-23713-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:38966 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1759339Ab3K1TRJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2013 14:17:09 -0500
Content-Disposition: inline
In-Reply-To: <1385296665-23713-1-git-send-email-ezequiel.garcia@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org

Hi Linus,

On Sun, Nov 24, 2013 at 09:37:45AM -0300, Ezequiel Garcia wrote:
> These warnings can be very spammy, since they could be called from
> kernel threads. Use WARN_ON_ONCE, which is enough to warn developers
> about the 'can_sleep' usage.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/gpio/gpiolib.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 7dd4461..9568998 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1927,7 +1927,7 @@ int gpiod_get_raw_value(const struct gpio_desc =
*desc)
>  	if (!desc)
>  		return 0;
>  	/* Should be using gpio_get_value_cansleep() */
> -	WARN_ON(desc->chip->can_sleep);
> +	WARN_ON_ONCE(desc->chip->can_sleep);
>  	return _gpiod_get_raw_value(desc);
>  }
>  EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
> @@ -1948,7 +1948,7 @@ int gpiod_get_value(const struct gpio_desc *des=
c)
>  	if (!desc)
>  		return 0;
>  	/* Should be using gpio_get_value_cansleep() */
> -	WARN_ON(desc->chip->can_sleep);
> +	WARN_ON_ONCE(desc->chip->can_sleep);
> =20
>  	value =3D _gpiod_get_raw_value(desc);
>  	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
> @@ -2042,7 +2042,7 @@ void gpiod_set_raw_value(struct gpio_desc *desc=
, int value)
>  	if (!desc)
>  		return;
>  	/* Should be using gpio_set_value_cansleep() */
> -	WARN_ON(desc->chip->can_sleep);
> +	WARN_ON_ONCE(desc->chip->can_sleep);
>  	_gpiod_set_raw_value(desc, value);
>  }
>  EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
> @@ -2063,7 +2063,7 @@ void gpiod_set_value(struct gpio_desc *desc, in=
t value)
>  	if (!desc)
>  		return;
>  	/* Should be using gpio_set_value_cansleep() */
> -	WARN_ON(desc->chip->can_sleep);
> +	WARN_ON_ONCE(desc->chip->can_sleep);
>  	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
>  		value =3D !value;
>  	_gpiod_set_raw_value(desc, value);
> --=20
> 1.8.1.5
>=20

Any comments on this?
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
