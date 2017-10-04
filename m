From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.15
Date: Wed,  4 Oct 2017 11:44:37 +0200
Message-ID: <1507110277-11785-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.15-tag1

for you to fetch changes up to 5ec8a41a36715cf543cb7c109097fb3b4cdfb427:

  pinctrl: sh-pfc: r8a7795: Add USB3.0 host support (2017-10-02 13:23:44 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.15

  - Add SDHI and DRIF pin groups on R-Car H3 ES2.0,
  - Add USB3.0 host pin groups on R-Car H3 (ES1.x and ES2.0),
  - Add EthernetAVB and USB2.0 host pin groups on R-Car D3.

Thanks for pulling!
----------------------------------------------------------------
Dirk Behme (1):
      pinctrl: sh-pfc: r8a7795: Re-add DRIF support

Takeshi Kihara (4):
      pinctrl: sh-pfc: r8a7795: Add SDHI0-3 support
      pinctrl: sh-pfc: r8a77995: Add USB2.0 host support
      pinctrl: sh-pfc: r8a7795-es1: Add USB3.0 host support
      pinctrl: sh-pfc: r8a7795: Add USB3.0 host support

Yoshihiro Shimoda (1):
      pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c |  29 ++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 581 +++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 134 +++++++
 3 files changed, 744 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
