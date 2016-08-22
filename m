From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.8, take one
Date: Mon, 22 Aug 2016 10:46:50 +0200
Message-ID: <CACRpkdZVTv+yGMSZQkb7NQVU3iZEjFGkWBf0PmR5j0Zhz16m8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35183 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752226AbcHVIqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 04:46:51 -0400
Received: by mail-oi0-f46.google.com with SMTP id 4so141853853oih.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 01:46:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here are a few GPIO fixes for v4.8. I was expecting some fallout from
the new chardev rework but nothing like that turned up att all. Instead
a Kconfig confusion that I think I have finally nailed, then some ordinary
driver noise and trivia.

Please pull these changes!

Yours,
Linus Walleij


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.8-2

for you to fetch changes up to 048c28c91e56781082bc17d181e460b81e7e8bcb:

  gpio: make any OF dependent driver depend on OF_GPIO (2016-08-19
15:01:29 +0200)

----------------------------------------------------------------
GPIO fixes for v4.8:

This fixes a Kconfig issue with UM: when I made GPIOLIB
available to all archs, that included UM, but the OF part
of GPIOLIB requires HAS_IOMEM, so we add HAS_IOMEM as a
dependency to OF_GPIO.

This in turn exposed the fact that a few GPIO drivers were
implicitly assuming OF_GPIO as their dependency but instead
depended on OF alone (the typical problem being a pointer
inside gpio_chip not existing unless OF_GPIO is selected)
and then UM would fail to compile with these drivers
instead. Then I lost patience and made any GPIO driver
depending on just OF depend on OF_GPIO instead, that is
certainly what they meant and the only thing that makes
sense anyway. GPIO with just OF but !OF_GPIO does not make
sense.

Also a fix for the max730x driver data pointer, and a minor
comment fix for the GPIO tools.

----------------------------------------------------------------
Baruch Siach (1):
      tools/gpio: fix gpio-event-mon header comment

Christophe Leroy (1):
      gpio: max730x: set gpiochip data pointer before using it

Linus Walleij (2):
      gpio: Fix OF build problem on UM
      gpio: make any OF dependent driver depend on OF_GPIO

 drivers/gpio/Kconfig        | 11 ++++++-----
 drivers/gpio/gpio-max730x.c |  8 ++++----
 tools/gpio/gpio-event-mon.c |  2 +-
 3 files changed, 11 insertions(+), 10 deletions(-)
