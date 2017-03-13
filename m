From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] pinctrl: sh-pfc: Add support for R-Car H3 ES2.0
Date: Mon, 13 Mar 2017 18:12:43 +0100
Message-ID: <1489425167-22711-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus, Laurent,

This patch series adds pinctrl support for R-Car H3 ES2.0, which differs
from ES1.x in several areas.

The goal is twofold:
  1. Support both the ES1.x and ES2.0 SoC revisions in a single binary
     for now,
  2. Make it clear which code supports ES1.x, so it can easily be
     identified and removed later, when production SoCs are deemed
     ubiquitous.

This is achieved by:
  1. Extracting the support for R-Car H3 ES1.x into a separate file, as
     the differences are quite large,
  2. Adding code for detecting the SoC revision at runtime using the new
     soc_device_match() API, and selecting pinctrl tables for the actual
     SoC revision,
  3. Replacing the core register and bitfield definitions, and pins,
     groups, and functions for basic devices by their counterparts for
     R-Car H3 ES2.0.

Changes compared to v1:
  - Print correct subdriver name,
  - Extend Proof-of-Concept to basic support (SCIF serial port).

The addition of pins, groups, and functions for other on-chip devices is
left to subsequent patches.

For testers, this series and its dependencies are available in the
topic/r8a7795es2-pfc-v2 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
An integration branch for testing on the R-Car H3 ES2.0 based Salvator-X
development board is provided as topic/r8a7795es2-integration.

This has been tested on Salvator-X with R-Car H3 ES1.0, ES1.1, and ES2.0
SoCs.

I plan to queue this up in sh-pfc-for-v4.12.

Thanks for your comments!

Geert Uytterhoeven (4):
  pinctrl: sh-pfc: Update info pointer after SoC-specific init
  pinctrl: sh-pfc: r8a7795: Add support for R-Car H3 ES2.0
  pinctrl: sh-pfc: r8a7795: Add SCIF support
  pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support

 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    3 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 4217 ++++----------------
 .../sh-pfc/{pfc-r8a7795.c => pfc-r8a7795es1.c}     |   25 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 5 files changed, 782 insertions(+), 3465 deletions(-)
 copy drivers/pinctrl/sh-pfc/{pfc-r8a7795.c => pfc-r8a7795es1.c} (99%)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
