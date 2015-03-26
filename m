From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] pinctrl: at91: convert __raw to endian agnostic IO
Date: Thu, 26 Mar 2015 13:23:17 +0100
Message-ID: <5513FA35.6020201@atmel.com>
References: <1427372329-26005-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:32519 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbbCZMXV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2015 08:23:21 -0400
In-Reply-To: <1427372329-26005-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@lists.codethink.co.uk, Linus Walleij <linus.walleij@linaro.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "moderated list:PIN CONTROLLER -..." <linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROL SUBSY..." <linux-gpio@vger.kernel.org>, Andrew Victor <linux@maxim.org.za>, Ludovic Desroches <ludovic.desroches@atmel.com>

Le 26/03/2015 13:18, Ben Dooks a =E9crit :
> Use endian agnostic _relaxed IO accessors instead of the __raw ones.
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> --
> CC: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com> (maintai=
ner:PIN CONTROLLER -...)
> CC: Linus Walleij <linus.walleij@linaro.org> (maintainer:PIN CONTROL =
SUBSY...)
> CC: linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLL=
ER -...)
> CC: linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSY...)
> CC: Andrew Victor <linux@maxim.org.za>
> CC: Nicolas Ferre <nicolas.ferre@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> CC: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> ---
>  drivers/pinctrl/pinctrl-at91.c | 50 +++++++++++++++++++++-----------=
----------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl=
-at91.c
> index f4cd0b9..cdd47dc 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -451,18 +451,18 @@ static enum at91_mux at91_mux_get_periph(void _=
_iomem *pio, unsigned mask)
> =20
>  static bool at91_mux_get_deglitch(void __iomem *pio, unsigned pin)
>  {
> -	return (__raw_readl(pio + PIO_IFSR) >> pin) & 0x1;
> +	return (readl_relaxed(pio + PIO_IFSR) >> pin) & 0x1;
>  }
> =20
>  static void at91_mux_set_deglitch(void __iomem *pio, unsigned mask, =
bool is_on)
>  {
> -	__raw_writel(mask, pio + (is_on ? PIO_IFER : PIO_IFDR));
> +	writel_relaxed(mask, pio + (is_on ? PIO_IFER : PIO_IFDR));
>  }
> =20
>  static bool at91_mux_pio3_get_deglitch(void __iomem *pio, unsigned p=
in)
>  {
> -	if ((__raw_readl(pio + PIO_IFSR) >> pin) & 0x1)
> -		return !((__raw_readl(pio + PIO_IFSCSR) >> pin) & 0x1);
> +	if ((readl_relaxed(pio + PIO_IFSR) >> pin) & 0x1)
> +		return !((readl_relaxed(pio + PIO_IFSCSR) >> pin) & 0x1);
> =20
>  	return false;
>  }
> @@ -470,55 +470,55 @@ static bool at91_mux_pio3_get_deglitch(void __i=
omem *pio, unsigned pin)
>  static void at91_mux_pio3_set_deglitch(void __iomem *pio, unsigned m=
ask, bool is_on)
>  {
>  	if (is_on)
> -		__raw_writel(mask, pio + PIO_IFSCDR);
> +		writel_relaxed(mask, pio + PIO_IFSCDR);
>  	at91_mux_set_deglitch(pio, mask, is_on);
>  }
> =20
>  static bool at91_mux_pio3_get_debounce(void __iomem *pio, unsigned p=
in, u32 *div)
>  {
> -	*div =3D __raw_readl(pio + PIO_SCDR);
> +	*div =3D readl_relaxed(pio + PIO_SCDR);
> =20
> -	return ((__raw_readl(pio + PIO_IFSR) >> pin) & 0x1) &&
> -	       ((__raw_readl(pio + PIO_IFSCSR) >> pin) & 0x1);
> +	return ((readl_relaxed(pio + PIO_IFSR) >> pin) & 0x1) &&
> +	       ((readl_relaxed(pio + PIO_IFSCSR) >> pin) & 0x1);
>  }
> =20
>  static void at91_mux_pio3_set_debounce(void __iomem *pio, unsigned m=
ask,
>  				bool is_on, u32 div)
>  {
>  	if (is_on) {
> -		__raw_writel(mask, pio + PIO_IFSCER);
> -		__raw_writel(div & PIO_SCDR_DIV, pio + PIO_SCDR);
> -		__raw_writel(mask, pio + PIO_IFER);
> +		writel_relaxed(mask, pio + PIO_IFSCER);
> +		writel_relaxed(div & PIO_SCDR_DIV, pio + PIO_SCDR);
> +		writel_relaxed(mask, pio + PIO_IFER);
>  	} else
> -		__raw_writel(mask, pio + PIO_IFSCDR);
> +		writel_relaxed(mask, pio + PIO_IFSCDR);
>  }
> =20
>  static bool at91_mux_pio3_get_pulldown(void __iomem *pio, unsigned p=
in)
>  {
> -	return !((__raw_readl(pio + PIO_PPDSR) >> pin) & 0x1);
> +	return !((readl_relaxed(pio + PIO_PPDSR) >> pin) & 0x1);
>  }
> =20
>  static void at91_mux_pio3_set_pulldown(void __iomem *pio, unsigned m=
ask, bool is_on)
>  {
>  	if (is_on)
> -		__raw_writel(mask, pio + PIO_PUDR);
> +		writel_relaxed(mask, pio + PIO_PUDR);
> =20
> -	__raw_writel(mask, pio + (is_on ? PIO_PPDER : PIO_PPDDR));
> +	writel_relaxed(mask, pio + (is_on ? PIO_PPDER : PIO_PPDDR));
>  }
> =20
>  static void at91_mux_pio3_disable_schmitt_trig(void __iomem *pio, un=
signed mask)
>  {
> -	__raw_writel(__raw_readl(pio + PIO_SCHMITT) | mask, pio + PIO_SCHMI=
TT);
> +	writel_relaxed(readl_relaxed(pio + PIO_SCHMITT) | mask, pio + PIO_S=
CHMITT);
>  }
> =20
>  static bool at91_mux_pio3_get_schmitt_trig(void __iomem *pio, unsign=
ed pin)
>  {
> -	return (__raw_readl(pio + PIO_SCHMITT) >> pin) & 0x1;
> +	return (readl_relaxed(pio + PIO_SCHMITT) >> pin) & 0x1;
>  }
> =20
>  static inline u32 read_drive_strength(void __iomem *reg, unsigned pi=
n)
>  {
> -	unsigned tmp =3D __raw_readl(reg);
> +	unsigned tmp =3D readl_relaxed(reg);
> =20
>  	tmp =3D tmp >> two_bit_pin_value_shift_amount(pin);
> =20
> @@ -554,13 +554,13 @@ static unsigned at91_mux_sam9x5_get_drivestreng=
th(void __iomem *pio,
> =20
>  static void set_drive_strength(void __iomem *reg, unsigned pin, u32 =
strength)
>  {
> -	unsigned tmp =3D __raw_readl(reg);
> +	unsigned tmp =3D readl_relaxed(reg);
>  	unsigned shift =3D two_bit_pin_value_shift_amount(pin);
> =20
>  	tmp &=3D ~(DRIVE_STRENGTH_MASK  <<  shift);
>  	tmp |=3D strength << shift;
> =20
> -	__raw_writel(tmp, reg);
> +	writel_relaxed(tmp, reg);
>  }
> =20
>  static void at91_mux_sama5d3_set_drivestrength(void __iomem *pio, un=
signed pin,
> @@ -1538,9 +1538,9 @@ void at91_pinctrl_gpio_suspend(void)
> =20
>  		pio =3D gpio_chips[i]->regbase;
> =20
> -		backups[i] =3D __raw_readl(pio + PIO_IMR);
> -		__raw_writel(backups[i], pio + PIO_IDR);
> -		__raw_writel(wakeups[i], pio + PIO_IER);
> +		backups[i] =3D readl_relaxed(pio + PIO_IMR);
> +		writel_relaxed(backups[i], pio + PIO_IDR);
> +		writel_relaxed(wakeups[i], pio + PIO_IER);
> =20
>  		if (!wakeups[i])
>  			clk_disable_unprepare(gpio_chips[i]->clock);
> @@ -1565,8 +1565,8 @@ void at91_pinctrl_gpio_resume(void)
>  		if (!wakeups[i])
>  			clk_prepare_enable(gpio_chips[i]->clock);
> =20
> -		__raw_writel(wakeups[i], pio + PIO_IDR);
> -		__raw_writel(backups[i], pio + PIO_IER);
> +		writel_relaxed(wakeups[i], pio + PIO_IDR);
> +		writel_relaxed(backups[i], pio + PIO_IER);
>  	}
>  }
> =20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
