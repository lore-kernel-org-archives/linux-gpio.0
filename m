From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.13 (take two)
Date: Wed, 28 Jun 2017 19:10:16 +0200
Message-ID: <1498669816-25410-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit c8bac70f079bb3ecaf9a716f141f3d85cef27231:

  pinctrl: sh-pfc: r8a7794: Add R8A7745 support (2017-05-16 13:53:15 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.13-tag2

for you to fetch changes up to c03a133bba8662daecd7db09819fa369663d0ea7:

  pinctrl: sh-pfc: r8a7795: Add PWM support (2017-06-26 10:21:38 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.13 (take two)

  - Add SCIF1 and SCIF2 pin groups for R-Car V2H,
  - Add EtherAVB, DU parallel RGB output, and PWM pin groups for R-Car
    H3 ES2.0,
  - Add pin and gpio controller support for RZ/A1.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a7795: Add EtherAVB pins, groups and function

Jacopo Mondi (3):
      pinctrl: Renesas RZ/A1 pin and gpio controller
      dt-bindings: pinctrl: Add RZ/A1 bindings doc
      arm: dts: dt-bindings: Add Renesas RZ/A1 pinctrl header

Laurent Pinchart (2):
      pinctrl: sh-pfc: r8a7795: Add DU parallel RGB output support
      pinctrl: sh-pfc: r8a7795: Add PWM support

Ulrich Hecht (1):
      pinctrl: sh-pfc: r8a7792: Add SCIF1 and SCIF2 pin groups

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |  221 ++++
 drivers/pinctrl/Kconfig                            |   11 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-rza1.c                     | 1311 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c               |   55 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  365 ++++++
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h     |   16 +
 7 files changed, 1980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza1.c
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
