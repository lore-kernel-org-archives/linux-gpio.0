From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fix for v4.19
Date: Fri, 12 Oct 2018 10:34:55 +0200
Message-ID: <CACRpkdb-KP_m6+2oB9r-WbR9K3juC+EMjgktv7v-PS_OACie=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Greg,

here is a last minute GPIO fix for the v4.19 series.

This fixes GPIO IRQchip parent assignment on a lot
of GPIO drivers.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 0238df646e6224016a45505d2c111a24669ebe21:

  Linux 4.19-rc7 (2018-10-07 17:26:02 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.19-4

for you to fetch changes up to 3e779a2e7f909015f21428b66834127496110b6d:

  gpio: Assign gpio_irq_chip::parents to non-stack pointer (2018-10-10
14:03:27 +0200)

----------------------------------------------------------------
GPIO fix for the v4.19 series:
- Fix up the interrupt parent for the irqdomains.

----------------------------------------------------------------
Stephen Boyd (1):
      gpio: Assign gpio_irq_chip::parents to non-stack pointer

 drivers/gpio/gpiolib.c      | 3 ++-
 include/linux/gpio/driver.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
