From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Wed, 3 Apr 2019 15:06:43 +0800
Message-ID: <CAB4CAwe7n5XsRNS-ZoJL1K7dHLpRrwNReBCCMXjDWCtxYaqfdQ@mail.gmail.com>
References: <20190327172940.GR3622@lahna.fi.intel.com> <20190328091729.GV9224@smile.fi.intel.com>
 <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
 <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
 <20190328123444.GX3622@lahna.fi.intel.com> <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
 <20190401074953.GQ3622@lahna.fi.intel.com> <CAB4CAweW_3p4i_8ntscJyU9n55HwdLt3pxyT3Gf6SUSbZAJ8qA@mail.gmail.com>
 <20190401122256.GF9224@smile.fi.intel.com> <CAB4CAwd6+6+Qwb2wDFkVOc_auTNdrEw07tX2ha=XLvxfwFHRXw@mail.gmail.com>
 <20190402115836.GL9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402115836.GL9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 2, 2019 at 7:58 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> > +               base = community->regs + community->hostown_offset;
> > +               for (gpp = 0; gpp < community->ngpps; gpp++) {
> > +                       if (communities[i].hostown[gpp] &&
> > +                           communities[i].hostown[gpp] != readl(base
> > + gpp * 4)) {
> > +                               writel(communities[i].hostown[gpp],
> > base + gpp * 4);
> > +                               dev_warn(dev, "hostown changed after resume\n");
> > +                               dev_dbg(dev, "restored hostown %d/%u
> > %#08x\n", i, gpp,
> > +                                       readl(base + gpp * 4));
> > +                       }
> > +               }
>
> Instead you may need to loop over each pin in the part of the group related to
> one 32-bit HOSTSW_OWN register (i.e. 8, see PADOWN_*() macros in the driver),
> check if it's requested and break a loop. If loop index is off-by-one a limit,
> nothing to do, otherwise restore hostown register.
>
> More pedantic approach is to collect the mask inside the loop and apply it.
>
> The check function name is gpiochip_is_requested().
>
> (One of Intel's drivers which is using that at ->resume() is
>  drivers/gpio/gpio-lynxpoint.c)
>
> P.S. I prefer pedantic approach. The simplification one is showed in order to
> give you an idea.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks for your great comment. I remove the useless hostown save function
and make the following change in ->resume() to detect and restore the abnormal
HOSTSW_OWN. Please help comment if there're still problems. Thanks.

@@ -1588,6 +1600,29 @@ int intel_pinctrl_resume(struct device *dev)
                        dev_dbg(dev, "restored mask %d/%u %#08x\n", i, gpp,
                                readl(base + gpp * 4));
                }
+
+               base = community->regs + community->hostown_offset;
+               for (gpp = 0; gpp < community->ngpps; gpp++) {
+                       const struct intel_padgroup *padgrp =
&community->gpps[i];
+                       unsigned int requested = 0;
+                       int j;
+
+                       if (padgrp->gpio_base < 0)
+                               continue;
+
+                       for (j = 0; j < padgrp->size; j++)
+                               if
(gpiochip_is_requested(&pctrl->chip, padgrp->gpio_base + j))
+                                       requested |= BIT(j);
+
+                       if (requested) {
+                               if (communities[i].hostown[gpp] !=
readl(base + gpp * 4)) {
+
writel(communities[i].hostown[gpp], base + gpp * 4);
+                                       dev_warn(dev, "hostown been
changed during resume\n");
+                                       dev_dbg(dev, "restored hostown
%d/%u %#08x\n", i, gpp,
+                                               readl(base + gpp * 4));
+                               }
+                       }
+               }
        }

        return 0;
