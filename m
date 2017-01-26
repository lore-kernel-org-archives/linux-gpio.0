From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/8] pinctrl: sh-pfc: Add r7s72100 PFC driver
Date: Thu, 26 Jan 2017 18:14:31 +0100
Message-ID: <20170126171431.inq5xf36ltllfrlr@ninjato>
References: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
 <1484568772-18137-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3sbfgq4hwkz5bwxt"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484568772-18137-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--3sbfgq4hwkz5bwxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Just some very minor nits... Probably not worth the resend.

On Mon, Jan 16, 2017 at 01:12:45PM +0100, Jacopo Mondi wrote:
> From: Magnus Damm <damm@opensource.se>
>=20
> Squash commits in Geert's renesas-driver/genmai-gpio-and-pfc branch that
> add support for r7s72100 PFC.
> This squash combines commits for Magnus' original driver, several
> "groups" definitions and minor fixes on top to forward-port it to a more
> recent kernel (v4.10)
>=20
> Signed-off-by: Magnus Damm <damm@opensource.se>
> Signed-off-by: Wolfram Sang <wsa@sang-engineering.com>

I'd prefer the "wsa+renesas@..." address here, too.

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

=2E..

> diff --git a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c b/drivers/pinctrl/sh-p=
fc/pfc-r7s72100.c
> new file mode 100644
> index 0000000..72e1dff
> --- /dev/null
> +++ b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
> @@ -0,0 +1,529 @@
> +/*
> + * R7S72100 processor support
> + *
> + * Copyright (C) 2013  Renesas Electronics Corporation

2013-2017?


--3sbfgq4hwkz5bwxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAliKLncACgkQFA3kzBSg
KbZ7VxAAkrAfG1RVFASWYKJSoIKiU4YdapIRJsDFWaJkWEd2eDxCF+PxZ6PuLoqm
KKD5OmXMKY2wiAK+JTgg9ri6e3sUVeZ2G2AIrgAEzXnFw0RahmiRlna8pJHLHw89
bMeaoZLtiVUVngbXtclXkPy/vymIPNOiUsmKYFlo7+JL663bLIQmghFw9sYYosGA
PMeGUcGXxyg2Na33q9DBjt00nT8Pe9qPl3NVwujSlWOJvCdv/3AoPy8Mlya3wXAP
x6CofGmvucJyJpfzFnpydSUV7y2SEVxLnp+ZkEYhE0xmeEKl3EDUsxMrYOj61Dlr
oq12EETEDsAjh1Fl0YgsWA8UhNyEPjrY+Pbl84989z8++TguyhxqtT+MHPY7rYmk
e3NenycjF1Kf6I9riH6h/z2HOSRMqPCmDY5xYjENL12WFhwlyHNhLoJ8FGEB1XCy
XJ6YITfi2a3QPGWPnZvH9PZoR//vrWSGMmNd786frzbWY135nU4x0XxXrronlt73
6W8D+yNoOCsfWzKwudiKTuYt/+mwo2PpifEK+6A2GWiIje9WuNoFGSqT/85c20r4
4FvdxS6cgNHRC054Ak3S/e43AQpCtd4CXVuZn1Jnf0fJkIGFEbNUhzoq0IC/5QlR
CnvxR1APD7hm1tNYeetxpxrMyRkDq3Q6F2GoR4mUoTmrWKN/iX8=
=FDRq
-----END PGP SIGNATURE-----

--3sbfgq4hwkz5bwxt--
