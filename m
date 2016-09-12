From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Mon, 12 Sep 2016 12:04:01 +0300
Message-ID: <20160912090401.GB1811@lahna.fi.intel.com>
References: <CALUN=qJ_KEXXD4T11h3Xxjxx9LExBnzevVKGQ1K=XGZn-SS_rg@mail.gmail.com>
 <20160818135813.GJ30827@lahna.fi.intel.com>
 <20160908101303.GA22716@ktx>
 <20160908102402.GC15313@lahna.fi.intel.com>
 <20160908162843.GB22716@ktx>
 <20160909061834.GG15313@lahna.fi.intel.com>
 <20160909082358.GA23895@ktx>
 <20160909085832.GK15313@lahna.fi.intel.com>
 <20160911080506.GO15313@lahna.fi.intel.com>
 <20160912065656.GA2411@ktx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160912065656.GA2411@ktx>
Sender: linux-kernel-owner@vger.kernel.org
To: Phidias Chiang <phidias.chiang@canonical.com>
Cc: Anisse Astier <anisse@astier.eu>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2016 at 02:56:56PM +0800, Phidias Chiang wrote:
> On Sun, Sep 11, 2016 at 11:05:06AM +0300, Mika Westerberg wrote:
> > On Fri, Sep 09, 2016 at 11:58:32AM +0300, Mika Westerberg wrote:
> > > On Fri, Sep 09, 2016 at 04:23:58PM +0800, Phidias Chiang wrote:
> > > 
> > > Only other place where we touch INTMASK register is
> > > chv_gpio_irq_mask_unmask(). Can you add some debug there to find out the
> > > caller?
> > 
> > Something like this:
> > 
> > diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> > index 0fe8fad..95fa3b1 100644
> > --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> > +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> > @@ -1357,6 +1357,11 @@ static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
> >  		value |= BIT(intr_line);
> >  	chv_writel(value, pctrl->regs + CHV_INTMASK);
> >  
> > +	if (printk_ratelimit()) {
> > +		dev_info(pctrl->dev, "%smask pin %u intmask 0x%08x\n",
> > +			 mask ? "" : "un", pin, readl(pctrl->regs + CHV_INTMASK));
> > +	}
> > +
> >  	raw_spin_unlock_irqrestore(&chv_lock, flags);
> >  }
> >  
> 
> With printk_ratelimit():
> 
> [    2.058485] cherryview-pinctrl INT33FF:00: INTMASK0: 0x00000006
> [    2.058513] cherryview-pinctrl INT33FF:00: mask pin 0 intmask 0x00000006
> [    2.058533] cherryview-pinctrl INT33FF:00: mask pin 1 intmask 0x00000006
> [    2.058551] cherryview-pinctrl INT33FF:00: mask pin 2 intmask 0x00000006
> [    2.058569] cherryview-pinctrl INT33FF:00: mask pin 3 intmask 0x00000006
> [    2.058587] cherryview-pinctrl INT33FF:00: mask pin 4 intmask 0x00000006
> [    2.058604] cherryview-pinctrl INT33FF:00: mask pin 5 intmask 0x00000006
> [    2.058623] cherryview-pinctrl INT33FF:00: mask pin 6 intmask 0x00000006
> [    2.058641] cherryview-pinctrl INT33FF:00: mask pin 7 intmask 0x00000006
> [    2.058663] cherryview-pinctrl INT33FF:00: mask pin 15 intmask 0x00000006
> [    2.059401] cherryview-pinctrl INT33FF:00: INTMASK1: 0x00000000
> [    2.059551] cherryview-pinctrl INT33FF:01: INTMASK0: 0x00004000
> [    2.061272] cherryview-pinctrl INT33FF:01: INTMASK1: 0x00000000
> [    2.061516] cherryview-pinctrl INT33FF:02: INTMASK0: 0x00000000
> [    2.061906] cherryview-pinctrl INT33FF:02: INTMASK1: 0x00000000
> [    2.062116] cherryview-pinctrl INT33FF:03: INTMASK0: 0x00000000
> [    2.062956] cherryview-pinctrl INT33FF:03: INTMASK1: 0x00000000
> 
> w/o printk_ratelimit():
> http://pastebin.com/dLDELDB4
> 
> The main difference is the intmask turns to 0x4 on pin 75 and 0x0
> afterwards for INT33FF:00. And same thing happened with :01 on pin 25

OK, I see what is going on now. When I changed handle_simple_irq to
handle_bad_irq, the IRQ core in __irq_do_set_handler() thinks the
handler is uninstalled and masks the line.

If you change handle_bad_irq to handle_simple_irq, in call to
gpiochip_irqchip_add(), does it work then?
