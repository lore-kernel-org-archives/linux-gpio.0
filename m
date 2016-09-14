From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.9 (take three)
Date: Wed, 14 Sep 2016 09:59:28 +0200
Message-ID: <1473839968-7876-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:34344 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760286AbcINH7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 03:59:35 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 374cf6992de89fc38d4d923c89b40816d341d678:

  pinctrl: sh-pfc: r8a7796: Add SDHI pins, groups and functions (2016-08-19 09:37:20 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.9-tag3

for you to fetch changes up to 77fd4136e58c642482f03d293d5717658a569b4b:

  pinctrl: sh-pfc: r8a7794: Implement voltage switching for SDHI (2016-09-14 09:26:54 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.9 (take three)

  - Return pinconf with arguments in packed format,
  - MSIOF and QSPI pin groups on R-Car V2H,
  - Voltage switching for SDHI on R-Car M2-W, E2, and M3-W.

Thanks for pulling!
----------------------------------------------------------------
Niklas Söderlund (1):
      pinctrl: sh-pfc: Return pinconf with arguments in packed format

Sergei Shtylyov (2):
      pinctrl: sh-pfc: r8a7792: Add QSPI pin groups
      pinctrl: sh-pfc: r8a7792: Add MSIOF pin groups

Simon Horman (4):
      pinctrl: sh-pfc: r8a7796: Add voltage switch operations for SDHI
      pinctrl: sh-pfc: Add PORT_GP_24 helper macro
      pinctrl: sh-pfc: r8a7791: Implement voltage switching for SDHI
      pinctrl: sh-pfc: r8a7794: Implement voltage switching for SDHI

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |  29 ++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c | 115 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |  28 ++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c |  28 ++++++++-
 drivers/pinctrl/sh-pfc/pinctrl.c     |   8 ++-
 drivers/pinctrl/sh-pfc/sh_pfc.h      |   8 ++-
 6 files changed, 207 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
