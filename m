From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.9 (take two)
Date: Wed, 24 Aug 2016 21:24:51 +0200
Message-ID: <1472066691-7967-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 7955dac1b7efab7ae1e7522ea9af3fdc18a257d0:

  pinctrl: sh-pfc: r8a7795: Add DU support (2016-08-16 10:30:43 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.9-tag2

for you to fetch changes up to 374cf6992de89fc38d4d923c89b40816d341d678:

  pinctrl: sh-pfc: r8a7796: Add SDHI pins, groups and functions (2016-08-19 09:37:20 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Add support for R-Car M3-W

Add initial support for the Pin Function Controller on the Renesas R-Car
M3-W SoC:
  - Basic definitions,
  - SCIF (serial) pins, groups and functions,
  - SDHI pins, groups and functions.

As this is a dependency for adding pinctrl properties to the existing
r8a7796-salvator-x.dts without breaking runtime, I would appreciate if
you could do that sooner rather than later, so Simon can pull it as
well, and start queueing up pinctrl property DT patches.

Thanks for pulling!
----------------------------------------------------------------
Takeshi Kihara (3):
      pinctrl: sh-pfc: Initial R8A7796 PFC support
      pinctrl: sh-pfc: r8a7796: Add SCIF pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add SDHI pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 2647 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 6 files changed, 2661 insertions(+)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7796.c
