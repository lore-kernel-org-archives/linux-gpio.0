From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Thu, 4 Apr 2019 21:06:04 +0800
Message-ID: <CAB4CAweo6uSbn2hY-YbnPqWPBShAYwfGhfOosHL+oL_EE=8L9A@mail.gmail.com>
References: <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
 <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
 <20190328123444.GX3622@lahna.fi.intel.com> <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
 <20190401074953.GQ3622@lahna.fi.intel.com> <CAB4CAweW_3p4i_8ntscJyU9n55HwdLt3pxyT3Gf6SUSbZAJ8qA@mail.gmail.com>
 <20190401122256.GF9224@smile.fi.intel.com> <CAB4CAwd6+6+Qwb2wDFkVOc_auTNdrEw07tX2ha=XLvxfwFHRXw@mail.gmail.com>
 <20190402115836.GL9224@smile.fi.intel.com> <CAB4CAwe7n5XsRNS-ZoJL1K7dHLpRrwNReBCCMXjDWCtxYaqfdQ@mail.gmail.com>
 <20190403130640.GD9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403130640.GD9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 3, 2019 at 9:06 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Apr 03, 2019 at 03:06:43PM +0800, Chris Chiu wrote:
> > On Tue, Apr 2, 2019 at 7:58 PM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
>
> > > Instead you may need to loop over each pin in the part of the group related to
> > > one 32-bit HOSTSW_OWN register (i.e. 8, see PADOWN_*() macros in the driver),
> > > check if it's requested and break a loop. If loop index is off-by-one a limit,
> > > nothing to do, otherwise restore hostown register.
> > >
> > > More pedantic approach is to collect the mask inside the loop and apply it.
> > >
> > > The check function name is gpiochip_is_requested().
> > >
> > > (One of Intel's drivers which is using that at ->resume() is
> > >  drivers/gpio/gpio-lynxpoint.c)
> > >
> > > P.S. I prefer pedantic approach. The simplification one is showed in order to
> > > give you an idea.
>
> > Thanks for your great comment. I remove the useless hostown save function
> > and make the following change in ->resume() to detect and restore the abnormal
> > HOSTSW_OWN. Please help comment if there're still problems. Thanks.
>
>
> This better to make as a separate helper function
>
> static u32 intel_gpio_is_requested(chip, base, size)
> {
>         u32 requested = 0;
>         unsigned int i;
>
>         for () {
>                 if ()
>                         requested |= BIT();
>         }
>         return requested;
> }
>
> (Note u32 as a type)
>

Thanks. I made a minor modification for the check function. I think to
pass a padgroup
as the argument would be better instead of base, size which I may need
to check if
the size > 32 (of course it shouldn't happen) or not.

+intel_padgroup_has_gpio_requested(struct gpio_chip *chip,  const
struct intel_padgroup *gpp)
+{
+       u32 requested = 0;
+       int i;
+
+       if (gpp == NULL)
+               return 0;
+
+       if (gpp->gpio_base < 0)
+               return 0;
+
+       for (i = 0; i < gpp->size; i++)
+               if (gpiochip_is_requested(chip, gpp->gpio_base + i))
+                       requested |= BIT(i);
+
+       return requested;
+}
+
 int intel_pinctrl_resume(struct device *dev)
 {
        struct platform_device *pdev = to_platform_device(dev);

> > +                       if (requested) {
> > +                               if (communities[i].hostown[gpp] !=
> > readl(base + gpp * 4)) {
> > +
> > writel(communities[i].hostown[gpp], base + gpp * 4);
>
> The idea here not to check this at all, but rather apply a mask.
>
> u32 value;
>
> ...
> value = readl();
> value = (value & ~requested) | (hostown[gpp] & requested);
> writel(value);
>

I made the following per your suggestion. So basically I don't need to show a
warning for the abnormal HOSTSW_OWN value change? I will submit a formal
patch for review if there's no big problem for these code logic. Please advise
if any. Thanks.

@@ -1588,6 +1619,22 @@ int intel_pinctrl_resume(struct device *dev)
                        dev_dbg(dev, "restored mask %d/%u %#08x\n", i, gpp,
                                readl(base + gpp * 4));
                }
+
+               base = community->regs + community->hostown_offset;
+               for (gpp = 0; gpp < community->ngpps; gpp++) {
+                       const struct intel_padgroup *padgrp =
&community->gpps[i];
+                       u32 requested =
intel_padgroup_has_gpio_requested(&pctrl->chip, padgrp);
+
+                       if (requested) {
+                               u32 value = readl(base + gpp * 4);
+                               u32 saved = communities[i].hostown[gpp];
+
+                               value = (value & ~requested) | (saved
& requested);
+                               writel(value, base + gpp * 4);
+                               dev_dbg(dev, "restored hostown %d/%u
%#08x\n", i, gpp,
+                                       readl(base + gpp * 4));
+                       }
+               }
