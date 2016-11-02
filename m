From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Wed, 2 Nov 2016 22:31:42 +0100
Message-ID: <20161102213142.ajano4g4oizusv74@lukather>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
 <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
 <20160923210549.GY8719@lukather>
 <20161026154928.hu6rjalw7syrvbvg@lukather>
 <CACRpkda=_TD5S7N52CSYrmKvkY5WLU4Qi47_a=K+8Ud+kmphqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sggayqvgig4knulw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from up.free-electrons.com ([163.172.77.33]:49230 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751214AbcKBVbq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2016 17:31:46 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkda=_TD5S7N52CSYrmKvkY5WLU4Qi47_a=K+8Ud+kmphqg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>


--sggayqvgig4knulw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Oct 27, 2016 at 02:12:45PM +0200, Linus Walleij wrote:
> On Wed, Oct 26, 2016 at 5:49 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > In order not to break the DT, we looked at the code of pin_request
> > (which is the one using the strict flag), and went to the conclusion
> > that it needs to be amended to check the owner based on the device
> > structure pointer.
> (...)
> > Which means that in order to avoid removing one property from a DT to
> > fix an actual bug that can cause real stability issues to Linux, we
> > end up reworking the gpiolib API and fixing all the users.
>=20
> DT backward compatibility is for one case: when devices are shipped
> with a DT burnt into ROM/flash. Is that happening?
>
> If Allwinner or their subvendors are not shipping devcie trees - i.e. if
> this a community-only effort and you're just building and booting the
> DT+kernel on all these devices, by all means break the ABI if it
> makes sense. Noone is going to complain.
>=20
> Then we can discuss backward compatibility the day Allwinner start
> shipping device trees, not now.

As far as I know, no one is shipping DTs in a read-only
storage. Allwinner ships a different binary format (FEX), or a widely
incompatible DT in their newer SoCs in their BSPs, so it doesn't
really matter anyway.

The only product that I know of that is running only a mainline-ish
kernel is the CHIP, which I happen to work on, and we just have an
upgradable debian package holding the DT.

And we'll *have* to update it anyway, since between the time where we
ship a feature, and the time it gets upstreamed, the DT binding is
very likely to have changed anyway because of the reviews.

Some other products have a mainline-ish options too, but are in a
similar situation, since their DT have bindings of an earlier version
of patches.

So no, I really don't think the DT ABI matters here, or at least
compared to the bug we face and the changes that we would need to make
in order to fix it. But Mark will probably disagree.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sggayqvgig4knulw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGls6AAoJEBx+YmzsjxAg5GEP/RulMtoZkmiQbvOgHDbxNKC2
Oq7XM59xV5TTtWi2h+8bLMdzSXglGa8naE0LUM/qJyxM232UOkq1QVwzlExwKhKr
RdJE52UpLmh2EoXQrWKXDEtD1JCpb9CWX9drJfqLyd3Kdg0XrkibsUEZwfwgQhfd
Q31nmDZpW8F9KjWdnysugNDx1zB00nOld32mrwI2YPy+PfSn9WIPFUWMfA7xbEm1
EHJr9RIcSKqrcnKqHH6p/VdLp5i5JKRq6rBuX3QWVZkvWk2++ZDGSd9+TqWUtNBv
liEUeZh3+GEefYHMAUbRgEUWZ9Vf3NYt6jqfPmkdr/49vRZCv6qicKVE18M1zmZp
2BxKxMSp0IXj9o4c2t0ke0Jac98hTMT+E9l7N8PX5+kvCK+ZksPOd6oMTzlX/vCl
l7yScGXJvMzSzUxOQ3VKE8uTnqQd24ddBQeqKCXsl9XQqAbmva514ljeQgieW1Z0
NX4NadVuYKSX4NCsQFNVFTozcC3SJamkAasmmGXcJIwnkO6oQRiU8WphdGOB+B49
Rbams1UaXBsZnY7RDAuRBaPNIAMJSbn8xjF7fXIwnbMpZ4qUhm3i5vmsbKMe0DEk
uPbPFZnt3Ba0zd6pASjvSwKJsFpXHSBDbaR6D+JMvJyL5+oDrsMWbpK5yOePOJqB
pwMffakFOt+eMhaQH2pd
=gXne
-----END PGP SIGNATURE-----

--sggayqvgig4knulw--
