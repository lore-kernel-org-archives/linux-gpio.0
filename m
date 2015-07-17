From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.2 take one
Date: Fri, 17 Jul 2015 14:53:55 +0200
Message-ID: <CACRpkdZgxk6+c8PM+vbNUf+1v9nUsxLcAQF9c4HxFOfoKVRs-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34757 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757208AbbGQMx4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 08:53:56 -0400
Received: by obre1 with SMTP id e1so65318771obr.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 05:53:56 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Linus,

here are a bunch of GPIO fixes for the v4.2 series, all
hitting individual drivers except for an documentation oneliner.
I intended to send a request earlier but life intervened.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f=
0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.2-2

for you to fetch changes up to fdd50409c8b9ce4cdd757ce10bf2e39e9c172de6=
:

  gpio: pca953x: fix nested irqs rescheduling (2015-07-16 14:40:08 +020=
0)

----------------------------------------------------------------
This is a first set of GPIO fixes for the v4.2 series, all
hitting individual drivers and nothing else.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      gpio: Remove double "base" in comment

Gregory Fong (1):
      gpio: brcmstb: fix null ptr dereference in driver remove

Grygorii Strashko (3):
      gpio: omap: add missed spin_unlock_irqrestore in omap_gpio_irq_ty=
pe
      gpio: omap: prevent module from being unloaded while in use
      gpio: pca953x: fix nested irqs rescheduling

Marek Vasut (1):
      gpio: max732x: Add missing dev reference to gpiochip

Michal Simek (1):
      gpio: zynq: Fix problem with unbalanced pm_runtime_enable

Rapha=C3=ABl Teysseyre (1):
      gpio/xilinx: Use correct address when setting initial values.

 drivers/gpio/gpio-brcmstb.c | 14 +++++++++++---
 drivers/gpio/gpio-max732x.c |  1 +
 drivers/gpio/gpio-omap.c    |  5 ++++-
 drivers/gpio/gpio-pca953x.c |  4 ++++
 drivers/gpio/gpio-xilinx.c  |  4 ++--
 drivers/gpio/gpio-zynq.c    |  1 +
 include/linux/gpio/driver.h |  2 +-
 7 files changed, 24 insertions(+), 7 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
