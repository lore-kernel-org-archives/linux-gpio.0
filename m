From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7791/r8a7795: Add SCIF_CLK support
Date: Thu, 19 Nov 2015 19:30:25 +0100
Message-ID: <1447957827-32637-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:40912 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758707AbbKSSaX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2015 13:30:23 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus, Laurent,

This patch series add pins, groups, and a function for SCIF_CLK on R-Car
M2 and R-Car H3. SCIF_CLK is the external clock source for the Baud Rate
Generator for External Clock (BRG) on (H)SCIF.

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: r8a7791: Add SCIF_CLK support
  pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 25 +++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 24 ++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
