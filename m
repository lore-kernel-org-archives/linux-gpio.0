From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: Strange message from Kirkwood pinctrl driver
Date: Wed, 25 Nov 2015 16:24:05 +0100
Message-ID: <20151125152405.GG4665@kw.sim.vm.gnt>
References: <CACRpkdah4w-=qHS+q_=Ab-RiJyvbCKY-Rp5Ya0x+F=3DL2iuBA@mail.gmail.com>
 <20151125144645.GE11384@lunn.ch>
 <CACRpkdbi=iCV1B=u60mNqRWhcgAcs33J-DeB-C=r+2v1eLPbpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pTYhUwqpXRR/mkN7"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:40564 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752752AbbKYPQ0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 Nov 2015 10:16:26 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbi=iCV1B=u60mNqRWhcgAcs33J-DeB-C=r+2v1eLPbpQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>


--pTYhUwqpXRR/mkN7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 03:55:16PM +0100, Linus Walleij wrote:
> On Wed, Nov 25, 2015 at 3:46 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> > On Wed, Nov 25, 2015 at 11:27:46AM +0100, Linus Walleij wrote:
> >> Hi Sebastian,
> >>
> >> trying to use the Kirkwood pinctrl driver with compatible =3D
> >> "marvell,88f6192-pinctrl";
> >> on a Pogoplug series 4 yields the following message when instantiating
> >> the driver:
> >>
> >> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 36
> >> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 37
> >> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 38
> >> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 39
> >> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 40
> >
> > Hi Linus
> >
> > Humm, interesting. I don't remember it doing that before. I will look
> > into this in the next couple of days.
>=20
> There are only few devices using it: it is declared in
> kirkwood-6192.dtsi and that is just used by:
>=20
> kirkwood-blackarmor-nas220.dts
> kirkwood-laplug.dts
> kirkwood-rd88f6192.dts
> ... and my new device tree
>=20
> Interestingly, kirkwood-ns2[lite|mini].dts specifies it's compatible
> with "marvell,kirkwood-88f6192" but instead includes
> kirkwood-ns2-common.dtsi which includes
> kirkwood-6281.dtsi. I haven't wrapped my head around that
> one, I suspect it's a bug.

Don't wrap your head too much about that :) It is indeed a bug and it
explains why I didn't see this messages before.

Simon

--pTYhUwqpXRR/mkN7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlZV0pUACgkQgtp0PDeOcDpV+wCfZgY0PBk+BVw62iasN7uNdBpR
OOYAnjZUWeJu+a/UUkL3MctnUNi8gZQB
=ldpC
-----END PGP SIGNATURE-----

--pTYhUwqpXRR/mkN7--
