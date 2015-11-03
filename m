From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Tue, 03 Nov 2015 08:23:24 +0100
Message-ID: <3389425.noBYZr9C6e@adelgunde>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org> <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com> <20151102101347.GA14066@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2878517.OidkK43KWv"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:34454 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751546AbbKCHXp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 02:23:45 -0500
In-Reply-To: <20151102101347.GA14066@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>


--nextPart2878517.OidkK43KWv
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 02 November 2015 11:13:47 Johan Hovold wrote:
> On Fri, Oct 30, 2015 at 08:48:44PM +0100, Linus Walleij wrote:
> > On Fri, Oct 30, 2015 at 2:55 AM, Alexandre Courbot <gnurou@gmail.co=
m> wrote:
> > > On Sun, Oct 25, 2015 at 3:42 AM, Markus Pargmann <mpa@pengutronix=
.de> wrote:
> >=20
> > >> What happens if we have two I2C gpio expanders with the same I2C=

> > >> addresses connected to different I2C busses? If I see this corre=
ctly
> > >> they would both show up with the same name. Is there an easy and=

> > >> race-free way to see which GPIO chip is connected to which I2C b=
us?
> > >
> > > I suppose the bus path could be part of the GPIO chip name to avo=
id
> > > this ambiguity, something like: 7000c000.i2c/0-001c.gpio
> >=20
> > For DT that is the simple solution.
>=20
> Not all devices are platform devices, and the bus path can become qui=
te
> long, for example for usb to uniquely identify the gpio controller th=
is
> could be:
>=20
> =09platform/68000000.ocp/48064000.usbhshost/48064800.ehci/usb1/1-2/1-=
2.3/1-2.3:1.0/gpiochip7
>=20
> > Right now it used gpiochip->label if that is set, else the name of
> > the gpiochip device like gpiochip0, gpiochip1 etc.
>=20
> Perhaps better to just stick to the bus unique names (e.g. gpopchip7)=
,
> and possibly export the label as an additional attribute.

I think this wouldn't be enough. We would still have trouble identifyin=
g the
gpiochips, right?

As an idea: We could use the complete path to create some sort of uniqu=
e id for
the device (perhaps hash or something different). This id can be export=
ed as
device attribute and would allow udev to create some links as known fro=
m
/dev/disk/by-id for example. This would make identifying a single chip =
quite
easy for any userspace application and we would avoid having this reall=
y long
path somewhere.

Best Regards,

Markus

>=20
> This is the lsgpio output I get on an omap system by the way:
>=20
> GPIO chip: gpio, 32 GPIO lines
> GPIO chip: gpio, 32 GPIO lines
> GPIO chip: gpio, 32 GPIO lines
> GPIO chip: gpio, 32 GPIO lines
> GPIO chip: gpio, 32 GPIO lines
> GPIO chip: gpio, 32 GPIO lines
> GPIO chip: twl4030, 20 GPIO lines
> GPIO chip: pl2303, 2 GPIO lines
>=20
> Johan
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2878517.OidkK43KWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWOGD7AAoJEEpcgKtcEGQQsAIQALGyEuk5Qxh+qcjJRZfeTD3U
sMXSqpkOZ13zn/F+PXIyiVnb8cs6hRbea0Ml++xSXtDye7VvGXlb1kOsFAnZhVl9
5tVTyPlSJaYBu2yFlHIwWnJHCTBgsxlYnNmEhSfapgr8jcuSzwhlZclYYNj3CPEL
w5ifFUFfloyJn/wsw+ASq64ljQDapHXPGFoWZyEUaGTWVLY760oUHsPGcuMvkrr5
s9srvJwmfTlcry8WUUtjujWj4VIuEBNbHuF+sOEsCifLQI44eGaiY+0Piag2SCyI
Q8C5oQCQpsgsmIdLEyEuvLrI3bCRt/lZ1EgydyiPC2mg9SNbNhvMJXP9cbEuQjyV
qV0+jHZboBzrOa4G0MYRH7uDr0L/oqaoFoy3mDGMzkLK+JKCCi9ZqIQje1taaxXp
tdbB3NIyiDKvot2DWLvz7X6jmqWBu33AIVvxAMlH4/2+CMCa1Tei3xdxYIh+LVUS
0zZBOk5IvNfAAh20rKQdfZvfdfgRVnhNru3hchEVgpNGRPqZ7pICdugouKiGlO/J
t6RWFsXbbRBd66k7Z9ue/Nd9X2FGuW7zDXfRs6oexFBSQx1ukbWKegaJflkviPsu
rFyjxnMJY8OGxOOE1Ypj9bHX2/oULWdNEfhHe4kXbLcGvGLe13q4Mfohl+/t2ueE
G2Un9zvKEfDO+i1EzF78
=U713
-----END PGP SIGNATURE-----

--nextPart2878517.OidkK43KWv--

