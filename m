From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.8
Date: Thu, 23 Jun 2016 15:39:21 +0200
Message-ID: <1466689161-27672-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:36418 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682AbcFWNj3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 09:39:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.8-tag1

for you to fetch changes up to 2d7758319889bf9def19e0a7a5daf1f87c9a9116:

  pinctrl: sh-pfc: r8a7795: Add DRIF support (2016-06-23 11:01:21 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.8

  - Voltage switching support for R-Car H3,
  - DRIF pin support for R-Car H3,
  - Cleanups and fixes.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (4):
      pinctrl: sh-pfc: sh7757: Fix duplicate initializer in GPIO pinmux data
      pinctrl: sh-pfc: Move SoC-specific forward declarations to sh_pfc.h
      pinctrl: sh-pfc: Improve core and user API separation
      pinctrl: sh-pfc: Convert to devm_gpiochip_add_data()

Kuninori Morimoto (1):
      pinctrl: sh-pfc: r8a7795: Use PINMUX_SINGLE() for I2C

Ramesh Shanmugasundaram (1):
      pinctrl: sh-pfc: r8a7795: Add DRIF support

Wolfram Sang (3):
      pinctrl: sh-pfc: refactor voltage setting
      pinctrl: sh-pfc: r8a7795: add support for voltage switching
      pinctrl: sh-pfc: fix property name in bindings doc

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   2 +-
 drivers/pinctrl/sh-pfc/core.c                      |  10 -
 drivers/pinctrl/sh-pfc/core.h                      |  58 ----
 drivers/pinctrl/sh-pfc/gpio.c                      |  13 +-
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c               |   1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |   1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |  59 +---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 327 ++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-sh7757.c                |   1 -
 drivers/pinctrl/sh-pfc/pinctrl.c                   |  41 ++-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  55 +++-
 13 files changed, 413 insertions(+), 158 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
