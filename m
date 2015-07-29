From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 9/9] gpiolib: Add gpio name information to
 /sys/kernel/debug/gpio
Date: Wed, 29 Jul 2015 09:08:42 +0200
Message-ID: <20150729070842.GG30895@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-10-git-send-email-mpa@pengutronix.de>
 <20150728095842.GO28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NPukt5Otb9an/u20"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:34561 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753253AbbG2HIr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2015 03:08:47 -0400
Content-Disposition: inline
In-Reply-To: <20150728095842.GO28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org


--NPukt5Otb9an/u20
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 11:58:42AM +0200, Johan Hovold wrote:
> On Fri, Jul 17, 2015 at 11:32:50AM +0200, Markus Pargmann wrote:
> > Add some information about gpio names to the debugfs gpio file. name and
> > label of a GPIO are then displayed next to each other. This way it is
> > easy to see what the real name of GPIO is and what the driver requested
> > it for.
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/gpio/gpiolib.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index dcac3bcf21dd..0f1d1f5faf5d 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2308,14 +2308,19 @@ static void gpiolib_dbg_show(struct seq_file *s=
, struct gpio_chip *chip)
> >  	int			is_irq;
> > =20
> >  	for (i =3D 0; i < chip->ngpio; i++, gpio++, gdesc++) {
> > -		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
> > +		if (!test_bit(FLAG_REQUESTED, &gdesc->flags)) {
> > +			if (gdesc->name) {
> > +				seq_printf(s, " gpio-%-3d (%-20.20s)\n",
> > +					   gpio, gdesc->name);
> > +			}
>=20
> So now we'd no longer just be listing requested gpios, but on a similar
> format to how requested ones used to be represented.

Better suggestions on how to display those extra information in debugfs?

>=20
> Then there's the debugfs as ABI discussion...

I didn't consider debugfs as ABI as I thought it is just for debugging purp=
oses?

Best regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--NPukt5Otb9an/u20
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuHv6AAoJEEpcgKtcEGQQ/ToP/3rj7sxZG3mhHqCfKUyXj79M
PsIBS1gmCYhbCfW1OexUIYqCRbm04PFVC0rGY7vD+ilfbTemap6ySX33ZtvCTQtP
ODm0/WX3GgPSz+FTXQ3C+l2t8AWCijefSDC0R4TBdNph9s+Tj4b8QSfo34uICqJe
DgczzjW+ZtBzw6SQc604pjLNvb95fWvve92xj4mkgRCCwZ61ErZiH4+5cGzHffly
/EMuVGX7ZXv4cE3V8QqP0kCLpdaPFoMQs4PSWa94EBQ4VnDET6SpXwjf0FCIYVmm
kE4eNNv6EeXzsNBjkG24MxygY5iNl9zXxB5G53K9QzkiiPvBoU1oeCVYykJklrJW
WY+ckiMmNMpyP/K4mee3tBL6hMOqVK/45t8ERok2bLH9czZPhwJoPRetMReaLANc
YnrV/o1z8DBku09U2qAPsPTjMEwFSpzZDyq9r8WTqiL4KpTf726NZr0X1IXAqwju
/ZKMBPU1UbKQokmi9zr154Ltl/tzL+qgl/DwePmBLTBLi0FnoQp9cpzoz9b+Rr4R
ipfgFTJZoJpQz99b7Ia0nRJ1OaSnYMzNqRiXkj5Yep9o0Vg9OfSp84fj8DjEqfLS
dP5hXFb7/E8nKQY4YcCgZhVqi1lmVBO+AFkrtJmTj8AlKX+fUe0dlpmMeHIbhUsz
5y6b+jCuZi2rsTIarlLc
=DH3Z
-----END PGP SIGNATURE-----

--NPukt5Otb9an/u20--
