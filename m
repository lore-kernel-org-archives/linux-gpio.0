From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] gpio: raspberrypi-ext: fix firmware dependency
Date: Fri, 2 Mar 2018 01:33:17 +0200
Message-ID: <20180301233317.ptmgx4coj6iedc34@tarshish>
References: <20180228134822.2194009-1-arnd@arndb.de>
 <CACRpkdajRp6PKYzMyeV81tu4dZxhnEDv7cKBvSCsNOUdW24KpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdajRp6PKYzMyeV81tu4dZxhnEDv7cKBvSCsNOUdW24KpQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <stefan.wahren@i2se.com>, Dave Stevenson <dave.stevenson@raspberrypi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Mar 01, 2018 at 10:28:52AM +0100, Linus Walleij wrote:
> On Wed, Feb 28, 2018 at 2:48 PM, Arnd Bergmann <arnd@arndb.de> wrote: 
> > When the firmware driver is a loadable module, the gpio driver cannot be
> > built-in:
> >
> > drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_set':
> > gpio-raspberrypi-exp.c:(.text+0xb4): undefined reference to `rpi_firmware_property'
> > drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_get':
> > gpio-raspberrypi-exp.c:(.text+0x1ec): undefined reference to `rpi_firmware_property'
> > drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_get_direction':
> > gpio-raspberrypi-exp.c:(.text+0x360): undefined reference to `rpi_firmware_property'
> > drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_get_polarity':
> > gpio-raspberrypi-exp.c:(.text+0x4d4): undefined reference to `rpi_firmware_property'
> > drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_dir_out':
> > gpio-raspberrypi-exp.c:(.text+0x670): undefined reference to `rpi_firmware_property'
> > drivers/gpio/gpio-raspberrypi-exp.o:gpio-raspberrypi-exp.c:(.text+0x7fc): more undefined references to `rpi_firmware_property' follow
> > drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_dir_in':
> > drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_probe':
> > gpio-raspberrypi-exp.c:(.text+0x93c): undefined reference to `rpi_firmware_get'
> >
> > We already have a Kconfig dependency for it, but when compile-testing, it
> > is disregarded.
> >
> > This changes the dependency so that compile-testing is only done when the
> > firmware driver is completely disabled.
> >
> > Fixes: a98d90e7d588 ("gpio: raspberrypi-exp: Driver for RPi3 GPIO expander via mailbox service")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Baruch, are you waiting for a fixed fix or should I apply this?
> 
> It's a bit unclear from the mail chain what action I should take...

This patch fixes the issue. I think that an inline comment should be added at 
least, because otherwise the dependency in incomprehensible. I also prefer the

  depends on m || DEPENDENCY != m 

style to express this kind of dependencies.

What do you think?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
