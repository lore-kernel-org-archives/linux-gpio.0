From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7794: remove reserved bits
Date: Tue, 16 May 2017 12:58:40 +0200
Message-ID: <CAMuHMdVddAgMkUhKi2M6Wmu_Syqe8+OwgfiVtooqqLGARnOCFQ@mail.gmail.com>
References: <20170428175432.051091580@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170428175432.051091580@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 28, 2017 at 7:50 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The R8A7794 PFC driver was apparently based on the preliminary revisions
> of  the  user's manual which  had some signals and MOD_SEL register fields
> described which the recent manual changed  to reserved. Of course, these
> signals haven't ever  been really used, which makes removing them painless.
>
> While at it, make the large *enum* look better by starting a new line each
> time  a new  row  in the IPSR and MOD_SEL register field tables is started.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.13.

>         PINMUX_IPSR_GPSR(IP2_31_30, A20),
>         PINMUX_IPSR_GPSR(IP2_31_30, SPCLK),
> -       PINMUX_IPSR_GPSR(IP2_29_27, MOUT1),

This patch seems to remove quite some wrong numbered entries, good ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
