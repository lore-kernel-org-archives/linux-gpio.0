From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 3/9] gpio: Allow hogged gpios to be requested
Date: Wed, 29 Jul 2015 08:52:00 +0200
Message-ID: <20150729065200.GC30895@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-4-git-send-email-mpa@pengutronix.de>
 <20150717202702.GK7013@pengutronix.de>
 <20150719140142.GV26287@pengutronix.de>
 <20150728091753.GJ28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:34048 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778AbbG2GwG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2015 02:52:06 -0400
Content-Disposition: inline
In-Reply-To: <20150728091753.GJ28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, linux-gpio@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 11:17:53AM +0200, Johan Hovold wrote:
> On Sun, Jul 19, 2015 at 04:01:42PM +0200, Markus Pargmann wrote:
> > Hi Uwe,
> >=20
> > On Fri, Jul 17, 2015 at 10:27:02PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello,
> > >=20
> > > On Fri, Jul 17, 2015 at 11:32:44AM +0200, Markus Pargmann wrote:
> > > > It can be useful to claim hogged gpios later, for example from
> > > > userspace. This allows to set defaults for GPIOs using the hogging
> > > > mechanism and override the setup later from userspace or a kernel d=
river.
> > > >=20
> > > > This patch adds a check for hogged gpios to allow requesting them. =
If
> > > > the gpio is not hogged but marked as requested, it still fails with
> > > > -EBUSY.
> > > >=20
> > > > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > > > ---
> > > >  drivers/gpio/gpiolib.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index bf4bd1d120c3..9f402b159cbe 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -798,7 +798,8 @@ static int __gpiod_request(struct gpio_desc *de=
sc, const char *label)
> > > >  	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
> > > >  	 */
> > > > =20
> > > > -	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) =3D=3D 0) {
> > > > +	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) =3D=3D 0 ||
> > > > +	    test_and_clear_bit(FLAG_IS_HOGGED, &desc->flags) =3D=3D 1) {
> > > >  		desc_set_label(desc, label ? : "?");
> > > >  		status =3D 0;
> > > I don't like this patch. IMHO hogging is a "use" of a GPIO that should
> > > prevent it being requested.
> >=20
> > I disagree with you here. The original patch stated in its description
> > that it was designed to initialize GPIOs. In my understanding this does
> > not necessarily mean that a hogged GPIO has to be blocked forever.
>=20
> IIRC, this use case was discussed but was rejected by Linus when hogs
> were added:
>=20
> 	https://lkml.kernel.org/r/CACRpkdZcNcPBYQM438CZJx1gYst9BFBSTj-3Qv2aPGF9p=
dWa5g@mail.gmail.com

I see. Yes I really would like to have this 'initial settings' feature.
Any suggestions for a better way?

Best regards,

Markus

>=20
> Linus?
>=20
> Johan
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuHgQAAoJEEpcgKtcEGQQYtEP/2VtTAv9W8lQSHDW31+rx75r
4sK1F+QeJO9akPUJE1ljrBR803X0qlpbYlV0CRAJKg/qKJDffWa4SBl9W46ouRjc
zvbyaD3EyCGuY8M36KA6RtkU0wYHg2L9QTCUUdRn+dazJt6bR6c5G7RTsfIMJawk
wz6tFNlit4RR0VoJEdnCNCOp3W8nqsMzZmvweIU98JEL7K9wMLvnvcVsDG8wq9v0
wT1SdvrB4QS6j+1BwwlNqsskAK8AXpjkHyaqoieiA1x1g1zQLYQsp/rHieA45F/c
xaEE1btL/Xj/mht8Xy9BBJ+Kb7Kr+PcyYWNZ88hbrh+2oUKQA7+f+3VnicXDhsVo
8v8VadBCd/xCKb5bL9rxRJvOBHRegLvUM8W7x3/k1iJbYK+aFqSuTo7b07BHwmC5
1V05QuSXupApGBa/LnP4p+TLStQKSwhpBko9YyPkoMtxqo/ABDl6ya1rkli0wBf1
UwTaetb1ExggqjqY78fKRoWoEcKEPEeq+AvnIoQVh4zMAQ13QwE5sD5zIx3eHRTU
bK3nXc9e0HdaRzsr3ouFJEhtJmzYiLyx0PMvuHscn4f2G9kK0s9AEMsIxNuOUJkr
Hkh6oztpIRNDSHsEpP2+YI7XdANjApZYfcTKuC83LlJPcnbrwIPM/Z92quebE+GF
SdZObUtU7VTFj53nZIpm
=a0OE
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
