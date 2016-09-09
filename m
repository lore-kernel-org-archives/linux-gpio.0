From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] pinctrl: sh-pfc: r8a7791: Implement voltage switching
 for SDHI
Date: Fri, 9 Sep 2016 09:52:20 +0200
Message-ID: <CAMuHMdVNW=hVrmHrbPZW1GpeaaDZOz-4x0cv9qjU9D5p9CLBTQ@mail.gmail.com>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au> <1473334608-24638-3-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1473334608-24638-3-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

Hi Simon,

On Thu, Sep 8, 2016 at 1:36 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> All the SHDIs can operate with either 3.3V or 1.8V signals, depending
> on negotiation with the card.
>
> Based on work by Wolfram Sang for the r8a7790.
>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

If you correct the copy-and-pasted comment below, you can add my
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> index 0c1a60c9a844..b707fc96f208 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -13,6 +13,10 @@
>
>  #include "sh_pfc.h"
>
> +/*
> + * All pins assigned to GPIO bank 3 can be used for SD interfaces in

Pins 0-23 assigned to GPIO bank 6...

> + * which case they support both 3.3V and 1.8V signalling.
> + */
>  #define CPU_ALL_PORT(fn, sfx)                                          \
>         PORT_GP_32(0, fn, sfx),                                         \
>         PORT_GP_26(1, fn, sfx),                                         \
> @@ -20,7 +24,15 @@
>         PORT_GP_32(3, fn, sfx),                                         \
>         PORT_GP_32(4, fn, sfx),                                         \
>         PORT_GP_32(5, fn, sfx),                                         \
> -       PORT_GP_32(6, fn, sfx),                                         \
> +       PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
