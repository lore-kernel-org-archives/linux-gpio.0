From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.7
Date: Wed, 29 Jun 2016 09:15:22 +0200
Message-ID: <CACRpkdaXSyYLwdtJh7GysTbESTp91CmaWbLaAZPDG=nv05Ve3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are a bunch of fixes for pin control. Just drivers and
a MAINTAINERS fixup.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 33688abb2802ff3a230bd2441f765477b94cc89e:

  Linux 4.7-rc4 (2016-06-19 21:30:02 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.7-3

for you to fetch changes up to b41aa4f8476545e2b663b1549759a8c3a66f47b0:

  pinctrl: baytrail: Fix mingled clock pins (2016-06-23 11:05:04 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.7 cycle:

- Driver fixes for i.MX, single register, Tegra and BayTrail.

- MAINTAINERS entry for the documentation

----------------------------------------------------------------
Alexander Shiyan (1):
      pinctrl: imx: Do not treat a PIN without MUX register as an error

Andy Shevchenko (1):
      MAINTAINERS: belong Documentation/pinctrl.txt properly

Axel Lin (1):
      pinctrl: tegra: Fix build dependency

Cristina Ciocan (1):
      pinctrl: baytrail: Fix mingled clock pins

Thierry Reding (1):
      gpio: tegra: Make lockdep class file-scoped

Tony Lindgren (1):
      pinctrl: single: Fix missing flush of posted write for a wakeirq

 MAINTAINERS                              | 1 +
 drivers/gpio/gpio-tegra.c                | 9 +++++++--
 drivers/pinctrl/Makefile                 | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c  | 4 ++--
 drivers/pinctrl/intel/pinctrl-baytrail.c | 6 +++---
 drivers/pinctrl/pinctrl-single.c         | 3 +++
 drivers/pinctrl/tegra/Makefile           | 2 +-
 7 files changed, 18 insertions(+), 9 deletions(-)
