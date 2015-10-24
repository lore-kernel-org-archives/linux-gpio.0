From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 5/6] gpio: add a userspace character device ABI
Date: Sat, 24 Oct 2015 20:46:19 +0200
Message-ID: <20151024184619.GD22220@pengutronix.de>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-6-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:40656 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934AbbJXSqU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Oct 2015 14:46:20 -0400
Content-Disposition: inline
In-Reply-To: <1445502750-22672-6-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2015 at 10:32:29AM +0200, Linus Walleij wrote:
> Put in some documentation for the new character device ABI
> so we can properly etch it in stone.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/ABI/testing/gpio-cdev | 26 ++++++++++++++++++++++++++
>  MAINTAINERS                         |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 Documentation/ABI/testing/gpio-cdev
>=20
> diff --git a/Documentation/ABI/testing/gpio-cdev b/Documentation/ABI/test=
ing/gpio-cdev
> new file mode 100644
> index 000000000000..7b265fbb47e3
> --- /dev/null
> +++ b/Documentation/ABI/testing/gpio-cdev
> @@ -0,0 +1,26 @@
> +What:		/dev/gpiochip[0-9]+
> +Date:		November 2015
> +KernelVersion:	4.4
> +Contact:	linux-gpio@vger.kernel.org
> +Description:
> +		The character device files /dev/gpiochip* are the interface
> +		between GPIO chips and userspace.
> +
> +		The ioctl(2)-based ABI is defined and documented in
> +		[include/uapi]<linux/gpio.h>.
> +
> +		The following file operations are supported:
> +
> +		open(2)
> +		Currently the only useful flags are O_RDWR.
> +
> +		ioctl(2)
> +		Initiate various actions.
> +		See the inline documentation in [include/uapi]<linux/gpio.h>
> +		for descriptions of all ioctls.

Minor thing: The one ioctl is obvious but has no inline documentation at
the moment.

Best Regards,

Markus

> +
> +		close(2)
> +		Stops and free up the I/O contexts that was associated
> +		with the file descriptor.
> +
> +Users:		TBD
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bb1f52d54e0..23cd966cb974 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4642,6 +4642,7 @@ L:	linux-gpio@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.g=
it
>  S:	Maintained
>  F:	Documentation/gpio/
> +F:	Documentation/ABI/testing/gpio-cdev
>  F:	drivers/gpio/
>  F:	include/linux/gpio/
>  F:	include/linux/gpio.h
> --=20
> 2.4.3
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWK9H7AAoJEEpcgKtcEGQQQc4P/3H/k37b+c0SyBJdxnK8IKGb
xoI2imOzAjJDpqYUbxpsfIeZtzzU4zS3Oif1gCl2lEwXqBKkF4fHafaTt8zYfIeH
HP2kcURLkxARJk1a3AYOoI4BkOCDb0vQV9KtEjvFHfdduZzEDjTBOkk2dBFOGbXH
4ipH3oxrwHVWdhhl/reWYcdkh7CJvc2UuJ7VcgQ/P4mz7z4phLsw8TTLbj/088xe
s9FKkKfZJXvVJhsBppdoWupfcPo98YSpbsqLNGjbF9HVGMpQsVlWjXkCC3+VhNVf
faN2v11zcbhCFDc13+4vulrm8xMxCobNGtojXwNCVBV0JmIjEyQXwkdflYvuS6i2
tQO56L5x3TBhrfwNh1ofxymi8OW6jHsTwnly1fLBLpFBXGmOAaTY8APMlvGVR9Rk
4Rtm0fDJRXQRiONKJMdLhmZXYPXY+z3BOsMxunPt2lWfVrOemxGrOaizzVQlEEkV
Lqh7JWcJhjxZN6onqmTh6X5SM+lQyrDvM6CjAqxjk6VoGRBJ65/IXsOAhOHNBGF3
KBWcJC4B380TWyPOGaXE6AZ2o3u2RJ/mhSw+tGBLYmOlUDSgj8i1W2mvkbYhA7BK
Whxscl5EZ7Oi0sMKb2BgOEuNLnIBqeThKgZfph7anTrejxpNhCFUAuyNH8UbzfPJ
O4aDm03g+6AWe8GkkLWW
=9oKX
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
