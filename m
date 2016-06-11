From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.7 take two
Date: Sun, 12 Jun 2016 01:48:41 +0200
Message-ID: <CACRpkdYVVc0gRATS5nnavAyFjbTfKXSwe42CSCYvRVmHi9uGXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35182 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553AbcFKXsn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jun 2016 19:48:43 -0400
Received: by mail-oi0-f43.google.com with SMTP id w5so82845209oib.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jun 2016 16:48:42 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Helmut Grohne <h.grohne@intenta.de>

Hi Linus,

a new bunch of GPIO fixes for v4.7. This time I am very grateful that
Ricardo Ribalda Delgado went in and fixed my stupid refcounting mistakes
in the removal path for GPIO chips. I had a feeling something was wrong
here and so it was. It exploded on OMAP and it fixes their
problem. Now it should be (more) solid.

The rest i compilation, Kconfig and driver fixes. Some tagged for stable.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit af8c34ce6ae32addda3788d54a7e340cad22516b:

  Linux 4.7-rc2 (2016-06-05 14:31:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.7-3

for you to fetch changes up to b66b2a0adf0e48973b582e055758b9907a7eee7c:

  gpio: bcm-kona: fix bcm_kona_gpio_reset() warnings (2016-06-08 14:04:35 +0200)

----------------------------------------------------------------
GPIO fixes for the v4.7 series:

- Fix a NULL pointer dereference when we are searching the
  GPIO device list but one of the devices have been removed
  (struct gpio_chip pointer is NULL).

- Fix unaligned reference counters: we were ending on +3 after
  all said and done. It should be 0. Remove an extraneous
  get_device(), and call cdev_del() followed by device_del()
  in gpiochip_remove() instead and the count goes to zero and
  calls the release() function properly.

- Fix a compile warning due to a missing #include in the
  OF/device tree portions.

- Select ANON_INODES for GPIOLIB, we're using that for our
  character device. Some randconfig tests disclosed the
  problem.

- Make sure the Zynq driver clock runs also without CONFIG_PM
  enabled

- Fix an off-by-one error in the 104-DIO-48E driver

- Fix warnings in bcm_kona_gpio_reset()

----------------------------------------------------------------
Ben Dooks (1):
      gpio: bcm-kona: fix bcm_kona_gpio_reset() warnings

Helmut Grohne (1):
      gpio: zynq: initialize clock even without CONFIG_PM

Linus Walleij (2):
      gpio: include <linux/io-mapping.h> in gpiolib-of
      gpio: select ANON_INODES

Ricardo Ribalda Delgado (2):
      gpiolib: Fix NULL pointer deference
      gpiolib: Fix unaligned used of reference counters

William Breathitt Gray (1):
      gpio: 104-dio-48e: Fix control port offset computation off-by-one error

 drivers/gpio/Kconfig            | 1 +
 drivers/gpio/gpio-104-dio-48e.c | 4 ++--
 drivers/gpio/gpio-bcm-kona.c    | 4 ++--
 drivers/gpio/gpio-zynq.c        | 7 +++++++
 drivers/gpio/gpiolib-of.c       | 1 +
 drivers/gpio/gpiolib.c          | 6 +++---
 6 files changed, 16 insertions(+), 7 deletions(-)
