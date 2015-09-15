From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 2/3] gpiolib: gpiod_hog remove separate name argument
Date: Tue, 15 Sep 2015 10:50:05 +0200
Message-ID: <20150915085005.GC1537@pengutronix.de>
References: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
 <1439979512-3894-3-git-send-email-mpa@pengutronix.de>
 <20150907080818.GQ9999@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:48271 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518AbbIOIuP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2015 04:50:15 -0400
Content-Disposition: inline
In-Reply-To: <20150907080818.GQ9999@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@devmp.org>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 07, 2015 at 10:08:18AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Aug 19, 2015 at 12:18:31PM +0200, Markus Pargmann wrote:
> > From: Markus Pargmann <mpa@devmp.org>
> >=20
> > The gpio name is now stored in the gpio descriptor, so we can simply use
>=20
> What is now? Does this introduce a dependency; maybe better reference a
> commit here?

Thanks. Yes this was refering to patch 3 of series
"gpiolib: Add GPIO name support",
patch "gpiolib: Use GPIO name from names array for gpio descriptor".

However I can only reference by name here. Will add it to the commit
message.

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV99u9AAoJEEpcgKtcEGQQZcIQAKPKq2DDhWrkf4Db7OSpvGbV
Nusaz7dYnwAR5DhPW3yZvEbTJnlWkd/UBIszz7QMmzA87TZTCP+FdWNzX05T/Ol0
Xssc/TeNoqfCQ6JZYgkT1+2hIi39j0xFQPJwHwMw/SJedHXmg4LHoWP3uDKXo1k9
JMNgGTfnSSnbrabDgbWhl3OuntwPslAMK47fAnawa+VMczEmAPOuHqdD9y6mZKUV
pn8Bs5ekyO3k4wCBzR7i4PfjFNluRA7wRV/ACokIPYUnNwgdA7gc1vMu0bc5ZCu9
CvM2c3C2W50XklPYo7mSVskBlMNut5bJpkVCRgfnyv3tz1vqRTkYKPzmpbPP1W2X
XYD0ctpnTkaKcA4Lwo0GBg0bYBt6w7xbbLw8Z/pnhYx+Co5QGyYp4tLEb/MfUvxv
j53Ihm4rMiYbE1O9srFMChHTIR8TijR9US9SwWehNcRNfqbEKDNmmcmnG8HMkxnh
UGfUaPGGFUanLBoDuL9NbMv957PPtw94CZe9pUCjb39bDl1inJASkUapUT6/DVCD
frtACBNMU2UK7k37FV21i1Q4gM90eTgN9pyyz532nvNIQwgml+fXk98ieNwoOr9r
8n8qw3sjBqBiESJhQRPTeS1+SCIzflFzms38PaUY3S4YHRbiKS3KIQVHL+wwjkNE
r/4fy1N5rScA/om3FNcw
=yL7m
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
