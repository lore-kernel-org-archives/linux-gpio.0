From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 7/9] ARM: sa1100: move gpio irq handling to GPIO driver
Date: Fri, 22 Nov 2013 20:02:42 +0000
Message-ID: <20131122200242.GE16735@n2100.arm.linux.org.uk>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com> <1384505280-25389-8-git-send-email-dbaryshkov@gmail.com> <20131122174528.GB16735@n2100.arm.linux.org.uk> <CALT56yM1rf7onJNu6L9tG52RrmDXcuWSoa=JfpakZRO+e7vnEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43308 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755626Ab3KVUDS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2013 15:03:18 -0500
Content-Disposition: inline
In-Reply-To: <CALT56yM1rf7onJNu6L9tG52RrmDXcuWSoa=JfpakZRO+e7vnEQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Artamonow <mad_soft@inbox.ru>

On Fri, Nov 22, 2013 at 11:46:10PM +0400, Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> On Fri, Nov 22, 2013 at 9:45 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > Therefore, if we want to have certain GPIOs triggering wakeups (iow,
> > those GPIOs which have had enable_irq_wake() called on them) but not
> > those which haven't, we need to reprogram GRER and GFER with the
> > GPIOs which can wake the system up.
> 
> I thought so. I was puzzled, because that would mean, that we want to wake
> up from a GPIO, which is masked in GPIO_IRQ_mask, but enabled in PWER.
> Is that the real scenario/usecase? If we/kernel has disabled IRQ
> through _mask_irq,
> I thought, we didn't expect events from that pin (including wakeup), did we?

So, if a device driver decides that it wants to be woken up by a GPIO
and therefore calls enable_irq_wake() on it, but also calls disable_irq()
on that same interrupt to avoid _receiving_ the interrupt until it's
ready, does that mean that the system should _not_ be woken up?

I doubt many systems work this way - later PXA devices certainly don't,
where the wakeup is triggered from the silicon on the pad interface
rather than the interrupt controller - where the state of the IRQ masks
have no bearing what so ever on it.

Please, stop thinking about changing the behaviour of any of the SA11x0
stuff.  Treat the code as-is as authoritive on the way things should be
done, and _carefully_ "adjust it" to how you'd like to see it - so we
can have a higher confidence that stuff isn't being broken or behaviour
isn't changed.

Such behaviour changes would include looping differently while handling
interrupts.

And more importantly, treat SA11x0 as a reference implementation for
IRQ stuff; that's the platform I developed the IRQ handling stuff on
which became the basis for tglx's IRQ layer in the kernel.
