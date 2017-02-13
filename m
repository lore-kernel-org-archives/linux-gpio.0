From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Mon, 13 Feb 2017 09:20:01 +0100
Message-ID: <20170213082001.eoebg6wtzagzaaow@pengutronix.de>
References: <20170213011355.GA13075@dtor-ws>
 <20170213011501.GB528@dtor-ws>
 <20170213074506.cf2zrjp2lmhtyoo5@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:51125 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751940AbdBMIUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Feb 2017 03:20:04 -0500
Content-Disposition: inline
In-Reply-To: <20170213074506.cf2zrjp2lmhtyoo5@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 13, 2017 at 08:45:06AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Sun, Feb 12, 2017 at 05:15:01PM -0800, Dmitry Torokhov wrote:
> > On Sun, Feb 12, 2017 at 05:13:55PM -0800, Dmitry Torokhov wrote:
> > > Given the intent behind gpiod_get_optional() and friends it does not make
> > > sense to return -ENOSYS when GPIOLIB is disabled: the driver is expected to
> > > work just fine without gpio so let's behave as if gpio was not found.
> > > Otherwise we have to special-case -ENOSYS in drivers.
> > > 
> > > Note that there was objection that someone might forget to enable GPIOLIB
> > > when dealing with a platform that has device that actually specifies
> > > optional gpio and we'll break it. I find this unconvincing as that would
> > > have to be the *only GPIO* in the system, which is extremely unlikely.
> > > 
> > > Suggested-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> I don't like this patch and so I wonder what I wrote that could be
> interpreted as suggesting this patch. For now I'd say only
> 
> 	Nacked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> is justified.

Oh, it seems I really sent such a RFC patch some time ago. Still I think
it's wrong to do that and that we need something like a
lookup-only-GPIOLIB that implements:

	def gpio_get_optional(...):
		if a gpio is specified:
			return -ENOSYS
		else:
			return NULL

if you really want save some bytes and disable the full-fledged GPIOLIB.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
