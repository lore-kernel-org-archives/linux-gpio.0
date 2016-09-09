From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: Add PORT_GP_24 helper macro
Date: Fri, 9 Sep 2016 09:40:33 +0200
Message-ID: <CAMuHMdWP3O_huybgERFLh83+q-8+h822039iET=cJN0mgbdq=g@mail.gmail.com>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au> <1473334608-24638-2-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1473334608-24638-2-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

Hi Simon,

On Thu, Sep 8, 2016 at 1:36 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> This follows the style of existing PORT_GP_X macros and
> will be used by a follow-up patch for the r8a7791 SoC.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 5e966c09434d..de91b5f247c0 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -399,11 +399,15 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>         PORT_GP_CFG_1(bank, 16, fn, sfx, cfg), PORT_GP_CFG_1(bank, 17, fn, sfx, cfg)
>  #define PORT_GP_18(bank, fn, sfx)      PORT_GP_CFG_18(bank, fn, sfx, 0)
>
> -#define PORT_GP_CFG_26(bank, fn, sfx, cfg)                                             \
> +#define PORT_GP_CFG_24(bank, fn, sfx, cfg)                                             \

This patch no longer applies since "pinctrl: sh-pfc: Add R8A7792 PFC support".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
