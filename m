From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] pinctrl_gpio_get_direction & ingenic fixes
Date: Mon, 9 Jul 2018 14:09:28 +0200
Message-ID: <CACRpkdav3FV7hc20Fj=n=DaNzvSaA2uLuj8QgHwwcevDkn_6_Q@mail.gmail.com>
References: <20180627114904.10890-1-paul@crapouillou.net> <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi folks,

On Wed, Jun 27, 2018 at 7:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Even if GPIO and pin muxing has only one set of buffers to indicate
> input or output (same registers in use) it's a GPIO driver business to
> get direction from GPIO part of IP.
>
> Looking into the existing code I would rather say that
> pinctrl-ingenic.c should incorporate gpio-ingenic.c as they are
> (partially) sharing same registers.

Usually we only split the functionality into two drivers if the two features
pin control and GPIO are explicitly in different hardware blocks,
and typically not sharing the same memory range.

If these registers are intermingled and the hardware actually
just one piece of silicon, I would suggest to try to merge the
two drivers into a combined pin control and GPIO driver
inside drivers/pinctrl/pinctrl-ingenic.c.

We have a few drivers like that already, good textbook
examples of how to do this include
drivers/pinctrl/pinctrl-sx150x.c where the two blocks are
handled in one driver using both APIs.

Paul could you have a look at if we can simply merge these
two into one big driver? It is much more natural to write
into the same set of registers when we do that.

If you still prefer to proceed with the GPIO/pinctrl as separate
drivers we need to look into this patch set, which I am
a bit ambivalent about, because it makes sense but at the
same time I want to keep GPIO and pin control business
separate because separation of concerns is just nice.

Yours,
Linus Walleij
