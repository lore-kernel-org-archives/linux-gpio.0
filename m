From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v3 7/9] gpiolib-sysfs: Add gpio name parsing for sysfs
 export
Date: Thu, 24 Sep 2015 09:23:40 +0200
Message-ID: <20150924072340.GX32203@pengutronix.de>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
 <1439561466-14350-8-git-send-email-mpa@pengutronix.de>
 <CACRpkdYb3i-Bb75bn--r2ack_wiSMFFq1msFkxx5o4UVht6WWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NAuYj0K7Umiq33rm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:41254 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932730AbbIXHXo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 03:23:44 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYb3i-Bb75bn--r2ack_wiSMFFq1msFkxx5o4UVht6WWw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>


--NAuYj0K7Umiq33rm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 06:09:15PM -0700, Linus Walleij wrote:
> On Fri, Aug 14, 2015 at 7:11 AM, Markus Pargmann <mpa@pengutronix.de> wro=
te:
>=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> This has too terse commit description. I don't understand the patch or
> what it is supposed to do.

Sorry, indeed, this requires a commit description. I would add something
like this:

In '/sys/class/gpio/' GPIOs can be exported by using their GPIO number.
If the exported GPIO has a name, it will show up as a new directory in
'/sys/class/gpio/<GPIO_NAME>'. It is somehow inconsistent to use a
number for exporting and the name for accessing the GPIO.

This patch adds the possibility to use the GPIO name to export it. This
introduces a consistent behaviour for exporting and accessing a GPIO
=66rom userspace.

The mechanism of parsing the GPIO name is a fallback mechanism. This
ensures backwards compatibility of the gpio interface. If the string
passed to '/sys/class/gpio/export' can not be parsed as number, it tries
to match a GPIO name. The same behaviour is implemented for the
'unexport' file.

The implementation uses the previously defined gpio_name_to_desc().



Thanks,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--NAuYj0K7Umiq33rm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWA6T8AAoJEEpcgKtcEGQQdAkP/RpndaAz/uD7d8xFnvjk532d
5bht8a2RjXP2ONyYGUmpXeyb2WQDG8cwehFryyw75MkMJEFR3Ojq0TP992qc65Dr
fIsk4CMgei1Zx+lst5DFO6qhZocb5JuMlqyRVdy0LCegrVKKoMokTg7WKQFmxR+I
8jT+sd1JWiMoUlIIOPmNdJrola4sICyG1IGx/Yvsa2G2grj9bYxN/A6DKwZPJYkz
6LESszoOa4eVd0Rxxc5huIxSkJu+qSP6N+Dt8VbPpODwyV74UfFf9gSj6Qug4Bpm
35oBjJTDzlmaKeiQfqmsLXcFYF7knzg3ZB8751KdpOA67T69fCbrq8s1+8VtqbWW
3TK/dluYAH/uTPgkxWSbKWJQuN8dRw5mExCh6vUPsUZuoIIsNNGC6r+WEH1Ai9t6
9Bo807gL/4SY/uOK1i+NWlMqrGgC5yJz8YVRLC8ce4K6Xzmyh1LZLiI2MZNiX0ew
U8hz+JA3OIpbcI62gmV7JzCrYrz7SgVGpX2oV1lhyHzvtOJZen/4llK40RATaQzP
Hk0TSyVcrv89H6ul/HRtySkywbUL3Hqd1LHRwATvdSqxn3ycwtmWbxsVH3JXxB0U
RRVBNEDI4xUueCFR6oW5rlm450XUqszRJ411QVXou4dk8lMuRsCgi4FktifYjPkT
C07bduGPS26Doq7cj4Av
=AH1H
-----END PGP SIGNATURE-----

--NAuYj0K7Umiq33rm--
