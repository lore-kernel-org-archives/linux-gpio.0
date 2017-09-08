From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines used
 as irq?
Date: Fri, 8 Sep 2017 16:22:40 +0200
Message-ID: <CACRpkdaB1_xJAPxikmMaZYT3CXgHubNdqbnUYyWpkjfF4zz8zA@mail.gmail.com>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
 <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
 <alpine.DEB.2.20.1707122330060.2510@nanos> <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
 <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com> <20170826004514.be093db11518876eb85f4e10@videhug.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33780 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755196AbdIHOWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Sep 2017 10:22:41 -0400
Received: by mail-oi0-f53.google.com with SMTP id r20so15551406oie.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Sep 2017 07:22:40 -0700 (PDT)
In-Reply-To: <20170826004514.be093db11518876eb85f4e10@videhug.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Davide Hug <d@videhug.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, Marc Zyngier <marc.zyngier@arm.com>

On Sat, Aug 26, 2017 at 12:45 AM, Davide Hug <d@videhug.ch> wrote:
> On Tue, 1 Aug 2017 09:37:12 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> I'm not so sure about that. You might be the only one with the right hardware
>> to fix the problem. Also it is never our intention to discourage anyone to
>> hack on the kernel.
>
> You are right. I shouldn't give up that quickly.
>
> I have tried a few things and I would like to ask if one of these is an appropriate approach.
> Sorry this is long! If there is a better place for me to ask these, please point me there.
>
> My main question is if "timer based polling" is the way to go, is my
> approach with timers below (3.) appropriate?

...
> 1. Naive approach: just `msleep` long enough.

This is wrong atleastm since msleep() has no guarantees for the
time it sleeps, it's "this amount or more".

> 2. Naive polling: `msleep` repeatedly in a loop and check for the data line to be low each time.

Same problem.

> 3. Polling with timer: use a timer for polling and `wait_event_timeout` to wait for the polling to succeed.

This seems reasonable.

> 4. Fix the irq problem in the current driver by calling `devm_request_irq` and
> `devm_free_irq` instead of just using `disable_irq_nosync` and `enable_irq`,
> to prevent setting as output a gpio requested as irq.

This makes me feel there is something that needs to be fixed.

If IRQs are available we should always try to use them somehow.
I don't remember the discussuin fully, but I guess the timer in (3)
is started in response to an IRQ? That should work fine.

Yours,
Linus Walleij
