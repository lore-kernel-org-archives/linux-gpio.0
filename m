From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 3/4] gpio: pca953x: Add pca9506 as DT compatible
Date: Wed, 30 Jul 2014 15:09:30 +0200
Message-ID: <20140730130930.GJ13842@pengutronix.de>
References: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
 <1406618686-22385-4-git-send-email-mpa@pengutronix.de>
 <20140730125216.GI13842@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zPXeIxDajdrcF2en"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:57000 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752692AbaG3NJp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jul 2014 09:09:45 -0400
Content-Disposition: inline
In-Reply-To: <20140730125216.GI13842@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de


--zPXeIxDajdrcF2en
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 02:52:16PM +0200, Markus Pargmann wrote:
> On Tue, Jul 29, 2014 at 09:24:45AM +0200, Markus Pargmann wrote:
> > This driver can also be used for the nxp,pca9506 device.
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
> >  drivers/gpio/gpio-pca953x.c                             | 1 +
> >  2 files changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/=
Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> > index b9a42f294dd0..eb65157d47f6 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> > @@ -3,6 +3,7 @@
> >  Required properties:
> >   - compatible: Has to contain one of the following:
> >  	nxp,pca9505
> > +	nxp,pca9506
> >  	nxp,pca9534
> >  	nxp,pca9535
> >  	nxp,pca9536
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> > index fda3eae835d0..df5eb6e6be1e 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -729,6 +729,7 @@ static int pca953x_remove(struct i2c_client *client)
> > =20
> >  static const struct of_device_id pca953x_dt_ids[] =3D {
> >  	{ .compatible =3D "nxp,pca9505", },
> > +	{ .compatible =3D "nxp,pca9506", },
>=20
> The item for the i2c_device_id table is missing in this patch. I will
> send a v2.

This patch can actually be dropped. There is no difference between
pca9505 and pca9506 so it doesn't make sense to add pca9506.

Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--zPXeIxDajdrcF2en
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJT2O6KAAoJEEpcgKtcEGQQT9QQALN8UG05jTjNgoRhqKBjgxSd
PBeJB8IUWJNrvR4iGf5uUP6KHuOT27Q/6XcON3XJd6SI/PSj6D8J/QLzCx2SvMI7
C7zQfgqATJyV1HdMmEtePSJWB3729Q3gJ78Rm4+3Nvw2ZCKyo7YM0Aq1rKLU+/+U
vZ4Nk5cjYpRUHqPfutbuAtckZY/mPxpbTDF2LtkWUyYo5P06TUpdUxw3FUfzke3g
y0CwLjEEyjD5NJuj4iT5wSaMzGZOa+BE109d6OpDqOYwxlLBZz4w8KQmtJ4hDi64
F69xbdrrpKUlnZv7BexmAGOV7vS4TMYGeMCQ1u6ERkNNsJ1M0Xkz6UsO/+Laiur0
RE/8blMNPsn4ncxCJ1xMEcv94RXnXrtdN1DMNW+RCuGqdrH+byAih5oKrCDjk06x
UC3ypM8vh8xm1kCZWVYCpIfoDsAEk2+x0xsS5WGAw4H3pDzhm02HdRI2SlueQk6C
an+rLtYbVHD/OfVLHSIAw7DPdiccSpuGvz50C07NUbck4H82EnWSCIxv4EG05BOh
DBC357YPZ4EIXMP1O5INeRYy1xS2i7aFz6/zogBQkkPpUeRPielnVdEmPYnzIMdh
1O8sufVB4chERSlXtKJ7ccZLi8U2u2BQX9C2FkzXz2hJbM01dknSwFSfUuNIrBx2
xWl46SCnWlyq9azV7FdZ
=vxvS
-----END PGP SIGNATURE-----

--zPXeIxDajdrcF2en--
