From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 175/182] video: fbdev: via: use gpiochip data pointer
Date: Thu, 10 Dec 2015 17:17:35 +0200
Message-ID: <5669978F.6060808@ti.com>
References: <1449669049-7022-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="paSeroUaOlj7xT0qI5Jou3Trx1EjixV8K"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:42004 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752974AbbLJPRx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 10 Dec 2015 10:17:53 -0500
In-Reply-To: <1449669049-7022-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

--paSeroUaOlj7xT0qI5Jou3Trx1EjixV8K
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 09/12/15 15:50, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Tomi: please ACK this so I can take it through the GPIO tree.
> ---
>  drivers/video/fbdev/via/via-gpio.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

Acked-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi


--paSeroUaOlj7xT0qI5Jou3Trx1EjixV8K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWaZePAAoJEPo9qoy8lh71v4gP/RB5Zl0POXmVnZtGoZ/tmyjh
cHVu8tUPS0wnZTucp9WipEb37HPydss7olyPbsHFjzaSi6V718KsVPVyPiB5/pM+
zXNyTo0uhzP3QsxFip6p02DucJBdO6Ea+zxNs6j59q2ijqyzoz9O6GnCXUElVDIB
p4VjxEPr7an6rUvYjUXzqpAwrCHeT7v/yUfpq7Dwns6gxUnAWysahCnwMfIwSA6r
OeZ1jy/9NGdNXti0kO+rm8oIocLpt1PjHMrFMyIBnXUmQ5mvxFw20T0b2VJze6HU
6WGGffiQdceLwKHFe0YIBGYn+QdvgHEbnAO+JNfL6/InVaTYnq0b+rSLgD/ucYSi
sZuD4vBpB+zvRHIlU8CeuiEGPROoOvZ5/7w4fCUiXo9SZ8VaPCqtF0If9ipLMTm9
Jj+BaTVETHpsczgpS715lTuZLE/Rdg4hr5QoxiTq/RIvTg+qA1gfKCLo0kWfG7Ua
m+6S/4ZhUCQRW94KRrPpwtvZkkFGcKt+SEEM8bWAOOOkIi8bhHWUjZpXOls4S/Rz
aGGEAC/VPzbpexCKs9SrP9ybCxmqkibk0xA14BJ6dssDE4mu63TjvJ/kSZJZcr09
oE71ZKeBcxVp0rxnKwVgoqLu6esJonblBV/5MW6aOAh9TBJpoShVA+yHoK3Ajjxw
bQ1ir2UZ0Aisyz9x3MVB
=6jnv
-----END PGP SIGNATURE-----

--paSeroUaOlj7xT0qI5Jou3Trx1EjixV8K--
