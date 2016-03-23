From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: Add drive strength support
Date: Wed, 23 Mar 2016 10:54:02 +0100
Message-ID: <CAMuHMdXZ6Eec37e7s3CO0Y782_Yy5hv--jX7gSGFTc5SCokZVA@mail.gmail.com>
References: <1458516819-3928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1458516819-3928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1458516819-3928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On Mon, Mar 21, 2016 at 12:33 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add support for the drive-strengh pin configuration using the generic
> pinconf DT bindings.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 181ea98a63b7..73f0b33ee0a1 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -173,6 +173,21 @@ void sh_pfc_write_raw_reg(void __iomem *mapped_reg, unsigned int reg_width,
>         BUG();
>  }
>
> +u32 sh_pfc_read_reg(struct sh_pfc *pfc, u32 reg, unsigned int width)
> +{
> +       return sh_pfc_read_raw_reg(sh_pfc_phys_to_virt(pfc, reg), width);
> +}
> +
> +void sh_pfc_write_reg(struct sh_pfc *pfc, u32 reg, unsigned int width, u32 data)
> +{
> +       if (pfc->info->unlock_reg)
> +               sh_pfc_write_raw_reg(
> +                       sh_pfc_phys_to_virt(pfc, pfc->info->unlock_reg), 32,
> +                       ~data);
> +
> +       sh_pfc_write_raw_reg(sh_pfc_phys_to_virt(pfc, reg), width, data);
> +}

I like these helpers. They may also be used by r8a7778_pinmux_[gs]et_bias()
and r8a7790_[gs]et_io_voltage().

However, writing to the pull-up registers on r8a7778 doesn't seem to require
writing to the unlock register first.

Should we prepare for that and add a bool parameter to sh_pfc_write_reg()?

> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c

> +static int sh_pfc_pinconf_get_drive_strength(struct sh_pfc *pfc,
> +                                            unsigned int pin)
> +{
> +       unsigned long flags;
> +       unsigned int offset;
> +       unsigned int size;
> +       u32 reg;
> +       u32 val;
> +
> +       reg = sh_pfc_pinconf_find_drive_strength_reg(pfc, pin, &offset, &size);
> +       if (!reg)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&pfc->lock, flags);
> +       val = sh_pfc_read_reg(pfc, reg, 32);
> +       spin_unlock_irqrestore(&pfc->lock, flags);
> +
> +       val = (val >> offset) & GENMASK(size - 1, 0);
> +
> +       /* Convert the value to mA based on a full drive strength value of 24mA.
> +        * We can make the full value configurable later if needed.
> +        */
> +       if (size == 2)
> +               val <<= 1;

I would write "val *= 2" here, as you're doing arithmetic, and have a "* 3"
below anyway.

> +       return (val + 1) * 3;
> +}
> +
> +static int sh_pfc_pinconf_set_drive_strength(struct sh_pfc *pfc,
> +                                            unsigned int pin, u16 strength)
> +{
> +       unsigned long flags;
> +       unsigned int offset;
> +       unsigned int size;
> +       u32 reg;
> +       u32 val;
> +
> +       if (strength < 3 || strength > 24)
> +               return -EINVAL;
> +
> +       reg = sh_pfc_pinconf_find_drive_strength_reg(pfc, pin, &offset, &size);
> +       if (!reg)
> +               return -EINVAL;
> +
> +       /* Convert the value from mA based on a full drive strength value of
> +        * 24mA. We can make the full value configurable later if needed.
> +        */
> +       strength = strength / 3 - 1;
> +       if (size == 2)
> +               strength >>= 1;

Same here: "strength / = 2".

Apart from the above, everything else looks fine to me, thx!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
