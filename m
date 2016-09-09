From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Fri, 9 Sep 2016 09:18:34 +0300
Message-ID: <20160909061834.GG15313@lahna.fi.intel.com>
References: <20150602141520.GE4057@lahna.fi.intel.com>
 <CALUN=qLAvUipcHArE_NT7Opv8iDjaZ3OTAsgs_jpXtBbvpwUXQ@mail.gmail.com>
 <20160817081344.GM30827@lahna.fi.intel.com>
 <CALUN=q+LAfTf_=V4tXy3_h48K2BLtNOjxK4=AKRTtdjfW8970g@mail.gmail.com>
 <20160818121328.GE30827@lahna.fi.intel.com>
 <CALUN=qJ_KEXXD4T11h3Xxjxx9LExBnzevVKGQ1K=XGZn-SS_rg@mail.gmail.com>
 <20160818135813.GJ30827@lahna.fi.intel.com>
 <20160908101303.GA22716@ktx>
 <20160908102402.GC15313@lahna.fi.intel.com>
 <20160908162843.GB22716@ktx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160908162843.GB22716@ktx>
Sender: linux-kernel-owner@vger.kernel.org
To: Phidias Chiang <phidias.chiang@canonical.com>
Cc: Anisse Astier <anisse@astier.eu>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 09, 2016 at 12:28:43AM +0800, Phidias Chiang wrote:
> On Thu, Sep 08, 2016 at 01:24:02PM +0300, Mika Westerberg wrote:
> > On Thu, Sep 08, 2016 at 06:13:03PM +0800, Phidias Chiang wrote:
> > > On Thu, Aug 18, 2016 at 04:58:13PM +0300, Mika Westerberg wrote:
> > > > On Thu, Aug 18, 2016 at 03:52:57PM +0200, Anisse Astier wrote:
> > > > > On Thu, Aug 18, 2016 at 2:13 PM, Mika Westerberg
> > > > > <mika.westerberg@linux.intel.com> wrote:
> > > > > > On Wed, Aug 17, 2016 at 03:42:58PM +0200, Anisse Astier wrote:
> > > > > >> pin 25 (GPIO_SUS6) GPIO ctrl0 0xec918201 ctrl1 0x05c00001
> > > > > >
> > > > > > It is this one (GPIO_SUS6).
> > > > > >
> > > > > > I wonder if we can relax the driver so that it only masks pins which are
> > > > > > not configured to generate interrupts by the BIOS. I quickly tried
> > > > > > following on one Braswell machine and it did not generate spurious
> > > > > > interrupts.
> > > > > >
> > > > > > Can you check if this works for you?
> > > > > 
> > > > > I tried it, your patch is working. It gives the same result as not
> > > > > clearing the north community. I receive the ACPI events.
> > > > 
> > > > OK, thanks for testing.
> > > > 
> > > > I'll make a formal patch and submit it with you CC'd. Let's hope it will
> > > > not break anything :)
> > > 
> > > Hi, we've also found this issue on HP X360, but both patches don't work
> > > with on it.
> > > 
> > > My current workaround is to save INTMASK before clearing then restore
> > > it after, but I'm not sure if there's any side-effect by doing so.
> > 
> > Did you try the latest patch here?
> > 
> > https://patchwork.ozlabs.org/patch/661413/
> 
> yes, that, including another patch in this thread. I inserted some debug
> message and found out INTMASK was still cleared after `gpiochip_irqchip_add`,
> hope it helps.

Hmm, how can that happen? The patch removes clearing of INTMASK and only
other place where it is cleared temporarily is on resume. Can you add
dev_info() calls like:

	/* Clear all interrupts */
	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
	dev_info(pctrl->dev, "INTMASK0: 0x%08x\n", readl(pctrl->regs + CHV_INTMASK));

	...

	gpiochip_set_chained_irqchip(chip, &chv_gpio_irqchip, irq,
				     chv_gpio_irq_handler);
	dev_info(pctrl->dev, "INTMASK1: 0x%08x\n", readl(pctrl->regs + CHV_INTMASK));
	return 0;

It should print the same values both time.

Also which interrupt does not work and can you send me output of
/proc/interrupts?
