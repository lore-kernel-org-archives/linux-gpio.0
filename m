From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.14
Date: Wed, 11 Oct 2017 09:25:19 +0200
Message-ID: <CACRpkdb-Pbyynt0254fjsL_BwxO3gtJon2vMv=qC483CPi-v1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some pin control fixes for v4.14 that stacked up.
Two small things and a slightly larger thing in the Intel
Cherryview.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.14-3

for you to fetch changes up to 845e405e5e6c9dc9ed10306a4b5bfeaefebc2e84:

  pinctrl: cherryview: fix issues caused by dynamic gpio irqs mapping
(2017-10-08 02:32:59 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.14 series:

- Fix two build problems.

- Fix a regression on the Intel Cherryview interrupt path.

----------------------------------------------------------------
Corentin Labbe (1):
      pinctrl: bcm2835: fix build warning in bcm2835_gpio_irq_handle_bank

Grygorii Strashko (1):
      pinctrl: cherryview: fix issues caused by dynamic gpio irqs mapping

Petr Mladek (1):
      pinctrl/amd: Fix build dependency on pinmux code

 drivers/pinctrl/Kconfig                    |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c      |  4 ----
 drivers/pinctrl/intel/pinctrl-cherryview.c | 14 +++++++++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)
