From: Davide Hug <d@videhug.ch>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines
 used as irq?
Date: Sun, 10 Sep 2017 16:16:00 +0200
Message-ID: <20170910161600.e1643057e6b8fd1e7834c3a8@videhug.ch>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
        <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
        <alpine.DEB.2.20.1707122330060.2510@nanos>
        <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
        <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com>
        <20170826004514.be093db11518876eb85f4e10@videhug.ch>
        <CACRpkdaB1_xJAPxikmMaZYT3CXgHubNdqbnUYyWpkjfF4zz8zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from s067.cyon.net ([149.126.4.76]:47174 "EHLO s067.cyon.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751737AbdIJOQE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 10 Sep 2017 10:16:04 -0400
In-Reply-To: <CACRpkdaB1_xJAPxikmMaZYT3CXgHubNdqbnUYyWpkjfF4zz8zA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, Marc Zyngier <marc.zyngier@arm.com>

On Fri, 8 Sep 2017 16:22:40 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Sat, Aug 26, 2017 at 12:45 AM, Davide Hug <d@videhug.ch> wrote:
> > 1. Naive approach: just `msleep` long enough.
> 
> This is wrong atleastm since msleep() has no guarantees for the
> time it sleeps, it's "this amount or more".

I read Documentation/timers/timers-howto.txt and msleep seemed the right choice
since it is suggested for delays >10ms and the measurement takes 20-230ms. Also
the sensor stores the measurement till it is retrieved so I thought it wouldn't
be a problem if msleep takes some more time.

Should I use usleep_range instead?

> 
> > 2. Naive polling: `msleep` repeatedly in a loop and check for the data line to be low each time.
> 
> Same problem.
> 
> > 3. Polling with timer: use a timer for polling and `wait_event_timeout` to wait for the polling to succeed.
> 
> This seems reasonable.
> 
> > 4. Fix the irq problem in the current driver by calling `devm_request_irq` and
> > `devm_free_irq` instead of just using `disable_irq_nosync` and `enable_irq`,
> > to prevent setting as output a gpio requested as irq.
> 
> This makes me feel there is something that needs to be fixed.
> 
> If IRQs are available we should always try to use them somehow.
> I don't remember the discussuin fully, but I guess the timer in (3)
> is started in response to an IRQ? That should work fine.

At each measurement the bidirectional data line is used by the sensor as data
ready signal. So the IRQ is used only to detect the data ready signal. After that
the IRQ is disabled to avoid triggering interrupts during the serial
communication.
In (3) the IRQ is replaced by polling. So it avoids using IRQs altogether. I
posted a patch implementing this in linux-hwmon.

Thanks
Davide
