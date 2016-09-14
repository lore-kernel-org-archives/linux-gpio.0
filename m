From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Wed, 14 Sep 2016 11:26:10 +0300
Message-ID: <20160914082610.GV1811@lahna.fi.intel.com>
References: <20160911080506.GO15313@lahna.fi.intel.com>
 <20160912065656.GA2411@ktx>
 <20160912090401.GB1811@lahna.fi.intel.com>
 <20160912130444.GB2411@ktx>
 <20160912131111.GG1811@lahna.fi.intel.com>
 <CACRpkdZRguTg4davCW-x6HvRJgOxNz8R4KyeFCEnQzyXPkP6cg@mail.gmail.com>
 <20160913093302.GL1811@lahna.fi.intel.com>
 <CACRpkdY9+poXW1cw4K20edGYjiuPN9DH0umsEAh31iHXGJhx6g@mail.gmail.com>
 <20160913125214.GO1811@lahna.fi.intel.com>
 <CACRpkdY-8_+jp+J55FnDHrt-y6woFTEqs7JPxR+KRRcuWPpQWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:28786 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755890AbcINI0Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Sep 2016 04:26:16 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdY-8_+jp+J55FnDHrt-y6woFTEqs7JPxR+KRRcuWPpQWw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 13, 2016 at 10:57:31PM +0200, Linus Walleij wrote:
> On Tue, Sep 13, 2016 at 2:52 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > [Me]
> >> A-ha! But why are you registering a irqdomain entry for an interrupt
> >> that cannot be used, hm?
> >
> > Unfortunately there is no way to figure out from the hardware (or
> > firmware) whether the interrupt is supposed to be used by the GPIO
> > driver or something else.
> 
> So the fact that we kept it in valid-mask in the DT was a hint: it is
> part of the hardware description.
> 
> Isn't this (a list of what IRQs are reserved by BIOS) by sheer logic
> something that ACPI should provide?
> 
> Or is this one of those "well we could alter ACPI tables but we can't
> because they already shipped so we just can't so now we need to
> hack around it"?

Isn't it always the case? ;-)

Once the hardware enters stores the firmware cannot be changed anymore
and we get all the fun working around problems in the OS.

> Letting Linux map an interrupt it cannot access and then papering it
> over by using handle_simple_irq() just feels wrong to me.
> 
> I would argue for associating the mask of BIOS-reserved IRQs with
> something in ACPI and implement the mentioned scheme to avoid
> even mapping them seems most logical.

I'm going to re-read the hardware spec and see if there is anything we
can do about this. The newer hardware (Skylake, Broxton) has a bit that
tells the IRQ is routed directly to I/O-APIC but unfortunately Braswell
misses that. There may be something else, though.

> If we have to use handle_simple_irq() by default on all I prefer to put
> in a very fat comment of the type:
> 
> /*
>  * HACK HACK HACK HACK HACK HACK HACK HACK HACK HACK
>  *
>  * Some interrupts are BIOS-reserved but we don't know which ones!
>  * So we anyway map them and assign the handle_simple_irq() handle
>  * to them, leaving them unmasked, pretending they can be used, and
>  * pray no-one will accidentally use these GPIO IRQs.
>  *
>  * HACK HACK HACK HACK HACK HACK HACK HACK HACK HACK
>   */

OK, got it.

Let me try to come up with a solution that both works and does not
involve using handle_simple_irq.
