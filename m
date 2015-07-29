From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 6/9] gpiolib-of: Reuse 'line-name' from DT as gpio
 descriptor name
Date: Wed, 29 Jul 2015 08:52:56 +0200
Message-ID: <20150729065256.GD30895@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-7-git-send-email-mpa@pengutronix.de>
 <20150728093105.GL28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42495 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752659AbbG2Gw7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2015 02:52:59 -0400
Content-Disposition: inline
In-Reply-To: <20150728093105.GL28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 11:31:05AM +0200, Johan Hovold wrote:
> On Fri, Jul 17, 2015 at 11:32:47AM +0200, Markus Pargmann wrote:
> > The DT describes gpios with subnodes. These subnodes can contain a
> > property 'line-name'. This information can be useful in other areas
> > where we want to identify a GPIO by its name.
> >=20
> > This patch stores the line-name in the gpio descriptor.
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/gpio/gpiolib-of.c | 29 ++++++++++++++++++++---------
> >  1 file changed, 20 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index 64950591a764..cefc665a558c 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -184,11 +184,6 @@ static struct gpio_desc *of_parse_gpio(struct devi=
ce_node *np,
> >  		*dflags |=3D GPIOD_OUT_LOW;
> >  	else if (of_property_read_bool(np, "output-high"))
> >  		*dflags |=3D GPIOD_OUT_HIGH;
> > -	else {
> > -		pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\=
n",
> > -			desc_to_gpio(gg_data.out_gpio), np->name);
> > -		return ERR_PTR(-EINVAL);
> > -	}
> >
> >  	if (name && of_property_read_string(np, "line-name", name))
> >  		*name =3D np->name;
> > @@ -214,15 +209,31 @@ static void of_gpiochip_scan_gpios(struct gpio_ch=
ip *chip)
> > =20
> >  	for_each_child_of_node(chip->of_node, np) {
> >  		const char *name =3D NULL;
> > -		if (!of_property_read_bool(np, "gpio-hog"))
> > -			continue;
> > +		struct gpio_desc *name_desc;
> > =20
> >  		desc =3D of_parse_gpio(np, &name, &lflags, &dflags);
> >  		if (IS_ERR(desc))
> >  			continue;
> > =20
> > -		if (gpiod_hog(desc, name, lflags, dflags))
> > -			continue;
> > +		if (name) {
> > +			name_desc =3D gpio_name_to_desc(name);
> > +			if (name_desc)
> > +				pr_err("GPIO name collision for '%s' detected at GPIO line %d (%s)=
\n",
> > +				       name, desc_to_gpio(desc), np->name);
> > +			else
> > +				desc->name =3D name;
>=20
> This will introduce a regression. As I mentioned in a comment on an
> earlier patch, of_get_gpio_hog falls back to using the node name and
> those need not be unique.

Yes, will fix this as well.

Thanks,

Markus

>=20
> Johan
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuHhIAAoJEEpcgKtcEGQQR6gQAL2hvzKPTKPfIXCAZuzCXUd8
aY3MzlcGAcTKp+HM3YcdEYKFpf/W9RCkTczCyazh74fl8p6DfxkHyMoBHvQ7nYWR
EVUj12zaRapWlaL7X/uDxk0M0/5D0L6MouyfXbnMvHxre4XZe/BzWL8IjS+3VYgd
oFBFriGAoe5gwaCd8gW+9CB6D3hJwP8PPzQvrZQlpafCrKyPP1fpXRU8y+54bWKL
7a3cafI5wQIV1qTgiQ12wrdYsxedFtwe/P2zc6/fAp54DjBS0AIbL9aIkvwDvixL
4hyNc5ezMFINZf1E1ntRvWGKv3zJhMX0OikhzZe/s5BwnWJskVrf7QTJb0+P85tL
Lsylvs3x3CYubhd0k3sery19p2R904eHEfldS0N5Sx32vJZmFHrRXf7h9CBDcam6
/dIu2gRW+KNOrtRs+rHFlAKwKhQPT8chLMnycLQ0DjYfJ2U21Nfppv0f7Xc5voaF
aU+LWyrr45Ej0MKGrnS1fUTOWBmhghNZSS6VXK3b6gUnDtSOIQSwAhEWknHHNqb6
8oRNo0yts9OMhJrYvZf49fMYQl7vF8yn3T7GbM3etDkTWJhnkUTQ8TD5jO9j8lEo
dBjVQQS8GnvwFHnSUsPNJFH1zvn4YaSd1qQrq2smSRuPd5fIrcFLKVSqFU8v8BCg
FZ046I0FnimroQeEVELC
=HLCJ
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
