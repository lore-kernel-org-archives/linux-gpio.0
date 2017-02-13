From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Mon, 13 Feb 2017 08:45:06 +0100
Message-ID: <20170213074506.cf2zrjp2lmhtyoo5@pengutronix.de>
References: <20170213011355.GA13075@dtor-ws>
 <20170213011501.GB528@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:43317 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751712AbdBMHpJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Feb 2017 02:45:09 -0500
Content-Disposition: inline
In-Reply-To: <20170213011501.GB528@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Sun, Feb 12, 2017 at 05:15:01PM -0800, Dmitry Torokhov wrote:
> On Sun, Feb 12, 2017 at 05:13:55PM -0800, Dmitry Torokhov wrote:
> > Given the intent behind gpiod_get_optional() and friends it does not make
> > sense to return -ENOSYS when GPIOLIB is disabled: the driver is expected to
> > work just fine without gpio so let's behave as if gpio was not found.
> > Otherwise we have to special-case -ENOSYS in drivers.
> > 
> > Note that there was objection that someone might forget to enable GPIOLIB
> > when dealing with a platform that has device that actually specifies
> > optional gpio and we'll break it. I find this unconvincing as that would
> > have to be the *only GPIO* in the system, which is extremely unlikely.
> > 
> > Suggested-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I don't like this patch and so I wonder what I wrote that could be
interpreted as suggesting this patch. For now I'd say only

	Nacked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

is justified.

My concern is still there. This might break some setups. IMHO it's not
ok to request that a device in a certain configuration only works when
the (optional) Kconfig option GPIOLIB is enabled and silently breaks if
it's not. And you cannot rely on the person who configured the kernel.

When accepting this you will burn debug time of others who see their
device breaking with no or unrelated error messages.

The only reliable way out here is to enable enough of GPIOLIB to only
return NULL in ..._optional when there is no gpio required. You can have
a suggested-by for that.

The semantic of gpiod_get_optional is:

	if there is a gpio:
		give it to me
	else:
		give me a dummy

If the kernel is configured to be unable to answer the question "is
there a gpio?" that is worth a -ENOSYS.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
