From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 7/9] ARM: sa1100: move gpio irq handling to GPIO driver
Date: Sat, 23 Nov 2013 01:20:29 +0400
Message-ID: <CALT56yPaXp8Zwnv-oXiA3NT=7myMcMBckbEF4u_LERNC_Q2ykQ@mail.gmail.com>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
	<1384505280-25389-8-git-send-email-dbaryshkov@gmail.com>
	<20131122174528.GB16735@n2100.arm.linux.org.uk>
	<CALT56yM1rf7onJNu6L9tG52RrmDXcuWSoa=JfpakZRO+e7vnEQ@mail.gmail.com>
	<20131122200242.GE16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:38505 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755248Ab3KVVU3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2013 16:20:29 -0500
Received: by mail-ie0-f180.google.com with SMTP id tp5so2965857ieb.25
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2013 13:20:29 -0800 (PST)
In-Reply-To: <20131122200242.GE16735@n2100.arm.linux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Artamonow <mad_soft@inbox.ru>

Hello,

On Sat, Nov 23, 2013 at 12:02 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Nov 22, 2013 at 11:46:10PM +0400, Dmitry Eremin-Solenikov wrote:
>> On Fri, Nov 22, 2013 at 9:45 PM, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>> > Therefore, if we want to have certain GPIOs triggering wakeups (iow,
>> > those GPIOs which have had enable_irq_wake() called on them) but not
>> > those which haven't, we need to reprogram GRER and GFER with the
>> > GPIOs which can wake the system up.
>>
>> I thought so. I was puzzled, because that would mean, that we want to wake
>> up from a GPIO, which is masked in GPIO_IRQ_mask, but enabled in PWER.
>> Is that the real scenario/usecase? If we/kernel has disabled IRQ
>> through _mask_irq,
>> I thought, we didn't expect events from that pin (including wakeup), did we?
>
> So, if a device driver decides that it wants to be woken up by a GPIO
> and therefore calls enable_irq_wake() on it, but also calls disable_irq()
> on that same interrupt to avoid _receiving_ the interrupt until it's
> ready, does that mean that the system should _not_ be woken up?
>
> I doubt many systems work this way - later PXA devices certainly don't,
> where the wakeup is triggered from the silicon on the pad interface
> rather than the interrupt controller - where the state of the IRQ masks
> have no bearing what so ever on it.
>
> Please, stop thinking about changing the behaviour of any of the SA11x0
> stuff.  Treat the code as-is as authoritive on the way things should be
> done, and _carefully_ "adjust it" to how you'd like to see it - so we
> can have a higher confidence that stuff isn't being broken or behaviour
> isn't changed.
>
> Such behaviour changes would include looping differently while handling
> interrupts.
>
> And more importantly, treat SA11x0 as a reference implementation for
> IRQ stuff; that's the platform I developed the IRQ handling stuff on
> which became the basis for tglx's IRQ layer in the kernel.

OK, I got your message. I agree that I don't have enough level of knowledge
to rework SA11x0 it in such big steps.

Thank you for your explanations.

-- 
With best wishes
Dmitry
