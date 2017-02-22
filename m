From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when GPIOLIB
 is disabled
Date: Wed, 22 Feb 2017 17:06:35 +0100
Message-ID: <CACRpkdb+KKKwZEBW0o24KRGmxgSEbf9Op5OL8JK1tVvfvR6pGw@mail.gmail.com>
References: <20170213011355.GA13075@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:35426 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753699AbdBVQGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 11:06:36 -0500
Received: by mail-it0-f48.google.com with SMTP id 203so141183724ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 08:06:36 -0800 (PST)
In-Reply-To: <20170213011355.GA13075@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 13, 2017 at 2:13 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Given the intent behind gpiod_get_optional() and friends it does not make
> sense to return -ENOSYS when GPIOLIB is disabled: the driver is expected to
> work just fine without gpio so let's behave as if gpio was not found.
> Otherwise we have to special-case -ENOSYS in drivers.
>
> Note that there was objection that someone might forget to enable GPIOLIB
> when dealing with a platform that has device that actually specifies
> optional gpio and we'll break it. I find this unconvincing as that would
> have to be the *only GPIO* in the system, which is extremely unlikely.
>
> (...)
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> This is a resend of a similar patch from a couple years ago.

I want to get an indication from Mark Brown on how he see this
semantic compared to how regulators work.

It makes most sense to developers to have the same kind of
semantics in optional GPIOs as in optional regulators.

For optional regulators, if I understand correctly, these are
*electrically optional* as in: a voltage input pin on a chip that
the chip can very well live without. The regulator may be there,
it may not, it may affect the function of the chip but it's still OK
without it.

For this reason regulators will return an error if an optional regulator
is not present, and the code is expected to deal with it.

It is a common misconception that the "optional" part of the
regulator API call means "software optional". It is not the semantic
of this call.

It is also tagged __must_check and return an error when compiled
out. They return -ENODEV, see <linux/regulator/consumer.h>

I would be happy for a patch switching out return value to -ENODEV
for sure :)

Now second: why should the GPIO semantic be different from what
regulators is using?

Consistency is important with regards to Rusty Russell's API
rules, so we should try to have the same semantic:
http://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html

Yours,
Linus Walleij
