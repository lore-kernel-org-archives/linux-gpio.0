From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: add R8A7743 support
Date: Mon, 3 Apr 2017 10:13:37 +0200
Message-ID: <CAMuHMdVY=GGoygPTbtPv4jiUqeU8FL2g2nXcReXrChZ-fatMZg@mail.gmail.com>
References: <20170401220849.814356301@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170401220849.814356301@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Sergei,

On Sun, Apr 2, 2017 at 12:08 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Renesas RZ/G1M (R8A7743) is pin compatible with R-Car M2-W/N (R8A7791/3),
> however it doesn't have several automotive specific peripherals. Along
> with adding 'struct sh_pfc_soc_info' for R8A7743, annotate  all  items
> that only exist on the R-Car SoCs.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your (big) patch!

> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -1,8 +1,8 @@
>  /*
> - * r8a7791 processor support - PFC hardware block.
> + * r8a7791/r8a7743 processor support - PFC hardware block.
>   *
>   * Copyright (C) 2013 Renesas Electronics Corporation
> - * Copyright (C) 2014-2015 Cogent Embedded, Inc.
> + * Copyright (C) 2014-2017 Cogent Embedded, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2
> @@ -129,11 +129,12 @@ enum {
>         FN_A9, FN_MSIOF1_SS2, FN_I2C0_SDA,
>         FN_A10, FN_MSIOF1_TXD, FN_MSIOF1_TXD_D,
>         FN_A11, FN_MSIOF1_RXD, FN_I2C3_SCL_D, FN_MSIOF1_RXD_D,
> -       FN_A12, FN_FMCLK, FN_I2C3_SDA_D, FN_MSIOF1_SCK_D,
> -       FN_A13, FN_ATAG0_N_C, FN_BPFCLK, FN_MSIOF1_SS1_D,
> -       FN_A14, FN_ATADIR0_N_C, FN_FMIN, FN_FMIN_C, FN_MSIOF1_SYNC_D,
> -       FN_A15, FN_BPFCLK_C,
> -       FN_A16, FN_DREQ2_B, FN_FMCLK_C, FN_SCIFA1_SCK_B,
> +       FN_A12, FN_FMCLK /* R8A779x only */, FN_I2C3_SDA_D, FN_MSIOF1_SCK_D,
> +       FN_A13, FN_ATAG0_N_C, FN_BPFCLK /* R8A779x only */, FN_MSIOF1_SS1_D,
> +       FN_A14, FN_ATADIR0_N_C, FN_FMIN /* R8A779x only */,
> +       FN_FMIN_C /* R8A779x only */, FN_MSIOF1_SYNC_D,
> +       FN_A15, FN_BPFCLK_C /* R8A779x only */,
> +       FN_A16, FN_DREQ2_B, FN_FMCLK_C /* R8A779x only */, FN_SCIFA1_SCK_B,

I don't know if it's worth annotating all bits...

> @@ -1702,7 +1789,7 @@ static const struct sh_pfc_pin pinmux_pi
>         PINMUX_GPIO_GP_ALL(),
>  };
>
> -/* - ADI -------------------------------------------------------------------- */
> +/* - ADI (R8A779x only) ----------------------------------------------------- */
>  static const unsigned int adi_common_pins[] = {
>         /* ADIDATA, ADICS/SAMP, ADICLK */
>         RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25), RCAR_GP_PIN(6, 26),

... and pins (and groups and register bit fields), as they're used
only indirectly.

> @@ -4420,14 +4507,14 @@ static const unsigned int vin2_clk_mux[]
>  };
>
>  static const struct sh_pfc_pin_group pinmux_groups[] = {
> -       SH_PFC_PIN_GROUP(adi_common),
> -       SH_PFC_PIN_GROUP(adi_chsel0),
> -       SH_PFC_PIN_GROUP(adi_chsel1),
> -       SH_PFC_PIN_GROUP(adi_chsel2),
> -       SH_PFC_PIN_GROUP(adi_common_b),
> -       SH_PFC_PIN_GROUP(adi_chsel0_b),
> -       SH_PFC_PIN_GROUP(adi_chsel1_b),
> -       SH_PFC_PIN_GROUP(adi_chsel2_b),
> +       SH_PFC_PIN_GROUP(adi_common),   /* R8A779x only */
> +       SH_PFC_PIN_GROUP(adi_chsel0),   /* R8A779x only */
> +       SH_PFC_PIN_GROUP(adi_chsel1),   /* R8A779x only */
> +       SH_PFC_PIN_GROUP(adi_chsel2),   /* R8A779x only */
> +       SH_PFC_PIN_GROUP(adi_common_b), /* R8A779x only */
> +       SH_PFC_PIN_GROUP(adi_chsel0_b), /* R8A779x only */
> +       SH_PFC_PIN_GROUP(adi_chsel1_b), /* R8A779x only */
> +       SH_PFC_PIN_GROUP(adi_chsel2_b), /* R8A779x only */
>         SH_PFC_PIN_GROUP(audio_clk_a),
>         SH_PFC_PIN_GROUP(audio_clk_b),
>         SH_PFC_PIN_GROUP(audio_clk_b_b),
> @@ -4524,7 +4611,7 @@ static const struct sh_pfc_pin_group pin
>         SH_PFC_PIN_GROUP(intc_irq1),
>         SH_PFC_PIN_GROUP(intc_irq2),
>         SH_PFC_PIN_GROUP(intc_irq3),
> -       SH_PFC_PIN_GROUP(mlb_3pin),
> +       SH_PFC_PIN_GROUP(mlb_3pin),     /* R8A7794 only */

R8A779x ;-)

>         SH_PFC_PIN_GROUP(mmc_data1),
>         SH_PFC_PIN_GROUP(mmc_data4),
>         SH_PFC_PIN_GROUP(mmc_data8),

> @@ -5288,7 +5377,7 @@ static const char * const vin2_groups[]
>  };
>
>  static const struct sh_pfc_function pinmux_functions[] = {
> -       SH_PFC_FUNCTION(adi),
> +       SH_PFC_FUNCTION(adi),           /* R8A779x only */
>         SH_PFC_FUNCTION(audio_clk),
>         SH_PFC_FUNCTION(avb),
>         SH_PFC_FUNCTION(can0),
> @@ -5308,7 +5397,7 @@ static const struct sh_pfc_function pinm
>         SH_PFC_FUNCTION(iic0),
>         SH_PFC_FUNCTION(iic1),
>         SH_PFC_FUNCTION(intc),
> -       SH_PFC_FUNCTION(mlb),
> +       SH_PFC_FUNCTION(mlb),           /* R8A779x only */
>         SH_PFC_FUNCTION(mmc),
>         SH_PFC_FUNCTION(msiof0),
>         SH_PFC_FUNCTION(msiof1),

For pinmux_groups[] and pinmux_functions[] I agree they should be annotated.

However, you could achieve the same by using separate arrays for r8a7791
and r8a7743, with the added benefits that users cannot select nonexisting groups
and functions, and that only existing groups and functions are exposed
through debugfs
(/sys/kernel/debug/pinctrl/e6060000.pfc/pin{conf-groups,groups,mux-functions}).

Alternatively, you could share the arrays by putting the common entries first,
and the r8a7791/3-only entries last, and restricting r8a7743 to the common
subsets by filling in a lower values in r8a7743_pinmux_info.nr_groups resp.
r8a7743_pinmux_info.nr_functions.
Currently groups and functions do not have to be sorted, so this should work.
I'm not aware of a safe and simple way of filling in .nr_groups resp.
.nr_functions, and make sure everything stays in sync, except perhaps by
creating a struct:

        static const struct {
                struct sh_pfc_function common[<n>];
                struct sh_pfc_function r8a7791[];
        } pinmux_functions;

and manually updating <n> when changing the initializers?
Then at least the compiler will complain when adding (not when
removing) entries.

Both alternatives allow to add #ifdefs to the pinmux_groups[] and
pinmux_functions[] arrays (and __maybe_unused to referred arrays) to reduce
kernel size when not enabling support for all SoCs.

> @@ -6527,6 +6616,28 @@ static const struct sh_pfc_soc_operation
>         .pin_to_pocctrl = r8a7791_pin_to_pocctrl,
>  };
>
> +#ifdef CONFIG_PINCTRL_PFC_R8A7743
> +const struct sh_pfc_soc_info r8a7743_pinmux_info = {
> +       .name = "r8a77430_pfc",
> +       .ops = &r8a7791_pinmux_ops,
> +       .unlock_reg = 0xe6060000, /* PMMR */
> +
> +       .function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
> +
> +       .pins = pinmux_pins,
> +       .nr_pins = ARRAY_SIZE(pinmux_pins),
> +       .groups = pinmux_groups,
> +       .nr_groups = ARRAY_SIZE(pinmux_groups),
> +       .functions = pinmux_functions,
> +       .nr_functions = ARRAY_SIZE(pinmux_functions),
> +
> +       .cfg_regs = pinmux_config_regs,
> +
> +       .pinmux_data = pinmux_data,
> +       .pinmux_data_size = ARRAY_SIZE(pinmux_data),
> +};
> +#endif
> +
>  #ifdef CONFIG_PINCTRL_PFC_R8A7791
>  const struct sh_pfc_soc_info r8a7791_pinmux_info = {
>         .name = "r8a77910_pfc",

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
