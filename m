From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] pinctrl: sh-pfc: r8a7791: Add can_clk function
Date: Wed, 15 Nov 2017 17:17:22 +0100
Message-ID: <CAMuHMdUwJnvsH-8+EsFWVhaw7zNLeFDxTv6mZoja57cgwg_qdQ@mail.gmail.com>
References: <1510674077-31136-1-git-send-email-fabrizio.castro@bp.renesas.com> <1510674077-31136-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1510674077-31136-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

Hi Fabrizio,

On Tue, Nov 14, 2017 at 4:41 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds can_clk function to r8a7743/r8a7791 which is cleaner,
> and allows for independent configuration.
> We keep the can_clk* pins definitions from within can0_groups and
> can1_groups for uniformity and backwards compatibility.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> ---
> v1->v2
> * Retained can_clk* pins inside can[01]_groups
> * Added comments

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
