From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: raspberrypi-ext: fix firmware dependency
Date: Fri, 2 Mar 2018 09:47:25 +0100
Message-ID: <CACRpkdYFp3NJEa8efX6PC1t=9+fDmqmpMNcm2oL_uj-=vowNAg@mail.gmail.com>
References: <20180228134822.2194009-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228134822.2194009-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Baruch Siach <baruch@tkos.co.il>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 28, 2018 at 2:48 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> When the firmware driver is a loadable module, the gpio driver cannot be
> built-in:
>
> drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_set':
> gpio-raspberrypi-exp.c:(.text+0xb4): undefined reference to `rpi_firmware_property'
> drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_get':
> gpio-raspberrypi-exp.c:(.text+0x1ec): undefined reference to `rpi_firmware_property'
> drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_get_direction':
> gpio-raspberrypi-exp.c:(.text+0x360): undefined reference to `rpi_firmware_property'
> drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_get_polarity':
> gpio-raspberrypi-exp.c:(.text+0x4d4): undefined reference to `rpi_firmware_property'
> drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_dir_out':
> gpio-raspberrypi-exp.c:(.text+0x670): undefined reference to `rpi_firmware_property'
> drivers/gpio/gpio-raspberrypi-exp.o:gpio-raspberrypi-exp.c:(.text+0x7fc): more undefined references to `rpi_firmware_property' follow
> drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_dir_in':
> drivers/gpio/gpio-raspberrypi-exp.o: In function `rpi_exp_gpio_probe':
> gpio-raspberrypi-exp.c:(.text+0x93c): undefined reference to `rpi_firmware_get'
>
> We already have a Kconfig dependency for it, but when compile-testing, it
> is disregarded.
>
> This changes the dependency so that compile-testing is only done when the
> firmware driver is completely disabled.
>
> Fixes: a98d90e7d588 ("gpio: raspberrypi-exp: Driver for RPi3 GPIO expander via mailbox service")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
