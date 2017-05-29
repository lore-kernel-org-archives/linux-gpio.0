From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.13
Date: Mon, 29 May 2017 13:57:52 +0200
Message-ID: <1496059072-13102-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:58164 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750986AbdE2L6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 07:58:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.13-tag1

for you to fetch changes up to c8bac70f079bb3ecaf9a716f141f3d85cef27231:

  pinctrl: sh-pfc: r8a7794: Add R8A7745 support (2017-05-16 13:53:15 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.13

  - Add PWM, AVB MDIO/MII, and sound pin groups on R-Car M3-W,
  - Add support for RZ/G1M and RZ/G1E,
  - Small fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a7796: Add group for AVB MDIO and MII pins

Kuninori Morimoto (6):
      pinctrl: sh-pfc: r8a7796: Rename SSI_{WS,SCK}0129 to SSI_{WS,SCK}01239
      pinctrl: sh-pfc: r8a7796: Rename SSI_{WS,SCK}34 to SSI_{WS,SCK}349
      pinctrl: sh-pfc: r8a7796: Add Audio SSI pin support
      pinctrl: sh-pfc: r8a7796: Add Audio clock pin support
      pinctrl: sh-pfc: r8a7795: Rename SSI_{WS,SCK}34 to SSI_{WS,SCK}349
      pinctrl: sh-pfc: r8a7795-es1: Rename SSI_{WS,SCK}34 to SSI_{WS,SCK}349

Sergei Shtylyov (6):
      pinctrl: sh-pfc: r8a7791: Grand I2C rename
      pinctrl: sh-pfc: r8a7791: Add R8A7743 support
      pinctrl: sh-pfc: r8a7794: Rename some I2C signals
      pinctrl: sh-pfc: r8a7794: Remove AVB_AVTP_* groups
      pinctrl: sh-pfc: r8a7794: Remove reserved bits
      pinctrl: sh-pfc: r8a7794: Add R8A7745 support

Takeshi Kihara (1):
      pinctrl: sh-pfc: r8a7796: Add PWM pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    2 +
 drivers/pinctrl/sh-pfc/Kconfig                     |   10 +
 drivers/pinctrl/sh-pfc/Makefile                    |    2 +
 drivers/pinctrl/sh-pfc/core.c                      |   12 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               | 1341 ++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               | 1256 +++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |   30 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |   20 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  606 ++++++++-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    2 +
 10 files changed, 1928 insertions(+), 1353 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
