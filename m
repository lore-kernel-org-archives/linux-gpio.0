From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 0/2] Add device driver for APU2/APU3 GPIOs
Date: Thu, 29 Nov 2018 17:24:00 +0200
Message-ID: <CAHp75VfSKz8sauUKq2pxUhQ6xvmX4UeOBw6eEA+71=NUyWES9g@mail.gmail.com>
References: <20181127132508.5501-1-fe@dev.tdt.de> <CAHp75VfFYJQzTv_oe8RKPo03-FLYHy6BkrKaG23svAKtC+jVBg@mail.gmail.com>
 <583ca922b4a877a4b0577994e40ddf5f@dev.tdt.de> <CAHp75VcKu4fhP8=NH7fgfSFCh6xdCLWrNLcsHSuWvMcW+irfmA@mail.gmail.com>
 <70e7b8e2346b9837273b5edce0524584@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70e7b8e2346b9837273b5edce0524584@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Eckert.Florian@googlemail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 29, 2018 at 4:02 PM Florian Eckert <fe@dev.tdt.de> wrote:
>
> >> Thank you very very much for your code review "again" I will update my
> >> patch set with your hints.
> >> Should I send v6 or should i wait till I get feedback from you about
> >> ACPI?
> >>
> >> >>
> >> >> Until now it was not possible to get more information to detect the
> >> >> MMIO_BASE address from the ACPI subsystem.
> >> >
> >> > I'm sorry if I already asked, please, remind me where dump of ACPI
> >> > tables can be found?
> >>
> >> https://www.spinics.net/lists/kernel/msg2887290.html
> >
> > Unfortunately the file had been removed.
> >
> > Btw, is the statement in above email still actual? "...I can fix
> > required things."

> Yes i will fix your hints tomorrow and send a v6 of my patchset.
> Thank you for your hints and time
> It would be nice if you could fix ACPI problemmatik.

I would like to see the ACPI dump for that...

-- 
With Best Regards,
Andy Shevchenko
