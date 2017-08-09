From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.13, take one
Date: Wed, 9 Aug 2017 23:11:08 +0200
Message-ID: <CACRpkdaqeE-Bx5Z1CYiTwQM4mYQtF7u9YvQWKkyGttmsDfCjbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

these are the pin control fixes I have gathered since the return from my
vacation. They boiled in -next a while so let's get them in.

Details in the signed tag. Apart from the documentation build it is purely
driver fixes. Which is nice. The Intel fixes seem kind of important.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 16f73eb02d7e1765ccab3d2018e0bd98eb93d973:

  Linux 4.13-rc3 (2017-07-30 12:40:36 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.13-2

for you to fetch changes up to 0cca6c8920ade95e2741b2062cf1397dc546fb0f:

  pinctrl: generic: update references to Documentation/pinctrl.txt
(2017-08-07 15:26:34 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.13 cycle:

- Fix the documentation build as the docs were moved.

- Correct the UART pin list on the Intell Merrifield.

- Fix pin assignment and number of pins on the Marvell Armada
  37xx pin controller.

- Cover the Setzer models in the Chromebook DMI quirk in the
  Intel cheryview driver so they start working.

- Add the missing "sim" function to the sunxi driver.

- Fix USB pin definitions on Uniphier Pro4.

- Smatch fix for invalid reference in the zx pin control driver.

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: cherryview: Add Setzer models to the Chromebook DMI quirk
      pinctrl: intel: merrifield: Correct UART pin lists

Gregory CLEMENT (2):
      pinctrl: armada-37xx: Fix the pin 23 on south bridge
      pinctrl: armada-37xx: Fix number of pin in south bridge

Icenowy Zheng (1):
      pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver

Kunihiko Hayashi (1):
      pinctrl: uniphier: fix USB3 pin assignment for Pro4

Ludovic Desroches (1):
      pinctrl: generic: update references to Documentation/pinctrl.txt

Shawn Guo (1):
      pinctrl: zte: fix dereference of 'data' in zx_set_mux()

 Documentation/gpio/gpio-legacy.txt               |  2 +-
 MAINTAINERS                                      |  2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c       |  7 +++++++
 drivers/pinctrl/intel/pinctrl-merrifield.c       |  6 +++---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c      | 25 +++++++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c        |  1 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c |  2 +-
 drivers/pinctrl/zte/pinctrl-zx.c                 | 11 +++++++----
 include/linux/device.h                           |  2 +-
 include/linux/pinctrl/pinconf-generic.h          |  4 ++--
 10 files changed, 42 insertions(+), 20 deletions(-)
