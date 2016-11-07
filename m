From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.10
Date: Mon,  7 Nov 2016 16:35:32 +0100
Message-ID: <1478532932-5713-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.10-tag1

for you to fetch changes up to 0f866a9679215838328e1c0ed1892224672bb396:

  pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for SDHI2/3 (2016-11-07 10:39:11 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.10

  - I2C and DRIF pin groups for R-Car M3-W,
  - Bug fixes for SDHI2/3 on R-Car M3-W.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for SDHI2/3

Ramesh Shanmugasundaram (1):
      pinctrl: sh-pfc: r8a7796: Add DRIF support

Ulrich Hecht (1):
      pinctrl: sh-pfc: r8a7796: Add I2C pin support

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 388 ++++++++++++++++++++++++++++++++++-
 1 file changed, 378 insertions(+), 10 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
