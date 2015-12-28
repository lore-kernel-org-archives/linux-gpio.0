From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 29/54] pinctrl: ssbi-gpio: Be sure to clamp return value
Date: Sun, 27 Dec 2015 19:59:49 -0800
Message-ID: <20151228035949.GE16437@tuxbot>
References: <1450794674-23958-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:34590 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345AbbL1D7x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 22:59:53 -0500
Received: by mail-pf0-f176.google.com with SMTP id e65so54229076pfe.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 19:59:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450794674-23958-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Bj?rn Andersson <bjorn.andersson@sonymobile.com>

On Tue 22 Dec 06:31 PST 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Also, this code was double-inverting a bool. That makes no
> sense whatsoever, so I removed the double-invert.
>=20
> Cc: Bj=F6rn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinct=
rl/qcom/pinctrl-ssbi-gpio.c
> index 7bea0df06fb1..394ca34bec4a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> @@ -487,10 +487,10 @@ static int pm8xxx_gpio_get(struct gpio_chip *ch=
ip, unsigned offset)

                ret =3D pin->output_value;

I do make sure that output_value always is [0,1], but feel free to add =
a
!! for clarity.

>  	} else {
>  		ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, =
&state);
>  		if (!ret)
> -			ret =3D !!state;
> +			ret =3D state;
>  	}
> =20
> -	return ret;
> +	return !!ret;

But these you should keep as is; before your change ret is either
negative errno or !!state, after your change errno is merged with the
"high case".

So either just drop this patch, or add the !! to the output_value and m=
y
Reviewed-by if you want consistency.


This is actually the code path that started the discussion :)

Regards,
Bjorn

>  }
> =20
>  static void pm8xxx_gpio_set(struct gpio_chip *chip, unsigned offset,=
 int value)
> --=20
> 2.4.3
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
