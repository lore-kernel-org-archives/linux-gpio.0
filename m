From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 3/9] gpio: Allow hogged gpios to be requested
Date: Sun, 19 Jul 2015 16:01:42 +0200
Message-ID: <20150719140142.GV26287@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-4-git-send-email-mpa@pengutronix.de>
 <20150717202702.GK7013@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+epxrXWOh++2HLjY"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:44644 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbbGSOBo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jul 2015 10:01:44 -0400
Content-Disposition: inline
In-Reply-To: <20150717202702.GK7013@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org


--+epxrXWOh++2HLjY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Fri, Jul 17, 2015 at 10:27:02PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Fri, Jul 17, 2015 at 11:32:44AM +0200, Markus Pargmann wrote:
> > It can be useful to claim hogged gpios later, for example from
> > userspace. This allows to set defaults for GPIOs using the hogging
> > mechanism and override the setup later from userspace or a kernel drive=
r.
> >=20
> > This patch adds a check for hogged gpios to allow requesting them. If
> > the gpio is not hogged but marked as requested, it still fails with
> > -EBUSY.
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/gpio/gpiolib.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index bf4bd1d120c3..9f402b159cbe 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -798,7 +798,8 @@ static int __gpiod_request(struct gpio_desc *desc, =
const char *label)
> >  	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
> >  	 */
> > =20
> > -	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) =3D=3D 0) {
> > +	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) =3D=3D 0 ||
> > +	    test_and_clear_bit(FLAG_IS_HOGGED, &desc->flags) =3D=3D 1) {
> >  		desc_set_label(desc, label ? : "?");
> >  		status =3D 0;
> I don't like this patch. IMHO hogging is a "use" of a GPIO that should
> prevent it being requested.

I disagree with you here. The original patch stated in its description
that it was designed to initialize GPIOs. In my understanding this does
not necessarily mean that a hogged GPIO has to be blocked forever.

It may be a use case for example to initialize multiplexers to known
safe values to work with the system right from the beginning. Later it
may be necessary to change them.

>=20
> While I think it's useful to be able to export some hogged pins I don't
> think this should be possible for all hogged pins unconditionally. And
> for gpios being used by drivers I'd expect they don't need to be hogged
> at all.
>=20
> I don't have a good idea how to solve that. Adding another property to a
> gpio that should be allowd to be exported can hardly count as hardware
> description and so doesn't belong in a device tree?!
>=20
> Please don't consider this objection as a reason for a NACK, only as
> starting point for a discussion.
>=20
> Apart from that: Does this result in hogged gpios being able to be
> requested by two additional drivers in parallel? Maybe the IS_HOGGED
> flag should be dropped when the gpio is requested?

The IS_HOGGED flag is cleared at the same time it is tested so only one
consumer can request one hogged GPIO. The GPIO is not considered to be
hogged after it is normally requested.

Best regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--+epxrXWOh++2HLjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVq63FAAoJEEpcgKtcEGQQ6zcQALLbCUhtMLeN4mmb34gUZoQz
KJXq6YFc4JxOG5BVKZPjuEiOp+JVmvBW4ghkos0IVyX97x8Gl8FIgnHwb+djAIHI
moMk36qRlN6fH06GGNzwxB3At7xsPRXJdlKMGCiphfVkEuRzqYMwRKqekecRTMna
F/cX6ItAdbZtrw/tWXIdAp8yaIBVCdec35VA8EBGORarQ+qcuOzMm3KSBxbfg4L4
aMtq+RJusO+3stJa6pKrqpClfyqnVnvvS1hxoCUX9AhVjnf6QSL9ReqDZoTary9c
ukaDNHJcdIcAbWQRMc9UeSP+5ndYpmA21M47Ww6ERhBxmssjcAJ1we64t5CzoD9O
lzdB13JFcCvP6hY/CmVSYRxpBjZafieUoDx2YcjJd6RJTXtTuk5gueWhFrzZb2zY
qQ64iOmm6+3mc5jbMR0O1aVWfH8lnn++0r8r/Jtu8aaYRX7ROvp+9z/JkO74leBu
XWo5DJBDBrQUi6Qa+RS4oS+EItKD1BMgf3lVdHQm3t8wTK/gXoB4rRCbtR+FNBJL
7WKtZDaCnCBUioyJUXdd9SJyGXmOpNKhLBrK2H+6ZwA4k+xnwmG2NMahvV8hox/b
wZOj3wZrrnuMbuzmSV6HlvFilY5+C6mPW/H3NUSTTW29PIPXdEVpHlaGYwFlFLzj
18D3YyYjJiM7r24GiT9r
=tKF8
-----END PGP SIGNATURE-----

--+epxrXWOh++2HLjY--
