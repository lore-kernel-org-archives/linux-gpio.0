From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Mon, 5 Oct 2015 12:19:05 +0200
Message-ID: <20151005101905.GI19355@pengutronix.de>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
 <20151004133742.GO4284@localhost>
 <20151005094704.GG19355@pengutronix.de>
 <20151005100703.GC25143@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y+xroYBkGM9OatJL"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:59604 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752250AbbJEKTI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 06:19:08 -0400
Content-Disposition: inline
In-Reply-To: <20151005100703.GC25143@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>


--Y+xroYBkGM9OatJL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 11:07:03AM +0100, Johan Hovold wrote:
> On Mon, Oct 05, 2015 at 11:47:04AM +0200, Markus Pargmann wrote:
> > On Sun, Oct 04, 2015 at 03:37:42PM +0200, Johan Hovold wrote:
>=20
> > > You also need to revert ddd5404007b8 ("gpio-sysfs: Use gpio descriptor
> > > name instead of gpiochip names array") however as this is an ABI chan=
ge. =20
> > > Otherwise pins with a name in DT will now be exported using the gpio =
name
> > > rather than number as they used to be. [ The current behaviour is
> > > maintained by exporting names from chip->names for hard coded names
> > > only. ]
> >=20
> > Even for GPIOs from DT it is not a ABI change. The only GPIOs that have
> > a GPIO name at the moment are using the GPIO hogging mechanism. But
> > hogged GPIOs can't be exported to userspace so there is no difference
> > for these.
>=20
> Yes, but you're aiming at generalising the hogging mechanism so that
> such pins can be requested, and that would break the ABI.

No, hogged GPIOs can not be requested afterwards.

But you are right that GPIO names should probably not be added to
existing DTs. But that's essentially the same with the currently used
GPIO names array. Changing it would change the names in userspace as
well.

So this would be only useful for all newly created DTs.

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Y+xroYBkGM9OatJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWEk6ZAAoJEEpcgKtcEGQQyjgP/AxbhcTgtxuhUuQklmFbd6lq
i4X7d4gf7aBDlN1pYGL3Pv6wXOVoj0Ed+lCU9DVwZ0nBjCrrUyO3RstIZy8L1SGM
k6+Sxxh5fdL6O218Czmcp20xvGiN84ZowcJG1Orwtbv2Xzs5WO/IdT4o1JTxa/3a
HQnwnZUDL70qKm+jtiwqq83ch8SA3XyIp+TMrFkdBvouEnVYQmQhvx1lEDX1uWlA
h51ODamMWe52t6uuDoBM/IcFxmZHlEvCr0uGlCMpQfYrGzMi8cpyVuVh5Vrim8C3
mdLYZnwdhhN9DI+qybuQ/dK2aWpHzcTgWFhBbqFxCk1kC7vK3d55vc6H8ZbkD3Iq
RHCccqTghXl/qU04FqHfUE0k5gqW7FUoFdG+NKjBIHrETG9PHxq8JYN8V8Xx2vSc
gDyWiRcMZJfS72CyWR1gepj59OONlgQbuPt/42K19HNpvPR8OjeSf3ljTPcMgSSg
Z4Jxj2iimh2610JH50PzPv23++CMypz0AC6zwJc9Rhv2Okw7loPi6uivTpxv/+vL
SZfO4XtMu02wkAjAfnmURcoCp2K6Bdkpre0/e6c86pe226pMED2kZ9GqxLoHCVDB
7q1KszWfngSwPU8jv45zj9Jxd7tE/F4+dHw4OavheVwk5njT8aoqnh1YFf65GQSk
xdnGMxG7uTILjUWFasQK
=nXnZ
-----END PGP SIGNATURE-----

--Y+xroYBkGM9OatJL--
