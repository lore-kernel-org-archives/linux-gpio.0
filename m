From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 4/6] pinctrl: intel: Add support for hardware debouncer
Date: Thu, 5 Jan 2017 01:14:36 +0200
Message-ID: <CAHp75VdVizfoxP1wEK0Z4v15uFA45tmFA46rHGAk__V1dT_Vdw@mail.gmail.com>
References: <20170104153109.28663-1-mika.westerberg@linux.intel.com> <20170104153109.28663-5-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:35656 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934087AbdADXOs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2017 18:14:48 -0500
In-Reply-To: <20170104153109.28663-5-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 4, 2017 at 5:31 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> The next generation Intel GPIO hardware has two additional registers
> PADCFG2 and PADCFG3. The latter is marked as reserved but the former
> includes configuration for per-pad hardware debouncer.
>
> This patch adds support for that in the Intel pinctrl core driver. Since
> these are additional features on top of the current generation hardware,
> we use revision number and feature flags to enable this if detected.

Few comments below.

> @@ -244,6 +264,7 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
>                                unsigned pin)
>  {
>         struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +       void __iomem *padcfg;

Perhaps padcfg2 ?

I don't remember if we had such a pattern earlier in the code, though
it would be better for my opinion to map local variable name to
register name.

At least you are using it later here.

> @@ -552,6 +596,53 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
>         return ret;
>  }
>
> +static int intel_config_set_debounce(struct intel_pinctrl *pctrl, unsigned pin,
> +                                    unsigned debounce)
> +{
> +       void __iomem *padcfg0, *padcfg2;
> +       unsigned long flags;
> +       u32 value0, value2;
> +       int ret = 0;
> +
> +       padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
> +       if (!padcfg2)
> +               return -ENOTSUPP;
> +
> +       padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
> +
> +       raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
> +       value0 = readl(padcfg0);
> +       value2 = readl(padcfg2);
> +
> +       /* Disable glitch filter and debouncer */
> +       value0 &= ~PADCFG0_PREGFRXSEL;
> +       value2 &= ~(PADCFG2_DEBEN | PADCFG2_DEBOUNCE_MASK);
> +
> +       if (debounce) {
> +               unsigned long v;
> +
> +               v = order_base_2(debounce * 1000 / DEBOUNCE_PERIOD);

> +               if (v < 3 || v > 15) {
> +                       ret = -EINVAL;
> +               } else {
> +                       /* Enable glitch filter and debouncer */
> +                       value0 |= PADCFG0_PREGFRXSEL;
> +                       value2 |= v << PADCFG2_DEBOUNCE_SHIFT;
> +                       value2 |= PADCFG2_DEBEN;
> +               }
> +       }
> +
> +       if (!ret) {

Would be cleaner to
if (ret)
 goto exit_unlock;
...

> +               writel(value0, padcfg0);
> +               writel(value2, padcfg2);
> +       }
> +

exit_unlock:

?

Or even do this above

if (v < 3 || v > 15) {
 ret = ...
 goto exit_unlock;
}

> +       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +       return ret;
> +}

> @@ -1000,6 +1110,18 @@ int intel_pinctrl_probe(struct platform_device *pdev,
>                 if (IS_ERR(regs))
>                         return PTR_ERR(regs);
>
> +               /*
> +                * Determine community features based on the revision if
> +                * not specified already.
> +                */
> +               if (!community->features) {
> +                       u32 rev;
> +
> +                       rev = (readl(regs + REVID) & REVID_MASK) >> REVID_SHIFT;
> +                       if (rev >= 0x94)

Can we define revision ID as well?

> +                               community->features |= FEATURE_DEBOUNCE;
> +               }
> +
>                 /* Read offset of the pad configuration registers */
>                 padbar = readl(regs + PADBAR);
>
> @@ -1073,6 +1195,7 @@ int intel_pinctrl_suspend(struct device *dev)
>         pads = pctrl->context.pads;
>         for (i = 0; i < pctrl->soc->npins; i++) {
>                 const struct pinctrl_pin_desc *desc = &pctrl->soc->pins[i];
> +               void __iomem *padcfg;

padcfg2


> @@ -72,11 +73,15 @@ struct intel_community {
>         unsigned pin_base;
>         unsigned gpp_size;
>         size_t npins;
> +       unsigned features;
>         void __iomem *regs;
>         void __iomem *pad_regs;
>         size_t ngpps;
>  };
>
> +/* Additional features supported by the hardware */
> +#define FEATURE_DEBOUNCE       BIT(0)

INTEL_PINCTRL_FEATURE_* ?

-- 
With Best Regards,
Andy Shevchenko
