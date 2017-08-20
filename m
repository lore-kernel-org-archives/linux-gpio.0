From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v8 0/7] genirq/gpio: Add driver for ThunderX and OCTEON-TX
 SoCs
Date: Sun, 20 Aug 2017 11:36:41 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708201135080.6785@nanos>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com> <alpine.DEB.2.20.1708181123330.1929@nanos> <f663518b-6330-dfc7-1c55-79b4a5de33fe@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:46982 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751061AbdHTJhb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Aug 2017 05:37:31 -0400
In-Reply-To: <f663518b-6330-dfc7-1c55-79b4a5de33fe@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 18 Aug 2017, David Daney wrote:
> On 08/18/2017 02:24 AM, Thomas Gleixner wrote:
> > On Thu, 17 Aug 2017, David Daney wrote:
> > 
> > > The ThunderX/OCTEON-TX GPIO hardware looks like a PCIe device, with
> > > the interrupt signal from each GPIO line being routed to a dedicated
> > > MSI-X.  This interrupt routing requires that we add some custom
> > > processing to the beginning of the MSI-X irqdomain hierarchy.
> > 
> > I merged the irq core patches into
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-gpio
> > 
> > This branch can be pulled into the GPIO tree to avoid pull request
> > dependencies.
> 
> Thanks everybody for helping me work through the challenges of preparing this
> patch set.  Touching multiple subsystems under the stewardship of multiple
> maintainers can be difficult, but I think this worked out well.

Thanks for your patience and the excellent work!

       tglx
