From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Mon, 13 Feb 2017 00:20:08 -0800
Message-ID: <20170213082008.GA22252@dtor-ws>
References: <20170213011355.GA13075@dtor-ws>
 <20170213011501.GB528@dtor-ws>
 <20170213074506.cf2zrjp2lmhtyoo5@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35579 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751876AbdBMIUM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 03:20:12 -0500
Content-Disposition: inline
In-Reply-To: <20170213074506.cf2zrjp2lmhtyoo5@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
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
> interpreted as suggesting this patch.

It came from my exchange with Alexandre:

On Fri, Feb 20, 2015 at 01:59:43PM +0900, Alexandre Courbot wrote:
> On Fri, Feb 20, 2015 at 9:30 AM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > Given the intent behind gpiod_get_optional() and friends it does not
> > make
> > sense to return -ENOSYS when GPIOLIB is disabled: the driver is
> > expected to
> > work just fine without gpio so let's behave as if gpio was not
> > found.
> > Otherwise we have to special-case -ENOSYS in drivers.
>
> Interestingly Uwe sent a RFC for this one week ago:
>
> http://patchwork.ozlabs.org/patch/439135/
>
> Maybe credit him with a Suggested-by.?

If you check out that patchwork entry you indeed suggested doing exactly
what this patch is doing. But if you insist I can certainly remove the
"suggested-by".

> For now I'd say only
> 
> 	Nacked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> is justified.
> 
> My concern is still there. This might break some setups. IMHO it's not
> ok to request that a device in a certain configuration only works when
> the (optional) Kconfig option GPIOLIB is enabled and silently breaks if
> it's not. And you cannot rely on the person who configured the kernel.

Really? So I guess we can tell people do just do "make randconfig"
and start reporting bugs when that kernel would not work on their
hardware?

> 
> When accepting this you will burn debug time of others who see their
> device breaking with no or unrelated error messages.
> 
> The only reliable way out here is to enable enough of GPIOLIB to only
> return NULL in ..._optional when there is no gpio required. You can have
> a suggested-by for that.
> 
> The semantic of gpiod_get_optional is:
> 
> 	if there is a gpio:
> 		give it to me
> 	else:
> 		give me a dummy
> 
> If the kernel is configured to be unable to answer the question "is
> there a gpio?" that is worth a -ENOSYS.

You know what every single driver for peripherals that are used on
variety of systems using has to do for gpios that are truly optional?

	gpio = gpio_get_optional();
	if (IS_ERR(gpio)) {
		error = PTR_ERR(gpio);
		if (error == -ENOSYS) {
			/*
			 * - It's OK, we said it's optional GPIO so
			 * if GPIOLIB is not there we should not fail
			 * to enable the device, because this gpio is
			 * *OPTIONAL*.
			 * - But what if it is actually there? What if the
			 * kernel is misconfigured?
			 * - And what if it is not? How would we know?
			 * - Let's parse device tree by hand! And check
			 * ACPI. And if ACPI is disabled reimplement it
			 * because we should not silently break users!
			 * - ... no, let's not.
			 */
			gpio = NULL;
		} else {
			return error;
		}
	}

Really, the argument that there is a *single* GPIO in the whole system,
that GPIO happens to be optional, but critical for the deice operation
and a random person is confused when enabling random options and
forgetting gpiolib? And to "save" this scenario you prefer to fail
loading drivers on perfectly configured systems that do not need gpiolib
and do not use gpios? Or to add -ENOSYS checks (that actually break
the scenario you described and make the driver code ugly)? I think you
have your priorities wrong.

Thanks.

-- 
Dmitry
