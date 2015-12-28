From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 28/54] pinctrl: spmi-mpp: Be sure to clamp return value
Date: Sun, 27 Dec 2015 19:53:31 -0800
Message-ID: <20151228035331.GD16437@tuxbot>
References: <1450794652-23900-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:34598 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751510AbbL1Dxf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 22:53:35 -0500
Received: by mail-pa0-f47.google.com with SMTP id uo6so81510391pac.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 19:53:35 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450794652-23900-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Bj?rn Andersson <bjorn.andersson@sonymobile.com>

On Tue 22 Dec 06:30 PST 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Cc: Bj=F6rn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctr=
l/qcom/pinctrl-spmi-mpp.c
> index 69c14ba177d0..ea1d2b2f6fd1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -591,7 +591,7 @@ static int pmic_mpp_get(struct gpio_chip *chip, u=
nsigned pin)
>  		pad->out_value =3D ret & PMIC_MPP_REG_RT_STS_VAL_MASK;
>  	}
> =20
> -	return pad->out_value;
> +	return !!pad->out_value;
>  }
> =20
>  static void pmic_mpp_set(struct gpio_chip *chip, unsigned pin, int v=
alue)
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
