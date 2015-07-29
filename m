From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 7/9] gpiolib-sysfs: Add gpio name parsing for sysfs export
Date: Wed, 29 Jul 2015 08:57:36 +0200
Message-ID: <20150729065736.GE30895@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-8-git-send-email-mpa@pengutronix.de>
 <20150728095004.GM28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42294 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752012AbbG2G5l (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2015 02:57:41 -0400
Content-Disposition: inline
In-Reply-To: <20150728095004.GM28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 11:50:04AM +0200, Johan Hovold wrote:
> On Fri, Jul 17, 2015 at 11:32:48AM +0200, Markus Pargmann wrote:
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/gpio/gpiolib-sysfs.c | 41 ++++++++++++++++++++++++++++--------=
-----
> >  1 file changed, 28 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> > index b57ed8e55ab5..c3b74440ca67 100644
> > --- a/drivers/gpio/gpiolib-sysfs.c
> > +++ b/drivers/gpio/gpiolib-sysfs.c
> > @@ -443,18 +443,25 @@ static ssize_t export_store(struct class *class,
> >  				const char *buf, size_t len)
> >  {
> >  	long			gpio;
> > -	struct gpio_desc	*desc;
> > +	struct gpio_desc	*desc =3D NULL;
> >  	int			status;
> > =20
> >  	status =3D kstrtol(buf, 0, &gpio);
> > -	if (status < 0)
> > -		goto done;
> > +	if (!status)
> > +		desc =3D gpio_to_desc(gpio);
> > =20
> > -	desc =3D gpio_to_desc(gpio);
> > -	/* reject invalid GPIOs */
> > +	/* Fall back on detection by name */
> >  	if (!desc) {
> > -		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
> > -		return -EINVAL;
> > +		char *gpio_name =3D kstrdup(buf, GFP_KERNEL);
>=20
> Must check for allocation failures, but why use kstrdup at all?

Yes have to check that.
strim() may modify the buf variable which is constant.

Best regards,

Markus

>=20
> > +
> > +		desc =3D gpio_name_to_desc(strim(gpio_name));
> > +		kfree(gpio_name);
> > +
> > +		/* reject invalid GPIOs */
> > +		if (!desc) {
> > +			pr_warn("%s: invalid GPIO %s\n", __func__, buf);
> > +			return -EINVAL;
> > +		}
> >  	}
> > =20
> >  	/* No extra locking here; FLAG_SYSFS just signifies that the
> > @@ -485,17 +492,25 @@ static ssize_t unexport_store(struct class *class,
> >  				const char *buf, size_t len)
> >  {
> >  	long			gpio;
> > -	struct gpio_desc	*desc;
> > +	struct gpio_desc	*desc =3D NULL;
> >  	int			status;
> > =20
> >  	status =3D kstrtol(buf, 0, &gpio);
> > -	if (status < 0)
> > -		goto done;
> > +	if (!status)
> > +		desc =3D gpio_to_desc(gpio);
> > +
> > +	/* Fall back on detection by name */
> > +	if (!desc) {
> > +		char *gpio_name =3D kstrdup(buf, GFP_KERNEL);
>=20
> Same here.
>=20
> > +
> > +		desc =3D gpio_name_to_desc(strim(gpio_name));
> > +		kfree(gpio_name);
> > +	}
> > +
>=20
> Random whitespace change.
>=20
> > =20
> > -	desc =3D gpio_to_desc(gpio);
> >  	/* reject bogus commands (gpio_unexport ignores them) */
> >  	if (!desc) {
> > -		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
> > +		pr_warn("%s: invalid GPIO %s\n", __func__, buf);
> >  		return -EINVAL;
> >  	}
>=20
> Johan
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuHlgAAoJEEpcgKtcEGQQNeIP/26nwzWAnz83smaMEUohizmm
CM30pf+2vsnX065NQ//qOZL3L2O1inATDpV6amFAjJvwgeHyncizRz+znaA3PXZw
9w5Ks9X7eIo5/dT8IsqdCAhfZ1HuOLBrqClFTi5/KWI0grhimilT7KHi/33LkC+B
x0uf861mYrWZk+NoFLPSeIS9Wj3BXMQ7E6aI3qH7hQz40nLNjpol09UVf5MmrQ3R
t9ygvEfEvZLHGy78eNRzxfCQAfEF6gRJFFvPXtljXDsLg6HPIB4a4Rove0mpDX2e
DdtosusA2pcLyu/ad9JRw/U2LM3y7VVCT8EEkfZCL6Jjix383qZlG24+oKYWTN/J
ZiVUmJH8hfLe1yo5Z3gi0UX0NXyDzYJiC1h34l+OrZ68JYV0i3RtB1tmwHAr29X5
i43OTc/hYihxSTD41eC/hPr7gN8H+pb66lZT00zm93gboygjIPAhUED6D4+hMRli
koNTshn0fT5izoTj7Id9Emq9sLmjDVNL4e8dwKosy2wfuxVuu04jkJtjW2KPdbJF
hW7CtSiSo5qsmk2hzBpImcbmQ9snY12jcFTiZkYqey61/2JjQyeWYXUCdT9IqlRO
5RPqprrZmaZgY+6yKCVFYvfDWi3Hfmho3tIp/GLCKFz3Bw2SmtG+RVbrroC4pL6B
9pU7fmdXpTix0nHJFuow
=cFW/
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
