From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a7794: Add PWM[0123456] support
Date: Mon, 18 Dec 2017 12:05:41 +0100
Message-ID: <CAMuHMdU1pbNnV_ed+kc8K8c2kyTkEMXcnO6Lqx5eWNnVc80sKw@mail.gmail.com>
References: <1513249026-26759-1-git-send-email-fabrizio.castro@bp.renesas.com> <1513249026-26759-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513249026-26759-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 14, 2017 at 11:57 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds PFC PWM[0123456] pin groups and functions, enabling
> PWM on the r8a7794 and r8a7745.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
