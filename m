From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/7] gpio: mockup: extensions for testing purposes
Date: Wed, 25 Jan 2017 16:34:14 +0100
Message-ID: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

I would like to create an automated test-suite for libgpiod, but
the gpio-mockup driver is quite limited when it comes to current
user space functionality - I can't test neither line event
notifications nor finding GPIO lines by name.

This series proposes to extend the gpio framework by allowing to
inject line events from the kernel code and by providing a debugfs
interface for that to the gpio-mockup driver. We also allow the
user to request that the mockup driver name the lines.

The first patch contains only minor clean-ups. Patches 2/7-4/7
implement the in-kernel mechanism for injecting events, while patch
5/7 extends the mockup driver to provide a relevant debugfs interface.

Patch 6/7 adds a new module param allowing to request naming of the
lines.

The last patch contains some coding style tweaks.

Bartosz Golaszewski (7):
  gpiolib: clean up includes
  gpiolib: support monitoring mockup devices
  gpio: mockup: set the mockup flag in struct gpio_chip
  gpiolib: allow injecting line events
  gpio: mockup: implement injecting events over debugfs
  gpio: mockup: implement naming the GPIO lines
  gpio: mockup: readability tweaks

 drivers/gpio/gpio-dwapb.c      |   1 -
 drivers/gpio/gpio-mockup.c     | 147 +++++++++++++++++++++++++++++++++++++----
 drivers/gpio/gpio-xgene-sb.c   |   1 -
 drivers/gpio/gpiolib-acpi.c    |   2 -
 drivers/gpio/gpiolib-devprop.c |   2 -
 drivers/gpio/gpiolib-legacy.c  |   3 -
 drivers/gpio/gpiolib-of.c      |   1 -
 drivers/gpio/gpiolib-sysfs.c   |   2 -
 drivers/gpio/gpiolib.c         |  44 +++++++++---
 drivers/gpio/gpiolib.h         |   5 ++
 include/linux/gpio/driver.h    |   4 ++
 11 files changed, 175 insertions(+), 37 deletions(-)

-- 
2.9.3
