From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 0/2] Add device driver for APU2/APU3 GPIOs
Date: Thu, 29 Nov 2018 15:44:52 +0200
Message-ID: <CAHp75VcKu4fhP8=NH7fgfSFCh6xdCLWrNLcsHSuWvMcW+irfmA@mail.gmail.com>
References: <20181127132508.5501-1-fe@dev.tdt.de> <CAHp75VfFYJQzTv_oe8RKPo03-FLYHy6BkrKaG23svAKtC+jVBg@mail.gmail.com>
 <583ca922b4a877a4b0577994e40ddf5f@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <583ca922b4a877a4b0577994e40ddf5f@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Eckert.Florian@googlemail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 29, 2018 at 12:15 PM Florian Eckert <fe@dev.tdt.de> wrote:
>
> Hello Andy,
>
> Thank you very very much for your code review "again" I will update my
> patch set with your hints.
> Should I send v6 or should i wait till I get feedback from you about
> ACPI?
>
> >>
> >> Until now it was not possible to get more information to detect the
> >> MMIO_BASE address from the ACPI subsystem.
> >
> > I'm sorry if I already asked, please, remind me where dump of ACPI
> > tables can be found?
>
> https://www.spinics.net/lists/kernel/msg2887290.html

Unfortunately the file had been removed.

Btw, is the statement in above email still actual? "...I can fix
required things."

> > Also would be nice to have the output of `lspci -nk -vv -xxx` on such
> > platform.

> 00:14.3 0601: 1022:780e (rev 11)
>         Subsystem: 1022:780e
>         Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
> 00: 22 10 0e 78 0f 00 20 02 11 00 01 06 00 00 80 00
> 10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 0e 78
> 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 40: 04 00 00 00 d5 ff 03 ff 07 ff 20 00 00 00 00 00
> 50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 60: 00 00 00 00 00 0e 10 00 0e 00 0f 00 00 ff ff ff
> 70: 67 45 23 00 00 00 00 00 90 00 00 00 05 0a 00 00
> 80: 08 00 03 a8 00 00 00 00 00 00 00 00 00 00 00 00
> 90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> a0: 02 00 c1 fe 2f 01 00 00 00 00 00 00 00 00 00 00
> b0: 00 00 00 00 00 00 00 00 04 00 e9 3d 00 00 00 00
> c0: 00 00 00 00 00 00 00 00 00 00 00 80 47 10 82 ff
> d0: 86 ff ff 08 42 00 00 00 00 00 00 00 00 00 00 00
> e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Thanks.

--
With Best Regards,
Andy Shevchenko
