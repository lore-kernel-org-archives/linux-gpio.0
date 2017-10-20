From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.15 (take two)
Date: Fri, 20 Oct 2017 13:25:44 +0200
Message-ID: <1508498744-11481-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:44108 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbdJTLZu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 07:25:50 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 5ec8a41a36715cf543cb7c109097fb3b4cdfb427:

  pinctrl: sh-pfc: r8a7795: Add USB3.0 host support (2017-10-02 13:23:44 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.15-tag2

for you to fetch changes up to 8843797df383ac7ed7cf4f87cc18a4ec6d929b60:

  pinctrl: sh-pfc: Save/restore registers for PSCI system suspend (2017-10-20 11:37:43 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.15 (take two)

  - Add Audio, HSCIF, I2C, and INTC-EX pin groups on R-Car H3 ES2.0,
  - Add Audio and PWM pin groups on R-Car D3,
  - Add support for RZ/A1M and RZ/A1L,
  - Add INTC-EX pin groups on R-Car M3-W,
  - Add SDHI voltage switching on RZ/G1E,
  - Make bias control and IOCTRL support more generic,
  - Add suspend/resume support for R-Car Gen3,
  - Small fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (1):
      pinctrl: sh-pfc: r8a7745: Implement voltage switching for SDHI

Chris Brandt (2):
      pinctrl: rza1: Add support for RZ/A1L
      dt-bindings: pinctrl: Add support for RZ/A1M and RZ/A1L

Geert Uytterhoeven (18):
      pinctrl: sh-pfc: r8a7795-es1: Restore sort order
      pinctrl: sh-pfc: r8a7795: Restore sort order
      pinctrl: sh-pfc: r8a7795: Add INTC-EX pins, groups and function
      pinctrl: sh-pfc: r8a77995: Remove USB0_IDIN and USB0_IDPU pins
      pinctrl: sh-pfc: Remove matching on plain sh-pfc platform device
      pinctrl: sh-pfc: Drop width parameter of sh_pfc_{read,write}_reg()
      pinctrl: sh-pfc: Add generic bias register description
      pinctrl: sh-pfc: Add sh_pfc_pin_to_bias_reg() helper
      pinctrl: sh-pfc: r8a7795-es1: Use generic bias register description
      pinctrl: sh-pfc: r8a7795: Use generic bias register description
      pinctrl: sh-pfc: r8a7796: Use generic bias register description
      pinctrl: sh-pfc: r8a7778: Use generic bias register description
      pinctrl: sh-pfc: Remove obsolete sh_pfc_pin_to_bias_info()
      pinctrl: sh-pfc: Add generic IOCTRL register description
      pinctrl: sh-pfc: r8a7795-es1: Use generic IOCTRL register description
      pinctrl: sh-pfc: r8a7795: Use generic IOCTRL register description
      pinctrl: sh-pfc: r8a7796: Use generic IOCTRL register description
      pinctrl: sh-pfc: Save/restore registers for PSCI system suspend

Kuninori Morimoto (4):
      pinctrl: sh-pfc: r8a7795: Add Audio clock pin support
      pinctrl: sh-pfc: r8a7795: Add Audio SSI pin support
      pinctrl: sh-pfc: r8a77995: Add Audio clock pin support
      pinctrl: sh-pfc: r8a77995: Add Audio SSI pin support

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a77995: Add PWM pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add support for INTC-EX IRQ pins

Wolfram Sang (5):
      pinctrl: sh-pfc: r8a7795: Add I2C pin support
      pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions
      pinctrl: sh-pfc: r8a7795: Fix trivial typo in comment
      pinctrl: sh-pfc: r8a7795-es1: Fix trivial typo in comment
      pinctrl: sh-pfc: r8a7796: Fix trivial typo in comment

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |    6 +-
 drivers/pinctrl/pinctrl-rza1.c                     |  134 ++
 drivers/pinctrl/sh-pfc/core.c                      |  131 +-
 drivers/pinctrl/sh-pfc/core.h                      |   11 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  403 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |    1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |  547 ++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 1345 ++++++++++++++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  573 +++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |  260 +++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   12 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   24 +-
 12 files changed, 2468 insertions(+), 979 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
