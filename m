From: "Zheng, Qi" <qi.zheng@intel.com>
Subject: RE: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ
 setup
Date: Mon, 14 Mar 2016 09:02:04 +0000
Message-ID: <0DD381DBF8F68D419C32ACFCEB28EB2521D10664@SHSMSX101.ccr.corp.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
 <20160311094517.GO1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
 <20160314084457.GX1796@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:45880 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755487AbcCNJCI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2016 05:02:08 -0400
In-Reply-To: <20160314084457.GX1796@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Westerberg, Mika" <mika.westerberg@intel.com>
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

>That is still a race.

> To me, it is the only available platform dependent interface to do the "ACK" in the flow of request_irq.
> Maybe you have other better option here?
> 
> > We should check in the interrupt handler whether the interrupt is actually enabled which I think we do already. Maybe that code has bug somewhere?
> 
> The check in the interrupt handler can't distinguish if the interrupt status was set before or after the request_irq.
> On the Broxton RVP, one unexpected GPIO interrupt was captured during our GPIO unit test program.
> This issue can be fixed by this patch.

> Drivers need to deal with the fact that they might get spurious interrupts from time to time. You need to check in the interrupt handler if the interrupt was from the device you are driving or not.

> request_irq() enables the interrupt line and if the pin is already in a state that triggers an interrupt, the driver interrupt handler will be called.

I agree with you that the driver need deal with spurious interrupts, but it is expected that the GPIO driver eliminate this spurious interrupts as well which the patch can help.
And IMHO, adding ACK in the irq_set_type makes sense since a clean interrupt status is expected behavior before enabling the interrupt.


