From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/5] pinctrl_gpio_get_direction & ingenic fixes
Date: Thu, 28 Jun 2018 21:11:06 +0200
Message-ID: <1530213066.3755.0@smtp.crapouillou.net>
References: <20180627114904.10890-1-paul@crapouillou.net>
        <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


Hi Andy,

Le mer. 27 juin 2018 =E0 19:18, Andy Shevchenko=20
<andy.shevchenko@gmail.com> a =E9crit :
> On Wed, Jun 27, 2018 at 2:48 PM, Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>  Hi Linus,
>>=20
>>  Here's a set of (rather RFC) patches, to implement
>>  pinctrl_gpio_get_direction(). I did that, because my gpio-ingenic=20
>> driver
>>  calls pinctrl_gpio_set_direction() within its gpio_chip's=20
>> .set_direction
>>  callback, but there was no corresponding function to implement the
>>  .get_direction callback. If that's not the right way to do it,=20
>> please
>>  advise.
>>=20
>>  If not merging the whole series, patch [3/5] is a real fix that=20
>> should
>>  go through.
>>=20
>>  Note that it doesn't make checkpatch.pl happy, I wasn't sure=20
>> whether I
>>  should try to comply to checkpatch.pl or match the coding style in=20
>> the
>>  pinctrl subsystem, I chose the latter.
>=20
> I dunno what Linus would going to say about this, but I would like to
> see a schematics for this piece of IP.

ftp://ftp.ingenic.com/SOC/JZ4780/JZ4780_pm.pdf

> Even if GPIO and pin muxing has only one set of buffers to indicate
> input or output (same registers in use) it's a GPIO driver business to
> get direction from GPIO part of IP.

If I follow that logic it's also a GPIO driver business to set the=20
direction
of a GPIO, right? Truth is the pinctrl subsystem takes care of that. So=20
why
have "set direction" and no "get direction"?

> Looking into the existing code I would rather say that
> pinctrl-ingenic.c should incorporate gpio-ingenic.c as they are
> (partially) sharing same registers.
> To ->get_direction() implementation it's pretty straight forward, just
> read necessary registers in the gpio-ingenic.c directly. No need to
> have pin control or pin muxing to be involved.

Sure, it'd be pretty straightforward to do it from the GPIO driver, but=20
I'd
still like to hear Linus' point of view about this.

As for merging pinctrl-ingenic.c and gpio-ingenic.c... I wouldn't=20
disagree more,
even if they share registers, they belong to different subsystems.=20
Besides,
your platform might need the pinctrl driver but not the GPIO one, or=20
you might
want to provide the GPIO driver as a loadable module, etc.

Regards,
-Paul
=
