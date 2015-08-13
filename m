From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 5/6] gpiolib-sysfs: Show gpio-name in
 /sys/class/gpio/gpio*/name
Date: Thu, 13 Aug 2015 15:43:33 +0200
Message-ID: <20150813134333.GY19600@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
 <1438680203-13432-6-git-send-email-mpa@pengutronix.de>
 <CACRpkdZCSwWUuhbe2+nrEPTRnqNGvJrrbZLDwy8fkHeEJDujUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ANwsuk3Muel3MOM0"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33751 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbbHMNnj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 09:43:39 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZCSwWUuhbe2+nrEPTRnqNGvJrrbZLDwy8fkHeEJDujUg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>


--ANwsuk3Muel3MOM0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 11:50:16AM +0200, Linus Walleij wrote:
> On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wro=
te:
>=20
> > This patch adds a sysfs attribute 'name' to gpios that were exported. It
> > exposes the newly added name property of gpio descriptors.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> This needs to also patch Documentation/ABI/testing/sysfs-gpio
> if we should go with it. It says this:

Right, forgot about that documentation.

>=20
>     /sys/class/gpio
>         /export ... asks the kernel to export a GPIO to userspace
>         /unexport ... to return a GPIO to the kernel
>         /gpioN ... for each exported GPIO #N
>             /value ... always readable, writes fail for input GPIOs
>             /direction ... r/w as: in, out (default low); write: high, low
>             /edge ... r/w as: none, falling, rising, both
>=20
> Anyways I don't know if this is right, and that ABI doc is also lying.
>=20
> Look at this in gpiolib-sysfs.c:
>=20
>         if (chip->names && chip->names[offset])
>                 ioname =3D chip->names[offset];
>=20
>         dev =3D device_create_with_groups(&gpio_class, chip->dev,
>                                         MKDEV(0, 0), data, gpio_groups,
>                                         ioname ? ioname : "gpio%u",
>                                         desc_to_gpio(desc));
>=20
> I.e. what the ABI doc say about the dirs being named "gpioN" is
> a plain lie, it can have a descriptive name as its directory  name
> under /sys/class/gpio/foo-line or so.
>=20
> Since this already exist and is a flat namespace ... we should
> use that.
>=20
> However it has the implication like I said before that two names
> cannot be the same. I think Johan's comment that they could
> be non-unique did not take into account the fact that two chips
> could use the same .names array (and that would already fail,
> by the way) so the .names in the struct gpio_chip *MUST* be
> unique as compared to all other names.
>=20
> We *could* deprecate the old line naming mechanism (that create
> dirs named after the pin), and from here on only use gpioN and
> "name" in a separate file like this patch does. However that is
> not really OK either: we want to move away from the GPIO numbers
> and to descriptors and descriptive names, so I currently feel
> we should name the directories after the line instead, and
> require them to be unique.

Ok, this also answers the question I just had in the other mail.

Best Regards,

Markus

>=20
> I'll have to patch this document now anyways because it is
> lying about the ABI :(
>=20
> Yours,
> Linus Walleij
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--ANwsuk3Muel3MOM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVzJ8FAAoJEEpcgKtcEGQQEPcP/1Xh7VlSUw+ZilbwXGdwBDXd
b0nTvtRmL7WMykr+b+M8/umeLRjuPAj6QV/Ee6BGYAZmhYBgP3BkBkou78mm6rfg
2WttGYICKMy0ouSaDJ4FzAgV/xYuv9x9BcJ9XMXAwxCAubmI+kKErACe8mozrgyq
gN7z8l8LQR1npEcNpq1jDCeCiawmQxumkxg3Ffmt/aTLjP8ufwumXlHF3XUR9bzL
uD0RMVILg2ncaSLMTQcGD8rreRMr9GvYQokHEICp3TO/OpgrV6Aye5IzlCvkOgST
oUKARwVaF7uYJKTets3AdHn9Ww69Sf78pguXLqOicutxItG++NeaHP1jXfkZxqnH
ZxAmMucFV2JsIkFlaXRbivm27dN+h6pQAxwxPyrbc+N5GvBFxs/OrJm2g7RUo11U
U0gQmjthcerFP++3IgE2YX8BNKKSKDlsRF0G31MhMioRM7hbSXFKUSEJ2QJ6pPbc
X+i/pdBh3McytQh9At7QmmR5AyxtcfrAEw9OvJ9qDsFWIQfM0IDhNMWy3hS+weYf
8ahTpfz7ewjeGc73B/oR/djC7EPUNncwinW6SGoMrHjyLKowbPirzthDjrX7A5xJ
uV1bULVN6iPg1D37Dn6RLTTeAys66mX6wSHdsHj6A94qRkFq0Wr1M5JSN8qmzPSj
aPmbzn7CNI+bFNPq2/4P
=mywd
-----END PGP SIGNATURE-----

--ANwsuk3Muel3MOM0--
