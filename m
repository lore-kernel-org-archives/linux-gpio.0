From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFT v3] gpio: gpio-rcar: Support S2RAM
Date: Fri, 26 Jan 2018 16:31:15 +0100
Message-ID: <CAMuHMdUd9f6+f4KrkRNzGm9JHhHmLC3Nm3JaL-uiL0KmKv7B-Q@mail.gmail.com>
References: <1516040426-15507-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34783 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751422AbeAZPbR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jan 2018 10:31:17 -0500
In-Reply-To: <1516040426-15507-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Kaneko-san,

On Mon, Jan 15, 2018 at 7:20 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Hien Dang <hien.dang.eb@renesas.com>
>
> This patch adds an implementation that saves and restores the state of
> GPIO configuration on suspend and resume.
>
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [Modify structure of the bank info to simplify a saving registers]
> [Remove DEV_PM_OPS macro]
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>
> This patch is based on the for-next branch of linux-gpio tree.
>
> v2 [Yoshihiro Kaneko]
> * Modify structure of the bank info as suggested by Geert Uytterhoeven
>
> v3 [Yoshihiro Kaneko]
> * Remove DEV_PM_OPS macro as suggested by Vladimir Zapolskiy

Thanks for the updates!

It looks like not much is left from the original patches...

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -31,6 +31,16 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>
> +struct gpio_rcar_bank_info {
> +       u32 iointsel;
> +       u32 inoutsel;
> +       u32 outdt;
> +       u32 active_high_rising_edge;
> +       u32 level_trigger;
> +       u32 both;
> +       u32 intmsk;
> +};
> +
>  struct gpio_rcar_priv {
>         void __iomem *base;
>         spinlock_t lock;
> @@ -41,6 +51,7 @@ struct gpio_rcar_priv {
>         unsigned int irq_parent;
>         bool has_both_edge_trigger;
>         bool needs_clk;
> +       struct gpio_rcar_bank_info bank_info;
>  };
>
>  #define IOINTSEL 0x00  /* General IO/Interrupt Switching Register */
> @@ -531,11 +542,65 @@ static int gpio_rcar_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int gpio_rcar_suspend(struct device *dev)
> +{
> +       struct gpio_rcar_priv *p = dev_get_drvdata(dev);
> +
> +       p->bank_info.iointsel = gpio_rcar_read(p, IOINTSEL);
> +       p->bank_info.inoutsel = gpio_rcar_read(p, INOUTSEL);
> +       p->bank_info.outdt = gpio_rcar_read(p, OUTDT);
> +       p->bank_info.intmsk = gpio_rcar_read(p, INTMSK);

Given you just store values read from the hardware registers, why
not name all fields below according to the registers' names, like you did
for the above?
Especially for active_high_rising_edge and level_trigger, as the semantics
are inverted, compared to the POSNEG resp. EDGLEVEL registers.

> +       p->bank_info.active_high_rising_edge = gpio_rcar_read(p, POSNEG);
> +       p->bank_info.level_trigger = gpio_rcar_read(p, EDGLEVEL);
> +       p->bank_info.both = gpio_rcar_read(p, BOTHEDGE);

R-Car Gen1 does not have the BOTHEDGE.
Hence it should be read only if p->has_both_edge_trigger is true;

However, do we need to save/restore the configuration on all supported SoCs?
Shouldn't it depend on PSCI, like is done in drivers/pinctrl/sh-pfc/core.c
and drivers/clk/renesas/renesas-cpg-mssr.c?

> +
> +       return 0;
> +}
> +
> +static int gpio_rcar_resume(struct device *dev)
> +{
> +       struct gpio_rcar_priv *p = dev_get_drvdata(dev);
> +       int offset;

unsigned int

> +       u32 mask;
> +
> +       for (offset = 0; offset < p->gpio_chip.ngpio; offset++) {
> +               mask = BIT(offset);
> +               /* I/O pin */
> +               if (!(p->bank_info.iointsel & mask)) {
> +                       if (p->bank_info.inoutsel & mask)
> +                               gpio_rcar_direction_output(
> +                                       &p->gpio_chip, offset,
> +                                       !!(p->bank_info.outdt & mask));
> +                       else
> +                               gpio_rcar_direction_input(&p->gpio_chip,
> +                                                         offset);
> +               /* Interrupt pin */

The comment above is not properly indented, and should be moved below
the "else" statement.

> +               } else {
> +                       gpio_rcar_config_interrupt_input_mode(
> +                               p,
> +                               offset,
> +                               !(p->bank_info.active_high_rising_edge & mask),
> +                               !!(p->bank_info.level_trigger & mask),

This logic seems to be inverted, shouldn't it be

        !(p->bank_info.level_trigger & mask),

?

> +                               !!(p->bank_info.both & mask));
> +
> +                       if (p->bank_info.intmsk & mask)
> +                               gpio_rcar_write(p, MSKCLR, mask);
> +               }
> +       }
> +
> +       return 0;
> +}
> +#endif /* CONFIG_PM_SLEEP*/
> +
> +static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_resume);
> +
>  static struct platform_driver gpio_rcar_device_driver = {
>         .probe          = gpio_rcar_probe,
>         .remove         = gpio_rcar_remove,
>         .driver         = {
>                 .name   = "gpio_rcar",
> +               .pm     = &gpio_rcar_pm_ops,
>                 .of_match_table = of_match_ptr(gpio_rcar_of_table),
>         }
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
