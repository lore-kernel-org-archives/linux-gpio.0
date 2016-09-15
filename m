From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Thu, 15 Sep 2016 18:42:33 +0300
Message-ID: <20160915154233.GH1811@lahna.fi.intel.com>
References: <20160912131111.GG1811@lahna.fi.intel.com>
 <CACRpkdZRguTg4davCW-x6HvRJgOxNz8R4KyeFCEnQzyXPkP6cg@mail.gmail.com>
 <20160913093302.GL1811@lahna.fi.intel.com>
 <CACRpkdY9+poXW1cw4K20edGYjiuPN9DH0umsEAh31iHXGJhx6g@mail.gmail.com>
 <20160913125214.GO1811@lahna.fi.intel.com>
 <CACRpkdY-8_+jp+J55FnDHrt-y6woFTEqs7JPxR+KRRcuWPpQWw@mail.gmail.com>
 <20160914082610.GV1811@lahna.fi.intel.com>
 <CACRpkdYRYR0hSacpxieG6k9qHyjMFsr6ViYU3HCcQEzB9NXLGQ@mail.gmail.com>
 <20160914151234.GZ1811@lahna.fi.intel.com>
 <CACRpkdZBbcL87Hq94sFYdDOWnC7S_JGtArTNMimAps663UQNgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:44467 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753398AbcIOPmi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Sep 2016 11:42:38 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZBbcL87Hq94sFYdDOWnC7S_JGtArTNMimAps663UQNgw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 15, 2016 at 02:39:47PM +0200, Linus Walleij wrote:
> On Wed, Sep 14, 2016 at 5:12 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Wed, Sep 14, 2016 at 02:46:01PM +0200, Linus Walleij wrote:
> >> > I'm going to re-read the hardware spec and see if there is anything we
> >> > can do about this. The newer hardware (Skylake, Broxton) has a bit that
> >> > tells the IRQ is routed directly to I/O-APIC but unfortunately Braswell
> >> > misses that. There may be something else, though.
> >>
> >> So as far as we can determine:
> >>
> >> (A) we are running on Braswell and
> >> (B) we are probing this driver
> >>
> >> we can conclude that
> >>
> >> (C) IRQs A,B,C are reserved by BIOS?
> >>
> >> That sounds doable?
> >
> > Yes, it's doable but that requires some hard coding in the driver :-/
> 
> >From my point of view that is the lesser of two evils.
> 
> We only have hard-coding (syntactic) madness over having
> behaviour-dependent (semantic) madness.

I re-read the hardware spec now and it occured to me that for north and
southwest community, only the first 8 IRQs can be used as interrupts
(all GPIOs which have IntSel value < 8). Rest can only trigger GPEs
which are used for EC events.

I'll submit patches shortly using this information and valid_mask as you
suggested.
