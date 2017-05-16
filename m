From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7794: rename some I2C signals
Date: Tue, 16 May 2017 12:26:09 +0200
Message-ID: <CAMuHMdW18O-3FxDtnF4aOUrJFSWgqKb=QzM+AXxOqBkP8Gsf1g@mail.gmail.com>
References: <20170427211731.545220214@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170427211731.545220214@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 27, 2017 at 11:17 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The R8A7794 PFC driver was apparently based  on the preliminary revisions
> of  the  user's manual which called I2C5 device IIC0 and IIC0 device IIC1.
> Luckily, these signals haven't been used for any functions/groups so far,
> so  the  renaming should  be painless...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
