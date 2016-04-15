From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: Add DU pin groups
Date: Fri, 15 Apr 2016 12:31:15 +0200
Message-ID: <CAMuHMdU0sEDSKzbetXfxKsB2gx5E6mb=oXw_=p=KzL5qJqxM_Q@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
	<3647462.hH7yCUNCYQ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <3647462.hH7yCUNCYQ@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Sergei,

On Wed, Apr 13, 2016 at 8:01 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> r8a7794 PFC DU support from the R-Car Gen2 v1.9.4 BSP
>
> [Magnus: added the description, added missing dot clock output signals,
> separated CDE and DISP signals, broke out the ODDF signal from the sync
> group.]
>
> [Sergei: resolved rejects, folded in Magnus' patches, killed empty lines,
> reordered pin/mux arrays and pin groups, fixed up some comments to the pin
> arrays, removed the "du" function splitting its groups between the "du0"
> and "du1" functions.]
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in sh-pfc-for-v4.7 for a second pull request.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
