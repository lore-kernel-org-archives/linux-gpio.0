From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v5.0-rc
Date: Wed, 6 Feb 2019 09:09:39 +0100
Message-ID: <CACRpkdYfCT9eBfrKZBA_Do3PcCwvTCX9odD1uHDyZQKdJ4KsNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jason Kridner <jdk@ti.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some overdue pin control fixes for the v5.0
series. Was too busy to send them until now.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.0-2

for you to fetch changes up to 10098709b4ee6f6f19f25ba81d9c6f83518c584c:

  pinctrl: sunxi: Correct number of IRQ banks on H6 main pin
controller (2019-01-22 10:52:39 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.0 series:
- Mediatek Kconfig fix
- Sunxi regulator, IRQ banks and pin base fixup
- Intel Cherryview Strago DMI workaround
- Potential regmap problem on mcp23s08

----------------------------------------------------------------
Chen-Yu Tsai (3):
      pinctrl: sunxi: Fix and simplify pin bank regulator handling
      pinctrl: sunxi: Consider pin_base when calculating regulator array index
      pinctrl: sunxi: Correct number of IRQ banks on H6 main pin controller

Dmitry Torokhov (1):
      pinctrl: cherryview: fix Strago DMI workaround

Jason Kridner (1):
      pinctrl: mcp23s08: spi: Fix regmap allocation for mcp23s18

Ryder Lee (1):
      pinctrl: mediatek: fix Kconfig build errors for moore core

 drivers/pinctrl/intel/pinctrl-cherryview.c |  8 +++---
 drivers/pinctrl/mediatek/Kconfig           |  3 ++
 drivers/pinctrl/pinctrl-mcp23s08.c         |  7 ++++-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c  |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c      | 44 +++++++++++++++---------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h      |  2 +-
 6 files changed, 37 insertions(+), 29 deletions(-)
