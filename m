From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.9
Date: Wed, 17 Aug 2016 17:05:28 +0200
Message-ID: <1471446328-15537-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.9-tag1

for you to fetch changes up to 7955dac1b7efab7ae1e7522ea9af3fdc18a257d0:

  pinctrl: sh-pfc: r8a7795: Add DU support (2016-08-16 10:30:43 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.9

  - Bias and DU support for R-Car H3,
  - Basic R-Car V2H support,
  - Cleanups and fixes.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a7795: Correct header from R-Car Gen3 to R8A7795

Laurent Pinchart (1):
      pinctrl: sh-pfc: r8a7795: Add DU support

Sergei Shtylyov (7):
      pinctrl: sh-pfc: Fix overly long lines
      pinctrl: sh-pfc: Add R8A7792 PFC support
      pinctrl: sh-pfc: r8a7792: Add EtherAVB pin groups
      pinctrl: sh-pfc: r8a7792: Add SDHI pin groups
      pinctrl: sh-pfc: r8a7792: Add CAN pin groups
      pinctrl: sh-pfc: r8a7792: Add VIN pin groups
      pinctrl: sh-pfc: r8a7792: Add DU pin groups

Ulrich Hecht (1):
      pinctrl: sh-pfc: r8a7795: Add bias pinconf support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c               | 2624 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  356 ++-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  108 +-
 7 files changed, 3048 insertions(+), 53 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7792.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
