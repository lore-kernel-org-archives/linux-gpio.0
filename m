From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.12
Date: Fri, 24 Mar 2017 10:39:33 +0100
Message-ID: <1490348373-11050-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:35528 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753963AbdCXJjl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2017 05:39:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.12-tag1

for you to fetch changes up to 3091ae775fae17084013021d01513bc1ad274e6a:

  pinctrl: sh-pfc: Update info pointer after SoC-specific init (2017-03-21 11:21:55 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.12

  - Fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (3):
      pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
      pinctrl: sh-pfc: r8a7795: Restore sort order
      pinctrl: sh-pfc: Update info pointer after SoC-specific init

 drivers/pinctrl/sh-pfc/core.c        |   3 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 175 ++++++++++++++++++-----------------
 2 files changed, 91 insertions(+), 87 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
