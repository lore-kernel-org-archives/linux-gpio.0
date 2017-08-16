From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 2/5] genirq: Add handle_fasteoi_{level,edge}_irq flow
 handlers.
Date: Wed, 16 Aug 2017 18:26:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708161824250.1987@nanos>
References: <1502319099-2782-1-git-send-email-david.daney@cavium.com> <1502319099-2782-3-git-send-email-david.daney@cavium.com> <alpine.DEB.2.20.1708141221440.1865@nanos> <5d9b51c1-a2bd-9932-8917-a743854192db@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:59160 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751517AbdHPQ0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2017 12:26:14 -0400
In-Reply-To: <5d9b51c1-a2bd-9932-8917-a743854192db@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 16 Aug 2017, David Daney wrote:

> On 08/14/2017 03:25 AM, Thomas Gleixner wrote:
> > On Wed, 9 Aug 2017, David Daney wrote:
> > >   #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
> > 
> > Can we please make them conditional in order not to bloat all kernels with
> > it? Like we do for handle_edge_eoi_irq() ?
> 
> 
> Yes.  Because these are initially used by exactly one driver, I could just
> make it conditional on that driver being enabled.
> 
> Alternately, I could invent a new Kconfig symbol to gate these and select that
> when the driver is enabled.
> 
> Do you have a preference?

The latter.

> > Hmm. That's quite different to the way we handle edge interrupts
> > normally. See handle_edge_irq() and handle_edge_eoi_irq().
> 
> Yes, these are not standard edge interrupts.  If they were, I wouldn't need
> new handlers.
> 
> For this particular irqdomain hierarchy, I need exactly handle_fasteoi_irq()
> semantics with the addition of a call to the chip->irq_ack() function *before*
> the handler is called.  I chose to "clone" and enhance handle_fasteoi_irq(),
> rather than adding hooks with runtime checks to the existing
> handle_fasteoi_irq().  There is code bloat this way, but a smaller risk of
> breaking other things.
> 
> Any additional "stuff" that is not needed to cover this use case would just be
> adding dead code.  In the future, if there is a need to enable more users of
> these functions, I would not object to doing more.

Ok, so we might rename that thing to something else than edge() as all
edge handlers have this processing loop which is required not to lose
edges.

Thanks

	tglx
