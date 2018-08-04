From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] gpio: Add driver for PC Engines APU2/APU3 GPIOs
Date: Sat, 04 Aug 2018 20:22:20 +0200
Message-ID: <1846152.TW98f23PIX@debian64>
References: <20180801111243.2848-1-fe@dev.tdt.de> <CACRpkdbY3w-ptUOkv5TUZh+5oEGU+4BLO_6=12QecRveTSBKSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbY3w-ptUOkv5TUZh+5oEGU+4BLO_6=12QecRveTSBKSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: fe@dev.tdt.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thursday, August 2, 2018 11:30:00 PM CEST Linus Walleij wrote:
> On Wed, Aug 1, 2018 at 1:12 PM Florian Eckert <fe@dev.tdt.de> wrote:
> 
> > Add a new device driver "gpio-apu" which will now handle the GPIOs on
> > APU2 and APU3 devices from PC Engines.
> >
> > - APU2/APU3 -> front button reset support
> > - APU3 -> SIM switch support
> >
> > Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> 
> Hi Florian, thanks for the patch!

There have been multiple attempts at upstreaming a gpio/pinctrl driver for
the different APU SoC by now. The last attempt I remember took place on 
this ML too: <https://lkml.org/lkml/2017/12/20/824>

But sadly most attempts stalled, because there is already a leds-apu driver 
<https://github.com/torvalds/linux/blob/master/drivers/leds/leds-apu.c>
(since the gpio-driver was never accepted) that will do in a pinch for the
LEDs (which most people care about).

> I looped in Andy Schevchenko and Mika Westerberg who are authorities on
> x86 platform drivers in general and GPIO and pin control in particular
> so they can help out with the review.
Intel helping AMD. That's nice to see ;-)

> I'm a bit confused whether these things are really GPIOs or just
> switches but since they can change direction they seem to be GPIOs.

Yes, it's a real gpio/pinctrl in AMDs Tech docs.
<https://support.amd.com/TechDocs/52740_16h_Models_30h-3Fh_BKDG.pdf>

Some of the pins are muxed. I.e GPIO167-170 can either be a GPIO or
used for HD audio.
"The HD audio controller supports up to four codecs with one AZ_SDIN
pin from each codec. The four AZ_SDIN pins are multiplexed with
GPIO167-170 (GPIOxA7-GPIOxAA). If a particular pin is to be used for
HD audio functionality". There's a full table in "3.26.12.1 GPIO Registers". 




As for the APUs. The vendor (PC Engines) happily provides
PDFs and schematics for their boards:
<https://www.pcengines.ch/pdf/apu1.pdf>
<https://www.pcengines.ch/schema/apu1c.pdf>
<https://www.pcengines.ch/pdf/apu2.pdf>
<http://pcengines.ch/schema/apu2c.pdf>

So, it's possible to repurpose several test points as additional
GPIOs and more.

Note2:
On both boards there is also a dedicated GPIO pin header J19, but
these pins are controlled by the SuperIO Nuvoton NCT5104D.

> > +config GPIO_APU
> > +       tristate "PC Engines APU2/APU3 GPIO support"
> > +       depends on X86
> > +       select GPIO_GENERIC
> > +       help
> > +         Say Y here to support GPIO functionality on APU2/APU3 boards
> > +         from PC Engines.
> > +         - APU2/APU3 -> front button reset support
> > +         - APU3 -> SIM switch support
Well, by design this driver will sort of clash with the leds-apu driver. 
 
Regards,
Christian
