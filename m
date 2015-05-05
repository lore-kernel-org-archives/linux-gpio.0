From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 00/27] gpio: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 16:33:24 +0200
Message-ID: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-gpio@vger.kernel.org

    	Hi all,
    
The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

This patch series relaxes the dependencies on GPIOLIB if COMPILE_TEST is
enabled, where appropriate:
  - Patches 1-2 add missing dependencies on GPIOLIB || COMPILE_TEST,
  - Patches 3-27 relax existing dependencies on GPIOLIB.
In some cases (patches 1,2, and 4), this required adding a missing
include (<linux/gpio/consumer.h>), as this may not be included if
asm-generic/gpio.h is not used.

There are a few more drivers that depend on GPIOLIB and that may be
eligible for COMPILE_TEST. These I didn't handle yet, as I couldn't
enable them with m68k/all{mod,yes}config due to other dependencies.

This series is against v4.1-rc2 and next-20150505 with the exception of
patch 21, which has an additional dependency (mentioned in the patch
itself, incl. resolution instructions if the dependency isn't
satisified).

Thanks!

Geert Uytterhoeven (27):
  drm/bridge: ptn3460: #include <linux/gpio/consumer.h>, depend on
    GPIOLIB
  drm/bridge: ps8622: #include <linux/gpio/consumer.h>, depend on
    GPIOLIB
  tpm: Allow compile test of GPIO consumers if !GPIOLIB
  extcon: Allow compile test of GPIO consumers if !GPIOLIB
  hwmon: Allow compile test of GPIO consumers if !GPIOLIB
  i2c: Allow compile test of GPIO consumers if !GPIOLIB
  iio: Allow compile test of GPIO consumers if !GPIOLIB
  input: Allow compile test of GPIO consumers if !GPIOLIB
  leds: Allow compile test of GPIO consumers if !GPIOLIB
  [media] wl128x: Allow compile test of GPIO consumers if !GPIOLIB
  mfd: Allow compile test of GPIO consumers if !GPIOLIB
  misc: ti-st: Allow compile test of GPIO consumers if !GPIOLIB
  mtd: Allow compile test of GPIO consumers if !GPIOLIB
  net: phy: Allow compile test of GPIO consumers if !GPIOLIB
  power: Allow compile test of GPIO consumers if !GPIOLIB
  regulator: Allow compile test of GPIO consumers if !GPIOLIB
  spi: Allow compile test of GPIO consumers if !GPIOLIB
  staging: android: Allow compile test of GPIO consumers if !GPIOLIB
  staging: fbtft: Allow compile test of GPIO consumers if !GPIOLIB
  Staging: iio: Allow compile test of GPIO consumers if !GPIOLIB
  serial: Allow compile test of GPIO consumers if !GPIOLIB
  usb: phy: Allow compile test of GPIO consumers if !GPIOLIB
  backlight: Allow compile test of GPIO consumers if !GPIOLIB
  fbdev: Allow compile test of GPIO consumers if !GPIOLIB
  w1: Allow compile test of GPIO consumers if !GPIOLIB
  watchdog: Allow compile test of GPIO consumers if !GPIOLIB
  net: rfkill: Allow compile test of GPIO consumers if !GPIOLIB

 drivers/char/tpm/st33zp24/Kconfig    |  2 +-
 drivers/extcon/Kconfig               |  4 ++--
 drivers/extcon/extcon-usb-gpio.c     |  1 +
 drivers/gpu/drm/bridge/Kconfig       |  8 ++++----
 drivers/gpu/drm/bridge/ps8622.c      |  1 +
 drivers/gpu/drm/bridge/ptn3460.c     |  1 +
 drivers/hwmon/Kconfig                |  4 ++--
 drivers/i2c/busses/Kconfig           |  4 ++--
 drivers/i2c/muxes/Kconfig            |  5 +++--
 drivers/iio/humidity/Kconfig         |  2 +-
 drivers/iio/magnetometer/Kconfig     |  4 ++--
 drivers/input/keyboard/Kconfig       |  4 ++--
 drivers/input/misc/Kconfig           | 11 ++++++-----
 drivers/input/mouse/Kconfig          |  2 +-
 drivers/input/touchscreen/Kconfig    |  8 ++++----
 drivers/leds/Kconfig                 |  2 +-
 drivers/leds/trigger/Kconfig         |  2 +-
 drivers/media/radio/wl128x/Kconfig   |  4 ++--
 drivers/mfd/Kconfig                  |  6 ++++--
 drivers/misc/ti-st/Kconfig           |  3 ++-
 drivers/mtd/maps/Kconfig             |  2 +-
 drivers/mtd/nand/Kconfig             |  2 +-
 drivers/net/phy/Kconfig              |  3 ++-
 drivers/power/Kconfig                |  8 +++++---
 drivers/regulator/Kconfig            |  2 +-
 drivers/spi/Kconfig                  |  4 ++--
 drivers/staging/android/Kconfig      |  3 ++-
 drivers/staging/fbtft/Kconfig        |  3 ++-
 drivers/staging/iio/accel/Kconfig    |  2 +-
 drivers/staging/iio/adc/Kconfig      |  6 +++---
 drivers/staging/iio/addac/Kconfig    |  2 +-
 drivers/staging/iio/resolver/Kconfig |  4 ++--
 drivers/tty/serial/Kconfig           |  3 ++-
 drivers/usb/phy/Kconfig              |  2 +-
 drivers/video/backlight/Kconfig      |  8 +++++---
 drivers/video/fbdev/Kconfig          |  2 +-
 drivers/w1/masters/Kconfig           |  2 +-
 drivers/watchdog/Kconfig             |  2 +-
 net/rfkill/Kconfig                   |  3 ++-
 39 files changed, 79 insertions(+), 62 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

					    Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							-- Linus Torvalds
