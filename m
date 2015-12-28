From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 30/54] gpio: ssbi-mpp: Be sure to clamp return value
Date: Sun, 27 Dec 2015 20:01:15 -0800
Message-ID: <20151228040115.GF16437@tuxbot>
References: <1450794693-24019-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:36385 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345AbbL1EBS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 23:01:18 -0500
Received: by mail-pa0-f46.google.com with SMTP id yy13so11676404pab.3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 20:01:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450794693-24019-1-git-send-email-linus.walleij@linaro.org>
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
> This code was also double-inverting a bool which makes no sense
> so I removed that code and moved clamping toward the end.
>=20
> Cc: Bj=F6rn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctr=
l/qcom/pinctrl-ssbi-mpp.c
> index 8f5c96cbf94e..23089d541230 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> @@ -502,13 +502,13 @@ static int pm8xxx_mpp_get(struct gpio_chip *chi=
p, unsigned offset)
>  	int ret;
> =20
>  	if (!pin->input)
> -		return pin->output_value;
> +		return !!pin->output_value;

Per my answer on the gpio driver, you have my Reviewed-by on this piece=
=2E

> =20
>  	ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &=
state);
>  	if (!ret)
> -		ret =3D !!state;
> +		ret =3D state;
> =20
> -	return ret;
> +	return !!ret;

But not on these two.

Regards,
Bjorn

>  }
> =20
>  static void pm8xxx_mpp_set(struct gpio_chip *chip, unsigned offset, =
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
