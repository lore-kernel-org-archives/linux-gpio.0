From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DU parallel RGB output support
Date: Fri, 16 Jun 2017 12:06:25 +0200
Message-ID: <CAMuHMdUyyo1aPGz+KN7D8QHJeeKqDpGrD9ALiqgEUbdBVUG8QQ@mail.gmail.com>
References: <20170615073031.11199-1-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170615073031.11199-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2017 at 9:30 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The H3 ES1.x and H3 ES2.0 have identical pinmuxing for the parallel RGB
> output support.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
