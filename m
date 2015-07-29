From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 8/9] gpiolib-sysfs: Show gpio-name in
 /sys/class/gpio/gpio*/name
Date: Wed, 29 Jul 2015 09:02:07 +0200
Message-ID: <20150729070207.GF30895@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-9-git-send-email-mpa@pengutronix.de>
 <20150728095337.GN28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45964 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752770AbbG2HCK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2015 03:02:10 -0400
Content-Disposition: inline
In-Reply-To: <20150728095337.GN28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 11:53:37AM +0200, Johan Hovold wrote:
> On Fri, Jul 17, 2015 at 11:32:49AM +0200, Markus Pargmann wrote:
> > This patch adds a sysfs attribute 'name' to gpios that were exported. It
> > exposes the newly added name property of gpio descriptors.
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/gpio/gpiolib-sysfs.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >=20
> > diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> > index c3b74440ca67..058019879bab 100644
> > --- a/drivers/gpio/gpiolib-sysfs.c
> > +++ b/drivers/gpio/gpiolib-sysfs.c
> > @@ -139,6 +139,25 @@ static ssize_t value_store(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RW(value);
> > =20
> > +static ssize_t gpio_name_show(struct device *dev,
> > +		struct device_attribute *attr, char *buf)
> > +{
> > +	struct gpio_desc	*desc =3D dev_get_drvdata(dev);
> > +	ssize_t			status;
> > +
> > +	mutex_lock(&sysfs_lock);
> > +
> > +	if (!test_bit(FLAG_EXPORT, &desc->flags))
>=20
> No need to check flag export, and no need for the mutex either.
>=20
> > +		status =3D -EIO;
> > +	else
> > +		status =3D sprintf(buf, "%s\n", desc->name);
>=20
> Depending on sprintfs representation of NULL is not a good idea here.
>=20
> > +
> > +	mutex_unlock(&sysfs_lock);
> > +	return status;
> > +}
> > +
> > +static DEVICE_ATTR(name, 0444, gpio_name_show, NULL);
>=20
> DEVICE_ATTR_RO
>=20
> > +
> >  static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
> >  {
> >  	struct gpiod_data *data =3D priv;
> > @@ -377,6 +396,7 @@ static struct attribute *gpio_attrs[] =3D {
> >  	&dev_attr_edge.attr,
> >  	&dev_attr_value.attr,
> >  	&dev_attr_active_low.attr,
> > +	&dev_attr_name.attr,
> >  	NULL,
> >  };

Thanks, will fix all of them.

Best regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuHpuAAoJEEpcgKtcEGQQ/2UQAIWePwK/ANbIgZMwnt1JMQuo
ajfZz5K+V45n6FlokBAroQTJIdVdbYC+Akto8zDSJ5DqvyHtcO+xFslizSU2U7S7
J8cIAoURmCKYCzwLL+aYUWbk/kzDPluvVS90VLCnfM+3w9C+MkyBwFfcOwrqcyQl
b9QDuDgXvVI3+YIiEfnZIfW12u1deh1e55A/YDR50MAWPOmTF6CxofVvBcbDidvr
qeLyha9XavXiEJ+pXQPfQc9CQhXWrT7G9zLcZIKBx0rufSBtMnxOcXU5Khv9M5Uh
AUKF3I1Rg1ksBcSGeJ0WJ/WqqAsvP9ak+Z6CzDlRfEjQHzMdh0Hq1QKldMsdPwFi
q1fPCm2ZQq6n2T963ZBoAHnlXRqqU+2t/qAcdozYU+WywdTdLSl+UOIE1vrs7RQr
ngG9mbkAH6XqpHzeCNUmDrA4tNpD5L13OUwXcCgbu4LJjxe/BrEP6Q4kqHyrPEck
RQw2/NJJ89Y2ZOJnbVJjwK8eDV8I75DgcsThPn9Ap/n6Shsfu4oSl8NptCUsNU87
9ZR3vdg/ol2yNOnHNH+dqGLZ1XIQ8lhCeR7gp3mRB2zuSlrjIGQIDQ/Y5dcbJbsn
r42aRB97fglvXOP7C7oFHX0wylEOKQ2Xj9e/qPGMF4bLj1/Y1zWuV81H6tElTY2O
Xic//7vPLChvcDQBHE3/
=4NIo
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
