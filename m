From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.8 take 3
Date: Fri, 9 Sep 2016 21:42:26 +0200
Message-ID: <CACRpkdYCKmzcyfaRgiAVmHcaE323jKFJT3o5MmPA8g=_Q=nFDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Some GPIO fixes that have been boiling the last two weeks or
so. Nothing special, I'm trying to sort out some Kconfig business
and Russell needs a fix in for -his SA1100 rework.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit c6935931c1894ff857616ff8549b61236a19148f:

  Linux 4.8-rc5 (2016-09-04 14:31:46 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.8-3

for you to fetch changes up to 56beac95cb88c188d2a885825a5da131edb41fe3:

  gpio: sa1100: fix irq probing for ucb1x00 (2016-09-08 00:42:57 +0200)

----------------------------------------------------------------
GPIO fixes for v4.8:

- Revert a pointless attempt to add an include to solve the UM
  allyes compilation problem.
- Make the mcp23s08 depend on OF_GPIO as it uses it and doesn't
  compile properly without it.
- Fix a probing problem for ucb1x00.

----------------------------------------------------------------
Linus Walleij (2):
      Revert "gpio: include <linux/io-mapping.h> in gpiolib-of"
      gpio: mcp23s08: make driver depend on OF_GPIO

Russell King (1):
      gpio: sa1100: fix irq probing for ucb1x00

 drivers/gpio/Kconfig         | 1 +
 drivers/gpio/gpio-mcp23s08.c | 2 +-
 drivers/gpio/gpio-sa1100.c   | 2 +-
 drivers/gpio/gpiolib-of.c    | 1 -
 4 files changed, 3 insertions(+), 3 deletions(-)
