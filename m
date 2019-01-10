From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Increase size of regulator array
Date: Thu, 10 Jan 2019 16:26:32 +0100
Message-ID: <20190110152632.hdlo3h4e7yzzjtug@flea>
References: <20190110082633.6321-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kli3jxp2tgsklhtl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110082633.6321-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--kli3jxp2tgsklhtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 10, 2019 at 04:26:32PM +0800, Chen-Yu Tsai wrote:
> On the A80, the pin banks go up to PN, which translates to the 14th
> entry in the regulator array. The array is only 12 entries long, which
> causes the sunxi_pmx_{request,free} functions to access beyond the
> array on the A80 and the A31 (which has pin bank PM). While the
> accessed data is still valid allocated data within the same driver
> data structure, it is likely not a pointer.
>=20
> Increase the size of the regulator array from 12 to 14. This is a simple
> fix. While we could have the code take into account the fact that R_PIO
> pin banks start from PL, or maybe even dynamically allocate the array
> based on the last pin of the pin controller, the size reduction probably
> isn't worth the additional code complexity.
>=20
> Fixes: 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank regulators")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

I definitely overlooked the R_PIO case, sorry. I guess the proper fix
would be the first alternative one you suggested, and we should take
the pin_base into account. There's no need to store twice such a large
array for this case.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--kli3jxp2tgsklhtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDdkKAAKCRDj7w1vZxhR
xVZ/AQCpt6hSufv7rqxoHZMaPfZNZtvAXgWIk+QzGqSQcNg/dwEA2m6KUm8jKcn+
y9C35x9106A+jIfECwW6uRGQcTCwhwY=
=vK/T
-----END PGP SIGNATURE-----

--kli3jxp2tgsklhtl--
