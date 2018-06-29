From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/5] pinctrl_gpio_get_direction & ingenic fixes
Date: Fri, 29 Jun 2018 18:29:45 +0300
Message-ID: <CAHp75VfPVB6BwkL1+bGRsi03g6io0A0Cty+ykSDkYevOvq=VGA@mail.gmail.com>
References: <20180627114904.10890-1-paul@crapouillou.net> <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
 <1530213066.3755.0@smtp.crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530213066.3755.0@smtp.crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 28, 2018 at 10:11 PM, Paul Cercueil <paul@crapouillou.net> wrot=
e:
> Le mer. 27 juin 2018 =C3=A0 19:18, Andy Shevchenko <andy.shevchenko@gmail=
.com> a
> =C3=A9crit :
>> On Wed, Jun 27, 2018 at 2:48 PM, Paul Cercueil <paul@crapouillou.net>
>> wrote:

>> I dunno what Linus would going to say about this, but I would like to
>> see a schematics for this piece of IP.

> ftp://ftp.ingenic.com/SOC/JZ4780/JZ4780_pm.pdf

I'm not sure you referred to a proper document "Mobile Application
Processor. Programming Manual"

I didn't find quickly what I'm looking for. Care to point me out to
the page number?
Thanks!

>> Even if GPIO and pin muxing has only one set of buffers to indicate
>> input or output (same registers in use) it's a GPIO driver business to
>> get direction from GPIO part of IP.
>
>
> If I follow that logic it's also a GPIO driver business to set the direct=
ion
> of a GPIO, right? Truth is the pinctrl subsystem takes care of that. So w=
hy
> have "set direction" and no "get direction"?

Because it's a pin muxing business depending on the function chosen.

It solely depends on a schematic. For the example, everyone knows that
MOSI is out always, otherwise SPI function would not work.
.get_direction() has useful meaning only for GPIO function. (This is
my understanding from electrical configuration of buffers).

>> Looking into the existing code I would rather say that
>> pinctrl-ingenic.c should incorporate gpio-ingenic.c as they are
>> (partially) sharing same registers.
>> To ->get_direction() implementation it's pretty straight forward, just
>> read necessary registers in the gpio-ingenic.c directly. No need to
>> have pin control or pin muxing to be involved.

> Sure, it'd be pretty straightforward to do it from the GPIO driver, but I=
'd
> still like to hear Linus' point of view about this.

Sure.

> As for merging pinctrl-ingenic.c and gpio-ingenic.c... I wouldn't disagre=
e
> more,
> even if they share registers, they belong to different subsystems. Beside=
s,
> your platform might need the pinctrl driver but not the GPIO one, or you
> might
> want to provide the GPIO driver as a loadable module, etc.

It was just my observation, I'm not a maintainer of that code  nor
author, so, up to you how to proceed.

--=20
With Best Regards,
Andy Shevchenko
