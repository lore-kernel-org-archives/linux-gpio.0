From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v4.20 series
Date: Fri, 23 Nov 2018 09:12:38 +0100
Message-ID: <CACRpkdYEtBRi7qcLtL602qE3fe6+eaYAH_Nw+25NsaL0EebOiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are a few collected GPIO fixes for the v4.20 series.
Minor stuff except the IDA leak which was kind of important
to fix. Also new maintainers, yay.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.20-2

for you to fetch changes up to 10547d956d590fbb846a7bd053a1dfc30e8f9a68:

  MAINTAINERS: Do maintain Intel GPIO drivers via separate tree
(2018-11-16 23:06:51 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.20 series:

- Do not lose an IDA on the gpiochip register errorpath.

- Fix the PXA non-pincontrol GPIO-using platforms.

- Fix the direction on the mockup GPIO driver.

- Add some MAINTAINERS stuff: Bartosz stepped up as GPIO
  co-maintainer, and Andy established an Intel git tree.

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Do maintain Intel GPIO drivers via separate tree

Bartosz Golaszewski (2):
      MAINTAINERS: add myself as co-maintainer of gpiolib
      gpio: mockup: fix indicated direction

Robert Jarzmik (1):
      gpio: pxa: fix legacy non pinctrl aware builds again

Vladimir Zapolskiy (1):
      gpio: don't free unallocated ida on gpiochip_add_data_with_key()
error path

 MAINTAINERS                | 34 ++++++++++++++++++++++------------
 drivers/gpio/gpio-mockup.c |  6 +++---
 drivers/gpio/gpio-pxa.c    |  4 ++--
 drivers/gpio/gpiolib.c     |  5 +++--
 4 files changed, 30 insertions(+), 19 deletions(-)
