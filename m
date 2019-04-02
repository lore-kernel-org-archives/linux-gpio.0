From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Tue, 2 Apr 2019 14:58:36 +0300
Message-ID: <20190402115836.GL9224@smile.fi.intel.com>
References: <20190327172940.GR3622@lahna.fi.intel.com>
 <20190328091729.GV9224@smile.fi.intel.com>
 <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
 <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
 <20190328123444.GX3622@lahna.fi.intel.com>
 <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
 <20190401074953.GQ3622@lahna.fi.intel.com>
 <CAB4CAweW_3p4i_8ntscJyU9n55HwdLt3pxyT3Gf6SUSbZAJ8qA@mail.gmail.com>
 <20190401122256.GF9224@smile.fi.intel.com>
 <CAB4CAwd6+6+Qwb2wDFkVOc_auTNdrEw07tX2ha=XLvxfwFHRXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAB4CAwd6+6+Qwb2wDFkVOc_auTNdrEw07tX2ha=XLvxfwFHRXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 02, 2019 at 02:16:19PM +0800, Chris Chiu wrote:
> On Mon, Apr 1, 2019 at 8:23 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Apr 01, 2019 at 06:41:57PM +0800, Chris Chiu wrote:

> Thanks for the comment. My first version did mimic the logic of the interrupt
> mask restore but it was based on the DMI quirk. It saves HOSTSW_OWN
> for each padgroup and restores them all after resume if DMI info matched.
> 
> What really confused me is how to do this specifically for a requested GPIO
> pin. So here's my new proposed patch. Please suggests if there's any better
> idea. Thanks.

>  struct intel_community_context {
>         u32 *intmask;
> +       u32 *hostown;

This is okay.

>  };

> +#ifdef CONFIG_PM_SLEEP
> +static void intel_save_hostown(struct intel_pinctrl *pctrl, unsigned int pin);
> +#endif
> +

No need for this...

>         /* Disable TX buffer and enable RX (this will be input) */
>         __intel_gpio_set_direction(padcfg0, true);
> +#ifdef CONFIG_PM_SLEEP
> +       intel_save_hostown(pctrl, pin);
> +#endif

...and for this.
Just save all of them at ->suspend()

>         for (i = 0; i < pctrl->ncommunities; i++) {
>                 struct intel_community *community = &pctrl->communities[i];
> -               u32 *intmask;
> +               u32 *intmask, *hostown;
> 
>                 intmask = devm_kcalloc(pctrl->dev, community->ngpps,
>                                        sizeof(*intmask), GFP_KERNEL);
> @@ -1292,6 +1299,13 @@ static int intel_pinctrl_pm_init(struct
> intel_pinctrl *pctrl)
>                         return -ENOMEM;
> 
>                 communities[i].intmask = intmask;
> +
> +               hostown = devm_kcalloc(pctrl->dev, community->ngpps,
> +                                      sizeof(*hostown), GFP_KERNEL);
> +               if (!hostown)
> +                       return -ENOMEM;
> +
> +               communities[i].hostown= hostown;

This is good.

>         }

> +static void intel_save_hostown(struct intel_pinctrl *pctrl, unsigned int pin)
> +{
> +       const struct intel_community *community;
> +       const struct intel_padgroup *padgrp;
> +       int i;
> +
> +       community = intel_get_community(pctrl, pin);
> +       if (!community)
> +               return;
> +       if (!community->hostown_offset)
> +               return;
> +
> +       padgrp = intel_community_get_padgroup(community, pin);
> +       if (!padgrp)
> +               return;
> +
> +       for (i = 0; i < pctrl->ncommunities; i++) {
> +               const struct intel_community *comm = &pctrl->communities[i];
> +               int j;
> +
> +               for (j = 0; j < comm->ngpps; j++) {
> +                       const struct intel_padgroup *pgrp = &comm->gpps[j];
> +
> +                       if (padgrp == pgrp) {
> +                               struct intel_community_context *communities;
> +                               void __iomem *base;
> +
> +                               communities = pctrl->context.communities;
> +                               base = community->regs +
> community->hostown_offset;
> +                               communities[i].hostown[j] = readl(base + j * 4);
> +                               break;
> +                       }
> +               }
> +       }

> +       return;

Useless.

> +}

This is too complicated. Just add

base = community->regs + community->hostown_offset;
for (gpp = 0; gpp < community->ngpps; gpp++)
	communities[i].hostown[gpp] = readl(base + gpp * 4);

into ->suspend() loop.

> +               base = community->regs + community->hostown_offset;
> +               for (gpp = 0; gpp < community->ngpps; gpp++) {
> +                       if (communities[i].hostown[gpp] &&
> +                           communities[i].hostown[gpp] != readl(base
> + gpp * 4)) {
> +                               writel(communities[i].hostown[gpp],
> base + gpp * 4);
> +                               dev_warn(dev, "hostown changed after resume\n");
> +                               dev_dbg(dev, "restored hostown %d/%u
> %#08x\n", i, gpp,
> +                                       readl(base + gpp * 4));
> +                       }
> +               }

Instead you may need to loop over each pin in the part of the group related to
one 32-bit HOSTSW_OWN register (i.e. 8, see PADOWN_*() macros in the driver),
check if it's requested and break a loop. If loop index is off-by-one a limit,
nothing to do, otherwise restore hostown register.

More pedantic approach is to collect the mask inside the loop and apply it.

The check function name is gpiochip_is_requested().

(One of Intel's drivers which is using that at ->resume() is
 drivers/gpio/gpio-lynxpoint.c)

P.S. I prefer pedantic approach. The simplification one is showed in order to
give you an idea.

-- 
With Best Regards,
Andy Shevchenko
