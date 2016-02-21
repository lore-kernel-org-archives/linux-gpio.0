From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Sun, 21 Feb 2016 14:13:29 +0100
Message-ID: <4414113.xrDgcf7gfo@galactica>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org> <8756ef874911997cc5ef45fec30fb75e@jic23.retrosnub.co.uk> <CACRpkdb2+MDhTiUy9bS-dVORyQpCo-MNvtKpU3TSpq=5JkXDWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9456746.B3FFZu0XcL"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:33220 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752841AbcBURXO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sun, 21 Feb 2016 12:23:14 -0500
In-Reply-To: <CACRpkdb2+MDhTiUy9bS-dVORyQpCo-MNvtKpU3TSpq=5JkXDWw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>, Michael Welling <mwelling@ieee.org>, Jonathan Cameron <jic23@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

--nextPart9456746.B3FFZu0XcL
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Friday 19 February 2016 12:51:48 Linus Walleij wrote:
> On Fri, Feb 19, 2016 at 12:35 PM,  <jic23@jic23.retrosnub.co.uk> wrot=
e:
> > [Me]
> >> Here I lean toward the IIO event interface, that if you want to
> >> monitor a GPIO line you should ask for an event file
> >> descriptor and select() it waiting for events in userspace,
> >> i.e. every such request comes with obtaining a new fd
> >> and watching it.
> >>
> > On events, it might be worth doing it a bit more input evdev
> > like and allowing mor than one consumer.
>=20
> Hm. I'm not familiar with how that works... I guess I just
> have to go and read the code.
>=20
> > Do we need to describe to userspace what GPIOs are available?
> > Right now I don't have a board to hand to see what info is
> > already available on that front.  Strikes me as that side of
> > things may be more complex than the interface to actually get hole
> > of them.  It's this side of things that makes IOCTLs on highly
> > varied devices a pain (any why we ended up with the split interface=

> > in IIO which is sort of an input / hwmon hybrid).
>=20
> So the usecase that has been around the recent months is
> basically Arduino-type usecases, where you want a Linux
> SoC+board to be used for clever electronics prototyping
> (Internet of Things-yada yada thingofabobs).
>=20
> Those are by definition one-off kind of things, and people
> want to go around having to implement kernelspace stuff
> for their one-offs.
>=20
> Another typical example is industrial
> automation, PLCs. Those currently mmap() their GPIO
> address range to userspace and hammers them from
> there, because they think Linux GPIO suck and they
> rather break down the kernelspace/userspace barrier
> than try to fix it. (Whether this stance come from
> laziness, ignorance or plain "not my problem" attitude,
> I don't know.)
>=20
> Industrial automation with relays and shutter and
> valves and whatnot are probably better off in userspace
> than in kernelspace, a bunch of GPIO onebit reading
> and writing drivers in the kernel is not gonna be helpful.
> If it's something more complex like a sensor they should
> use IIO, if it's a LED then they should use that
> subsystem etc. But for all these binary things that
> are really dumb analog components, like relays doing
> something misc.
>=20
> A typical case is a PLC or lab board such as
> BeagleBone or 96board, where there is a number of
> GPIO lines, that all come out on the same identical
> header on the board (96board has this). Then you want
> to put an accessory on this header and access it from
> userspace. But you want it to work the same no matter
> whether it is SoC A or SoC B.
>=20
> So in order to satisfy that usecase, you need to look up
> the GPIO by name. And that mechanism is now in
> place, just that we need some DT bindings or board
> data to name the lines (it can currently be done using
> the char *names[] array in struct gpio_chip).

The gpio-hogging DT bindings still seem perfectly fine for me:

=09qe_pio_a: gpio-controller@1400 {
=09=09compatible =3D "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
=09=09reg =3D <0x1400 0x18>;
=09=09gpio-controller;
=09=09#gpio-cells =3D <2>;

=09=09line_b {
=09=09=09gpio-hog;
=09=09=09gpios =3D <6 0>;
=09=09=09output-low;
=09=09=09line-name =3D "foo-bar-gpio";
=09=09};
=09};

This could be something like this without hogging:
=09=09...
=09=09line_b {
=09=09=09gpios =3D <6 0>;
=09=09=09line-name =3D "foo-bar-gpio";
=09=09};

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart9456746.B3FFZu0XcL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWybf5AAoJECi9+rkzbKwyZ3sQAJZxghkK+HjxZdyW222HcJaj
+UEz1jQ3x+HvGDHQUJjfugLLduoGSwjWKJshy98QXxnAQdvlkxAda3hKiXWl7W0g
weQVLYDfNn3GwMVwJJmkvLlsPg4QLYtiWFzWYskeTkuffpIclse4rBnkeXhyqz8R
QpZRZoQD5JK1T3eJb6mK0dFF7sHTOdAIc5YqgGTby/zX1RbgxyilQIo4SE1mQy4L
xsvFp2D1N8B6f06E7WWQZsNDwPSjozHQuMHZpWGZRH4PmK7NrIHYy4OGdGKPCod3
oHdvUZiRvuduPtGKdGjzSx+i3iDdxB45eAGCNoNMYyjqCGHXhNhdQOuu4ExJm8rG
b3+l1tQa6f7vViBoP0OtLABVJd3PAAsGunBgKBV6dtif60Mcsx3nm97JMNojFx8t
lxzGNr7l+VBqRgeLR4LTygt7oaHIdtolAUlaN0QqIPNOEUc0b4vDPuyBBJ1L1Wip
GMlRvTeVl7dmbVc38PdWEVh/alWPWvwATuNPRejnqE4qQ2O9M0TXK93qnX0CiQHS
5m1SGcKfoFKG5JZ/m3w/P3vU6YKLIBnslRSuHz36N5Ns+nGmE+j8zr8RNPRWJach
3jSyVHuMwa2L6u55duvamBTCY3p3TCdNTsmcREMp17VlIhAtXLp3uLeJuOzPtRk7
RuZ5IJ756Mmq3FYJ0ty/
=75TJ
-----END PGP SIGNATURE-----

--nextPart9456746.B3FFZu0XcL--

