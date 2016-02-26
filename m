From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.6 (take two)
Date: Fri, 26 Feb 2016 16:59:22 +0100
Message-ID: <1456502362-24779-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:44746 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933725AbcBZP73 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 10:59:29 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 4c96cb027be5ceb2c7c0d4dc086d35fd0cfaf14b
(my previous pull request, which is not yet visible in pinctrl/for-next):

  pinctrl: sh-pfc: r8a7794: Add EtherAVB pin groups (2016-02-18 09:30:59 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc-for-v4.6

for you to fetch changes up to 4412bb5db6068855b8ad30a058c9d039d3e4f7bd:

  pinctrl: sh-pfc: r8a7795: Add CAN FD support (2016-02-26 13:59:41 +0100)

Summary:
  - Fix a bug in R-Car E2 configur register data,
  - Add more pin group support for R-Car H3.

Thanks for pulling!

----------------------------------------------------------------
Andrey Gusakov (1):
      pinctrl: sh-pfc: r8a7794: Fix GP2[29] muxing

Ramesh Shanmugasundaram (2):
      pinctrl: sh-pfc: r8a7795: Add CAN support
      pinctrl: sh-pfc: r8a7795: Add CAN FD support

Simon Horman (1):
      pinctrl: sh-pfc: Use ARCH_RENESAS

 drivers/pinctrl/sh-pfc/Kconfig       |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |  1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 89 ++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
