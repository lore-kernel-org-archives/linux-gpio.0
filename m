From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/4] pinctrl: sh-pfc: Add PINMUX_SINGLE()
Date: Tue, 20 Oct 2015 21:26:31 +0200
Message-ID: <1445369195-25117-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:36371 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751753AbbJTT0d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2015 15:26:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi,

Currently single-function pins are described using the raw PINMUX_DATA()
macro.

Morimoto-san doesn't like that. He proposed to use the existing
PINMUX_IPSR_NOGP() macro instead (cfr. "[RFC] pinctrl: sh-pfc: r8a7795:
Add pinmux data for single-function pins",
http://www.spinics.net/lists/linux-sh/msg44823.html).
However, that macro is intended to describe a pinmux configuration
without GPIO function, which feels wrong to me.

This patch series proposes an alternative, introducing a new macro
PINMUX_SINGLE() to describe a pinmux configuration for a single-function
pin. It also converts the existing single-function pin descriptions.

Thanks for your comments!

Geert Uytterhoeven (4):
  pinctrl: sh-pfc: Add PINMUX_SINGLE()
  pinctrl: sh-pfc: r8a7790: Use PINMUX_SINGLE() instead of raw
    PINMUX_DATA()
  pinctrl: sh-pfc: r8a7791: Use PINMUX_SINGLE() instead of raw
    PINMUX_DATA()
  pinctrl: sh-pfc: r8a7794: Use PINMUX_SINGLE() instead of raw
    PINMUX_DATA()

 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 18 +++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 34 ++++++++++++++--------------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 44 ++++++++++++++++++------------------
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  7 ++++++
 4 files changed, 55 insertions(+), 48 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
