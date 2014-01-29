From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: [RFC 0/2] Changing gpio_request() scheme
Date: Wed, 29 Jan 2014 17:11:14 +0100
Message-ID: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:57639 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752781AbaA2QOv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2014 11:14:51 -0500
Received: by mail-wg0-f51.google.com with SMTP id z12so3898193wgg.18
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2014 08:14:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>

Hi Linus, Alexandre,

Here is an attempt at solving some of the issues appearing when a gpio is used
in different parts of the kernel. This was triggered by the recent discussion we
had on the need to request a gpio used as an interrupt and the fact that it
would make its value unavailable for other use.
The main idea behind the new scheme is that an input can safely be shared among
multiple users (one writer, multiple reader). 

The first patch is a draft implementation of the new request scheme. The 2nd
patch is an adaptation of the gpio_keys driver to test it.

Jean-Jacques

Jean-Jacques Hiblot (2):
  gpio: make the GPIOs shareable
  gpio_keys: updated the gpio_key driver to use the gpio descriptors
    instead ot the integer namespace.

 drivers/gpio/gpiolib-acpi.c        |   8 +-
 drivers/gpio/gpiolib-of.c          |   8 +-
 drivers/gpio/gpiolib.c             | 844 ++++++++++++++++++++++---------------
 drivers/input/keyboard/gpio_keys.c |  44 +-
 include/asm-generic/gpio.h         |  30 +-
 include/linux/acpi_gpio.h          |   8 +-
 include/linux/gpio.h               |   6 +
 include/linux/gpio/consumer.h      |  40 +-
 include/linux/gpio/driver.h        |   8 +-
 include/linux/gpio_keys.h          |   3 +-
 include/linux/of_gpio.h            |  13 +-
 11 files changed, 608 insertions(+), 404 deletions(-)

-- 
1.8.5.2

