From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Sat, 24 Oct 2015 19:53:31 +0200
Message-ID: <20151024175331.GA22220@pengutronix.de>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:38591 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751786AbbJXRxf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Oct 2015 13:53:35 -0400
Content-Disposition: inline
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 22, 2015 at 10:32:24AM +0200, Linus Walleij wrote:
> OK so this is it, I had no patience waiting for users to come up
> with this new ABI, and the requests for a way for userspace to
> use GPIOs properly is coming up again and again. So I created the
> basics for it, so we can then build on top of this to get things
> right. I want to get these very first things right before we go
> wild with setting/getting pin values etc.

Thanks for taking the time for this. This basic implementation seems
nice.

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

Does this include identifying GPIO lines independent of gpiochips? I
think that is a use-case as well.

Best Regards,

Markus

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

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWK8WbAAoJEEpcgKtcEGQQZvQQAKkbA+OUCgc0rnMfPu2dKb7p
Pfnud9fRXoPbL/7STVkjO6Z8U8Pllux9IoG/qqxUEzfHia++NK7Epj4SEUV0R5vk
oA3qVMeGjrZNeoRcVV5HtSmfVvC3HXL+6hTf6UrJL7CxeIcKMAtbr8djig1bWlhd
zCvdgAVUQjXRmpvx5548UpAEKs11oAtgd4I3F/jvBl5aTvXfe5ZXN9fSoN9uWPeD
Y4saR5OhXeaJHc2ZkHR+pDqn12HArjmpth9SGntAIshSS0RNvqPke9yHMTCSHUQX
BX0ZBwDycNXKoctzwyn5nl5cV9EyQfYmj/Uhr9WMkvU7bMNjp8U4EatgD7cN+2Jb
S6gtEqCupaNsKpMLdbH3d/C303V08wxWhnaUeC2kzaHbO+a2JONDj55ZiPZGB0j5
hMn9o3iS1/4bu1USdiwb/VIeLi238EsPF1nvnhgsEH+OeZ09Jmv32I0ORby+qZw1
GEJ4BIJlX9qvLHvlpNg+V/Kx/9CclyEkZCu6N2V0glhzLyIY3x+gB8fx7Bqvp7m4
M5auzRhuDu8UjrYPqKFdDIfsLS7+0+itVHZVyekcZakgEuGN6TEFnxYnlAGk2Awc
hwgMqOciBEYjp/+3pfNnxfBotTJRX0eqP/JU3yfuV9uz65MZq8AmJK3H6int7PHc
QW6L+mgGEEoSsLRov+Mh
=9YHc
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
