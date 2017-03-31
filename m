From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.12 (take two)
Date: Fri, 31 Mar 2017 11:26:30 +0200
Message-ID: <1490952390-11256-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:42512 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932817AbdCaJ0g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2017 05:26:36 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 3091ae775fae17084013021d01513bc1ad274e6a:

  pinctrl: sh-pfc: Update info pointer after SoC-specific init (2017-03-21 11:21:55 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.12-tag2

for you to fetch changes up to d14a39edf757f5bdd73cf25d0155d7cfb271e782:

  pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support (2017-03-30 13:43:55 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.12 (take two)

  - Add basic support for the Pin Function Controller on revision ES2.0
    of the R-Car H3 SoC, which differs from ES1.x in many ways.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (3):
      pinctrl: sh-pfc: r8a7795: Add support for R-Car H3 ES2.0
      pinctrl: sh-pfc: r8a7795: Add SCIF support
      pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support

 drivers/pinctrl/sh-pfc/Makefile          |    1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 5705 ++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 4217 ++++------------------
 drivers/pinctrl/sh-pfc/sh_pfc.h          |    1 +
 4 files changed, 6471 insertions(+), 3453 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
