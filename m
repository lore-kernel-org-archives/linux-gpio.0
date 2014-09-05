From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] pinctrl: single: fix freudian slip
Date: Fri, 5 Sep 2014 16:23:30 +0200
Message-ID: <20140905162330.75247029@ipc1.ka-ro>
References: <1409903739-25998-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.karo-electronics.de ([81.173.242.67]:49614 "EHLO
	mail.karo-electronics.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932614AbaIEOXo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Sep 2014 10:23:44 -0400
In-Reply-To: <1409903739-25998-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Hi,

Linus Walleij wrote:
> commit 03e9f0cac5da6af85758276cb4624caf5911f2b9
> "pinctrl: clean up after enable refactoring"
> renamed the vtable callback .enable to .set_mux. The
> renaming was done manually, and one of the alterations
> contained a freudian slip. I confess, I am human.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-single.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinct=
rl-single.c
> index 9032422ad18f..fb94b772ad62 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -519,7 +519,7 @@ static const struct pinmux_ops pcs_pinmux_ops =3D=
 {
>  	.get_functions_count =3D pcs_get_functions_count,
>  	.get_function_name =3D pcs_get_function_name,
>  	.get_function_groups =3D pcs_get_function_groups,
> -	.set_mux =3D pcs_sex_mux,
> +	.set_mux =3D pcs_set_mux,
>  	.gpio_request_enable =3D pcs_request_gpio,
>  };
> =20
Congrats, you passed the Turing test! ;)


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
