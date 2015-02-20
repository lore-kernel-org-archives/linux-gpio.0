From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] gpio: return NULL from gpiod_get_optional when GPIOLIB
 is disabled
Date: Fri, 20 Feb 2015 19:54:02 +0100
Message-ID: <20150220185402.GQ19388@pengutronix.de>
References: <20150220003035.GA22334@dtor-glaptop>
 <CAAVeFu+Ys44Y0mcBYqoUEVST+TZuGXKUX5qQe9z9sDZCXdOZfQ@mail.gmail.com>
 <20150220053344.GA5518@dtor-glaptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51721 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754530AbbBTSyF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Feb 2015 13:54:05 -0500
Content-Disposition: inline
In-Reply-To: <20150220053344.GA5518@dtor-glaptop>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hello,

On Thu, Feb 19, 2015 at 09:33:44PM -0800, Dmitry Torokhov wrote:
> On Fri, Feb 20, 2015 at 01:59:43PM +0900, Alexandre Courbot wrote:
> > On Fri, Feb 20, 2015 at 9:30 AM, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > Given the intent behind gpiod_get_optional() and friends it does =
not make
> > > sense to return -ENOSYS when GPIOLIB is disabled: the driver is e=
xpected to
> > > work just fine without gpio so let's behave as if gpio was not fo=
und.
> > > Otherwise we have to special-case -ENOSYS in drivers.
> >=20
> > Interestingly Uwe sent a RFC for this one week ago:
> >=20
> > http://patchwork.ozlabs.org/patch/439135/
> >=20
> > Maybe credit him with a Suggested-by.?
>=20
> I certainly am fine with crediting him with Suggested-by even though =
I did not
> see that Uwe's e-mail but this patch was prompted by his other patch =
changing a
> few input drivers to use gpiod_get_optional() and me recalling that I
> explicitly did not use it as it made no difference from gpiod_get() s=
ince I had
> to handle -ENOSYS anyway.
Note that I'm not convinced any more this is a good idea. Consider you
have a device tree entry specifying=20

	reset-gpio =3D <&gpio5 4 0>;

for your device.

With

	gpiod_get_optional(dev, "reset", GPIO_OUT_LOW);

the drivers tells that some of the devices it can handle have a reset
gpio. If the device in question does have such a gpio the driver must
know and do something with it. If the device doesn't have such a gpio
that's fine, too.

But if GPIOLIB is off and the device has a reset-gpio specified you
certainly want to error out, right?

So IMHO the right thing to do is to return NULL iff there is no
reset-gpio specified. Otherwise -ENOSYS is the right thing to return.

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
