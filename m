From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] gpio: pxa: avoid attempting to set pin direction via
 pinctrl on MMP2
Date: Sat, 3 Nov 2018 20:03:54 +0100
Message-ID: <20181103190354.GA31179@amd>
References: <20180917111721.7412-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180917111721.7412-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-09-17 13:17:21, Lubomir Rintel wrote:
> Similarly to PXA3xx pinctrl-single can't set pin direction on MMP2 either.
> See also: commit 9dabfdd84bdfa ("gpio: pxa: disable pinctrl calls for
> PXA3xx")
>=20
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvd8RoACgkQMOfwapXb+vIodgCgi/wX/q+GOA/M6aEi/a0vs0Ta
8U0AnjZVRfA/LQxh/TCv1qEy/OSfLaAR
=7QFO
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
