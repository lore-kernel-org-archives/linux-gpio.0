From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.12 (take three)
Date: Mon, 24 Apr 2017 13:06:13 +0200
Message-ID: <1493031973-4634-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit d14a39edf757f5bdd73cf25d0155d7cfb271e782:

  pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support (2017-03-30 13:43:55 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.12-tag3

for you to fetch changes up to 5f4c8cafe1148f8a91287072815df8f0b66f0e5c:

  pinctrl: sh-pfc: r8a7794: Swap ATA signals (2017-04-05 09:41:29 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.12 (take three)

  - Miscellaneous fixes for R-Car M2-W and R-Car E2.

Nothing critical, but given v4.11 is postponed by another week, I see no
reason to hold these off any longer.

Thanks for pulling!
----------------------------------------------------------------
Sergei Shtylyov (5):
      pinctrl: sh-pfc: r8a7791: Add missing HSCIF1 pinmux data
      pinctrl: sh-pfc: r8a7791: Add missing DVC_MUTE signal
      pinctrl: sh-pfc: r8a7791: Fix SCIF2 pinmux data
      pinctrl: sh-pfc: r8a7791: Fix IPSR comment typos
      pinctrl: sh-pfc: r8a7794: Swap ATA signals

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 18 +++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 16 ++++++++--------
 2 files changed, 19 insertions(+), 15 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
