From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] pinctrl / gpio: Allow GPIO chips to use generic
 pinconfig
Date: Mon, 23 Jan 2017 16:24:32 +0200
Message-ID: <1485181472.2133.283.camel@linux.intel.com>
References: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:61832 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750723AbdAWOYg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Jan 2017 09:24:36 -0500
In-Reply-To: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2017-01-23 at 15:34 +0300, Mika Westerberg wrote:
> This series makes it possible to configure pins from GPIO chip drivers
> by
> implementing a new callback .set_config(). This callback replaces the
> existing .set_single_ended() and .set_debounce() simply because adding
> new
> callbacks for each possible configuration type does not scale. So
> instead
> we re-use the existing generic pinconf types and the packed format.
> 
> This is a follow up of discussion on:
> 
>   https://patchwork.ozlabs.org/patch/713289/
> 
> While doing that, it was found out that the current packed format does
> not
> support all realistic debounce time values. The limit is ~64ms which
> does
> not cover mechanical switches connected to GPIOs that migh require
> values
> up to hundreths of milliseconds.
> 
> To solve that we change the packed format so that the value takes 24
> bits
> instead of 16, and change the callers to use 32-bit integer instead.
> 
> We also make it possible for GPIO chip driver to call pinctrl directly
> by
> providing a new functions gpiochip_generic_config() and
> pinctrl_gpio_set_config().
> 
> I've tested this on Intel Gemini Lake SoC. Non-Intel drivers are
> compile
> tested only because I do not have the hardware.
> 

Looks pretty nice to me!

FWIW:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Changes from v1:
> 
>   * Change pinconf_to_config_argument() to cast the result to u32
> instead
>     of enum pin_config_param (which was probably due to copy-paste).
>   
>   * Re-format PCONFDUMP() macro.
> 
>   * Add gpiochip_generic_config() so that GPIO drivers can just assign
>     that to their struct gpio_chip if they would just pass the
>     .set_config() directly to their backing pinctrl driver.
>   
>   * Rename gpio_set_drive_mode() to gpio_set_drive_single_ended().
> 
>   * Correct _gpiod_direction_output_raw() to jump to
> set_output_value()
>     when gpio_set_drive_single_ended() succeeds.
> 
> Mika Westerberg (3):
>   pinctrl: Widen the generic pinconf argument from 16 to 24 bits
>   pinctrl: Allow configuration of pins from gpiolib based drivers
>   pinctrl / gpio: Introduce .set_config() callback for GPIO chips
> 
>  Documentation/gpio/driver.txt                    |  9 ++--
>  drivers/gpio/gpio-bcm-kona.c                     | 14 +++++-
>  drivers/gpio/gpio-dln2.c                         | 12 +++--
>  drivers/gpio/gpio-dwapb.c                        | 14 +++++-
>  drivers/gpio/gpio-ep93xx.c                       | 11 +++--
>  drivers/gpio/gpio-f7188x.c                       | 19 ++++----
>  drivers/gpio/gpio-lp873x.c                       | 14 +++---
>  drivers/gpio/gpio-max77620.c                     | 20 ++++-----
>  drivers/gpio/gpio-menz127.c                      | 34 ++++++++++----
>  drivers/gpio/gpio-merrifield.c                   | 14 +++++-
>  drivers/gpio/gpio-omap.c                         | 14 +++++-
>  drivers/gpio/gpio-tc3589x.c                      | 15 +++----
>  drivers/gpio/gpio-tegra.c                        | 14 +++++-
>  drivers/gpio/gpio-tps65218.c                     | 14 +++---
>  drivers/gpio/gpio-vx855.c                        | 13 +++---
>  drivers/gpio/gpio-wcove.c                        | 13 +++---
>  drivers/gpio/gpio-wm831x.c                       | 21 +++++----
>  drivers/gpio/gpio-wm8994.c                       | 13 +++---
>  drivers/gpio/gpiolib.c                           | 56
> +++++++++++++++---------
>  drivers/pinctrl/bcm/pinctrl-bcm281xx.c           |  6 +--
>  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c         |  2 +-
>  drivers/pinctrl/bcm/pinctrl-ns2-mux.c            |  6 +--
>  drivers/pinctrl/bcm/pinctrl-nsp-gpio.c           |  6 +--
>  drivers/pinctrl/core.c                           | 29 ++++++++++++
>  drivers/pinctrl/intel/pinctrl-cherryview.c       |  4 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c    | 14 +++++-
>  drivers/pinctrl/meson/pinctrl-meson.c            |  2 -
>  drivers/pinctrl/pinconf.c                        | 12 +++++
>  drivers/pinctrl/pinconf.h                        |  9 ++++
>  drivers/pinctrl/pinctrl-amd.c                    | 14 +++++-
>  drivers/pinctrl/pinctrl-da850-pupd.c             |  2 -
>  drivers/pinctrl/pinctrl-lpc18xx.c                | 10 ++---
>  drivers/pinctrl/pinctrl-max77620.c               |  2 +-
>  drivers/pinctrl/pinctrl-palmas.c                 |  2 +-
>  drivers/pinctrl/pinctrl-rockchip.c               |  2 +-
>  drivers/pinctrl/pinctrl-single.c                 |  2 +-
>  drivers/pinctrl/pinctrl-sx150x.c                 | 55 +++++++------
> ----------
>  drivers/pinctrl/sirf/pinctrl-atlas7.c            |  3 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c            |  2 +-
>  drivers/pinctrl/uniphier/pinctrl-uniphier-core.c |  4 +-
>  drivers/pinctrl/vt8500/pinctrl-wmt.c             |  2 +-
>  drivers/rtc/rtc-omap.c                           |  2 +-
>  drivers/staging/greybus/gpio.c                   | 15 ++++---
>  drivers/usb/serial/cp210x.c                      | 13 +++---
>  include/linux/gpio/driver.h                      | 37 ++++-----------
> -
>  include/linux/pinctrl/consumer.h                 |  6 +++
>  include/linux/pinctrl/pinconf-generic.h          | 52 +++++++++++--
> ---------
>  47 files changed, 392 insertions(+), 257 deletions(-)
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
