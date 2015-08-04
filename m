From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/6 v2] gpiolib: Add GPIO name support
Date: Tue, 4 Aug 2015 11:25:19 +0200
Message-ID: <20150804092519.GG19600@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:44284 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754833AbbHDJZX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2015 05:25:23 -0400
Content-Disposition: inline
In-Reply-To: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2015 at 11:23:17AM +0200, Markus Pargmann wrote:
> Hi,
>=20
> Changes in v2:

Sorry, forgot to add v2 into the subject.

Best regards,

Markus

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
> Best Regards,
>=20
> Markus
>=20
>=20
> Markus Pargmann (6):
>   gpiolib-of: Rename gpio_hog functions to be generic
>   gpio: Introduce gpio descriptor 'name'
>   gpiolib-of: Reuse 'line-name' from DT as gpio descriptor name
>   gpiolib-sysfs: Add gpio name parsing for sysfs export
>   gpiolib-sysfs: Show gpio-name in /sys/class/gpio/gpio*/name
>   gpiolib: Add gpio name information to /sys/kernel/debug/gpio
>=20
>  drivers/gpio/gpiolib-of.c     | 41 ++++++++++++++++++------------
>  drivers/gpio/gpiolib-sysfs.c  | 59 +++++++++++++++++++++++++++++++++----=
------
>  drivers/gpio/gpiolib.c        | 43 ++++++++++++++++++++++++++++---
>  drivers/gpio/gpiolib.h        |  3 +++
>  include/linux/gpio/consumer.h |  7 +++++
>  5 files changed, 121 insertions(+), 32 deletions(-)
>=20
> --=20
> 2.1.4
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVwIT/AAoJEEpcgKtcEGQQtIMQAKJDshc2kmGxNCN0JO0H/O1F
T+/0OBXJR0CAXZNeDdlxCSWLs2k2/IXD9WD+NrAUFwP3bH2mDU9Hag3/yV3BoPSx
7MFJxtVc69TdQeOGmyHvpCm2TTM34VUpjEvR75H2mdAO0KrVH/1vVCbOpLyjHtlq
mLsIUTIhF2zENLr2Mh8KxKj5RkPKaEFbWn3W+WAgqzExxaBIh49B/XWn48ajDueV
KiGNOUumus7MdbRbfXJU244HPf9INzlo6cMALiO+5VyRfkAE1HDMDsNoW0GhwuQ9
WpMuB6Jva1iK1XO5w6qpsiglHrrlPlBFUw5LCgGUkYV5IUG/EvsBJZ98N00G0rZs
2/aJfJnE/NRRLIxMDbO5LuFF03I8SUTxWBX/f4ksZBpXc9JuYwcLo7TNMVK351Vf
CDk12Ly4JWXX9NmhDpt9jCCwRG+AL0lnWjiAVaGuqTGdyWARclhx4OSQifTNFsg7
Y28I6gcts5uiYxyIPfkJ/iH6sEXsapdPUu9678qODEpkYsFX4jK6orda486CltZn
n64d3yfghRdCdPwydPgvJKrKdapwArDJtpJr96BXTwWdL8le1JGHr3xh19gFTG9u
D9LF5xeOjP5/qGQIvnP1V0Q2V03jibTD8Yb7Bp1jg7UwfYTtdf/i0iPoeQlaJCHE
9aG4CRyc50NqeSX9PH67
=q087
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
