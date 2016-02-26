From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7794: fix GP2[29] muxing
Date: Fri, 26 Feb 2016 13:29:24 +0100
Message-ID: <CAMuHMdX-KD4ZZoA8XzYAxfVZS7=WiNF7LK89ZUUQ2vi-XtCeZw@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
	<2253759.3Cn6OZRLxj@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2253759.3Cn6OZRLxj@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2016 at 8:58 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
>
> GP2[29] muxing is controlled by 2-bit IP6[3:2] field, yet only 3 values
> are listed  instead of 4...
>
> [Sergei: fixed up the formatting, renamed, added the changelog.]
>
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, nice catch!

I guess I have found a reason to queue up more stuff on sh-pfc-for-v4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
