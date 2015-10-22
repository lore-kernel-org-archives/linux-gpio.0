From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] GPIO character device skeleton
Date: Thu, 22 Oct 2015 10:32:24 +0200
Message-ID: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35035 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768AbbJVIcm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 04:32:42 -0400
Received: by lfbn126 with SMTP id n126so5095357lfb.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 01:32:40 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

OK so this is it, I had no patience waiting for users to come up
with this new ABI, and the requests for a way for userspace to
use GPIOs properly is coming up again and again. So I created the
basics for it, so we can then build on top of this to get things
right. I want to get these very first things right before we go
wild with setting/getting pin values etc.

We add ONE ioctl() to get information on the gpiochip. Now we can
do this (example from ux500):

root@Ux500:/ lsgpio
GPIO chip: a03fe000.gpio, 32 GPIO lines
GPIO chip: 8011e080.gpio, 32 GPIO lines
GPIO chip: 8011e000.gpio, 32 GPIO lines
GPIO chip: 8000e180.gpio, 32 GPIO lines
GPIO chip: 8000e100.gpio, 32 GPIO lines
GPIO chip: 8000e080.gpio, 32 GPIO lines
GPIO chip: 8000e000.gpio, 32 GPIO lines
GPIO chip: 8012e080.gpio, 32 GPIO lines
GPIO chip: 8012e000.gpio, 32 GPIO lines
GPIO chip: abx500-gpio, 42 GPIO lines
GPIO chip: tc3589x, 20 GPIO lines

Johan: I don't have a hot-pluggable GPIO controller :( can you
do me the favour of testing this and fixing my stupid refcounts
and race conditions? I only used my brain to try to get things
right with pluggable GPIO controllers in this patch set, and it
is bound to fail.

How to identify and manipulate individual GPIO lines from this
ABI is a *LATER* *QUESTION*, this is the bare essentials for
getting there: basic operations on the gpiochip device level.

Linus Walleij (6):
  gpio: make the gpiochip a real device
  gpio: refer to gpio device in prints and debugfs
  gpio: add a userspace chardev ABI for GPIOs
  tools/gpio: create GPIO tools
  gpio: add a userspace character device ABI
  gpio: ABI: mark the sysfs ABI as obsolete

 Documentation/ABI/obsolete/sysfs-gpio |  30 ++++++
 Documentation/ABI/testing/gpio-cdev   |  26 +++++
 Documentation/ABI/testing/sysfs-gpio  |  28 -----
 MAINTAINERS                           |   4 +
 drivers/gpio/gpiolib-sysfs.c          |   2 +-
 drivers/gpio/gpiolib.c                | 193 +++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h                |  12 +--
 include/linux/gpio/driver.h           |  11 +-
 include/uapi/linux/Kbuild             |   1 +
 include/uapi/linux/gpio.h             |  28 +++++
 tools/Makefile                        |   7 +-
 tools/gpio/Makefile                   |  12 +++
 tools/gpio/gpio-utils.c               |  11 ++
 tools/gpio/gpio-utils.h               |  25 +++++
 tools/gpio/lsgpio.c                   | 128 ++++++++++++++++++++++
 15 files changed, 462 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-gpio
 create mode 100644 Documentation/ABI/testing/gpio-cdev
 delete mode 100644 Documentation/ABI/testing/sysfs-gpio
 create mode 100644 include/uapi/linux/gpio.h
 create mode 100644 tools/gpio/Makefile
 create mode 100644 tools/gpio/gpio-utils.c
 create mode 100644 tools/gpio/gpio-utils.h
 create mode 100644 tools/gpio/lsgpio.c

-- 
2.4.3

