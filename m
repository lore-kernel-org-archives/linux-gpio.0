From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.9
Date: Fri, 4 Nov 2016 14:00:21 +0100
Message-ID: <CACRpkdb3oGFGq4xZentTvdS6BjP5CKBdJ7wQpZ4m+uE2nggnnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:36383 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934524AbcKDNAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2016 09:00:23 -0400
Received: by mail-qk0-f176.google.com with SMTP id o68so95585891qkf.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2016 06:00:22 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi Linus,

here is a bunch of GPIO fixes for the v4.9 series.

The most prominent thing is the largeish file descriptor leak fix,
and the regression fix for multiple-instance chips is pretty important
too.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a909d3e636995ba7c349e2ca5dbb528154d4ac30:

  Linux 4.9-rc3 (2016-10-29 13:52:02 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.9-3

for you to fetch changes up to 812d47889a8e418d7bea9bec383581a34c19183e:

  gpio/mvebu: Use irq_domain_add_linear (2016-11-01 19:31:49 +0100)

----------------------------------------------------------------
Some GPIO fixes for the v4.9 series:

- Fix a nasty file descriptor leak when getting line handles.

- A fix for a cleanup that seemed innocent but created a problem
  for drivers instantiating several gpiochips for one single
  OF node.

- Fix a unpredictable problem using irq_domain_simple() in the
  mvebu driver by converting it to a lineas irqdomain.

----------------------------------------------------------------
Jason Gunthorpe (1):
      gpio/mvebu: Use irq_domain_add_linear

Lars-Peter Clausen (1):
      gpio: GPIO_GET_LINE{HANDLE,EVENT}_IOCTL: Fix file descriptor leak

Masahiro Yamada (1):
      gpio: of: fix GPIO drivers with multiple gpio_chip for a single node

 drivers/gpio/gpio-mvebu.c | 92 ++++++++++++++++++++++-------------------------
 drivers/gpio/gpiolib-of.c | 14 +++++---
 drivers/gpio/gpiolib.c    | 57 ++++++++++++++++++++++-------
 3 files changed, 97 insertions(+), 66 deletions(-)
