From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.10 (take two)
Date: Wed, 16 Nov 2016 10:47:57 +0100
Message-ID: <1479289677-13490-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 0f866a9679215838328e1c0ed1892224672bb396:

  pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for SDHI2/3 (2016-11-07 10:39:11 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.10-tag2

for you to fetch changes up to 1fa1522f61f1fa53b2518c82bb3c667161836e10:

  pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins (2016-11-16 10:29:14 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.10 (take two)

  - DU and EtherAVB pin groups for R-Car M3-W,
  - Bias handling cleanups and bug fixes,
  - Drive-strength for non-GPIO pins for R-Car H3,
  - EtherAVB MDIO & MII, and QSPI pin groups for R-Car H3.

Thanks for pulling!
----------------------------------------------------------------
Niklas Söderlund (10):
      pinctrl: sh-pfc: r8a7796: Add DU support
      pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
      pinctrl: sh-pfc: Add helper to handle bias lookup table
      pinctrl: sh-pfc: r8a7795: Simplify get bias logic
      pinctrl: sh-pfc: r8a7795: Use lookup function for bias data
      pinctrl: sh-pfc: r8a7778: Use lookup function for bias data
      pinctrl: sh-pfc: Support named pins with custom configuration
      pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable drive-strength
      pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
      pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins

Takeshi Kihara (1):
      pinctrl: sh-pfc: r8a7796: Add EtherAVB pins, groups and functions

 drivers/pinctrl/sh-pfc/core.c        |  15 +
 drivers/pinctrl/sh-pfc/core.h        |   4 +
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c | 342 +++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 616 ++++++++++++++++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 188 +++++++++++
 drivers/pinctrl/sh-pfc/pinctrl.c     |   3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  14 +
 7 files changed, 816 insertions(+), 366 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
