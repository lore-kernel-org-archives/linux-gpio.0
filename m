From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] regmap: regmap-irq/gpio-max77620: add level-irq support
Date: Wed, 26 Dec 2018 12:39:17 +0100
Message-ID: <CAMuHMdUbXeuemACL+GGx0HFjn2oKUb2UbDUKJedzCrm8JDfNaA@mail.gmail.com>
References: <20181218115931.GA21253@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218115931.GA21253@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Matti,

On Tue, Dec 18, 2018 at 1:00 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> Add level active IRQ support to regmap-irq irqchip. Change breaks
> existing regmap-irq type setting. Convert the existing drivers which

Indeed it does.

> use regmap-irq with trigger type setting (gpio-max77620) to work
> with this new approach. So we do not magically support level-active
> IRQs on gpio-max77620 - but add support to the regmap-irq for chips
> which support them =)
>
> We do not support distinguishing situation where HW supports rising
> and falling edge detection but not both. Separating this would require
> inventing yet another flags for IRQ types.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

This is now upstream as commit 1c2928e3e3212252 ("regmap:
regmap-irq/gpio-max77620: add level-irq support"), and breaks da9063-rtc
on the Renesas Koelsch board:

    genirq: Setting trigger mode 8 for irq 157 failed
(regmap_irq_set_type+0x0/0x140)
    da9063-rtc da9063-rtc: Failed to request ALARM IRQ 157: -524
    da9063-rtc: probe of da9063-rtc failed with error -524

> ---
>
> Version 3 of this patch is intended to be functionally identical to v2.
> This patch is rebased on top of a tree which contains changes:
> "regmap: irq: handle HW using separate rising/falling edge interrupts"
> from Bartosz Golaszewski and the change
> "regmap: regmap-irq: Remove default irq type setting from core"
> (proposed here):
> https://lore.kernel.org/lkml/20181218105813.GA6957@localhost.localdomain/
>
> There should not be direct dependency to "regmap: regmap-irq: Remove
> default irq type setting from core" though. Patch was also tested to
> apply cleany on regmap-tree.
>
> Same statement regarding testing applies - gpio-max77620 are only
> tested to compile. All real testing would be _HIGHLY_ appreciated.
>
>  drivers/base/regmap/regmap-irq.c | 35 ++++++++++-----
>  drivers/gpio/gpio-max77620.c     | 96 ++++++++++++++++++++++++++--------------
>  include/linux/regmap.h           | 27 ++++++++---
>  3 files changed, 110 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
> index 8b216b2e2c19..31d23c9a5ae7 100644
> --- a/drivers/base/regmap/regmap-irq.c
> +++ b/drivers/base/regmap/regmap-irq.c
> @@ -199,7 +199,7 @@ static void regmap_irq_enable(struct irq_data *data)
>         const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
>         unsigned int mask, type;
>
> -       type = irq_data->type_falling_mask | irq_data->type_rising_mask;
> +       type = irq_data->type.type_falling_val | irq_data->type.type_rising_val;
>
>         /*
>          * The type_in_mask flag means that the underlying hardware uses
> @@ -234,27 +234,42 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
>         struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
>         struct regmap *map = d->map;
>         const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
> -       int reg = irq_data->type_reg_offset / map->reg_stride;
> +       int reg;
> +       const struct regmap_irq_type *t = &irq_data->type;
>
> -       if (!(irq_data->type_rising_mask | irq_data->type_falling_mask))
> -               return 0;
> +       if ((t->types_supported & type) != type)
> +               return -ENOTSUPP;

Given types_supported defaults to zero, I think this breaks every existing
setup using REGMAP_IRQ_REG().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
