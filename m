From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/5] pinctrl_gpio_get_direction & ingenic fixes
Date: Wed, 27 Jun 2018 20:18:13 +0300
Message-ID: <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
References: <20180627114904.10890-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627114904.10890-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 27, 2018 at 2:48 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> Hi Linus,
>
> Here's a set of (rather RFC) patches, to implement
> pinctrl_gpio_get_direction(). I did that, because my gpio-ingenic driver
> calls pinctrl_gpio_set_direction() within its gpio_chip's .set_direction
> callback, but there was no corresponding function to implement the
> .get_direction callback. If that's not the right way to do it, please
> advise.
>
> If not merging the whole series, patch [3/5] is a real fix that should
> go through.
>
> Note that it doesn't make checkpatch.pl happy, I wasn't sure whether I
> should try to comply to checkpatch.pl or match the coding style in the
> pinctrl subsystem, I chose the latter.

I dunno what Linus would going to say about this, but I would like to
see a schematics for this piece of IP.
Even if GPIO and pin muxing has only one set of buffers to indicate
input or output (same registers in use) it's a GPIO driver business to
get direction from GPIO part of IP.

Looking into the existing code I would rather say that
pinctrl-ingenic.c should incorporate gpio-ingenic.c as they are
(partially) sharing same registers.
To ->get_direction() implementation it's pretty straight forward, just
read necessary registers in the gpio-ingenic.c directly. No need to
have pin control or pin muxing to be involved.

-- 
With Best Regards,
Andy Shevchenko
