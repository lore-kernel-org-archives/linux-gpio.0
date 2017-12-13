From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] gpio: Add helpers to determin direction of gpiods
Date: Wed, 13 Dec 2017 16:03:53 +0100
Message-ID: <20171213150353.er5fjw3toh7km7yg@ninjato>
References: <20171210002340.18460-1-linus.walleij@linaro.org>
 <20171212224207.xi4yiuyhp5radivr@ninjato>
 <CACRpkdbK1D6cPm__2DRd0LOi=3RgjBj9ubd1_fWE-=KLcEEbjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="74y57xjl7rxrr2qv"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbK1D6cPm__2DRd0LOi=3RgjBj9ubd1_fWE-=KLcEEbjA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--74y57xjl7rxrr2qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > You need to fix the kerneldoc for 'gpiod_get_direction", too. It still
> > mentions GPIOF_DIR_*.
>=20
> More places? I can't find them!

drivers/gpio/gpiolib.c

Line 198 in both 4.15-rc3 and linux-next.

Or as I said, the kerneldoc of gpiod_get_direction ;)

> Together with Geert's comments I start to lean towards actually
> just creating two new #defines in <linux/consumer.h>.
>=20
> It has the upside that we can also check the return value
> for errors.

Sounds good, in deed.


--74y57xjl7rxrr2qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAloxQVUACgkQFA3kzBSg
KbZyqw//RgVHHxHo9pzvFA9PLc19hp8fxk0xUvJ+oWtLK+3R/0lHJNHno0w6XqEZ
Tio4CMqL2V6FpwSHnYjtsPJ1cnVYis0BAkjHXrvmFDSOE397t3j0TEynwqQhN9rJ
syu/l4sKCJIxDsk2hil47+bsWbSj0UPOpgStKx3ZrcReT1Ikhogftc71cSSQ7Ikn
4CuOYMliaOFEieVs/TwUXsTLNiykmKYui2dDrJF4jP9cCGtAWyWID5PNv38YI7sC
0MGz+6UPkZUwXJXx/GKVE0trC6diHZxrwEB8ublQ5Dv+fdg+QGL2kO2IAKHaCf3l
HMhivV0CEsKVmr+XmzQ6cZd0SlBaIipxgIDsRKJaQcQubTcHHyFJSy5vlDjj8x5c
Ul4CHGslcB0uNFhmgVj+3t8tByKkkC/UX1cj0IJgiFGcpGJvWAlIvMtbZA0vnSgM
wEnb0VeKLKrr2q26cT5F8ZzNEH+PN/czwd5UOE2O6+KPpZwD38dBOx8xjh9CwGXN
4yJME++GhOrtMyOFabdBM1M59Bh197VLrnVE5+nmp5Z0a6oxPf4LtWVAO8T9BciC
Xhv1fh4RMLRd59uTWzzuEICWFZf/ORwVPwVww7zxNSkkKH/IIO8sH8H51H8mB6Qx
htpnwSSiYtW6+6sCC1xPQc5Zl+B+T+LRjRiI2KR3s2n1zh6PxAg=
=677T
-----END PGP SIGNATURE-----

--74y57xjl7rxrr2qv--
