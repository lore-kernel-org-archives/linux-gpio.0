From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/5] pinctrl_gpio_get_direction & ingenic fixes
Date: Thu, 12 Jul 2018 01:22:12 +0200
Message-ID: <1531351332.2021.2@smtp.crapouillou.net>
References: <20180627114904.10890-1-paul@crapouillou.net>
        <CAHp75Vc3QTYKp6oS6kW6EezsBbiLf9E=NBErHMbpxRU9EXMxWg@mail.gmail.com>
        <CACRpkdav3FV7hc20Fj=n=DaNzvSaA2uLuj8QgHwwcevDkn_6_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdav3FV7hc20Fj=n=DaNzvSaA2uLuj8QgHwwcevDkn_6_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,


Le lun. 9 juil. 2018 =E0 14:09, Linus Walleij <linus.walleij@linaro.org>=20
a =E9crit :
> Hi folks,
>=20
> On Wed, Jun 27, 2018 at 7:18 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>=20
>>  Even if GPIO and pin muxing has only one set of buffers to indicate
>>  input or output (same registers in use) it's a GPIO driver business=20
>> to
>>  get direction from GPIO part of IP.
>>=20
>>  Looking into the existing code I would rather say that
>>  pinctrl-ingenic.c should incorporate gpio-ingenic.c as they are
>>  (partially) sharing same registers.
>=20
> Usually we only split the functionality into two drivers if the two=20
> features
> pin control and GPIO are explicitly in different hardware blocks,
> and typically not sharing the same memory range.
>=20
> If these registers are intermingled and the hardware actually
> just one piece of silicon, I would suggest to try to merge the
> two drivers into a combined pin control and GPIO driver
> inside drivers/pinctrl/pinctrl-ingenic.c.
>=20
> We have a few drivers like that already, good textbook
> examples of how to do this include
> drivers/pinctrl/pinctrl-sx150x.c where the two blocks are
> handled in one driver using both APIs.
>=20
> Paul could you have a look at if we can simply merge these
> two into one big driver? It is much more natural to write
> into the same set of registers when we do that.

Well I wish you had told me that when I submitted the ingenic=20
pinctrl/gpio
patchset :)

I won't have much time before 4.19-rc1, but I can have a look after=20
that.

> If you still prefer to proceed with the GPIO/pinctrl as separate
> drivers we need to look into this patch set, which I am
> a bit ambivalent about, because it makes sense but at the
> same time I want to keep GPIO and pin control business
> separate because separation of concerns is just nice.

Well I can still implement the get_direction() function in the GPIO
driver by reading the registers instead of calling into pinctrl.

I just thought it felt illogic as set_direction() does that.

> Yours,
> Linus Walleij

Thanks,
-Paul
=
