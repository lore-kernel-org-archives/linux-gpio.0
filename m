From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 2/3] pinctrl: cherryview: Do not add all southwest and
 north GPIOs to IRQ domain
Date: Fri, 23 Sep 2016 21:04:43 +0300
Message-ID: <20160923180443.GT1218@lahna.fi.intel.com>
References: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
 <20160920121523.170293-3-mika.westerberg@linux.intel.com>
 <CACRpkdZGFgML2-aKQ_j4xQAoec3AJ+6k17FnXzh+EMp_uXHi7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:27846 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966192AbcIWSFF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Sep 2016 14:05:05 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZGFgML2-aKQ_j4xQAoec3AJ+6k17FnXzh+EMp_uXHi7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 23, 2016 at 02:58:47PM +0200, Linus Walleij wrote:
> On Tue, Sep 20, 2016 at 2:15 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > It turns out that for north and southwest communities, they can only
> > generate GPIO interrupts for lower 8 interrupts (IntSel value). The upper
> > part (8-15) can only generate GPEs (General Purpose Events).
> >
> > Now the reason why EC events such as pressing hotkeys does not work if we
> > mask all the interrupts is that in order to generate either interrupts or
> > GPEs the INTMASK register must have that particular interrupt unmasked. In
> > case of GPEs the CPU does not trigger normal interrupt (and thus the GPIO
> > driver does not see it) but instead it causes SCI (System Control
> > Interrupt) to be triggered with the GPE in question set.
> >
> > To make this all work as expected we only add those GPIOs to the IRQ domain
> > that can actually generate interrupts (IntSel value 0-7) and skip others.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Patch applied, had to merge in the recent fix from -rc6 first but
> after that it applied cleanly. Check the result please!

Looks good, thanks.
