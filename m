From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
Date: Wed, 13 Jul 2016 08:13:27 +0200
Message-ID: <CAMuHMdV086grEjTUxkhihF5t5NcO-pKt_8GfXhUWrMsq1zVbYg@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <1525017.NKJprrWkDB@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1525017.NKJprrWkDB@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2016 at 11:38 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the EtherAVB pin groups to the R8A7792 PFC driver.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus my 2 R8A7792 PFC patches posted before...
>
> Changes in version 2:
> - added AVB_AVTP_MATCH pin group.

Thanks for the update!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
