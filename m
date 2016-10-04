From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/3] pinctrl: sunxi: Make sunxi_pconf_group_set use
 sunxi_pconf_reg helper
Date: Tue, 4 Oct 2016 10:07:07 +0200
Message-ID: <20161004080707.GL5228@lukather>
References: <20161004015112.20833-1-wens@csie.org>
 <20161004015112.20833-4-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hNG1vEeyG8BCaHbQ"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:33583 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751554AbcJDPB2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2016 11:01:28 -0400
Content-Disposition: inline
In-Reply-To: <20161004015112.20833-4-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com


--hNG1vEeyG8BCaHbQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 09:51:12AM +0800, Chen-Yu Tsai wrote:
> The sunxi_pconf_reg helper introduced in the last patch gives us the
> chance to rework sunxi_pconf_group_set to have it match the structure
> of sunxi_pconf_(group_)get and make it easier to understand.
>=20
> For each config to set, it:
>=20
>     1. checks if the parameter is supported.
>     2. checks if the argument is within limits.
>     3. converts argument to the register value.
>     4. writes to the register with spinlock held.
>=20
> As a result the function now blocks unsupported config parameters,
> instead of silently ignoring them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 65 +++++++++++++++++++----------=
------
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 -
>  2 files changed, 35 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 236272a2339d..1f02c4cd55c7 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -364,23 +364,27 @@ static int sunxi_pconf_group_set(struct pinctrl_dev=
 *pctldev,
>  {
>  	struct sunxi_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
>  	struct sunxi_pinctrl_group *g =3D &pctl->groups[group];
> -	unsigned long flags;
>  	unsigned pin =3D g->pin - pctl->desc->pin_base;
> -	u32 val, mask;
> -	u16 strength;
> -	u8 dlevel;
>  	int i;
> =20
> -	spin_lock_irqsave(&pctl->lock, flags);
> -
>  	for (i =3D 0; i < num_configs; i++) {
> -		switch (pinconf_to_config_param(configs[i])) {
> +		enum pin_config_param param;
> +		unsigned long flags;
> +		u32 offset, shift, mask, val;
> +		u16 arg;
> +		int ret;
> +
> +		param =3D pinconf_to_config_param(configs[i]);
> +		arg =3D pinconf_to_config_argument(configs[i]);
> +
> +		ret =3D sunxi_pconf_reg(pin, param, &offset, &shift, &mask);
> +		if (ret < 0)
> +			return ret;
> +
> +		switch (param) {
>  		case PIN_CONFIG_DRIVE_STRENGTH:
> -			strength =3D pinconf_to_config_argument(configs[i]);
> -			if (strength > 40) {
> -				spin_unlock_irqrestore(&pctl->lock, flags);
> +			if (arg < 10 || arg > 40)

This is a nitpick, but I'd really like to store the value in a
separate variable, to have a distinction between the value that was
given us as an argument, and what we're going to write.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hNG1vEeyG8BCaHbQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX82MrAAoJEBx+YmzsjxAgMEEQALo6XzxDmpqMr4tKbXAeBmKd
UQktNJ7KjWRWP0jV3jCeaOgTaEutOIZfr7wRmvkMl2nH8rzCsEpe69Bu4kAT3AQh
zG5bihau4BahIqy+mkCb/VyisAMhM/fypXjTZt8wrjHL5TJbPreaw9LooPVQ5Eel
ve04bWp16TlO2VUalXnFwPDwfUREnDYnmXA1UeguRQ52tnlCmccWaoa7rtE5EST7
FcmbhFBJKjWsLKqyYoieTTbhw8J5tP9FDcvV4PDr5yqpfJVtRX03zsKHlX2Xh7+a
58furiUCsErOzRbJheBGJ7JzYd2WDcTuQvc8AM6hBnxiGvgJ4QlAtozLHr4fBKbx
6/JF9H0iYyu8IJWiKc6H1MNCKdzW6pA3Tk4Yv6RKN2DVxNez0mkVTqeGSDKCDMi0
OI4qghVxq3fHLsonPyY+uOJYAd8XmgEInsMGgBci94PgQCZkXFG+Nw5a9C1aoJ6d
NMueNSHV1usYy53xWgq/UB6hsA0o726QtgF8/frGGjl3bVk0tMx7uy11JMyRZP0q
eUaBv5vCWTcAcbjapjiOqozzsJ0ARIbV5pI151Tk3RL/rxKj1ILoy6Hbq2MTfrGI
3oOnoHAlh45iW+YoTj+rOtzhU80/HxOW/d1udfvNhw+5iS48on9+gAoNxYlvtNYj
Db+lHPSkcp5sBeQ10lsK
=0Hwe
-----END PGP SIGNATURE-----

--hNG1vEeyG8BCaHbQ--
