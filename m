From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: fix interrupt handling regression
Date: Wed, 18 Oct 2017 19:00:44 +0200
Message-ID: <20171018170044.2cr57k5jswsrvjlk@earth>
References: <1508336462-9378-1-git-send-email-mastichi@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ozsaz7vghuohtt3k"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38216 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbdJRRAs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2017 13:00:48 -0400
Content-Disposition: inline
In-Reply-To: <1508336462-9378-1-git-send-email-mastichi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Mastykin <mastichi@gmail.com>
Cc: preid@electromag.com.au, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--ozsaz7vghuohtt3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 18, 2017 at 05:21:02PM +0300, Dmitry Mastykin wrote:
> interrupt handling was broken with conversion to using regmap caching.
> cached_gpio value was updated by boolean status instead of gpio reading.
>=20
> Fixes: 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")
> Tested-by: Phil Reid <preid@electromag.com.au>
> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 3e40d42..9c950bbf 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -407,10 +407,10 @@ static int mcp23s08_get(struct gpio_chip *chip, uns=
igned offset)
>  	ret =3D mcp_read(mcp, MCP_GPIO, &status);
>  	if (ret < 0)
>  		status =3D 0;
> -	else
> +	else {
> +		mcp->cached_gpio =3D status;
>  		status =3D !!(status & (1 << offset));
> -
> -	mcp->cached_gpio =3D status;
> +	}
> =20
>  	mutex_unlock(&mcp->lock);
>  	return status;
> --=20
> 2.7.4
>=20

--ozsaz7vghuohtt3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnniLkACgkQ2O7X88g7
+pplog//QSdolzvvyrw9lYG10Gabnz1W9gCY9BTMKltXCFNPUHw7kjH/vxVjTpVP
FYSKEN0GgGhylW8Hum7hyA5FbjjdRHDVEjkkYtmh2G9PApp0TvIGe4/ABnrvvQ02
edxeWKhVGQPOYpOiWYSCyeClqUIEFYmLpSthy6U25shyqDU8Jo3AN/ZxVjAK13lY
watl/ayPesUHc5dhMb1oqEAsE0fXNzlVHctLrfZ7UZ3IsgagXaazAThBfSkVhLAN
e56Bc01f4SWNx1lbsGtV9jDKS90P8qc+i+r2PPPQ2pyektqV60/KjTE1klRP5lem
RLjllyiIrSBTNVFwAdCCUjSa8kexePpTN2fg3SWbyqSif2cHPmQFu+3YhSQ1keTI
tmQKkf2EZR0+nDL0sYhw3Be2X+xOaCcJLLoaZK5172tQgX4FBJJN7+opAD5Ben2D
fSCk+lInYUUke0kuS01w3kiP8BJf0M5Iro893UVDYqXBTD0Fy+GnJsehtUwhzu5y
PpcQinvpMvFGXYDsjvNtDhVnG0C6aIMYuppacvE5taP6+WGKMoNCxB2tkWqenF2H
cxyF/70kZyzkqalb1ZssvxKJGoKtV18z9znZ648RLDK+euO+sK2FUNSsqZvk3PlN
5wdgchAAbVcNeE9KJSLaejV/3/PeLHUWB/fascK75l1XfcuGvP0=
=ybw7
-----END PGP SIGNATURE-----

--ozsaz7vghuohtt3k--
