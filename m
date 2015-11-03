From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Tue, 03 Nov 2015 08:39:13 +0100
Message-ID: <2109736.Oi4ERkUO0L@adelgunde>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org> <CACRpkdaKO=L7+73OqnTYjs71F0-UEGTLy4=wszaXEro4dbKfcw@mail.gmail.com> <20151101024144.GF28319@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1993466.G3OXs7KGJK"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:46266 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750788AbbKCHjR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 02:39:17 -0500
In-Reply-To: <20151101024144.GF28319@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Amit Kucheria <amit.kucheria@linaro.org>


--nextPart1993466.G3OXs7KGJK
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 01 November 2015 11:41:44 Mark Brown wrote:
> On Fri, Oct 30, 2015 at 08:47:14PM +0100, Linus Walleij wrote:
> > On Fri, Oct 30, 2015 at 2:55 AM, Alexandre Courbot <gnurou@gmail.co=
m> wrote:
>=20
> > > * For all the justified hate that sysfs got, it had the advantage=
 of
> > > being directly accessible using only the shell. If we replace it =
with
> > > a character device interface, I think we will need a "libgpio" (t=
hat
> > > provides easy access to C programs) and "gpio-tools" (simple
> > > command-line tools that provide functionality similar to the sysf=
s
> > > interface). Are we ready to start and maintain these? Granted, it=

> > > should not be too much work, but it's still an extra.
>=20
> > I think the raw ioctl()s will be simple enough and intend to use
> > the tools/gpio/* as proper examples. If we need
> > tools/gpio/swiss-army-knife.c we will add it too.
>=20
> > ALSA and fbdev and MESA and libusb spawned huge userspace
> > libs, but I hope this ioctl() ABI will be simple enough that apps
> > can use it directly without a lib. But what do I know.
>=20
> That only works for very C like languages, for other languages (thing=
s
> like scripting languages in particular) you're going to need a librar=
y
> for the language to bind to in order to be usable.

I think we need real gpio userspace tools for such a chardev interface =
and not
only a library. On the one hand there are all the kernel/userspace deve=
lopers
that just want to test stuff. On the other hand there are really a lot =
of
people that are using small embedded devices (e.g. beaglebone, raspberr=
y pi,
...) for really simple applications like using GPIOs to control somethi=
ng. I am
sure many of them are just using some really simple bash code to reach =
their
goals.

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

--nextPart1993466.G3OXs7KGJK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWOGShAAoJEEpcgKtcEGQQV/8QAKDHJQ+eKlJC0CMvqW9MMx1p
NkEdDLsnPP7eT4sHc5uDj17fz24hMphzctRMM8MPrxyT8Sti1+O61afJH44K8gDP
0hBhSLAQn6Ss2w+bV6TKKjGMOEkTNcvBhMF0jRYpLPG3VMJnh0ABuMFRC0o6TzgB
LvXWEwD3LC1c3lYZzEpBpIzzbWecroDyPaBmIiw8zE9jjp0VL7f1hmYQSjpU0U4a
lUYY6K03g2+hS1c2b6rnvgid12yHzRbQXdN3m6U/E6E4NlslY1kY52+jkPv2I2wK
GVzn1ay3utuNkn9i7ex8DuYBhqbP+PZ4QoQ+PNO04F2XnOH6OoWLgcEDY5+ziBPM
1Gv/DeMC9emlMi+OUIrvkViEUmG8ovsFASgaJFTAucsaduJFKd2b6pU7nJJ/Q1Ly
o5vTmvkzcdP5Bnp0l6SmUVQaLUupLP0DJajdWNlzgNH474wOvyCYhYesUJI4friM
HGQftvNrlKUSVUqhuya0TQirHW9BqXcg+voJDfVv5jnf16vcWXOGVTJS5joDSeMo
pDPM7BfJK+eVLZ8albKgNxe7GhHu74sXEjodR1MEs+vwG3gRyL9+OSH8LvR0QNHH
5ZFF1pJe2xgT9ZYDrbWmVAfCtabu7udQLmH6SEYxxNhJ6cp1zndFuwbMvD4tXCmp
lEiV2zle5+9ULeDLfm8Q
=nd/a
-----END PGP SIGNATURE-----

--nextPart1993466.G3OXs7KGJK--

