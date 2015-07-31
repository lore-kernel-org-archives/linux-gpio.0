From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 9/9] gpiolib: Add gpio name information to
 /sys/kernel/debug/gpio
Date: Fri, 31 Jul 2015 12:41:01 +0200
Message-ID: <20150731104101.GB1994@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-10-git-send-email-mpa@pengutronix.de>
 <20150728095842.GO28535@localhost>
 <20150729070842.GG30895@pengutronix.de>
 <20150731085407.GO28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:37797 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287AbbGaKlH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2015 06:41:07 -0400
Content-Disposition: inline
In-Reply-To: <20150731085407.GO28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2015 at 10:54:07AM +0200, Johan Hovold wrote:
> On Wed, Jul 29, 2015 at 09:08:42AM +0200, Markus Pargmann wrote:
> > On Tue, Jul 28, 2015 at 11:58:42AM +0200, Johan Hovold wrote:
> > > On Fri, Jul 17, 2015 at 11:32:50AM +0200, Markus Pargmann wrote:
> > > > Add some information about gpio names to the debugfs gpio file. nam=
e and
> > > > label of a GPIO are then displayed next to each other. This way it =
is
> > > > easy to see what the real name of GPIO is and what the driver reque=
sted
> > > > it for.
> > > >=20
> > > > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > > > ---
> > > >  drivers/gpio/gpiolib.c | 11 ++++++++---
> > > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index dcac3bcf21dd..0f1d1f5faf5d 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -2308,14 +2308,19 @@ static void gpiolib_dbg_show(struct seq_fil=
e *s, struct gpio_chip *chip)
> > > >  	int			is_irq;
> > > > =20
> > > >  	for (i =3D 0; i < chip->ngpio; i++, gpio++, gdesc++) {
> > > > -		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
> > > > +		if (!test_bit(FLAG_REQUESTED, &gdesc->flags)) {
> > > > +			if (gdesc->name) {
> > > > +				seq_printf(s, " gpio-%-3d (%-20.20s)\n",
> > > > +					   gpio, gdesc->name);
> > > > +			}
> > >=20
> > > So now we'd no longer just be listing requested gpios, but on a simil=
ar
> > > format to how requested ones used to be represented.
> >=20
> > Better suggestions on how to display those extra information in debugfs?
>=20
> Perhaps a new file only listing the line names.

Yes that's a possibility. On the other side having it all in one place
is nice. As it helps you to debug faster, you can directly see which
line name was requested for what purpose and so on.

>=20
> > > Then there's the debugfs as ABI discussion...
> >=20
> > I didn't consider debugfs as ABI as I thought it is just for debugging
> > purposes?
>=20
> Some people seem to have expressed a different position:
>=20
> 	"The fact that something is documented (whether correctly or
>         not) has absolutely _zero_ impact on anything at all. What makes
>         something an ABI is that it's useful and available. The only way
>         something isn't an ABI is by _explicitly_ making sure that it's
>         not available even by mistake in a stable form for binary use.
>=20
>         Example: kernel internal data structures and function calls. We
>         make sure that you simply _cannot_ make a binary that works
>         across kernel versions. That is the only way for an ABI to not
>         form."
>=20
>         https://lwn.net/Articles/309298/
>=20

Oh, I see. But I think that debugfs should help us to debug issues.
If we start to care about breaking userspace tools it is not as helpful
anymore. If I develop some tool against information that are
clearly marked for debugging, I would somehow expect that my tool breaks
at some point. But thats just my opinion.

Best regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVu1C9AAoJEEpcgKtcEGQQb/YP/0ij8G2mVUV1lVW1NMiYjnpQ
5+2VSahEZG13gi6ILAehFBruVi+uGe6BvApkYFKI3TEqtzI+wMqwuC4uFOIykzbo
0r0UFwvRdK7orv5rYLeAFbIFJlFwET41KR38AvZ5MdBqSTbhOgL2FJuLSt+q5z2I
fzAXNPMGtL0l+dpDoAiLVQTT48dks7tqFB92lyiwRlCa/kVOIznXSuJHjdLs95aV
BA8kf9P6S9jNwFYvwNKLry7bKnihM/eZ+PbmqxEP2ab1MPfwr1bYn4GkQeCI4MrO
xhawXPMuV0M+BeWgtQiQOQWRaa53+AplGxXDwvhqrXW+sGJZA9a/0xuDy/r5TXdE
HljOLzg2PipZiwRGlX0Bk95bRypSO6or1e5hOT5sr89YE0FfXNREuLjh/BzkeXKc
vecEgfoWeBjhEawHXhunfqoF6ECyA3yS/QdH7Ew6CaMMaJH2gWkruUplbHG0944i
6n24ZhsRr6cTqS74Pcm9Urjxt6juZSYmiyVzfRVq3uhqAfac/AFfxnjz8+e8sWrn
uNFoXxLI1msyPjza3UEF+tPsoVcfPONWW9Z+Z6LhzKxBplkjBSiRg0fuBxJlsRZv
Rtc4J5Tq+sP/oUU/9ry0Ggk6KfcqpIUhb2mG4ijYLrBGNHxP9OwbeVxrIV2Afsu/
N6zmfCrfDiQGn+oU7lFc
=Y0AH
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
