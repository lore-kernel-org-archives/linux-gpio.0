From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 2/3] pinctrl: sh-pfc: r8a7795: add support for voltage switching
Date: Mon, 6 Jun 2016 09:23:35 +0200
Message-ID: <CAMuHMdW6ZEzpmxHMXTYb31JoGCxMskothr16p6GArNCEML8fGw@mail.gmail.com>
References: <1465195811-3041-1-git-send-email-wsa@the-dreams.de> <1465195811-3041-3-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465195811-3041-3-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

Hi Wolfram,

On Mon, Jun 6, 2016 at 8:50 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index 44632b1a5c978c..8e068d8534de00 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -17,8 +17,8 @@
>         PORT_GP_CFG_16(0, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
>         PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
>         PORT_GP_CFG_15(2, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
> -       PORT_GP_CFG_16(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
> -       PORT_GP_CFG_18(4, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
> +       PORT_GP_CFG_16(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_IO_VOLTAGE),  \

Shouldn't this be split in PORT_GP_CFG_12() with SH_PFC_PIN_CFG_IO_VOLTAGE,
and PORT_GP_CFG_4() without?

> +       PORT_GP_CFG_18(4, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_IO_VOLTAGE),  \

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
