From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: sh-pfc: Restore sort order
Date: Thu,  5 Oct 2017 12:20:28 +0200
Message-ID: <1507198830-26128-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi,

This patch series restores sort order in the R-Car H3 pinctrl files.

Queuing up in sh-pfc-for-v4.15, as usual.

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: r8a7795-es1: Restore sort order
  pinctrl: sh-pfc: r8a7795: Restore sort order

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 34 ++++++++++++++++----------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 32 +++++++++++++++---------------
 2 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
