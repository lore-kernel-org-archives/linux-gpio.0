From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a7794: Implement voltage switching
 for SDHI
Date: Fri, 9 Sep 2016 10:08:03 +0200
Message-ID: <CAMuHMdW4=89ro4E2zLRs6fPZk3fPfkHmowNybO107nkJtZqGbw@mail.gmail.com>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au> <1473334608-24638-4-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:34357 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752105AbcIIIIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 04:08:04 -0400
In-Reply-To: <1473334608-24638-4-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Simon,

On Thu, Sep 8, 2016 at 1:36 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> All the SHDIs can operate with either 3.3V or 1.8V signals, depending
> on negotiation with the card.
>
> Based on work by Wolfram Sang for the r8a7790.
>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> index 8bc2cf0c594e..c02b367837b7 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> @@ -5160,8 +5162,38 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>         { },
>  };
>
> +static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
> +{
> +       if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
> +               return -EINVAL;
> +
> +       *pocctrl = 0xe606006c;
> +
> +       /* GP6_16-23 -> bits 31-24 of pocctrl
> +        * GP6_06    -> bit  23    of pocctrl
> +        * GP6_00-05 -> bits 22-17 of pocctrl
> +        * GP6_07    -> bit  16    of pocctrl
> +        * GP6_14    -> bit  15    of pocctrl
> +        * GP6_08-13 -> bits 14-09 of pocctrl
> +        * GP6_15    -> bit  08    of pocctrl
> +        */
> +       if (pin == RCAR_GP_PIN(6, 6) || pin == RCAR_GP_PIN(6, 14))
> +               return 31 - 2 - (pin & 0x1f);
> +       else if (pin == RCAR_GP_PIN(6, 7) || pin == RCAR_GP_PIN(6, 15))
> +               return 31 - 8 - (pin & 0x1f);
> +       else if (pin < RCAR_GP_PIN(6, 14))
> +               return 31 - 9 - (pin & 0x1f);
> +       else
> +               return 31 + 16 - (pin & 0x1f);

While your code is correct, I think it's easier for the casual reader to use
a plain switch () statement, and let the optimizer handle the rest.

> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
