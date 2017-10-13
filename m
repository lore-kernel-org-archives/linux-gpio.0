From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio-rcar: use devm_ioremap_resource()
Date: Fri, 13 Oct 2017 08:50:29 +0200
Message-ID: <CAMuHMdXy=kz1tK_vdEN7cyjAACa6Cd_D8BFWcqotqcP5rEVnSg@mail.gmail.com>
References: <20171012201537.102610518@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171012201537.102610518@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 12, 2017 at 10:15 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Using devm_ioremap_resource() has several advantages over devm_ioremap():
> - it checks the passed resource's validity;
> - it calls devm_request_mem_region() to check for the resource overlap;
> - it prints an error message in case of error.
>
> We can call devm_ioremap_resource() instead of devm_ioremap_nocache()
> as ioremap() and ioremap_nocache()  are implemented identically on ARM.
> Doing this saves 2 LoCs and 80 bytes (AArch64 gcc 4.8.5).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
