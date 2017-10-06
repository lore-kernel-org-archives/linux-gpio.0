From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions
Date: Fri, 6 Oct 2017 13:24:08 +0200
Message-ID: <CAMuHMdV2x00e275zFNM-H-gGrK1u4fzZpO6=cwDQKpGZZi=8Xw@mail.gmail.com>
References: <20171006103704.13708-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171006103704.13708-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Wolfram,

On Fri, Oct 6, 2017 at 12:37 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested on a Salvator-XS with HSCIF1 mapped to debug1 connector with this
> snipplet in salvator-common.dtsi:

Thanks for your patch (and for testing ;-)!

> I verified to the best of my knowledge that all the other settings are equal to
> r8a7795-es1.

Unfortunately you missed that ES2.0 has a third set of pins for HSCIF2.
Can you please add these, too?
The rest looks fine to me.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
