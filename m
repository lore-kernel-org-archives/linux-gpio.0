From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 3/9] gpio: Allow hogged gpios to be requested
Date: Mon, 20 Jul 2015 09:51:25 +0200
Message-ID: <20150720075125.GW26287@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-4-git-send-email-mpa@pengutronix.de>
 <20150717202702.GK7013@pengutronix.de>
 <20150719140142.GV26287@pengutronix.de>
 <20150720063249.GM7013@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ubBGeysJ7fFOU9Y9"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33882 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755675AbbGTHv3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2015 03:51:29 -0400
Content-Disposition: inline
In-Reply-To: <20150720063249.GM7013@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, linux-gpio@vger.kernel.org


--ubBGeysJ7fFOU9Y9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 08:32:49AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Markus,
>=20
> On Sun, Jul 19, 2015 at 04:01:42PM +0200, Markus Pargmann wrote:
> > On Fri, Jul 17, 2015 at 10:27:02PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Fri, Jul 17, 2015 at 11:32:44AM +0200, Markus Pargmann wrote:
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
> Assume for a moment I can agree with "not necessarily". But now, what
> about the cases where a hogged GPIO should be blocked?
> IMHO, if you want to drive the GPIO from userspace anyhow, you don't
> need to add a hog for it.

If I don't use a hog I leave the system in an undefined state until the
userspace can initialize the GPIOs. So all the userspace controlled
GPIOs are undefined when all the drivers probe which can lead to
problems if the GPIOs have any indirect influence on hardware components
which drivers probe before the userspace.
I think it is valid to somehow define a safe state for GPIOs in the
devicetree while you can later change this state from userspace?!

Best regards,

Markus

>=20
> > The IS_HOGGED flag is cleared at the same time it is tested so only one
> > consumer can request one hogged GPIO. The GPIO is not considered to be
> > hogged after it is normally requested.
> You're right here, I missed the and_clear_bit part on the test.
>=20
> Best regards
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--ubBGeysJ7fFOU9Y9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrKh9AAoJEEpcgKtcEGQQbDUP/2hzWnjDIe80VK74pWpEBDDQ
FPkfNS0YzYyR8nBye3f5L/5hcsCajUnYmkr3UtgXZUHsF8z0uyi1ZLcUkpnn7r6q
blZBzEyzJvWJyiCqBkSoxfctnJRelotjQgQ6oDhrVNgJhFKYe6Fe5ibJAiKtnQOz
iL20H71FNui6183Y6KMEz6fPAsw6CzwqL4mKWqLidcUaTGfGJiodVk65KAGwTjf4
NZ1A7llseaYhd22SNBuHRD1YOiunCCGhNwkwQdxbA8bjLeXw1uh61cBTuS34lqsM
YfM0FvMQ227nccmn/1nzTH+5jRLUiMOyOq9TJCwbpvm98v6W0udnwApz5/6mJOsT
HC1JNlIyKXBD/+9e5CraIUxikxN5d9qBQOJmwl12nXrxaSPhM1/bVN/MY188wf95
w5ZuAJ7XJrc1+0bhbJTRTTqnJ30OG2c4NCJlaXKOii85OWyTkgLhwqE3Fk4s4VXL
LV/sNQyR1hVuYyVc83WJ353TQT70ygKLjD1ZYlNhIgqs7xf9CSh6+F48xwm83Sn2
iaumwEC6K3Zs1sFqAfqI6znbl0J3tnKFMJepLzujwZmefMwAJzL+1N9zG8hLNjfJ
pvuNrnMls7xlkluUwQ65Awrpazt71yI2zwqa65FPzs5zy4LaF51kn56CCd5/n/Q4
Qr5hcFjiMhQM2tERJr3t
=lXCv
-----END PGP SIGNATURE-----

--ubBGeysJ7fFOU9Y9--
