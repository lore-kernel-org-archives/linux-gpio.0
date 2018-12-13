From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Fix IOCTRL reg state after
 s2ram on R-Car E3
Date: Thu, 13 Dec 2018 17:28:58 +0100
Message-ID: <20181213162858.GC2549@kunai>
References: <20181213162027.13137-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213162027.13137-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 05:20:27PM +0100, Geert Uytterhoeven wrote:
> Due to an interaction with commit 9f2b76a2db3c4387 ("pinctrl: sh-pfc:
> r8a77990: Add R8A774C0 PFC support"), the state of the I/O Control
> Registers is saved/restored during s2ram on RZ/G2E, but not on R-Car E3.
> Hence on R-Car E3, SDHI voltage state is lost after system resume.
>=20
> Fix this by registering the I/O Control Registers on R-Car E3, too.
>=20
> Fixes: 33847a71373cd6ae ("pinctrl: sh-pfc: r8a77990: Add voltage switch o=
perations for SDHI")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Obviously correct:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwSiMUACgkQFA3kzBSg
KbYC6w/9EBRPFwadY8nfmIk8diOOVTkI8LwMGp8cTk/mo4sSFVm98+GSqzdEKqVD
8l/YMdToplQpec9TNd6B5Lt2KNrWpQissR2/N1OfQAEI246c9OhLt+TzNdvK5iwx
dzCGi+J9T5tdfxhx3OXOyL3Nx9C4rTHYmDFagqqRTSE8VlAg1zQPgWFn3vnve2V2
rfI3qUSRoeQQ1/CVG+lR/VfA6xYRMqS/dkmOV3bUEz1WYPei/FS3r1DVIXacydPM
3dufWD62TrmwVpKXPf8tBxcR7YKd2EiOgk96GHTcmL3pk2zRcn3y6U2EbnYRaExo
FfB/g7szwndJwQ0BMEppaK1qhBVF5wqbfWz4A/H3GK3njcoXJ9Zn4okI12t2+Iv4
6UhPEC73tOTEFfl9UJGAzuMIwS5uNW1WBTOfk3PBH2GPWjqIgiU+zZR7X+PTqDsF
uNwmmRHClCueD/i7AlB+TBMri1JPgom/T6GmLQFo/8H+ca9jXtvCBlYx79WBpiYa
O8xxPe+jTLLfxfWKbTwtzqXYT4RgMnuPKyqpW5Mz5shxn+s9PswtKKgedFnVX0lE
S38JLQtNj+x9HSopmCDYxRWkeDFOJIC7tSJvEw2LKobnaFk3XIV8XASAIIiK4Hc7
CDBrIGOe+B4jyZxto7NaI5qEZS4BePQBpRshI0rc/9p0Mqrbm3Y=
=p0ye
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
