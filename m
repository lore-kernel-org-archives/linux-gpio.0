From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/9] pinctrl: sh-pfc: r8a7795: Fix FMCLK{_C,_D} and
 FMIN{_C,_D} pin function definitions
Date: Wed, 16 Aug 2017 14:04:39 +0200
Message-ID: <CAMuHMdUvOTx7XK_Me+AQjUWHEYLP6qYBMOCXLGi9FAhKouZBiQ@mail.gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com> <1501242081-3805-5-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501242081-3805-5-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 28, 2017 at 1:41 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes the implementation incorrect of IPSR register value
> definitions for FMCLK{_C,_D} and FMIN{_C,_D} pins function.
>
> This is a correction to the incorrect implementation of IPSR register pin
> assignment of the specifications updated for R8A7795 ES2.0 SoC in R-Car
> Gen3 Hardware User's Manual Rev.0.53E.
>
> Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in sh-pfc-for-v4.14 with reference corrected.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
