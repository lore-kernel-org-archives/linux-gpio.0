From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/3] gpiolib: Initializing GPIOs using DT property
 gpio-initval
Date: Wed, 19 Aug 2015 12:35:58 +0200
Message-ID: <20150819103558.GP11161@pengutronix.de>
References: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y6PvmTFIYclVmRST"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:44994 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436AbbHSKgC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2015 06:36:02 -0400
Content-Disposition: inline
In-Reply-To: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org


--y6PvmTFIYclVmRST
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2015 at 12:18:29PM +0200, Markus Pargmann wrote:
> Hi,
>=20
> This series adds a gpio-initval property to the devicetree. It provides a=
 way
> to initialize GPIOs to a defined value.
>=20
> The previous patch was '[PATCH v2] gpio: Allow hogged gpios to be request=
ed'
> which would have allowed to request hogged GPIOs. Linus suggested a separ=
ate DT
> property as hogged gpios should not be requested.
>=20
> There are 3 patches. The first two simplify the function gpiod_hog. The t=
hird
> reuses the gpiod_hog()_code for a new gpiod_initialize() and adds the par=
sing
> of the DT.
>=20
> This series is based on the series
> "[PATCH v3 0/9] gpiolib: Add GPIO name support".

Messed up all the author/signed-off-bys. I will fix it in v2 but will
wait for some feedback first.

Best regards,

Markus

>=20
> Best regards,
>=20
> Markus
>=20
>=20
> Markus Pargmann (3):
>   gpio: Use __gpiod_request directly
>   gpiolib: gpiod_hog remove separate name argument
>   gpiolib: Add GPIO initialization
>=20
>  Documentation/devicetree/bindings/gpio/gpio.txt | 29 ++++++----
>  drivers/gpio/gpiolib-of.c                       | 11 +++-
>  drivers/gpio/gpiolib.c                          | 74 +++++++++++++++++--=
------
>  drivers/gpio/gpiolib.h                          |  6 +-
>  4 files changed, 83 insertions(+), 37 deletions(-)
>=20
> --=20
> 2.4.6
>=20
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--y6PvmTFIYclVmRST
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1FwOAAoJEEpcgKtcEGQQ87EP/2E9wSq2PPPrAQ/l/btsauk3
Rj2GcmZvlwaoKu9UkzjFi+ukqOKPNCFPwhY+zNRRV9S3qLGN9eXEWpOrSxT+cfZs
vx8XaisLUAFKTl96TsksZ7iiTvZcEpq7YgKMMUXMPiOmLHZWCgAxKC451TUmWGtE
k16Rkaj1wZ3PV3WSJr2LBIO04mkV9xm1TtaD8wzQ3dzpMDWRybfew3SB97Q5edtF
e3aUF9rOrn5MtQBqRCWtq9QOugje5lVYZEBSnWPZaGyQzz1bGkKNjJH3BcppSJ/A
IBy2ZCZ651Sk+tcRItVMVzZkXPkoCHhiEhpraW0nsrdwgPKW/MeEVYHTkgIbldOJ
tOc0RuBMTs9qRVshHoLDCvmyvI0t7amVlOyDhk9XoqZeF+a71DlED1mj5yfmkbC6
HPXNIGNo/mj//bDRjCNpXoohagkq/1Z0Bv8m2vY2x9FAaDxoK2383RHljQnvHUHl
fHHveY4CrGng/iHREic5edgL8lkHLqL5nXV8PK02xYOVdWeJJlh9PT80aUHGYzov
c5oXApMl3zCQNa25rP9+S1LBHB8ipCAl6Jf8cAn3Jx+ZF2xS8/xasBrxCUc4cHTF
RtoJm5UjPgjxT4gZBQSN9V/KMMBOjUkb9COXJr59RSjTcl5Vm7c+zg6qLbSenK3m
CQnqLHQei12xp5jNDEk1
=BC1q
-----END PGP SIGNATURE-----

--y6PvmTFIYclVmRST--
