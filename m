From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/3] Unify gpiod_get*() API
Date: Mon,  9 Jan 2017 16:02:25 +0200
Message-ID: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:10581 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936248AbdAIODD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Jan 2017 09:03:03 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

By some reason fwnode_get_named_gpiod() doesn't take flags as argument and each
caller has to cope with it.

Unify API here. Do couple obvious clean ups beforehand.

Since v1:
- append Mika's tags

Andy Shevchenko (3):
  gpiolib: Switch to for_each_set_bit()
  gpiolib: Update documentation of struct acpi_gpio_info
  gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO

 drivers/gpio/devres.c                     |  9 ++++++--
 drivers/gpio/gpiolib-acpi.c               |  5 ++--
 drivers/gpio/gpiolib.c                    | 38 ++++++++++++++++++-------------
 drivers/gpio/gpiolib.h                    |  3 ++-
 drivers/input/keyboard/gpio_keys.c        |  9 +-------
 drivers/input/keyboard/gpio_keys_polled.c | 11 ++-------
 drivers/leds/leds-gpio.c                  |  2 +-
 drivers/video/fbdev/amba-clcd-nomadik.c   | 15 ++++--------
 include/linux/gpio/consumer.h             | 19 +++++++++++-----
 9 files changed, 55 insertions(+), 56 deletions(-)

-- 
2.11.0

