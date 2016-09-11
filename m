From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Sun, 11 Sep 2016 11:05:06 +0300
Message-ID: <20160911080506.GO15313@lahna.fi.intel.com>
References: <CALUN=q+LAfTf_=V4tXy3_h48K2BLtNOjxK4=AKRTtdjfW8970g@mail.gmail.com>
 <20160818121328.GE30827@lahna.fi.intel.com>
 <CALUN=qJ_KEXXD4T11h3Xxjxx9LExBnzevVKGQ1K=XGZn-SS_rg@mail.gmail.com>
 <20160818135813.GJ30827@lahna.fi.intel.com>
 <20160908101303.GA22716@ktx>
 <20160908102402.GC15313@lahna.fi.intel.com>
 <20160908162843.GB22716@ktx>
 <20160909061834.GG15313@lahna.fi.intel.com>
 <20160909082358.GA23895@ktx>
 <20160909085832.GK15313@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160909085832.GK15313@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phidias Chiang <phidias.chiang@canonical.com>
Cc: Anisse Astier <anisse@astier.eu>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 09, 2016 at 11:58:32AM +0300, Mika Westerberg wrote:
> On Fri, Sep 09, 2016 at 04:23:58PM +0800, Phidias Chiang wrote:
> > On Fri, Sep 09, 2016 at 09:18:34AM +0300, Mika Westerberg wrote:
> > > On Fri, Sep 09, 2016 at 12:28:43AM +0800, Phidias Chiang wrote:
> > > 
> > > Hmm, how can that happen? The patch removes clearing of INTMASK and only
> > > other place where it is cleared temporarily is on resume. Can you add
> > > dev_info() calls like:
> > > 
> > > 	/* Clear all interrupts */
> > > 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
> > > 	dev_info(pctrl->dev, "INTMASK0: 0x%08x\n", readl(pctrl->regs + CHV_INTMASK));
> > > 
> > > 	...
> > > 
> > > 	gpiochip_set_chained_irqchip(chip, &chv_gpio_irqchip, irq,
> > > 				     chv_gpio_irq_handler);
> > > 	dev_info(pctrl->dev, "INTMASK1: 0x%08x\n", readl(pctrl->regs + CHV_INTMASK));
> > > 	return 0;
> > > 
> > > It should print the same values both time.
> > > 
> > > Also which interrupt does not work and can you send me output of
> > > /proc/interrupts?
> > 
> > Output in dmesg:
> > [    2.054475] cherryview-pinctrl INT33FF:00: INTMASK0: 0x00000006
> > [    2.055247] cherryview-pinctrl INT33FF:00: INTMASK1: 0x00000000
> > [    2.055375] cherryview-pinctrl INT33FF:01: INTMASK0: 0x00004000
> > [    2.056931] cherryview-pinctrl INT33FF:01: INTMASK1: 0x00000000
> > [    2.057036] cherryview-pinctrl INT33FF:02: INTMASK0: 0x00000000
> > [    2.057367] cherryview-pinctrl INT33FF:02: INTMASK1: 0x00000000
> > [    2.057489] cherryview-pinctrl INT33FF:03: INTMASK0: 0x00000000
> > [    2.058337] cherryview-pinctrl INT33FF:03: INTMASK1: 0x00000000
> > 
> > So it's somehow got cleared in the process after.
> 
> Only other place where we touch INTMASK register is
> chv_gpio_irq_mask_unmask(). Can you add some debug there to find out the
> caller?

Something like this:

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 0fe8fad..95fa3b1 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1357,6 +1357,11 @@ static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 		value |= BIT(intr_line);
 	chv_writel(value, pctrl->regs + CHV_INTMASK);
 
+	if (printk_ratelimit()) {
+		dev_info(pctrl->dev, "%smask pin %u intmask 0x%08x\n",
+			 mask ? "" : "un", pin, readl(pctrl->regs + CHV_INTMASK));
+	}
+
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 }
 
