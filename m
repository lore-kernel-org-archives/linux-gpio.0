From: jmondi <jacopo@jmondi.org>
Subject: Re: [PATCH] pinctrl: rza1: off by one in rza1_parse_gpiochip()
Date: Wed, 23 Aug 2017 09:42:18 +0200
Message-ID: <20170823074218.GA8135@w540>
References: <20170818103248.ddguatdt5jhm5zx7@mwanda>
 <CAMuHMdWu3rpXMwKe3KLPHo+Cmg25uCOFJjd_zdQCoLT3qi-f9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWu3rpXMwKe3KLPHo+Cmg25uCOFJjd_zdQCoLT3qi-f9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,
   sorry for being late.

With Geert's approval I guess my ack is not that necessary, but...

On Wed, Aug 23, 2017 at 09:35:42AM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 18, 2017 at 12:32 PM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> > The rza1_pctl->ports[] array has RZA1_NPORTS (12) elements.  The > here
> > should be >= to prevent an out of bounds access.
> >
> > Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
