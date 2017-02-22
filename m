From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Wed, 22 Feb 2017 10:27:25 -0800
Message-ID: <20170222182725.GA24044@dtor-ws>
References: <20170213011355.GA13075@dtor-ws>
 <CACRpkdb+KKKwZEBW0o24KRGmxgSEbf9Op5OL8JK1tVvfvR6pGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34007 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932955AbdBVS1f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 13:27:35 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdb+KKKwZEBW0o24KRGmxgSEbf9Op5OL8JK1tVvfvR6pGw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

On Wed, Feb 22, 2017 at 05:06:35PM +0100, Linus Walleij wrote:
> On Mon, Feb 13, 2017 at 2:13 AM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
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
> > (...)
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> > This is a resend of a similar patch from a couple years ago.
> 
> I want to get an indication from Mark Brown on how he see this
> semantic compared to how regulators work.

This is completely orthogonal to this patch though. This patch tries to
solve problem that API behaves differently when GPIOLIB is disabled, so
the driver has to check for both NULL and ENOSYS. I would like to make
gpiod_get_optional() return NULL when GPIOLIB is disabled.

> 
> It makes most sense to developers to have the same kind of
> semantics in optional GPIOs as in optional regulators.

I agree, here. Unfortunately optional regulators return -ENOENT and it
will take an effort to change it to NULL if we can persuade Mark that it
makes sense.

However, there are more optional GPIOs than regulators, so switching
gpio to return -ENODEV even bigger task. Besides, I believe that doing:

	gpio = gpiod_get_optional();
	if (IS_ERR(gpio))
		return PTR_ERR(gpio);

is better than:

	gpio = gpiod_get_optional();
	if ((IS_ERR(gpio)) {
		error = PTR_ERR(gpio);
		if (error != -ENODEV)
			return error;
		gpio = NULL;
	}

> 
> For optional regulators, if I understand correctly, these are
> *electrically optional* as in: a voltage input pin on a chip that
> the chip can very well live without. The regulator may be there,
> it may not, it may affect the function of the chip but it's still OK
> without it.
> 
> For this reason regulators will return an error if an optional regulator
> is not present, and the code is expected to deal with it.
> 
> It is a common misconception that the "optional" part of the
> regulator API call means "software optional". It is not the semantic
> of this call.
> 
> It is also tagged __must_check and return an error when compiled
> out. They return -ENODEV, see <linux/regulator/consumer.h>

The point is that they return the same value when regulator is not
present and when regulator support is compiled out. GPIOLIB returns NULL
and -ENOSYS respectively, and I contend that this is wrong and needs to
be resolved first.

> 
> I would be happy for a patch switching out return value to -ENODEV
> for sure :)

I as shown is the example above I think NULL is better for optionals.

> 
> Now second: why should the GPIO semantic be different from what
> regulators is using?
> 
> Consistency is important with regards to Rusty Russell's API
> rules, so we should try to have the same semantic:
> http://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html

I agree that if we can converge on the similar behavior it would be
best, but it is bigger (and separate) task. First I think we need to
make API behave sane when support is enabled and when it is disabled.

Thanks.

-- 
Dmitry
