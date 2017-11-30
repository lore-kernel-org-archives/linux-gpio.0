From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines used
 as irq?
Date: Thu, 30 Nov 2017 14:55:11 +0100
Message-ID: <CACRpkdaR11ZaQ5c3huPbuH5kkkn_ttBTQS8tg0oL5sQPqMqYWw@mail.gmail.com>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
 <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
 <alpine.DEB.2.20.1707122330060.2510@nanos> <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
 <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com>
 <20170826004514.be093db11518876eb85f4e10@videhug.ch> <CACRpkdaB1_xJAPxikmMaZYT3CXgHubNdqbnUYyWpkjfF4zz8zA@mail.gmail.com>
 <20170910161600.e1643057e6b8fd1e7834c3a8@videhug.ch> <CACRpkdb1X8H7Q0o_JNSmmyfY0b4mVqsv1=VNAG3dDUmJzxx+rA@mail.gmail.com>
 <20171120234841.b5367dbeb92a4e47e1557054@videhug.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:45061 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752321AbdK3NzM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 08:55:12 -0500
Received: by mail-io0-f171.google.com with SMTP id e204so7558655iof.12
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 05:55:12 -0800 (PST)
In-Reply-To: <20171120234841.b5367dbeb92a4e47e1557054@videhug.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Davide Hug <d@videhug.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, Marc Zyngier <marc.zyngier@arm.com>

On Mon, Nov 20, 2017 at 11:48 PM, Davide Hug <d@videhug.ch> wrote:

> I'm really sorry that I come back to this only now.

Business as usual. We are all creative people with lots to do, do
not worry.

> Do I understand this correctly? Some GPIO drivers can be slow and sleep, and
> .irq_enable/disable can be called from places where this is not acceptable.

That is the essence of it I guess.

> (I see that only gpio/gpio-pcf857x implements .irq_enable/disable and has
> .can_sleep=true)

The crucial thing is  that PCF857x is an I2C expander GPIO chip.

I2C traffic is blocking, so cannot be called in IRQ context.

As long as the .irq_enable/.irq_disable callbacks does not
start to issue something blocking, like I2C traffic, e.g. reading
and writing registers in the chip, all is fine.

>> Maybe we should do it in .irq_enable()/.irq_disable() in case
>> the .can_sleep bool on the gpiochip is not set, simply?
>> This way the irqchip should be able to lock/unlock the GPIO
>> lines dynamically.
>
> So, before a driver relays on locking/unlocking a GPIO line dynamically, the
> driver would have to make sure that the GPIO has not .can_sleep=true. Right?

Something like that. I suspect you know it better than me
by now, I am rusty all the time on details.

I also changed the accessor gpiod_set/get_raw_value() so these
will work even if the line is used for IRQ. These are really violent
accessors, but they have their place.

Please check if that is something that would help your
usecase before venturing to deep into the infrastructure.

> With a default .irq_enable/disable implementation in gpiolib (something as in
> the patch below) the GPIO driver implementing their own .irq_enable/disable
> would have to be fixed, right?

Yeah. But I don't know if the solution is very good, because
it duct-tapes on a solution that will only work if the gpiochip is
non-sleeping. The driver will simply fail randomly on
sleeping cpiochips which is not what we want, we want GPIOs
and their IRQs to uniformly behave the same no matter
which GPIO driver and consumer combo we make.

Yours,
Linus Walleij
