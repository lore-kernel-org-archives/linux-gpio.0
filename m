From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 2/6] gpio: Introduce gpio descriptor 'name'
Date: Thu, 13 Aug 2015 15:28:13 +0200
Message-ID: <20150813132813.GX19600@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
 <1438680203-13432-3-git-send-email-mpa@pengutronix.de>
 <CACRpkdYv=-fCj+ts9tTmFsovPN0RPYkOdYh9Dj6oFDJiRV=RUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zIy/tJHoBBdASg6V"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:48840 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752357AbbHMN2S (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 09:28:18 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYv=-fCj+ts9tTmFsovPN0RPYkOdYh9Dj6oFDJiRV=RUA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>


--zIy/tJHoBBdASg6V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 11:37:06AM +0200, Linus Walleij wrote:
> On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wro=
te:
>=20
> > The latest gpio hogging mechanism assigns each gpio a 'line-name' in the
> > devicetree. The 'name' field is different from the 'label' field.
> > 'label' is only used for requested GPIOs to describe its current use by
> > driver or userspace.
> >
> > The 'name' field describes the GPIO itself, not the use. This is most
> > likely identical to the label in the schematic on the GPIO line and
> > should help to find this particular GPIO.
> >
> > This patch adds a helper function to find gpio descriptors by name
> > instead of gpio number.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> Oh I realized there is a big problem with this.
>=20
> struct gpio_chip already contains this:
>=20
>         const char              *const *names;
>=20
> Now it seems like names can be stored in two places:
> in an array in the gpio_chip and in a name tag in struct
> gpio_desc.
>=20
> So how do we handle this?
>=20
> I guess we need to keep just *one* of them, so maybe remove
> the names array from the struct gpio_chip and add a helper function
> that sets the names on the descs for the lines like:
>=20
> int gpiochip_set_names(struct gpio_chip *gc, const char * const names);
>=20
> And then refactor all code and chips that use the old names
> array to use this instead. I don't think they are too many, really.

That sounds good. There are just a few users of this names array, so it
should all be fine.

Just to clarify: The line names will then be the same as this name
array? So all GPIOs with name/line-names are then exported by their name
and not the number?

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--zIy/tJHoBBdASg6V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVzJttAAoJEEpcgKtcEGQQZyQP/1jXQQg+MifIzP3nRtpHU+PV
BOmeUV2oc6G47rXgdqJ5RU5R+WQxgcqSTU7Ct380u25mqUI1oq8GHvQUqQn/byX3
KoNj2LQJwFCBZHqMoEM/gC+q8BtzFRDKJgbTyPX0u+57Lpv9TRlsXrH6cgYFwuFG
+PAYI9tjet8AP+XemQHjsHBT0lrlcF5fzLNdX88h5CVkJCgduFp0291e7jwSP/n7
hHaGXmsdXoWyj3sZDh3YkDTxIaKfvddm16ytig31ExWULBTXPkibhybMLgL9Wp1S
EFZEy9sTA4P9IIGEyoDKWEJzgbgl6yR3LRGM+tWT34FmRxAyoUiCPCP2mbtBGtlW
940EEwAm7x0uWEoA4a4uwr2/RRPvhe5/EjmvyTEa/+OD4bWrJr+CrEq9/hB88J4R
f7cw0kq2oW4UTS0bqSPMPQ/FRL4KpUuo8fVNrfEWXAinpyo95z/Y/Nt+8sxFJjDd
qMqZDzTKtTp3lRZ4OQ22TzxWUrq8Oj8j7FN6QSvtTl8Bph7dOwgiWJ8n5lClLhjv
WLng0GHRuhkjNrDtNkKIx8EBkFuTjhc6/9xh+Mqe0+eGwdzeTDcOsbQ78ZywwVsN
DycbkkHX95PAGmPDNuY7nxdrLwMSl1slq9TxZS1ax411fsJwQhHgZ+IhusCsgZdd
xFrEzPu/6paR598xRlgE
=UtIi
-----END PGP SIGNATURE-----

--zIy/tJHoBBdASg6V--
