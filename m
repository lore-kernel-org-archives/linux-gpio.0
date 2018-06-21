From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.18 take one
Date: Thu, 21 Jun 2018 19:19:15 +0200
Message-ID: <CACRpkdZP_WZ1PHWtW1bjAKa8kP08UWyt6WJ7cUxxYpfQooegEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

some fallout in the pin control subsystem in the first
week after the merge window, some minor fixes so I'd
like to get it to you ASAP.

Please pull it in och glad midsommar!
Linus Walleij

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.18-2

for you to fetch changes up to 5f591543a937310e48baf0ee23680be09cdedfb8:

  pinctrl: mt7622: fix a kernel panic when pio don't work as EINT
controller (2018-06-18 07:55:57 +0200)

----------------------------------------------------------------
Fixes for v4.18:

- Fix a serious kernel panic on the Mediatek driver with
  the external interrupt controller.

- Fix an uninitialized compiler warning in the owl
  (actions) driver.

- Allocation failure in the pinctrl-single driver.

- Pointer overwrite problem in the i.MX driver.

- Fix a small compiler warning.

----------------------------------------------------------------
Colin Ian King (1):
      pinctrl: single: Add allocation failure checking of saved_vals

Fabio Estevam (1):
      pinctrl: devicetree: Fix pctldev pointer overwrite

Geert Uytterhoeven (1):
      pinctrl: actions: Fix uninitialized error in owl_pin_config_set()

Sean Wang (1):
      pinctrl: mt7622: fix a kernel panic when pio don't work as EINT controller

Wei Yongjun (1):
      pinctrl: mediatek: remove redundant return value check of
platform_get_resource()

 drivers/pinctrl/actions/pinctrl-owl.c         |  2 +-
 drivers/pinctrl/devicetree.c                  |  7 +++++--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c     |  6 +++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  5 -----
 drivers/pinctrl/pinctrl-single.c              | 14 +++++++++++---
 5 files changed, 22 insertions(+), 12 deletions(-)
