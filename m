From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins,
 groups and functions
Date: Tue, 19 Sep 2017 16:08:25 +0200
Message-ID: <CAMuHMdXiu0UiH1U__zPJYA-dRs6Ym0JdAcvEq=xwpMJn9i7afQ@mail.gmail.com>
References: <1505346762-3666-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1505346762-3666-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Shimoda-san,

On Thu, Sep 14, 2017 at 1:52 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  About AVB'0', I don't get any feedback from HW team... So, I'd like to follow
>  the current PFC section in the manual.
>
>  Changes from v1:
>   - Changes the groups like other SoCs (r8a7795 and r8a7796).

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.15...

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -936,6 +936,99 @@ enum {

> +static const unsigned int avb0_mdc_pins[] = {
> +       /* AVB0_MDC, AVB_MDIO */

... with s/AVB_MDIO/AVB0_MDIO/.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
