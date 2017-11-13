From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 2/2] pinctrl: sh-pfc: r8a7791: Add can_clk function
Date: Mon, 13 Nov 2017 13:17:59 +0100
Message-ID: <CAMuHMdVLAdyrqecJmn09qLBY5=vA7YY-Opu79SvaDNdLp5DXtA@mail.gmail.com>
References: <CAMuHMdV=8rAE5z2VmCjL-M_MXY6TsKM_+0c-bsqDsjDZYWU1FA@mail.gmail.com>
 <1510334189-8942-1-git-send-email-fabrizio.castro@bp.renesas.com> <1510334189-8942-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:56310 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751128AbdKMMSA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 07:18:00 -0500
In-Reply-To: <1510334189-8942-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Hi Fabrizio,

On Fri, Nov 10, 2017 at 6:16 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds can_clk function to r8a7743/r8a7791 which is cleaner,
> as it reduces duplication, and allows for independent configuration.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -4826,10 +4826,6 @@ static const char * const can0_groups[] = {
>         "can0_data_d",
>         "can0_data_e",
>         "can0_data_f",
> -       "can_clk",
> -       "can_clk_b",
> -       "can_clk_c",
> -       "can_clk_d",

As the pin groups and functions are part of the stable DT ABI, you cannot just
remove the can_clk* pins from can0_groups[], as that would break existing users.

I would keep them, but add a comment "/* retained for backwards
compatibility */".

>  };
>
>  static const char * const can1_groups[] = {
> @@ -4837,6 +4833,9 @@ static const char * const can1_groups[] = {
>         "can1_data_b",
>         "can1_data_c",
>         "can1_data_d",

Likewise.

> +};
> +
> +static const char * const can_clk_groups[] = {
>         "can_clk",
>         "can_clk_b",
>         "can_clk_c",

Adding a new can_clk_groups[] ...

> @@ -5308,7 +5307,7 @@ static const char * const vin2_groups[] = {
>  };
>
>  static const struct {
> -       struct sh_pfc_function common[56];
> +       struct sh_pfc_function common[57];
>         struct sh_pfc_function r8a779x[2];
>  } pinmux_functions = {
>         .common = {
> @@ -5316,6 +5315,7 @@ static const struct {
>                 SH_PFC_FUNCTION(avb),
>                 SH_PFC_FUNCTION(can0),
>                 SH_PFC_FUNCTION(can1),
> +               SH_PFC_FUNCTION(can_clk),

and can_clk function is OK, though.

>                 SH_PFC_FUNCTION(du),
>                 SH_PFC_FUNCTION(du0),
>                 SH_PFC_FUNCTION(du1),

My comments apply to your r8a7794 patch, too. Except that on r8a7794 we
didn't have CAN support in pfc-r8a7794.c before, but I would like to treat all
R-Car Gen2 and RZ/G1 SoCs in the same way.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
