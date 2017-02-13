From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Mon, 13 Feb 2017 09:59:35 +0100
Message-ID: <20170213085935.76rlb6pwarejpmlh@pengutronix.de>
References: <20170213011355.GA13075@dtor-ws>
 <20170213011501.GB528@dtor-ws>
 <20170213074506.cf2zrjp2lmhtyoo5@pengutronix.de>
 <20170213082008.GA22252@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:40283 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750853AbdBMI7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Feb 2017 03:59:39 -0500
Content-Disposition: inline
In-Reply-To: <20170213082008.GA22252@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Dmitry,

On Mon, Feb 13, 2017 at 12:20:08AM -0800, Dmitry Torokhov wrote:
> On Mon, Feb 13, 2017 at 08:45:06AM +0100, Uwe Kleine-König wrote:
> > My concern is still there. This might break some setups. IMHO it's not
> > ok to request that a device in a certain configuration only works when
> > the (optional) Kconfig option GPIOLIB is enabled and silently breaks if
> > it's not. And you cannot rely on the person who configured the kernel.
> 
> Really? So I guess we can tell people do just do "make randconfig"
> and start reporting bugs when that kernel would not work on their
> hardware?

No, but if randconfig enabled a driver for your temperature sensor and
that driver manages to try binding to that device, it should fail if the
temperature sensor might have a GPIO that must be taken into account for
proper functioning if it's there and the driver cannot find out if it's
there.

If your driver can handle a GPIO that can also safely be ignored, then
sure, this function's semantic is a nuisance. But then given that this
semantic is what most drivers should use AFAICT the right thing is to
introduce another function with the semantic:

	if there is a gpio and GPIOLIB is enabled:
		return gpio
	else:
		return NULL

> > When accepting this you will burn debug time of others who see their
> > device breaking with no or unrelated error messages.
> > 
> > The only reliable way out here is to enable enough of GPIOLIB to only
> > return NULL in ..._optional when there is no gpio required. You can have
> > a suggested-by for that.
> > 
> > The semantic of gpiod_get_optional is:
> > 
> > 	if there is a gpio:
> > 		give it to me
> > 	else:
> > 		give me a dummy
> > 
> > If the kernel is configured to be unable to answer the question "is
> > there a gpio?" that is worth a -ENOSYS.
> 
> You know what every single driver for peripherals that are used on
> variety of systems using has to do for gpios that are truly optional?

What is the difference between "truly optional" and the meaning of
optional in gpiod_get_optional?

> 	gpio = gpio_get_optional();
> 	if (IS_ERR(gpio)) {
> 		error = PTR_ERR(gpio);
> 		if (error == -ENOSYS) {
> 			/*
> 			 * - It's OK, we said it's optional GPIO so
> 			 * if GPIOLIB is not there we should not fail
> 			 * to enable the device, because this gpio is
> 			 * *OPTIONAL*.
> 			 * - But what if it is actually there? What if the
> 			 * kernel is misconfigured?
> 			 * - And what if it is not? How would we know?
> 			 * - Let's parse device tree by hand! And check
> 			 * ACPI. And if ACPI is disabled reimplement it
> 			 * because we should not silently break users!
> 			 * - ... no, let's not.
> 			 */
> 			gpio = NULL;
> 		} else {
> 			return error;
> 		}
> 	}

I don't know a good name, but implementing a separate helper function
with this semantic is great. It simplifies all these drivers, makes them
easily greppable for, and lets the drivers that want the reliable
semantic just continue to use gpiod_get_optional().

Can you list a few drivers that should make use of this new function
instead of gpiod_get_optional()?

Or alternatively (if "truly optional" means: I don't need to do anything
even if it's available) just do the following instead:

	/*
	 * There might be a gpio but to not make the driver depend
	 * on GPIOLIB we don't make use of it.
	 */
	gpio = NULL;

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
