From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: Add r7s72100 PFC driver
Date: Tue, 10 Jan 2017 15:59:36 +0100
Message-ID: <CAMuHMdXdtuhZR3F1XEL0V9f1h04t4mJRfM3uBLNbtJhO0bF0YA@mail.gmail.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <1483990318-26927-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34983 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760475AbdAJO7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2017 09:59:37 -0500
In-Reply-To: <1483990318-26927-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

On Mon, Jan 9, 2017 at 8:31 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> Squash commits in Geert's renesas-driver/genmai-gpio-and-pfc branch that
> add support for r7s72100 PFC.
> This squash combines commits for Magnus' original driver and minor fixes
> to forward-port it to a more recent kernel (v4.10)
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -473,6 +473,12 @@ static const struct of_device_id sh_pfc_of_table[] = {
>                 .data = &emev2_pinmux_info,
>         },
>  #endif
> +#ifdef CONFIG_PINCTRL_PFC_R7S72100
> +       {
> +               .compatible = "renesas,pfc-r7s72100",
> +               .data = &r7s72100_pinmux_info,
> +       },
> +#endif
>  #ifdef CONFIG_PINCTRL_PFC_R8A73A4
>         {
>                 .compatible = "renesas,pfc-r8a73a4",
> @@ -626,6 +632,9 @@ static int sh_pfc_probe(struct platform_device *pdev)
>  }
>
>  static const struct platform_device_id sh_pfc_id_table[] = {
> +#ifdef CONFIG_PINCTRL_PFC_R7S72100
> +       { "pfc-r7s72100", (kernel_ulong_t)&r7s72100_pinmux_info },
> +#endif

The above chunk should be removed, as now r7s72100 always uses DT.

>  #ifdef CONFIG_PINCTRL_PFC_SH7203
>         { "pfc-sh7203", (kernel_ulong_t)&sh7203_pinmux_info },
>  #endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
