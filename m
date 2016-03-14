From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ
 setup
Date: Mon, 14 Mar 2016 10:44:57 +0200
Message-ID: <20160314084457.GX1796@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
 <20160311094517.GO1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:32517 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933863AbcCNIpB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Mar 2016 04:45:01 -0400
Content-Disposition: inline
In-Reply-To: <0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zheng, Qi" <qi.zheng@intel.com>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

On Mon, Mar 14, 2016 at 03:24:06AM +0200, Zheng, Qi wrote:
> 
> On Sat, Mar 12, 2016 at 01:06:01AM +0800, Qipeng Zha wrote:
> > There is one unexpected GPIO interrupt coming in below scenario.
> > 1. GPIO X is going to be used as falling edge interrupt.
> > 2. Before request_irq call, this GPIO X interrupt was masked.
> > 3. But the IRQ mode may be set for some mode in default (by BIOS).
> > 4. Toggle GPIO X from high to low.
> > 5. The GPIO X interrupt status will be set even if it was masked.
> > 6. Register the interrupt for GPIO X, the interrupt will be unmasked.
> > 7. Even if no change on GPIO X afterwards, but one GPIO X interrupt 
> > will be triggered because the interrupt status was set.
> > 
> > To avoid above issue, the interrupt status need clear before request_irq.
> > 
> > Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> > ---
> >  drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/intel/pinctrl-intel.c 
> > b/drivers/pinctrl/intel/pinctrl-intel.c
> > index ded5378..d6fe659 100644
> > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > @@ -773,6 +773,8 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
> >  		return -EPERM;
> >  	}
> >  
> > +	intel_gpio_irq_ack(d);
> 
> > If the pin toggles right here, we still have the same issue, no?
> 
> Yes. But it is very short time from here to the place IRQ got enabled.

That is still a race.

> To me, it is the only available platform dependent interface to do the "ACK" in the flow of request_irq.
> Maybe you have other better option here?
> 
> > We should check in the interrupt handler whether the interrupt is actually enabled which I think we do already. Maybe that code has bug somewhere?
> 
> The check in the interrupt handler can't distinguish if the interrupt status was set before or after the request_irq.
> On the Broxton RVP, one unexpected GPIO interrupt was captured during our GPIO unit test program.
> This issue can be fixed by this patch.

Drivers need to deal with the fact that they might get spurious
interrupts from time to time. You need to check in the interrupt handler
if the interrupt was from the device you are driving or not.

request_irq() enables the interrupt line and if the pin is already in
a state that triggers an interrupt, the driver interrupt handler will
be called.
