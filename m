From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.16 (take two)
Date: Fri,  5 Jan 2018 11:33:58 +0100
Message-ID: <1515148438-5569-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:32860 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751803AbeAEKeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jan 2018 05:34:02 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 527890f72892b127b67567af6bdbdc5288c211c1:

  pinctrl: sh-pfc: r8a77995: Add CAN FD support (2017-12-05 14:14:56 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.16-tag2

for you to fetch changes up to 297e5b2b7a8398b4b850d6bdb63f3a3544670b9e:

  pinctrl: sh-pfc: r8a7795: Add SATA pins, groups, and functions (2017-12-21 10:08:23 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.16 (take two)

  - Add PWM pin groups on various R-Car Gen2 and RZ/G1 SoCs,
  - Add missing I2C5 pin groups on R-Car E2 and RZ/G1E,
  - Add SATA pin groups on R-Car H3 ES2.0.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      pinctrl: sh-pfc: r8a7794: Add i2c5 pin groups and function

Fabrizio Castro (3):
      pinctrl: sh-pfc: r8a7794: Add PWM[0123456] support
      pinctrl: sh-pfc: r8a7794: Add tpu groups and function
      pinctrl: sh-pfc: r8a7791: Add tpu groups and function

Wolfram Sang (1):
      pinctrl: sh-pfc: r8a7795: Add SATA pins, groups, and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |  42 ++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 307 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c |  24 +++
 3 files changed, 371 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
