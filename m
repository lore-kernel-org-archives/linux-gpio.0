From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH 0/4] gpio: generic: add option to read output value from set register
Date: Wed, 29 Apr 2015 18:34:57 +0300
Message-ID: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:52585 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753555AbbD2Pfi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 11:35:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

The changeset introduces BGPIOF_READ_OUTPUT_REG_SET flag to
bgpio_init() function, which is if provided allows to get
stored value of output GPIO line in "set" register instead
of default "data" register.

The same functionality is already implemented in moxart driver by
a private function, move it to gpio-generic.c since at least iMX
GPIO controllers require it as well.

Fixes a problem on iMX platforms:

  % echo out > /sys/class/gpio/gpio9/direction
  % cat /sys/class/gpio/gpio9/value
  0
  % echo 1 > /sys/class/gpio/gpio9/value
  % cat /sys/class/gpio/gpio9/value
  0

Vladimir Zapolskiy (4):
  Revert "gpio: generic: clamp retured value to [0,1]"
  gpio: gpio-generic: add flag to read out output value from reg_set
  gpio: moxart: get value of output gpio from generic driver
  gpio: mxc: read output value from GPIO_DR register

 drivers/gpio/gpio-generic.c     |   24 ++++++++++++++++++++----
 drivers/gpio/gpio-moxart.c      |   17 +++--------------
 drivers/gpio/gpio-mxc.c         |    3 ++-
 include/linux/basic_mmio_gpio.h |    1 +
 4 files changed, 26 insertions(+), 19 deletions(-)

-- 
1.7.10.4

