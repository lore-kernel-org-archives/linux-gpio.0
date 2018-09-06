From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] gpio: Fix VLA removal fallout
Date: Thu, 6 Sep 2018 15:13:28 +0200
Message-ID: <CAMuHMdUgEqLxWPaE_G7YUGUmTteAW29Lqtnvgp=JRXOrJA-gxA@mail.gmail.com>
References: <20180905090555.9888-1-geert+renesas@glider.be> <CACRpkdZMD-GJUtcSiP30Rb-XAR6OHXZvdmEgOY-CxgauDGvViQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZMD-GJUtcSiP30Rb-XAR6OHXZvdmEgOY-CxgauDGvViQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Laura Abbott <labbott@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Sep 6, 2018 at 3:01 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 5, 2018 at 11:23 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series fixes various (mostly harmless) issues introduced by
> > commit 3027743f83f867d8 ("gpio: Remove VLA from gpiolib").
> >
> > As per the "one patch should fix one issue"-policy, this series contains 3
> > patches, although they all have the same Fixes: tag.
> >
> > W.r.t. propagating errors: while gpiod_set_array_value_complex() and its
> > callers can now return an error code, this is currently limited to -ENOMEM.
> > Actual failures setting a GPIO output value cannot be propagated, as
> > gpio_chip.set() still returns void.  Do you want to change that?
> > E.g. gen_74x164_set_value() can fail.
> >
> > Feel free to fold patches if deemed appropriate.
>
> What I want to know is if these patches drive a truck through Janusz patch
> set augmenting the array functions that I definately also plan to merge for
> this kernel cycle.
>
> Issues should be fixed of course, but if some of them already disappear
> if I apply Janusz patches, I'd rather postpone ... is it going to be hard
> to redo the cleanups on top of his patches?

I can respin afterwards. Just a few changed lines of context.

One question is if the stable team plans to backport the VLA removal (and
my fixes) or not...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
