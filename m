From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.6
Date: Fri, 19 Feb 2016 09:54:40 +0100
Message-ID: <1455872080-7373-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc-for-v4.6

for you to fetch changes up to 4c96cb027be5ceb2c7c0d4dc086d35fd0cfaf14b:

  pinctrl: sh-pfc: r8a7794: Add EtherAVB pin groups (2016-02-18 09:30:59 +0100)

Summary:
  - Add more pin group support for R-Car E2 and H3,
  - Implement Manual Errata for R-Car Gen3,
  - Improve pinmux macros documentation.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (4):
      pinctrl: sh-pfc: Improve pinmux macros documentation
      pinctrl: sh-pfc: Rename PINMUX_IPSR_DATA() to PINMUX_IPSR_GPSR()
      pinctrl: sh-pfc: r8a7795: Rename SSI_{WS,SCK}0129 to SSI_{WS,SCK}01239
      pinctrl: sh-pfc: r8a7795: Remove bits SEL_VSP_1 and SEL_VSP_0

Magnus Damm (2):
      pinctrl: sh-pfc: r8a7795: Add support for INTC-EX IRQ pins
      pinctrl: sh-pfc: Rework PFC GPIO support

Ryo Kataoka (2):
      pinctrl: sh-pfc: r8a7794: Add SSI pin groups
      pinctrl: sh-pfc: r8a7794: Add audio clock pin groups

Sergei Shtylyov (1):
      pinctrl: sh-pfc: r8a7794: Add EtherAVB pin groups

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a7795: Add USB2.0 host support
      pinctrl: sh-pfc: r8a7795: Add PWM support

 drivers/pinctrl/sh-pfc/Kconfig       |   54 +-
 drivers/pinctrl/sh-pfc/Makefile      |    7 +-
 drivers/pinctrl/sh-pfc/core.c        |    4 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c |  690 ++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c | 1136 +++++++++++++--------------
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c |  774 +++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |  624 +++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 1404 ++++++++++++++++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c |  826 +++++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7734.c  |  412 +++++-----
 drivers/pinctrl/sh-pfc/sh_pfc.h      |   98 ++-
 11 files changed, 3452 insertions(+), 2577 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
