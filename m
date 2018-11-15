From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.20
Date: Thu, 15 Nov 2018 09:29:25 +0100
Message-ID: <CACRpkdYht47bTGK_LSy9xqXAJ4axdarC0zqRoKpR4zOwjG-qRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some few pin control fixes for v4.20. Just meson
(a very specific hardware) and establishing a git repo for
Intel pin control.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.20-2

for you to fetch changes up to 595b0674ce781e38522097b18718ce3c3bffc1a1:

  MAINTAINERS: Add tree link for Intel pin control driver (2018-11-09
11:36:51 +0100)

----------------------------------------------------------------
Pin control fixes for the v4.20 series:

- A bunch of meson fixes for this (Allwinner) platform.

- Establish a git repo for Intel pin control in MAINTAINERS.

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Add tree link for Intel pin control driver

Jerome Brunet (5):
      pinctrl: meson: fix pinconf bias disable
      pinctrl: meson: fix gxbb ao pull register bits
      pinctrl: meson: fix gxl ao pull register bits
      pinctrl: meson: fix meson8 ao pull register bits
      pinctrl: meson: fix meson8b ao pull register bits

 MAINTAINERS                                | 1 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 2 +-
 drivers/pinctrl/meson/pinctrl-meson.c      | 2 +-
 drivers/pinctrl/meson/pinctrl-meson8.c     | 2 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)
