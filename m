From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/9] gpio: Allow hogged gpios to be requested
Date: Tue, 28 Jul 2015 11:17:53 +0200
Message-ID: <20150728091753.GJ28535@localhost>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-4-git-send-email-mpa@pengutronix.de>
 <20150717202702.GK7013@pengutronix.de>
 <20150719140142.GV26287@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:33349 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187AbbG1JRz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2015 05:17:55 -0400
Received: by lbbyj8 with SMTP id yj8so70429567lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2015 02:17:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150719140142.GV26287@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, linux-gpio@vger.kernel.org

On Sun, Jul 19, 2015 at 04:01:42PM +0200, Markus Pargmann wrote:
> Hi Uwe,
>=20
> On Fri, Jul 17, 2015 at 10:27:02PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Fri, Jul 17, 2015 at 11:32:44AM +0200, Markus Pargmann wrote:
> > > It can be useful to claim hogged gpios later, for example from
> > > userspace. This allows to set defaults for GPIOs using the hoggin=
g
> > > mechanism and override the setup later from userspace or a kernel=
 driver.
> > >=20
> > > This patch adds a check for hogged gpios to allow requesting them=
=2E If
> > > the gpio is not hogged but marked as requested, it still fails wi=
th
> > > -EBUSY.
> > >=20
> > > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > > ---
> > >  drivers/gpio/gpiolib.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
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

IIRC, this use case was discussed but was rejected by Linus when hogs
were added:

	https://lkml.kernel.org/r/CACRpkdZcNcPBYQM438CZJx1gYst9BFBSTj-3Qv2aPGF=
9pdWa5g@mail.gmail.com

Linus?

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
