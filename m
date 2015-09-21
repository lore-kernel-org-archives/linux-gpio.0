From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v3 0/9] gpiolib: Add GPIO name support
Date: Mon, 21 Sep 2015 12:58:25 +0200
Message-ID: <20150921105825.GB32203@pengutronix.de>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:34503 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754021AbbIUK6j (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 06:58:39 -0400
Content-Disposition: inline
In-Reply-To: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 14, 2015 at 04:10:57PM +0200, Markus Pargmann wrote:
> Changes in v3:
> As discussed in the v2 thread, we are using the already existing gpiochip=
 names
> now. To avoid races between kernel and userspace, the setup of gpio names=
 in
> the gpio descriptors has to happen right before the gpiochip is added for=
 use
> and after the gpio descriptors are available. Unfortunately this is exact=
ly in
> the function gpiochip_add().
>=20
> So we can't use a a function as proposed in the discussion like
> gpiochip_set_names(), as this function would only be possible after we ex=
ecuted
> gpiochip_add(). Before that point the gpio descriptors are not available.=
 But
> this can potentially lead to races between userspace and the gpio chip.
>=20
> That is the reason why I left the names array in the gpioscript. But this=
 array
> is now only used to initialize the GPIO descriptors. The named sysfs
> directories are now created using the name stored in the gpio descriptor.
>=20
> As the name is now directly represented through the sysfs directory name,=
 I am
> not sure if it makes sense to keep the patch which adds a 'name' property=
 to
> the sysfs GPIO directories. For the moment it is still in this series.

Any feedback on this series?

Thanks,

Markus

>=20
> Other changes in v3:
>  - Renamed generic of_parse_gpio() to of_parse_own_gpio()
>  - Replaced pr_warn with dev_warn as the device is available in the parsi=
ng code
>    in gpiolib-of
>  - Introduced name collision checks when adding the names from gpiochip->=
names
>    to the gpio descriptors
>  - Added documentation about /sys/class/gpio/<GPIO>/name
>  - Added check for DT in case the GPIO already has a name. This may happe=
n as
>    there are different ways to set a name, through 'line-name' property a=
nd
>    node name
>=20
> Best Regards,
>=20
> Markus
>=20
>=20
> Changes in v2:
>  - Removed patch 'gpiolib: Fix possible use of wrong name'
>  - Removed discussed patch 'gpio: Allow hogged gpios to be requested' fro=
m this
>    series
>  - Fixed show gpio name patch (locks, (null) printing, and getting the de=
scriptor)
>  - Merged gpio name patch into gpio_name_to_desc() patch
>=20
> Description from v1:
>=20
> This is a proposal to add GPIO names to the kernel based on devicetree
> descriptions.
>=20
> This series adds GPIO name support. Until now it is only possible to use =
names
> for already requested GPIOs (for example what they are used for). It is n=
ot
> possible to identify GPIOs by a name although most of them have a name for
> example in the schematics of the board. This makes it difficult to identi=
fy
> a specific GPIO from userspace.
>=20
> As the GPIO name information is a hardware description this series uses t=
he
> devicetree bindings introduced by the GPIO hogging mechanism, specifically
> 'line-name', to identify GPIOs. The sysfs 'export' file is changed to acc=
ept
> names as fallback. The gpio numbers still have a higher priority to ensure
> backwards compatibility.
>=20
> Exported GPIOs are still using their number as directory name (gpio<ID>).=
 But the
> directories now contain a 'name' file which is '' for non-existent names =
and
> the name otherwise.
>=20
> This series can be used to have an easy name mapping for udev with a quite
> simple rule similar to this:
> 	SUBSYSTEM=3D=3D"gpio", KERNEL=3D=3D"gpio*", ATTR{name}!=3D"(null)", ACTI=
ON=3D=3D"add", \
> 	PROGRAM+=3D"/bin/sh -c 'mkdir -p /dev/gpios; rm -f /dev/gpios/$attr{name=
}; ln -s /sys%p/ /dev/gpios/$attr{name}"
> With this rule udev adds a link for each exported GPIO with a name into
> /dev/gpios/. This way it is not necessary to know the number of a GPIO to=
 use
> it.
>=20
>=20
> Markus Pargmann (9):
>   gpiolib-of: Rename gpio_hog functions to be generic
>   gpio: Introduce gpio descriptor 'name'
>   gpiolib: Use GPIO name from names array for gpio descriptor
>   gpio-sysfs: Use gpio descriptor name instead of gpiochip names array
>   gpiolib: Add gpio name information to /sys/kernel/debug/gpio
>   gpiolib-sysfs: Show gpio-name in /sys/class/gpio/gpio*/name
>   gpiolib-sysfs: Add gpio name parsing for sysfs export
>   gpiolib-of: Reuse 'line-name' from DT as gpio descriptor name
>   gpiolib-of: Use dev_warn instead of pr_warn
>=20
>  Documentation/ABI/testing/sysfs-gpio |  1 +
>  drivers/gpio/gpiolib-of.c            | 50 +++++++++++++---------
>  drivers/gpio/gpiolib-sysfs.c         | 67 +++++++++++++++++++++---------
>  drivers/gpio/gpiolib.c               | 80 ++++++++++++++++++++++++++++++=
++++--
>  drivers/gpio/gpiolib.h               |  3 ++
>  include/linux/gpio/consumer.h        |  7 ++++
>  6 files changed, 166 insertions(+), 42 deletions(-)
>=20
> --=20
> 2.4.6
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/+LRAAoJEEpcgKtcEGQQqaUP/As7QON6/9/ony5BqZfF3Q7m
U5K47a6jVpOHB6aGew49G+LgN5oxSuFBRxkO9m/ORvgOuUhko2QygrRJJZwTvHOc
byXUr7xyBs999lt+VNfH+b3DEyhip1zcfcc69pilZIhxNkwEF30xUN3FrVn2wcIx
yPC5uKgRH8WdaQPaFJN31bU7vQWoJjO651wokezMMMwvmx21hkTBmVASFoA4c77g
bd2re0KLNdDLOciVX3dVlZ3Vi2arzUPC4++LlfO1Qv0Il8tBuJRvAwtKPz1+vla8
XasUgelkS+k55FCXG8Y6TMOvINvq8C8WDq2c/k6cONdPifjaMlt9OOAueTTdU9aU
7C71SCPq/VKKPZHrDQMsVqV7EQJAamtG3dVCpY3d/tzwVuOwK7GlU4ugcjPWB2qv
M73Yf9YKNhe3tBsGqhGiKF/kEy8/RNEATjWvu3sFeRK1k5JH+Edpk/r+SnR3qmDE
eX36tWxrxT8je2CssioOWjEhNwStstzJzcIRJIng/AYh1oOJWvwxNdCgSkF0F0RH
1KtcbdKneobzwjv84lTqZZx+mCOK7S0dlhil1kb3Pp434uok5rk/treAoBOtrMDw
55FHQwIxgnGCKmIeHslV8Kr5sufOq3cHg1gHfqPOhKQoK1l/mfL53iQGYvhYXL2T
1FcFxOBmR80aojtYXvR0
=yzN6
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
