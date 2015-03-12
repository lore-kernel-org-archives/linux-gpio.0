From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/4] pinctrl: sh-pfc: cleanups
Date: Thu, 12 Mar 2015 11:09:12 +0100
Message-ID: <1426154956-26583-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:51657 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753511AbbCLKJZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2015 06:09:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

This patch series does some code (type) cleanups.

  - Patch 1 changes the types used for storing register and field widths
    in the pinctrl data tables, shrinking them by an average of ca. 4
    KiB per SoC,
  - Patches 3, 4, and 5 do some more cleanups w.r.t. the choice of types.

This series is against pinctrl/for-next.

Boot-tested on r8a73a4/ape6evm, r8a7740/armadillo, r8a7791/koelsch, and
sh73a0/kzm9g.

Thanks for applying!

Geert Uytterhoeven (4):
  pinctrl: sh-pfc: Store register/field widths in u8 instead of unsigned
    long
  pinctrl: sh-pfc: Use unsigned int for register/field widths and
    offsets
  pinctrl: sh-pfc: Use reg_width instead of reg as sentinel
  pinctrl: sh-pfc: Use u32 to store register addresses

 drivers/pinctrl/sh-pfc/core.c   | 65 ++++++++++++++++++++---------------------
 drivers/pinctrl/sh-pfc/core.h   |  4 +--
 drivers/pinctrl/sh-pfc/gpio.c   | 18 +++++++-----
 drivers/pinctrl/sh-pfc/sh_pfc.h | 12 ++++----
 4 files changed, 52 insertions(+), 47 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
