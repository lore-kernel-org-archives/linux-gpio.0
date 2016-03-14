From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ
 setup
Date: Mon, 14 Mar 2016 15:00:41 +0200
Message-ID: <20160314130041.GH1793@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
 <20160311094517.GO1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
 <20160314084457.GX1796@lahna.fi.intel.com>
 <CACRpkdbqa2zmQ4ajH6LVQLPcWXJ+hWvHNPY5-L3TeLvA=3yg-g@mail.gmail.com>
 <20160314125436.GG1793@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:6390 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752394AbcCNNAp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Mar 2016 09:00:45 -0400
Content-Disposition: inline
In-Reply-To: <20160314125436.GG1793@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Zheng, Qi" <qi.zheng@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 14, 2016 at 02:54:36PM +0200, Westerberg, Mika wrote:
> On Mon, Mar 14, 2016 at 01:40:39PM +0100, Linus Walleij wrote:
> > On Mon, Mar 14, 2016 at 9:44 AM, Westerberg, Mika
> > <mika.westerberg@intel.com> wrote:
> > > On Mon, Mar 14, 2016 at 03:24:06AM +0200, Zheng, Qi wrote:
> > 
> > >> > +   intel_gpio_irq_ack(d);
> > >>
> > >> > If the pin toggles right here, we still have the same issue, no?
> > >>
> > >> Yes. But it is very short time from here to the place IRQ got enabled.
> > >
> > > That is still a race.
> > >
> > >> To me, it is the only available platform dependent interface to do
> > > the "ACK" in the flow of request_irq. Maybe you have other better
> > > option here?
> > (...)
> > > Drivers need to deal with the fact that they might get spurious
> > > interrupts from time to time. You need to check in the interrupt handler
> > > if the interrupt was from the device you are driving or not.
> > >
> > > request_irq() enables the interrupt line and if the pin is already in
> > > a state that triggers an interrupt, the driver interrupt handler will
> > > be called.
> > 
> > This looks like something is wrong in the irqchip.
> 
> If request_irq() is called so that the interrupt is level triggered,
> let's say active low, and the pin is already in that state I would
> expect interrupt to trigger immediately when enabled, no?
> 
> If I understand correctly this is precisely what Zheng is describing
> they are trying to solve.

Scratch that. I just re-read the patch changelog and they are
configuring the pin as edge triggered.

> > Your set_type() is supporting edges but have all IRQs
> > handled by handle_simple_irq() rather than handle_edge_irq()
> > for the edges, which gives a more robust control flow
> > from IRQ to ACK to calling the handler.
> > 
> > Zheng/Mika: please look at how the level/edge
> > IRQs are handled in drivers/gpio/gpio-pl061.c
> > where I *tried* to do things right, switching handler
> > in .set_type() using irq_set_handler_locked(). I think
> > you may need to use handle_edge_irq() for the edge IRQs
> > and handle_level_irq() for the level IRQs just like I do
> > in the PL061 driver.
> 
> The driver is already doing that as far as I can tell (see
> intel_gpio_irq_type()).

I will check again if we are still missing something there.
