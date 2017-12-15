From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.16
Date: Fri, 15 Dec 2017 10:38:52 +0100
Message-ID: <1513330732-16785-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:34082 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755121AbdLOJjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Dec 2017 04:39:01 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.16-tag1

for you to fetch changes up to 527890f72892b127b67567af6bdbdc5288c211c1:

  pinctrl: sh-pfc: r8a77995: Add CAN FD support (2017-12-05 14:14:56 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.16

  - Add CAN pin groups on RZ/G1E,
  - Add CAN and CAN FD pin groups on R-Car H3 ES2.0, and R-Car D3,
  - Add support for the new R-Car V3M SoC,
  - Add support for I2C on R-Car D3,
  - Small fixes and cleanups.

Thanks for pulling!

P.S. There seems to be issues with kernel.org mirrorring. I can't see my
     tag in the public repo, but the sh-pfc-for-v4.16 branch is up-to-date
     (last change 10 days ago).
----------------------------------------------------------------
Fabrizio Castro (3):
      pinctrl: sh-pfc: r8a7745: Add CAN[01] support
      pinctrl: sh-pfc: r8a7794: Add can_clk function
      pinctrl: sh-pfc: r8a7791: Add can_clk function

Ramesh Shanmugasundaram (2):
      pinctrl: sh-pfc: r8a7795: Add CAN support
      pinctrl: sh-pfc: r8a7795: Add CAN FD support

Sergei Shtylyov (2):
      pinctrl: sh-pfc: Add PORT_GP_CFG_{6|22}() helper macros
      pinctrl: sh-pfc: Add R8A77970 PFC support

Takeshi Kihara (6):
      pinctrl: sh-pfc: r8a7795: Add GP-1-28 port pin support
      pinctrl: sh-pfc: r8a7795-es1: Fix MOD_SEL1 bit[25:24] to 0x3 when using STP_ISEN_1_D
      pinctrl: sh-pfc: r8a7795: Fix to delete A20..A25 pins function definitions
      pinctrl: sh-pfc: r8a7796: Fix to delete A20..A25 pins function definitions
      pinctrl: sh-pfc: r8a7795: Rename RTS{0,1,3,4}# pin function definitions
      pinctrl: sh-pfc: r8a7796: Rename RTS{0,1,3,4}# pin function definitions

Ulrich Hecht (3):
      pinctrl: sh-pfc: r8a77995: Add missing pins SCL0 and SDA0 to pinmux data
      pinctrl: sh-pfc: r8a77995: Add CAN support
      pinctrl: sh-pfc: r8a77995: Add CAN FD support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   22 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |  166 ++
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  169 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |   66 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              | 2329 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |   88 +
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   17 +-
 12 files changed, 2788 insertions(+), 84 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77970.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
