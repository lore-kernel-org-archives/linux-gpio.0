From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal
Date: Thu, 30 Mar 2017 11:09:36 +0200
Message-ID: <CAMuHMdULqcyj8QBy3K9V7e+Pad2cjgxkLTNDyg4BEamywFAnJA@mail.gmail.com>
References: <20170329183658.618942497@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170329183658.618942497@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 29, 2017 at 8:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The R8A7791 PFC driver  was apparently based on the preliminary revisions
> of  the user's  manual, which  omitted the DVC_MUTE signal  altogether in
> the PFC section. The modern manual has the signal described,  so just add
> the necassary data to the driver...
>
> Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
