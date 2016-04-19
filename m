From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] pinctrl: at91-pio4: fix pull-up/down logic
Date: Tue, 19 Apr 2016 17:15:53 +0200
Message-ID: <57164BA9.3040907@atmel.com>
References: <1461074628-20224-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:26122 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932106AbcDSPPi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2016 11:15:38 -0400
In-Reply-To: <1461074628-20224-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, linus.walleij@linaro.org
Cc: alexandre.belloni@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Le 19/04/2016 16:03, Ludovic Desroches a =E9crit :
> The default configuration of a pin is often with a value in the
> pull-up/down field at chip reset. So, even if the internal logic of t=
he
> controller prevents writing a configuration with pull-up and pull-dow=
n at
> the same time, we must ensure explicitly this condition before writin=
g the
> register.
>=20
> This was leading to a pull-down condition not taken into account for
> instance.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Fixes: 776180848b57 ("pinctrl: introduce driver for Atmel PIO4 contro=
ller")
> Cc: stable@vger.kernel.org #v4.4 and later

Yes, and I can add:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

and more important:
On a sama5d2 Xplained board:
Tested-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks, bye.

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pi=
nctrl-at91-pio4.c
> index 629b6fe..75093d7 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -722,9 +722,11 @@ static int atmel_conf_pin_config_group_set(struc=
t pinctrl_dev *pctldev,
>  			break;
>  		case PIN_CONFIG_BIAS_PULL_UP:
>  			conf |=3D ATMEL_PIO_PUEN_MASK;
> +			conf &=3D (~ATMEL_PIO_PDEN_MASK);
>  			break;
>  		case PIN_CONFIG_BIAS_PULL_DOWN:
>  			conf |=3D ATMEL_PIO_PDEN_MASK;
> +			conf &=3D (~ATMEL_PIO_PUEN_MASK);
>  			break;
>  		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>  			if (arg =3D=3D 0)
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
