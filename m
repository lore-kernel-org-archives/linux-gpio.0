From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] pinctrl / gpio: Allow GPIO chips to use generic pinconfig
Date: Thu, 19 Jan 2017 12:48:17 +0300
Message-ID: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:56797 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751074AbdASJtC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Jan 2017 04:49:02 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This series makes it possible to configure pins from GPIO chip drivers by
implementing a new callback .set_config(). This callback replaces the
existing .set_single_ended() and .set_debounce() simply because adding new
callbacks for each possible configuration type does not scale. So instead
we re-use the existing generic pinconf types and the packed format.

This is a follow up of discussion on:

  https://patchwork.ozlabs.org/patch/713289/

While doing that, it was found out that the current packed format does not
support all realistic debounce time values. The limit is ~64ms which does
not cover mechanical switches connected to GPIOs that migh require values
up to hundreths of milliseconds.

To solve that we change the packed format so that the value takes 24 bits
instead of 16, and change the callers to use 32-bit integer instead.

We also make it possible for GPIO chip driver to call pinctrl directly by
providing a new function pinctrl_gpio_set_config() following
pinctrl_gpio_direction_output() and friends.

I've tested this on Intel Gemini Lake SoC. Non-Intel drivers are compile
tested only because I do not have the hardware.

Mika Westerberg (3):
  pinctrl: Widen the generic pinconf argument from 16 to 24 bits
  pinctrl: Allow configuration of pins from gpiolib based drivers
  pinctrl / gpio: Introduce .set_config() callback for GPIO chips

 Documentation/gpio/driver.txt                    |  9 ++--
 drivers/gpio/gpio-bcm-kona.c                     | 14 +++++-
 drivers/gpio/gpio-dln2.c                         | 12 ++++--
 drivers/gpio/gpio-dwapb.c                        | 14 +++++-
 drivers/gpio/gpio-ep93xx.c                       | 11 +++--
 drivers/gpio/gpio-f7188x.c                       | 19 ++++----
 drivers/gpio/gpio-lp873x.c                       | 14 +++---
 drivers/gpio/gpio-max77620.c                     | 20 ++++-----
 drivers/gpio/gpio-menz127.c                      | 34 +++++++++++----
 drivers/gpio/gpio-merrifield.c                   | 14 +++++-
 drivers/gpio/gpio-omap.c                         | 14 +++++-
 drivers/gpio/gpio-tc3589x.c                      | 15 +++----
 drivers/gpio/gpio-tegra.c                        | 14 +++++-
 drivers/gpio/gpio-tps65218.c                     | 14 +++---
 drivers/gpio/gpio-vx855.c                        | 13 +++---
 drivers/gpio/gpio-wcove.c                        | 13 +++---
 drivers/gpio/gpio-wm831x.c                       | 21 +++++----
 drivers/gpio/gpio-wm8994.c                       | 13 +++---
 drivers/gpio/gpiolib.c                           | 41 +++++++++---------
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c           |  6 +--
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c         |  2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c            |  6 +--
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c           |  6 +--
 drivers/pinctrl/core.c                           | 28 ++++++++++++
 drivers/pinctrl/intel/pinctrl-cherryview.c       |  4 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c    | 14 +++++-
 drivers/pinctrl/meson/pinctrl-meson.c            |  2 -
 drivers/pinctrl/pinconf.c                        | 12 ++++++
 drivers/pinctrl/pinconf.h                        |  9 ++++
 drivers/pinctrl/pinctrl-amd.c                    | 14 +++++-
 drivers/pinctrl/pinctrl-da850-pupd.c             |  2 -
 drivers/pinctrl/pinctrl-lpc18xx.c                | 10 ++---
 drivers/pinctrl/pinctrl-max77620.c               |  2 +-
 drivers/pinctrl/pinctrl-palmas.c                 |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c               |  2 +-
 drivers/pinctrl/pinctrl-single.c                 |  2 +-
 drivers/pinctrl/pinctrl-sx150x.c                 | 55 ++++++++----------------
 drivers/pinctrl/sirf/pinctrl-atlas7.c            |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c            |  2 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c |  4 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c             |  2 +-
 drivers/rtc/rtc-omap.c                           |  2 +-
 drivers/staging/greybus/gpio.c                   | 15 ++++---
 drivers/usb/serial/cp210x.c                      | 13 +++---
 include/linux/gpio/driver.h                      | 35 +++------------
 include/linux/pinctrl/consumer.h                 |  6 +++
 include/linux/pinctrl/pinconf-generic.h          | 51 +++++++++++-----------
 47 files changed, 376 insertions(+), 254 deletions(-)

-- 
2.11.0

