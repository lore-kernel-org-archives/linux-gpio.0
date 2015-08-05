From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH 2/2] gpio/mxc: implement reading output gpio value
Date: Wed, 5 Aug 2015 11:02:18 -0700
Message-ID: <20150805180215.GA4161@localhost.localdomain>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
 <1438795388-22743-3-git-send-email-edubezval@gmail.com>
 <CAOMZO5C3mh+vYV_ZHA8hAq2UwY_TcO5sZxqLQDyNvs0VuVvJAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:32995 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050AbbHESCY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2015 14:02:24 -0400
Content-Disposition: inline
In-Reply-To: <CAOMZO5C3mh+vYV_ZHA8hAq2UwY_TcO5sZxqLQDyNvs0VuVvJAg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, ubrindis56@gmail.com, Fabio Estevam <fabio.estevam@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello Fabio,

On Wed, Aug 05, 2015 at 02:43:05PM -0300, Fabio Estevam wrote:
> Hi Eduardo,
>=20
> On Wed, Aug 5, 2015 at 2:23 PM, Eduardo Valentin <edubezval@gmail.com> wr=
ote:
> > In current implementation, reading the value of an output gpio
> > always return 0. The reason is because when a gpio is configured
>=20
> Have you tried setting the SION bit for the pad?

No, I haven't. From the bit description, it looks like it does a
different thing of what we would achieve with this patch. The SION bit
is a overwrite to the pad configuration. That is, the pin will be INPUT
always.

We don't want to force it to be input. We simply want to be able to read
the value of an output GPIO. That is achievable by reading a different
register. In case the GPIO is configured as output, the GPIO block
documentation states its value can be read from GPIO_PSR.
This approach works fine, as the GPIO will be output and we can still
read its value.

Spotting this is very simple. A quick try on /sys/class/gpio/export on
a spare gpio would do it:

# echo $SPARE_GPIO > /sys/class/gpio/export
# echo out > /sys/class/gpio/gpio$SPARE_GPIO/direction
# echo 1 > /sys/class/gpio/gpio$SPARE_GPIO/value
# cat /sys/class/gpio/gpio$SPARE_GPIO/value

without the patch it would always return 0. With the patch in, you see
the read value corresponding the output of that pin (checked on scope,
for instance).



>=20
> This should fix the problem.
>=20
> Regards,
>=20
> Fabio Estevam

BR,

Eduardo Valentin

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVwk+iAAoJEMLUO4d9pOJWaKkH/2+wybY+aRIFfTIkS0jb5nwt
zkIMQXiFyXVjsNMIujHtKnuYRL+cs4HhaJjq5f9V47HugFu2MxgC3VogGxo5ix2N
81debigG+x+mY72sKEYQM7D5Sne5cpFknV6y0FwINpyC45PDR+eBKFzcxj3hTs9f
YcBJ0ZsYb3vo65vYDCOBlkfuuKUPiylqhFvW6FE0s0Ynru5F2a8FILh+3Vq8FtRs
THH7HeIEWmQOV5qMG30Kr0rC0xAJC5WsDFXBtKrn91wU0sRybw55qKAbVgWw5oMT
n49PGluz0dVyez/QkF+E6JdflhI2YS5rEkoHAmOLpXFuLXpDyBJplrUi/Pyw+P0=
=EpBB
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
