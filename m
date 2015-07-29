From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 1/9] gpiolib: Fix possible use of wrong name
Date: Wed, 29 Jul 2015 08:46:54 +0200
Message-ID: <20150729064654.GB30895@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-2-git-send-email-mpa@pengutronix.de>
 <20150728090331.GI28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45148 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbbG2GrA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2015 02:47:00 -0400
Content-Disposition: inline
In-Reply-To: <20150728090331.GI28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 11:03:31AM +0200, Johan Hovold wrote:
> On Fri, Jul 17, 2015 at 11:32:42AM +0200, Markus Pargmann wrote:
> > The name is set optionally from DT. Therefore we need to reset the name
> > variable for every loop iteration. Otherwise we could use a wrong or
> > uninitialized name.
>=20
> This doesn't make sense. of_get_gpio_hog falls back to using the node
> name so name will always be updated (unless there's an error).
>=20
> Could be better documented, though.

Thanks, just got the two lines wrong. Yes the name is always set
correctly.
Will fix it.

Best regards,

Markus

>=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/gpio/gpiolib-of.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index 9a0ec48a4737..60aebe4d7c26 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -209,11 +209,11 @@ static void of_gpiochip_scan_hogs(struct gpio_chi=
p *chip)
> >  {
> >  	struct gpio_desc *desc =3D NULL;
> >  	struct device_node *np;
> > -	const char *name;
> >  	enum gpio_lookup_flags lflags;
> >  	enum gpiod_flags dflags;
> > =20
> >  	for_each_child_of_node(chip->of_node, np) {
> > +		const char *name =3D NULL;
> >  		if (!of_property_read_bool(np, "gpio-hog"))
> >  			continue;
>=20
> Johan
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuHbeAAoJEEpcgKtcEGQQ0u0P/RVwxNLmKymG5g6HefsCEw1C
h9HOPIiWq522Mt0lGD0UwR6vwqHOUyDiPrlyvOFG9m6jvMgR/HTDGuJZNmUokUAf
Po03VVjBJ8hoBaxafTv9AcfShRTH6+D093aForaeA7mIW9C1CwmM0kk0LDpIS5I4
tvYVYB0CIoE/h9I3fsx6FDfNh2jUS5YtEfWjmK2psRfk0wrtILrPp7drsG5dryHw
kcFmSkJpcR/Zm+GTIqZ2sdGEDp3Ukfuo65CQbXq2lWT16Twc2XXEX5FgeHW+kC7W
2W+DrTkUp2Ft0qMM887Vk3/ifmeTEFt9/vJJ5NLwgPnrr1p8TPRFt1rzavStJ1gM
lwjHX4EziMa5BUReCGCh9hyndFHmf6LhnCcAj5VKTe0gwZdChsvnqXAIhu2Flptp
4ejOfC/UOhYGSE2nDjHC9LPN15R45UJv48j8er2DItfAurMSs8t0I21GZZMhnGDn
f+teLZ4gxogGD8KTT1ACw1pUKl+dB6GY647A8Bdbnnuxq9w1Aro5QQWY1kpNVeIq
5VetaSXXgjJ5sNsbU9gbMmQ7u34NWkYuBmZDuX81Af99UXVSmMDf1PEd06cXWimP
QStiljk3C8PWUGogIqg/KU/JZZuFkCopdetYrvAD1QYAxAORQWbW4kML9B+bGmpN
qrGV+9rwWTLbj/VCepPD
=zcQL
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
