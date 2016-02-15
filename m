From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Add Renesas R8A7794 audio PFC support
Date: Mon, 15 Feb 2016 12:01:54 +0100
Message-ID: <CAMuHMdVy-oopkgKx0c64c-WhGY-4u8fUUm2XayBPaiW8Q09FgQ@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Sergei,

On Wed, Feb 10, 2016 at 11:37 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>    Here's the set of 2 patches against the 'devel' branch of Linus Walleij's
> 'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7794
> SSI devices and audio clocks.

Thanks!

> [1/2] pinctrl: sh-pfc: r8a7794: add SSI pin groups
> [2/2] pinctrl: sh-pfc: r8a7794: add audio clock pin groups

Both
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue for renesas-drivers, and sh-pfc-for-v4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
