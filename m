From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Mon, 1 Apr 2019 18:41:57 +0800
Message-ID: <CAB4CAweW_3p4i_8ntscJyU9n55HwdLt3pxyT3Gf6SUSbZAJ8qA@mail.gmail.com>
References: <20171121105205.GP22431@lahna.fi.intel.com> <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
 <20171121120422.GR22431@lahna.fi.intel.com> <CAD8Lp444FNHZh6fLUfhfp1i_UBpMbS5QuvJ4FuZn7PKH1Ucy=A@mail.gmail.com>
 <20190327172940.GR3622@lahna.fi.intel.com> <20190328091729.GV9224@smile.fi.intel.com>
 <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
 <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
 <20190328123444.GX3622@lahna.fi.intel.com> <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
 <20190401074953.GQ3622@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401074953.GQ3622@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Daniel Drake <drake@endlessm.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 1, 2019 at 3:49 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Fri, Mar 29, 2019 at 04:38:20PM +0800, Chris Chiu wrote:
> > On Thu, Mar 28, 2019 at 8:34 PM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > On Thu, Mar 28, 2019 at 08:19:59PM +0800, Chris Chiu wrote:
> > > > On Thu, Mar 28, 2019 at 5:38 PM Daniel Drake <drake@endlessm.com> wrote:
> > > > >
> > > > > On Thu, Mar 28, 2019 at 5:17 PM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > Hmm... Can you confirm that laptop you declared as a fixed case and the
> > > > > > mentioned here is the same one?
> > > > >
> > > > > They are definitely not the same exact unit - originally we had a
> > > > > pre-production sample, and now we briefly diagnosed a real production
> > > > > unit that was sold to a customer. There could be subtle motherboard
> > > > > variations as you mention.
> > > > >
> > > > > > If it's the case, I recommend to ping Asus again and make them check and fix.
> > > > >
> > > > > We'll keep an eye open for any opportunities to go deeper here.
> > > > > However further investigation on both our side and theirs is blocked
> > > > > by not having any of the affected hardware (since the models are now
> > > > > so old), so I'm not very optimistic that we'll be able to make
> > > > > progress there.
> > > > >
> > > > > > Meanwhile, Mika's proposal sounds feasible and not so intrusive. We may
> > > > > > implement this later on.
> > > > >
> > > > > Chris will work on implementing this for your consideration.
> > > > >
> > > > > Thanks for the quick feedback!
> > > > > Daniel
> > > >
> > > > What if I modify the patch as follows? It doesn't save HOSTSW_OWN register.
> > > > It just toggles the bit specifically for the IRQ GPIO pin after resume when DMI
> > > > matches.
> > >
> > > I don't really like having quirks like this if we can avoid it and in
> > > this case I think we can. Just always save HOSTSW_OWN and then restore
> > > it if there is a GPIO requested and the value differs (and log a warning
> > > or something like that).
> >
> > You mean save the content of hostsw_own register on padgroup based ex.
> >     communities[i].hostown[gpp] = readl(base + gpp * 4);
> >
> > And then check the hostown bit for the GPIO requested pin in
> > intel_pinctrl_resume(),
> > differs the hostsw_own bit on pin base (like padcfg), then restore the
> > hostsw_own
> > value of the padgroug which the GPIO pin is belonging to?
>
> Yes.
>
> > I think what you mean should be a much more straightforward solution
> > for this. Could
> > you implement this in your way and we can try to help verification. Thanks.
>
> Sure I can but it probably does not happen until end of the week because
> I'm currently busy with something else.

Thanks for your attention. I don't want to distract you so I'll try to
refine the
patch. It would be a great help if you can help review and give comments.

Don't know whether if the following patch still get the wrong idea about
your thought.  It saves the hostsw_own when GPIO requested, check
if the value differs in resume() and restore if necessary. Please kindly
correct me if any. Thanks

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
b/drivers/pinctrl/intel/pinctrl-intel.c
index 8cda7b535b02..d1cfa5adef9b 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -77,6 +77,7 @@ struct intel_pad_context {
        u32 padcfg0;
        u32 padcfg1;
        u32 padcfg2;
+       u32 hostown;
 };

 struct intel_community_context {
@@ -219,6 +220,24 @@ static bool intel_pad_acpi_mode(struct
intel_pinctrl *pctrl, unsigned int pin)
        return !(readl(hostown) & BIT(gpp_offset));
 }

+static void __iomem *intel_get_hostown(struct intel_pinctrl *pctrl,
unsigned int pin)
+{
+       const struct intel_community *community;
+       const struct intel_padgroup *padgrp;
+
+       community = intel_get_community(pctrl, pin);
+       if (!community)
+               return NULL;
+       if (!community->hostown_offset)
+               return NULL;
+
+       padgrp = intel_community_get_padgroup(community, pin);
+       if (!padgrp)
+               return NULL;
+
+       return community->regs + community->hostown_offset +
padgrp->reg_num * 4;
+}
+
 static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
 {
        struct intel_community *community;
@@ -442,7 +461,7 @@ static int intel_gpio_request_enable(struct
pinctrl_dev *pctldev,
                                     unsigned int pin)
 {
        struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-       void __iomem *padcfg0;
+       void __iomem *padcfg0, *hostown;
        unsigned long flags;

        raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -457,6 +476,10 @@ static int intel_gpio_request_enable(struct
pinctrl_dev *pctldev,
        /* Disable TX buffer and enable RX (this will be input) */
        __intel_gpio_set_direction(padcfg0, true);

+       /* Save HOSTSW_OWN */
+       hostown = intel_get_hostown(pctrl, pin);
+       if (!pctrl->context.pads[pin].hostown)
+               pctrl->context.pads[pin].hostown = readl(hostown);
        raw_spin_unlock_irqrestore(&pctrl->lock, flags);

        return 0;
@@ -1543,12 +1566,22 @@ int intel_pinctrl_resume(struct device *dev)
        pads = pctrl->context.pads;
        for (i = 0; i < pctrl->soc->npins; i++) {
                const struct pinctrl_pin_desc *desc = &pctrl->soc->pins[i];
-               void __iomem *padcfg;
+               void __iomem *padcfg, *hostown;
                u32 val;

                if (!intel_pinctrl_should_save(pctrl, desc->number))
                        continue;

+               hostown = intel_get_hostown(pctrl, desc->number);
+               val = readl(hostown);
+               if (!pads[i].hostown && val != pads[i].hostown) {
+                       writel(pads[i].hostown, hostown);
+                       dev_warn(dev, "pin %u not owned by host\n",
+                               desc->number);
+                       dev_dbg(dev, "restored pin %u hostsw_own %#08x\n",
+                               desc->number, readl(hostown));
+               }
+
                padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG0);
                val = readl(padcfg) & ~PADCFG0_GPIORXSTATE;
                if (val != pads[i].padcfg0) {
