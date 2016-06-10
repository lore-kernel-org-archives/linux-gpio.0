From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pinctrl: sh-pfc: Cleanups
Date: Fri, 10 Jun 2016 12:05:00 +0200
Message-ID: <1465553103-6345-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:40731 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752130AbcFJKFI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2016 06:05:08 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ben Dooks <ben.dooks@codethink.co.uk>, Laxman Dewangan <ldewangan@nvidia.com>, linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi,

This series contains various cleanups for the Renesas Pin Function
Controller driver subsystem.

This has been tested on r8a7791/koelsch, and compile-tested for other
ARM and SH platforms.

I plan to queue this in sh-pfc-for-v4.8.

Thanks for your comments!

Geert Uytterhoeven (3):
  pinctrl: sh-pfc: Move SoC-specific forward declarations to sh_pfc.h
  pinctrl: sh-pfc: Improve core and user separation
  pinctrl: sh-pfc: Convert to devm_gpiochip_add_data()

 drivers/pinctrl/sh-pfc/core.c        | 10 -------
 drivers/pinctrl/sh-pfc/core.h        | 58 ------------------------------------
 drivers/pinctrl/sh-pfc/gpio.c        | 13 +-------
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c |  1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c |  1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c |  1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |  1 -
 drivers/pinctrl/sh-pfc/sh_pfc.h      | 51 ++++++++++++++++++++++++++++++-
 9 files changed, 52 insertions(+), 86 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
