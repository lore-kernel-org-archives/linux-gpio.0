From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.11
Date: Fri, 13 Jan 2017 15:00:18 +0100
Message-ID: <1484316018-25170-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.11-tag1

for you to fetch changes up to 0e4e4999aac16641f47699e8929693b83a7a4d64:

  pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions (2016-12-27 10:57:39 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.11

  - Add bias handling for non-GPIO pins for R-Car H3,
  - Add drive-strength and bias handling for R-Car M3-W,
  - Add CAN, CAN FD, MSIOF, and HSCIF pin groups for R-Car M3-W,
  - Add SDHI voltage switching for R-Car M2-N.

Thanks for pulling!
----------------------------------------------------------------
Chris Paterson (2):
      pinctrl: sh-pfc: r8a7796: Add CAN support
      pinctrl: sh-pfc: r8a7796: Add CAN FD support

Niklas Söderlund (3):
      pinctrl: sh-pfc: r8a7796: Add drive strength support
      pinctrl: sh-pfc: r8a7796: Add bias pinconf support
      pinctrl: sh-pfc: r8a7795: Support none GPIO pins bias setting

Simon Horman (1):
      pinctrl: sh-pfc: r8a7793: Implement voltage switching for SDHI

Takeshi Kihara (1):
      pinctrl: sh-pfc: r8a7796: Add MSIOF pins, groups and functions

Ulrich Hecht (1):
      pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |    1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c |  450 ++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 1920 +++++++++++++++++++++++++++++++++-
 3 files changed, 2158 insertions(+), 213 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
