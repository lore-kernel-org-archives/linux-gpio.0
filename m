From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] pinctrl: sh-pfc: r8a7795: Add MSIOF support
Date: Mon, 30 Nov 2015 14:49:37 +0100
Message-ID: <1448891379-2457-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:37539 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754486AbbK3Ntl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 08:49:41 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Laurent, Linus,

This patch series adds MSIOF pinctrl support for the Renesas R-Car H3
(r8a7795) SoC.

Please note that there's a timing issue when using the current
spi-sh-msiof driver on r8a7795.  However, pinctrl functionality has been
verified using MSIOF2.

Changes since v1:
  - Use PINMUX_SINGLE() instead of raw PINMUX_DATA(),
  - Rebased.

Thanks!

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: r8a7795: Add pinmux data for single-function pins
  pinctrl: sh-pfc: r8a7795: Add MSIOF pins, groups, and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 877 +++++++++++++++++++++++++++++++++++
 1 file changed, 877 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
