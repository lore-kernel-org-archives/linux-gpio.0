From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Tue, 2 Apr 2019 14:16:19 +0800
Message-ID: <CAB4CAwd6+6+Qwb2wDFkVOc_auTNdrEw07tX2ha=XLvxfwFHRXw@mail.gmail.com>
References: <20171121120422.GR22431@lahna.fi.intel.com> <CAD8Lp444FNHZh6fLUfhfp1i_UBpMbS5QuvJ4FuZn7PKH1Ucy=A@mail.gmail.com>
 <20190327172940.GR3622@lahna.fi.intel.com> <20190328091729.GV9224@smile.fi.intel.com>
 <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
 <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
 <20190328123444.GX3622@lahna.fi.intel.com> <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
 <20190401074953.GQ3622@lahna.fi.intel.com> <CAB4CAweW_3p4i_8ntscJyU9n55HwdLt3pxyT3Gf6SUSbZAJ8qA@mail.gmail.com>
 <20190401122256.GF9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401122256.GF9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 1, 2019 at 8:23 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 01, 2019 at 06:41:57PM +0800, Chris Chiu wrote:
>
> Thanks for the patch.
> My comments below.
>
> > diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> > b/drivers/pinctrl/intel/pinctrl-intel.c
> > index 8cda7b535b02..d1cfa5adef9b 100644
> > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > @@ -77,6 +77,7 @@ struct intel_pad_context {
> >         u32 padcfg0;
> >         u32 padcfg1;
> >         u32 padcfg2;
>
> > +       u32 hostown;
>
> This is wrong. We have one register per entire (*) group of pins to keep host
> ownership. Basically it's a mask.
>
> *) if it's <= 32, otherwise there are more registers. But in any case it's 1
> bit per pin, and not 32 bits.
>
> >         for (i = 0; i < pctrl->soc->npins; i++)
>
> Thus, the actual actions should mimic what we do for interrupt mask.
>
> --
> With Best Regards,
> Andy Shevchenko
>

Thanks for the comment. My first version did mimic the logic of the interrupt
mask restore but it was based on the DMI quirk. It saves HOSTSW_OWN
for each padgroup and restores them all after resume if DMI info matched.

What really confused me is how to do this specifically for a requested GPIO
pin. So here's my new proposed patch. Please suggests if there's any better
idea. Thanks.

--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -81,6 +81,7 @@ struct intel_pad_context {

 struct intel_community_context {
        u32 *intmask;
+       u32 *hostown;
 };

 struct intel_pinctrl_context {
@@ -117,6 +118,10 @@ struct intel_pinctrl {
 #define pin_to_padno(c, p)     ((p) - (c)->pin_base)
 #define padgroup_offset(g, p)  ((p) - (g)->base)

+#ifdef CONFIG_PM_SLEEP
+static void intel_save_hostown(struct intel_pinctrl *pctrl, unsigned int pin);
+#endif
+
 static struct intel_community *intel_get_community(struct intel_pinctrl *pctrl,
                                                   unsigned int pin)
 {
@@ -456,7 +461,9 @@ static int intel_gpio_request_enable(struct
pinctrl_dev *pctldev,
        intel_gpio_set_gpio_mode(padcfg0);
        /* Disable TX buffer and enable RX (this will be input) */
        __intel_gpio_set_direction(padcfg0, true);
+#ifdef CONFIG_PM_SLEEP
+       intel_save_hostown(pctrl, pin);
+#endif
        raw_spin_unlock_irqrestore(&pctrl->lock, flags);

        return 0;
@@ -1284,7 +1291,7 @@ static int intel_pinctrl_pm_init(struct
intel_pinctrl *pctrl)

        for (i = 0; i < pctrl->ncommunities; i++) {
                struct intel_community *community = &pctrl->communities[i];
-               u32 *intmask;
+               u32 *intmask, *hostown;

                intmask = devm_kcalloc(pctrl->dev, community->ngpps,
                                       sizeof(*intmask), GFP_KERNEL);
@@ -1292,6 +1299,13 @@ static int intel_pinctrl_pm_init(struct
intel_pinctrl *pctrl)
                        return -ENOMEM;

                communities[i].intmask = intmask;
+
+               hostown = devm_kcalloc(pctrl->dev, community->ngpps,
+                                      sizeof(*hostown), GFP_KERNEL);
+               if (!hostown)
+                       return -ENOMEM;
+
+               communities[i].hostown= hostown;
        }

        pctrl->context.pads = pads;
@@ -1447,6 +1461,43 @@ int intel_pinctrl_probe_by_uid(struct
platform_device *pdev)
 EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);

 #ifdef CONFIG_PM_SLEEP
+static void intel_save_hostown(struct intel_pinctrl *pctrl, unsigned int pin)
+{
+       const struct intel_community *community;
+       const struct intel_padgroup *padgrp;
+       int i;
+
+       community = intel_get_community(pctrl, pin);
+       if (!community)
+               return;
+       if (!community->hostown_offset)
+               return;
+
+       padgrp = intel_community_get_padgroup(community, pin);
+       if (!padgrp)
+               return;
+
+       for (i = 0; i < pctrl->ncommunities; i++) {
+               const struct intel_community *comm = &pctrl->communities[i];
+               int j;
+
+               for (j = 0; j < comm->ngpps; j++) {
+                       const struct intel_padgroup *pgrp = &comm->gpps[j];
+
+                       if (padgrp == pgrp) {
+                               struct intel_community_context *communities;
+                               void __iomem *base;
+
+                               communities = pctrl->context.communities;
+                               base = community->regs +
community->hostown_offset;
+                               communities[i].hostown[j] = readl(base + j * 4);
+                               break;
+                       }
+               }
+       }
+       return;
+}
+
 static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl,
unsigned int pin)
 {
        const struct pin_desc *pd = pin_desc_get(pctrl->pctldev, pin);
@@ -1588,6 +1639,17 @@ int intel_pinctrl_resume(struct device *dev)
                        dev_dbg(dev, "restored mask %d/%u %#08x\n", i, gpp,
                                readl(base + gpp * 4));
                }
+
+               base = community->regs + community->hostown_offset;
+               for (gpp = 0; gpp < community->ngpps; gpp++) {
+                       if (communities[i].hostown[gpp] &&
+                           communities[i].hostown[gpp] != readl(base
+ gpp * 4)) {
+                               writel(communities[i].hostown[gpp],
base + gpp * 4);
+                               dev_warn(dev, "hostown changed after resume\n");
+                               dev_dbg(dev, "restored hostown %d/%u
%#08x\n", i, gpp,
+                                       readl(base + gpp * 4));
+                       }
+               }
        }

        return 0;
