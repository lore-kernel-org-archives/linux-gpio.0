From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Sat, 24 Oct 2015 20:42:53 +0200
Message-ID: <20151024184253.GC22220@pengutronix.de>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:39990 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934AbbJXSm5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Oct 2015 14:42:57 -0400
Content-Disposition: inline
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2015 at 10:32:24AM +0200, Linus Walleij wrote:
> OK so this is it, I had no patience waiting for users to come up
> with this new ABI, and the requests for a way for userspace to
> use GPIOs properly is coming up again and again. So I created the
> basics for it, so we can then build on top of this to get things
> right. I want to get these very first things right before we go
> wild with setting/getting pin values etc.
>=20
> We add ONE ioctl() to get information on the gpiochip. Now we can
> do this (example from ux500):
>=20
> root@Ux500:/ lsgpio
> GPIO chip: a03fe000.gpio, 32 GPIO lines
> GPIO chip: 8011e080.gpio, 32 GPIO lines
> GPIO chip: 8011e000.gpio, 32 GPIO lines
> GPIO chip: 8000e180.gpio, 32 GPIO lines
> GPIO chip: 8000e100.gpio, 32 GPIO lines
> GPIO chip: 8000e080.gpio, 32 GPIO lines
> GPIO chip: 8000e000.gpio, 32 GPIO lines
> GPIO chip: 8012e080.gpio, 32 GPIO lines
> GPIO chip: 8012e000.gpio, 32 GPIO lines
> GPIO chip: abx500-gpio, 42 GPIO lines
> GPIO chip: tc3589x, 20 GPIO lines

What happens if we have two I2C gpio expanders with the same I2C
addresses connected to different I2C busses? If I see this correctly
they would both show up with the same name. Is there an easy and
race-free way to see which GPIO chip is connected to which I2C bus?

Best Regards,

Markus

>=20
> Johan: I don't have a hot-pluggable GPIO controller :( can you
> do me the favour of testing this and fixing my stupid refcounts
> and race conditions? I only used my brain to try to get things
> right with pluggable GPIO controllers in this patch set, and it
> is bound to fail.
>=20
> How to identify and manipulate individual GPIO lines from this
> ABI is a *LATER* *QUESTION*, this is the bare essentials for
> getting there: basic operations on the gpiochip device level.
>=20
> Linus Walleij (6):
>   gpio: make the gpiochip a real device
>   gpio: refer to gpio device in prints and debugfs
>   gpio: add a userspace chardev ABI for GPIOs
>   tools/gpio: create GPIO tools
>   gpio: add a userspace character device ABI
>   gpio: ABI: mark the sysfs ABI as obsolete
>=20
>  Documentation/ABI/obsolete/sysfs-gpio |  30 ++++++
>  Documentation/ABI/testing/gpio-cdev   |  26 +++++
>  Documentation/ABI/testing/sysfs-gpio  |  28 -----
>  MAINTAINERS                           |   4 +
>  drivers/gpio/gpiolib-sysfs.c          |   2 +-
>  drivers/gpio/gpiolib.c                | 193 ++++++++++++++++++++++++++++=
+++---
>  drivers/gpio/gpiolib.h                |  12 +--
>  include/linux/gpio/driver.h           |  11 +-
>  include/uapi/linux/Kbuild             |   1 +
>  include/uapi/linux/gpio.h             |  28 +++++
>  tools/Makefile                        |   7 +-
>  tools/gpio/Makefile                   |  12 +++
>  tools/gpio/gpio-utils.c               |  11 ++
>  tools/gpio/gpio-utils.h               |  25 +++++
>  tools/gpio/lsgpio.c                   | 128 ++++++++++++++++++++++
>  15 files changed, 462 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-gpio
>  create mode 100644 Documentation/ABI/testing/gpio-cdev
>  delete mode 100644 Documentation/ABI/testing/sysfs-gpio
>  create mode 100644 include/uapi/linux/gpio.h
>  create mode 100644 tools/gpio/Makefile
>  create mode 100644 tools/gpio/gpio-utils.c
>  create mode 100644 tools/gpio/gpio-utils.h
>  create mode 100644 tools/gpio/lsgpio.c
>=20
> --=20
> 2.4.3
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWK9EtAAoJEEpcgKtcEGQQB+YP/jiEDP3hfROzFHUtBNc9GEWG
lHUhlDKWnKwbys+qY0kZWzHid4F2aLOku8+6aXaSv1/7Qgszy4U51HSerDVktFOk
O86ufrTwmR3+PjdesgLa3jIj0n61bwba0Y/Qlhid3VCbLFEaDcsKIshn+ivSqc89
o0tPjFgFSAdeFU2pwFGbM6kAoEqt4j5C2Bu8KHsMPrlUTS8W4dFUVAjx3O7Cnimk
t0/vv4iLeJnSJ2l/NKXNnhapU9u0SHJPfkuhN6r/HhCeR0rcPdd3lcDcBNWDe1Yo
365ZPPESkkDGrT6V9WS/v0D5ot7z03EOjW5v8RtQq/C/rm3xsccXfyvORewJqhWc
BwM9Dc1wo7mC7bVbIHxTSWxN6ZuVBGiipFKRCIVrMascaDqzsljYDqDt2Nf44ss5
nf9cFN5jvHZ5Uj5y9otHyqT3nsVUq6SalYpMuMoeQzu0w147T+i4W7ErRX36LT43
JtfbLJkpjWlKlXDUU2a7JDD/ZgysCtrl/R4RQgK6WoEgTApCrnkhcLJdSI9VhqQ+
eZ0uImFXBwBr4Suq0kngZ6KKNLc90yQjoDh9yd/w9jtxERTbteEvNjGY0cuk/qnl
39RR6byhq6a08N1FhaZcLsKy8ishnV1J4r2+gmyIr06SgYxAAZtoE7bRc4ER7poV
AoXY3WBsdNnR57i7f+CN
=97Q9
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
