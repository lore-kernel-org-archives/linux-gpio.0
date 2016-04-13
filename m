From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.7
Date: Wed, 13 Apr 2016 10:45:30 +0200
Message-ID: <1460537130-28658-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc-for-v4.7

for you to fetch changes up to 92e6d9a2cc827018a18885e0f3050ab9ff8c3206:

  pinctrl: sh-pfc: r8a7795: Add drive strength support (2016-03-29 09:23:01 +0200)

Summary:
  - Voltage switching support for SDHI on R-Car H2,
  - Drive strength support on R-Car H3,
  - Correct register write ordering.

Thanks for pulling!

----------------------------------------------------------------
Kuninori Morimoto (1):
      pinctrl: sh-pfc: IPSRx and MOD_SELx should be set before GPSRx

Laurent Pinchart (2):
      pinctrl: sh-pfc: Add drive strength support
      pinctrl: sh-pfc: r8a7795: Add drive strength support

Wolfram Sang (1):
      pinctrl: sh-pfc: r8a7790: Implement voltage switching for SDHI

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   4 +-
 drivers/pinctrl/sh-pfc/core.c                      |  15 ++
 drivers/pinctrl/sh-pfc/core.h                      |   3 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |  54 ++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 218 ++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   | 111 +++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  19 +-
 7 files changed, 412 insertions(+), 12 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
