From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH RFC/RFT 0/2] gpio: allow auto population of request/free
Date: Sun, 11 Oct 2015 17:48:17 +0200
Message-ID: <1444578499-17980-1-git-send-email-jogo@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54757 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752367AbbJKPsU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Oct 2015 11:48:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

Many pinctrl/gpio combinations are fine with the generic gpio
request/free implementations, and some only have a subset of the
gpios actually support muxed.

The common occurrence is

a) populate request/free of gpiochip
b) if only some gcs have pinmux, store for the chip if it does
   and call pinctrl_request/free conditionally
c) register gpiochip
d) add ranges to chip

To reduce the amount of work for the drivers, introduce a
gpiochip_add_with_ranges(), that allows doing c and d at the same time.

Since gpiochip_add_with_ranges then has the information at hand whether
the chip ties into the pinctrl subsystem, we can then also automatically
populate the gpiochip's request/free in case ranges were passed or a
gpio range property is present on the of node of the chip. This handles
a) and b) for most known drivers.

This patchset is a proof-of-concept, with the pinctrl-cygnus-gpio driver
as the example conversion to it. It registers a total of 51 gpio ranges,
which I thought as an ideal maximum reduction example.

This patchset depends on "gpiochip: add and use generic request/free".

As last time only build tested, not run tested due to lacking hardware.

A few points of disscussion:

So far I have just reused the struct pinctrl_gpio_range, but ignore most
fields, which might bloat the kernel a bit. OTOH 0's should compress
fine.

Also currently the code assumes all ranges are handled by the same
pinctrl device. Currently this could be trivially fixed as
pinctrl_gpio_range has a field for the pinctrl device name.

So far I have assumed there are no actual platorms with such a setup.


Jonas Gorski (2):
  gpio: allow atomic registration of gpio chip with pin ranges
  pinctrl-cygnus-gpio: convert to use gpiochip_add_with_ranges

 drivers/gpio/gpiolib-of.c                 |   5 ++
 drivers/gpio/gpiolib.c                    |  43 ++++++++--
 drivers/gpio/gpiolib.h                    |   9 +++
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c | 126 +++++++-----------------------
 include/linux/gpio/driver.h               |  10 ++-
 5 files changed, 85 insertions(+), 108 deletions(-)

-- 
2.1.4
