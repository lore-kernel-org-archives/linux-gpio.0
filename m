From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] pinctrl_gpio_get_direction & ingenic fixes
Date: Mon, 9 Jul 2018 14:18:12 +0200
Message-ID: <CACRpkdaLE-XZ08CqRdFbW3AodUHKa=CdMtfO6Lic_j--BBet-g@mail.gmail.com>
References: <20180627114904.10890-1-paul@crapouillou.net> <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
 <1530213066.3755.0@smtp.crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530213066.3755.0@smtp.crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 28, 2018 at 9:11 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Sure, it'd be pretty straightforward to do it from the GPIO driver, but
> I'd still like to hear Linus' point of view about this.

I'm not sure about it, I guess it would be my second choice.

> As for merging pinctrl-ingenic.c and gpio-ingenic.c... I wouldn't
> disagree more,
> even if they share registers, they belong to different subsystems.

We actually have many pin control drivers also exposing
a GPIO chip. (Or several.) The way I see it is that we use
two kernel APIs for the same hardware, but one hardware
piece should still just have one driver, albeit exposing two
interfaces.

We actually also have serial ports and wireless network
cards exposing random GPIO chips because they happen
to have some arbitrary GPIO lines up for grabs.

So it is not just for the pin control and GPIO usecase, it is
for any usecase where the same hardware has something
plus a GPIO API. Pin control with GPIO as front-end is
special by being jitted together with the ranges though, so
they are closer related.

A good reason to keep it together in one driver is e.g. that they
have common clocking, so otherwise two drivers are grabbing
the same silicon clock and enabling/disabling it, runtime PM
would be a mess if both drivers start to request prepare
enable disable clocks at the same time etc. (I don't know
if this applied to Ingenic.)

> Besides,
> your platform might need the pinctrl driver but not the GPIO one, or
> you might
> want to provide the GPIO driver as a loadable module, etc.

I understand that concern. I think it's as nice with one
loadable module for pin control and GPIO at the same
time though, especially if the split is anyways kind
artificial between the two APIs.

Yours,
Linus Walleij
