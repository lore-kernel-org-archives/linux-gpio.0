From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795-es1: Fix MOD_SEL1 bit[25:24] to
 0x3 when using STP_ISEN_1_D
Date: Thu, 23 Nov 2017 11:26:10 +0100
Message-ID: <CAMuHMdV1jujQTqu79t=ByGP=x8iMpdVOLHaoz=uKDhCoGt=q3A@mail.gmail.com>
References: <1510802161-30646-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1510802161-30646-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Kaneko-san,

On Thu, Nov 16, 2017 at 4:16 AM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes the implementation incorrect of MOD_SEL1 bit[25:24]
> value when STP_ISEN_1_D pin function is selected for IPSR16 bit[27:24].
>
> This is a correction to the incorrect implementation of MOD_SEL register
> pin assignment for R8A7795 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.51E or later.

I will drop "or later" while applying, as starting with Rev.0.52E, it documents
R-Car H3 ES2.0, not ES1.x.

> Fixes: 0b0ffc96dbe3 ("pinctrl: sh-pfc: Initial R8A7795 PFC support)
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
