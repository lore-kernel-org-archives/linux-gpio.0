From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 1/6] gpiolib-of: Rename gpio_hog functions to be generic
Date: Thu, 13 Aug 2015 15:14:03 +0200
Message-ID: <20150813131403.GW19600@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
 <1438680203-13432-2-git-send-email-mpa@pengutronix.de>
 <CACRpkdYpeoo2scKzNuSYbWfWLTBodXJEX3KyRzoRQPuoaeqzKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H2KpQ9C2DUtn/ko0"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:36364 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752383AbbHMNOI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 09:14:08 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYpeoo2scKzNuSYbWfWLTBodXJEX3KyRzoRQPuoaeqzKw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>


--H2KpQ9C2DUtn/ko0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 11:29:58AM +0200, Linus Walleij wrote:
> On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wro=
te:
>=20
> > The gpio hogging functions are currently only used for gpio-hogging. But
> > these functions are widely generic ones which parse gpio device nodes in
> > the DT.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> (...)
> >  /**
> > - * of_get_gpio_hog() - Get a GPIO hog descriptor, names and flags for =
GPIO API
> > + * of_parse_gpio() - Get a GPIO hog descriptor, names and flags for GP=
IO API
>=20
> It's not a good name, too generic. It could easily be assued this is
> for something
> wider.
>=20
> of_parse_own_gpio() or something, indicating that this pertains to the
> chip itself and not to outside users, would be better.

Yes, changed to of_parse_own_gpio() for next version.

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--H2KpQ9C2DUtn/ko0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVzJgbAAoJEEpcgKtcEGQQ5gsQAKlyJF8sUW5K5cOen80Q+JRD
xyxQ7Mss49VWCiQi7Q27LqwUn99V4LDL0oj//RHgpcvZFWEXGZFYJg5LRWIAfKFa
7Qk6mJeTKHrA+7nPK7u52ZBn5MKH/Di47+Tgt7oJPec0AowZM1JLTrJKOmKNfWjT
TDSwy6mLHfUdYQ016OY/0jQbflBKRetzs1GNKbE0q8AC0GEg3p4mKSEwAH2uoxo9
03eiOWPqX1hDKZGgqqPRb2ppon6NjxAKtIUJqVcYH5YKMaEeFheYXEG8u85ru5Sp
GbWp9+wH6mLnVjFXFKfLUTA8Mrt8FqxwOgfmWe/NGbbbiPV5/5f0mzL05SHzUxik
0SFzg5pdWipa7mu05CAJ7klGqfW0q6ADJpaVoefy6LhM2vEUzYFmAsaLnYqg9KwJ
aZQ5JwT+4TtktPDk4VTOZyHm6IfX49jpfbxTTeZJgpn31tiCuCaJV/qTLH/1DUuv
S2UgNukbF9pKFHt9O3G3Ydr68dAAwWmkQG7GKhoreuSaHE9xIPI8GV4AdehSUT4+
1LOpwnX+VrVkJHcT77Q6DRA8tqfqm5cpIS9OFNyeg19G2N7DNigEGwDjsYMWjdco
o9TmyVCOrl6+w8WpwWT3d6bAKVLTN/ifSHMxWwJM2vYpglADQWSsJh0p4E45xCPg
lREIbpBB1XsYgCOxvYj+
=dm3/
-----END PGP SIGNATURE-----

--H2KpQ9C2DUtn/ko0--
