From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.10
Date: Thu, 26 Jan 2017 14:42:24 +0100
Message-ID: <CACRpkdZjLtDWbVLr70RibYe4YUjo7hWXPZ0kAPM_5ujH01d+Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a bunch of pin control fixes for v4.10 that didn't get
sent off until now, sorry for the delay.

Please pull them in, it's only driver fixes.

Yours,
Linus Walleij

The following changes since commit a121103c922847ba5010819a3f250f1f7fc84ab8:

  Linux 4.10-rc3 (2017-01-08 14:18:17 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.10-3

for you to fetch changes up to df1539c25cce98e2ac69881958850c6535240707:

  pinctrl: uniphier: fix Ethernet (RMII) pin-mux setting for LD20
(2017-01-19 10:36:40 +0100)

----------------------------------------------------------------
Pin control fixes for v4.10:

- A bunch of fixes to the Intel drivers: broxton, baytrail.
  Bugs related to register offsets, IRQ, debounce functionality.

- Fix a conflict amongst UART settings on the meson.

- Fix the ethernet setting on the Uniphier.

- A compilation warning squelched.

----------------------------------------------------------------
Andy Shevchenko (3):
      pinctrl: intel: Set pin direction properly
      pinctrl: baytrail: Rectify debounce support
      pinctrl: baytrail: Do not add all GPIOs to IRQ domain

Arnd Bergmann (1):
      pinctrl: amd: avoid maybe-uninitalized warning

Martin Blumenstingl (1):
      pinctrl: meson: fix uart_ao_b for GXBB and GXL/GXM

Masahiro Yamada (1):
      pinctrl: uniphier: fix Ethernet (RMII) pin-mux setting for LD20

Mika Westerberg (1):
      pinctrl: broxton: Use correct PADCFGLOCK offset

 drivers/pinctrl/intel/pinctrl-baytrail.c         | 39 +++++++++++++++---------
 drivers/pinctrl/intel/pinctrl-broxton.c          |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c            | 30 +++++++++++-------
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c       |  7 ++---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c        |  7 ++---
 drivers/pinctrl/pinctrl-amd.c                    |  2 ++
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c |  2 +-
 7 files changed, 54 insertions(+), 35 deletions(-)
