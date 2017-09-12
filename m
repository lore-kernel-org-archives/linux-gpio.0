From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines used
 as irq?
Date: Tue, 12 Sep 2017 15:57:47 +0200
Message-ID: <CACRpkdb1X8H7Q0o_JNSmmyfY0b4mVqsv1=VNAG3dDUmJzxx+rA@mail.gmail.com>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
 <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
 <alpine.DEB.2.20.1707122330060.2510@nanos> <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
 <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com>
 <20170826004514.be093db11518876eb85f4e10@videhug.ch> <CACRpkdaB1_xJAPxikmMaZYT3CXgHubNdqbnUYyWpkjfF4zz8zA@mail.gmail.com>
 <20170910161600.e1643057e6b8fd1e7834c3a8@videhug.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37273 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbdILN5t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2017 09:57:49 -0400
Received: by mail-it0-f51.google.com with SMTP id o200so29217465itg.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2017 06:57:49 -0700 (PDT)
In-Reply-To: <20170910161600.e1643057e6b8fd1e7834c3a8@videhug.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Davide Hug <d@videhug.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, Marc Zyngier <marc.zyngier@arm.com>

On Sun, Sep 10, 2017 at 4:16 PM, Davide Hug <d@videhug.ch> wrote:
> On Fri, 8 Sep 2017 16:22:40 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:

>> > 4. Fix the irq problem in the current driver by calling `devm_request_irq` and
>> > `devm_free_irq` instead of just using `disable_irq_nosync` and `enable_irq`,
>> > to prevent setting as output a gpio requested as irq.
>>
>> This makes me feel there is something that needs to be fixed.
>>
>> If IRQs are available we should always try to use them somehow.
>> I don't remember the discussuin fully, but I guess the timer in (3)
>> is started in response to an IRQ? That should work fine.
>
> At each measurement the bidirectional data line is used by the sensor as data
> ready signal. So the IRQ is used only to detect the data ready signal. After that
> the IRQ is disabled to avoid triggering interrupts during the serial
> communication.

That is a fully valid usecase and I think something gpiolib
should be able to support. If it bugs you, it will also soon bug
somebody else.

Somewhere the backing irqchip is talking to gpiochip by
issueing gpiochip_lock_as_irq() on this
line and it should be made to issue gpiochip_unlock_as_irq()
before used as serial line, and then gpiochip_lock_as_irq()
again when the go back to using it as irq.

Currently, this mostly gets done in the .irq_request_resources
and .irq_release_resources of the irqchip.

Intuitively I would say it should be done by
.irq_enable()/.irq_disable() but that has the problem that it
is fastpath, and not all GPIO irqchips can handle that.

Maybe we should do it in .irq_enable()/.irq_disable() in case
the .can_sleep bool on the gpiochip is not set, simply?
This way the irqchip should be able to lock/unlock the GPIO
lines dynamically.

We would need to patch a few drivers, but the generic code
for simple gpio irqchips is in gpiolib.c and can be fixed once
and for all. (Which is kind of why I insist on drivers to use
that...)

Yours,
Linus Walleij
