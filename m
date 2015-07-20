From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/9] gpio: Allow hogged gpios to be requested
Date: Mon, 20 Jul 2015 08:32:49 +0200
Message-ID: <20150720063249.GM7013@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-4-git-send-email-mpa@pengutronix.de>
 <20150717202702.GK7013@pengutronix.de>
 <20150719140142.GV26287@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51393 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751960AbbGTGcx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2015 02:32:53 -0400
Content-Disposition: inline
In-Reply-To: <20150719140142.GV26287@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, linux-gpio@vger.kernel.org

Hello Markus,

On Sun, Jul 19, 2015 at 04:01:42PM +0200, Markus Pargmann wrote:
> On Fri, Jul 17, 2015 at 10:27:02PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Fri, Jul 17, 2015 at 11:32:44AM +0200, Markus Pargmann wrote:
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index bf4bd1d120c3..9f402b159cbe 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -798,7 +798,8 @@ static int __gpiod_request(struct gpio_desc *=
desc, const char *label)
> > >  	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
> > >  	 */
> > > =20
> > > -	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) =3D=3D 0) {
> > > +	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) =3D=3D 0 ||
> > > +	    test_and_clear_bit(FLAG_IS_HOGGED, &desc->flags) =3D=3D 1) =
{
> > >  		desc_set_label(desc, label ? : "?");
> > >  		status =3D 0;
> > I don't like this patch. IMHO hogging is a "use" of a GPIO that sho=
uld
> > prevent it being requested.
>=20
> I disagree with you here. The original patch stated in its descriptio=
n
> that it was designed to initialize GPIOs. In my understanding this do=
es
> not necessarily mean that a hogged GPIO has to be blocked forever.
Assume for a moment I can agree with "not necessarily". But now, what
about the cases where a hogged GPIO should be blocked?
IMHO, if you want to drive the GPIO from userspace anyhow, you don't
need to add a hog for it.

> The IS_HOGGED flag is cleared at the same time it is tested so only o=
ne
> consumer can request one hogged GPIO. The GPIO is not considered to b=
e
> hogged after it is normally requested.
You're right here, I missed the and_clear_bit part on the test.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
