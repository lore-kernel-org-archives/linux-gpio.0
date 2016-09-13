From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Tue, 13 Sep 2016 12:33:02 +0300
Message-ID: <20160913093302.GL1811@lahna.fi.intel.com>
References: <20160908162843.GB22716@ktx>
 <20160909061834.GG15313@lahna.fi.intel.com>
 <20160909082358.GA23895@ktx>
 <20160909085832.GK15313@lahna.fi.intel.com>
 <20160911080506.GO15313@lahna.fi.intel.com>
 <20160912065656.GA2411@ktx>
 <20160912090401.GB1811@lahna.fi.intel.com>
 <20160912130444.GB2411@ktx>
 <20160912131111.GG1811@lahna.fi.intel.com>
 <CACRpkdZRguTg4davCW-x6HvRJgOxNz8R4KyeFCEnQzyXPkP6cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:2274 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757830AbcIMJdH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Sep 2016 05:33:07 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZRguTg4davCW-x6HvRJgOxNz8R4KyeFCEnQzyXPkP6cg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 13, 2016 at 11:18:49AM +0200, Linus Walleij wrote:
> On Mon, Sep 12, 2016 at 3:11 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Sep 12, 2016 at 09:04:44PM +0800, Phidias Chiang wrote:
> >> On Mon, Sep 12, 2016 at 12:04:01PM +0300, Mika Westerberg wrote:
> >> >
> >> > OK, I see what is going on now. When I changed handle_simple_irq to
> >> > handle_bad_irq, the IRQ core in __irq_do_set_handler() thinks the
> >> > handler is uninstalled and masks the line.
> >> >
> >> > If you change handle_bad_irq to handle_simple_irq, in call to
> >> > gpiochip_irqchip_add(), does it work then?
> >>
> >> Yes it does :), thank you for the support!
> >
> > Thanks for testing.
> >
> > So we need to use handle_simple_irq here instead.
> >
> > Linus, do you see any problems with that?
> 
> I need to see the patch in its context with a commit message,
> I can't figure it out from the thread.
> 
> handle_simple_irq() is for something generic not level- or
> edge-triggered. If you support specific triggers only, it
> should not be used.
> 
> Nominally assigning handle_bad_irq() until a specific
> edge or level is requested is the right thing to do, since
> the IRQ is really not configured for anything at all and
> hence has undefined behaviour.

For Cherryview/Braswell some interrupts are actually configured by the
BIOS but they are routed directly to the I/O-APIC and are supposed to be
handled without involvement of the GPIO driver (an example of this is
the ACPI SCI interrupt). However, INTMASK GPIO register can still be
used to mask the interrupt in question.

So when we specify handle_bad_irq as handler the IRQ core thinks the
handler is being uninstalled and masks the interrupt.

> But write a patch and involve the irqchip people I guess?

OK, I'll do this.

Thanks.
