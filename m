From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] pinctrl: sh-pfc: r8a7795/r8a7796: MSIOF updates
Date: Wed, 12 Jul 2017 12:31:12 +0200
Message-ID: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:40960 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755927AbdGLKbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 06:31:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus, Laurent,

This patch series fixes MSIOF-related bugs in the R-Car H3 ES2.0 and M3-W
pin control drivers, and enables support for MSIOF on R-Car H3 ES2.0.

I plan to queue these up in sh-pfc-for-v4.14.

Thanks!

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: r8a7795: Add MSIOF pins, groups and functions
  pinctrl: sh-pfc: r8a7796: Fix MSIOF3 SS2_E mux

Takeshi Kihara (3):
  pinctrl: sh-pfc: r8a7795: Fix MSIOF3_{SS1,SS2}_E pin function
    definitions
  pinctrl: sh-pfc: r8a7796: Fix MSIOF3_{SS1,SS2}_E pin function
    definitions
  pinctrl: sh-pfc: r8a7796: Fix IPSR setting for MSIOF3_SS1_E pin

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 916 ++++++++++++++++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c |   8 +-
 2 files changed, 918 insertions(+), 6 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
