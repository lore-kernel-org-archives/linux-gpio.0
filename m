From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 113/182] pinctrl: sunxi: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:51:10 +0100
Message-ID: <20151210095110.GC27957@lukather>
References: <1449667999-3152-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LCbsoPZWBRMqE7TI"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:57567 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750790AbbLJKGT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:06:19 -0500
Content-Disposition: inline
In-Reply-To: <1449667999-3152-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>


--LCbsoPZWBRMqE7TI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2015 at 02:33:19PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--LCbsoPZWBRMqE7TI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWaUsOAAoJEBx+YmzsjxAgBbYP/3LU8Yvf2BD6jqQ72g1JIQfc
rPrH1Amx0fI7vo4juY8pg8v4bTya41AzTScNoNus4P6e9ZNKNJ9ju7OdEz0cgoJq
OgHiycRHhsnDn7frIjKN6vlZGB40fUQC4QfsBrmmGerBPGyUWGDexp2lflOcwKi4
RFLyTtODK0mMAGgno4+BoBz6dnUOfd474aDqkaBZhytT0IDRKApf4Yunup0gmSxu
vmv0ogXIWVESQilNj8c8Wqgjk9WV6BMLutxxD8Ah7anHFbPA2CVEKd28CgcqKWzJ
tnnka/+EQ7msvRdEAH30DHVUeV/JFEDjx7U1aisUfPGZe8yN2VvT3e7vonVrbhkm
RPZ3w8OrS8kK+Kc8bZIw++X5l2OqLtnZcTh8OFOBIB3UITqyGzOPCbXqsWil4Joj
TEAB4nDhntvJvv/6VMim3jV44VihLQ5LUToCk+zgz0fWwvnq+uR2eyegJV72WYcF
1+ueby2xADavqMvALi2fJPmFZIEYqnmbBkT8Y8BDnnrp5DwSjm06nXhTMr4BZ8U6
ciSph433yqOB9nfv2+LSvBq9eYt2w6ShK010TAYVtfqgg14P2Zbx872pls00gEsV
Wiva03BIG81fTT/N4/UuOjP90nE3uwZk6dEXkdpOQ4ICqjbjjSs4pf9nj4iXojSV
jp5MrfVraFT6guZHW0Md
=zCOe
-----END PGP SIGNATURE-----

--LCbsoPZWBRMqE7TI--
