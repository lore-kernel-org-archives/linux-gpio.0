From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: rza1: report if devm_kasptrinf() fails
Date: Fri, 7 Dec 2018 10:32:50 +0100
Message-ID: <CAMuHMdVe9xdNbMvH+8ZhWJQWKakDM96HEyki2GN6Ebvap9mnUQ@mail.gmail.com>
References: <1543077033-7016-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543077033-7016-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Nicholas,

On Sat, Nov 24, 2018 at 5:35 PM Nicholas Mc Guire <hofrat@osadl.org> wrote:
> devm_kasprintf() may return NULL on failure of internal allocation
> thus the assignments are not safe if not checked. On error
> rza1_pinctrl_register() respectively rza1_parse_gpiochip() return
> negative values so -ENOMEM in the (unlikely) failure case of
> devm_kasprintf() should be fine here.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")

Thanks for your patch!

> The dev_err() for this unlikely case is added so that a failures of
> rza1_pinctrl_register() respectively rza1_parse_gpiochip() can be
> understood as currently the negative return value is simply passed up
> the call stack but it would be hard to identify the cause.

Adding the dev_err() is not needed, as the memory management core
print a message on memory allocation failures anyway.
Hence please remove it.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
