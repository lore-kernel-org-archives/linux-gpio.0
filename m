From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add EtherAVB pins, groups and functions
Date: Tue, 15 Nov 2016 10:56:43 +0100
Message-ID: <CAMuHMdXbBYbHzQXD-6dC2kQFVVGLWdGn0UWM0ahC7MSUPbwqwg@mail.gmail.com>
References: <1477921588-2326-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34247 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941325AbcKOJ4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 04:56:44 -0500
In-Reply-To: <1477921588-2326-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>

On Mon, Oct 31, 2016 at 2:46 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds AVB_LINK, AVB_MAGIC, AVB_PHY_INT, AVB_MDC, AVB_AVTP_PPS,
> AVB_AVTP_MATCH, AVB_AVTP_CAPTURE pins, groups and functions to R8A7796
> SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 87 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> index c7b8811fbab554bb..16773e580a902edc 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c

> @@ -2564,6 +2638,18 @@ enum {
>         "hscif4_data_b",
>  };
>
> +static const char * const avb_groups[] = {
> +       "avb_link",
> +       "avb_magic",
> +       "avb_phy_int",
> +       "avb_mdc",
> +       "avb_avtp_pps",
> +       "avb_avtp_match_a",
> +       "avb_avtp_capture_a",
> +       "avb_avtp_match_b",
> +       "avb_avtp_capture_b",
> +};
> +

Queueing up, with above chunk moved in front of drif0_groups[].

>  static const char * const i2c1_groups[] = {
>         "i2c1_a",
>         "i2c1_b",

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
