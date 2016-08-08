From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7792: add VIN pin groups
Date: Mon, 8 Aug 2016 13:46:43 +0200
Message-ID: <CAMuHMdVq8WXqJsi3Y7FYMeZLmLv3_Ja5RtMQgZX+H7tUC4ngUQ@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <3792658.DACycCOyRo@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36372 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259AbcHHLqp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2016 07:46:45 -0400
In-Reply-To: <3792658.DACycCOyRo@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Sergei,

On Fri, Aug 5, 2016 at 10:52 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add VIN[0-5] pin groups to the R8A7792 PFC driver.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus my 6 R8A7792 PFC patches  posted before (those should  be collected
> by Geert)...
>
> Changes in version 2:
> - fixed the SoC model in the changelog.

Thanks!

Reviewed-by:  Geert Uytterhoeven <geert+renesas@glider.be>

> Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
> ===================================================================
> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c

> +/* - VIN1 ------------------------------------------------------------------- */
> +static const union vin_data vin1_data_pins = {
> +       .data24 = {
> +               /* B */
> +               RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 5),
> +               RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7),
> +               RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
> +               RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
> +               /* G */
> +               RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
> +               RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
> +               RCAR_GP_PIN(8, 5), RCAR_GP_PIN(8, 6),
> +               RCAR_GP_PIN(8, 6), RCAR_GP_PIN(8, 7),

RCAR_GP_PIN(8, 7), RCAR_GP_PIN(8, 8),

> +               /* R */
> +               RCAR_GP_PIN(9, 5), RCAR_GP_PIN(9, 6),
> +               RCAR_GP_PIN(9, 7), RCAR_GP_PIN(9, 8),
> +               RCAR_GP_PIN(9, 9), RCAR_GP_PIN(9, 10),
> +               RCAR_GP_PIN(9, 11), RCAR_GP_PIN(9, 12),
> +       },
> +};

> +static const unsigned int vin1_data18_pins[] = {
> +       /* B */
> +       RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7),
> +       RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
> +       RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
> +       /* G */
> +       RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
> +       RCAR_GP_PIN(8, 5), RCAR_GP_PIN(8, 6),
> +       RCAR_GP_PIN(8, 6), RCAR_GP_PIN(8, 7),

RCAR_GP_PIN(8, 7), RCAR_GP_PIN(8, 8),

> +       /* R */
> +       RCAR_GP_PIN(9, 7), RCAR_GP_PIN(9, 8),
> +       RCAR_GP_PIN(9, 9), RCAR_GP_PIN(9, 10),
> +       RCAR_GP_PIN(9, 11), RCAR_GP_PIN(9, 12),
> +};

There's no need to resend. I'll fix it up when queuing in sh-pfc-for-v4.9.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
