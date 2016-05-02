From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.7 (take two)
Date: Mon,  2 May 2016 13:48:46 +0200
Message-ID: <1462189726-31833-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus,

The following changes since commit 92e6d9a2cc827018a18885e0f3050ab9ff8c3206:

  pinctrl: sh-pfc: r8a7795: Add drive strength support (2016-03-29 09:23:01 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.7-tag2

for you to fetch changes up to 56ed4bb984acbba9cfe080e45ac4b50ca63dd188:

  pinctrl: sh-pfc: r8a7794: Add DU pin groups (2016-04-15 12:31:37 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.7 (take two)

  - Support for the Display Unit on R-Car E2.

Thanks for pulling!
----------------------------------------------------------------
Koji Matsuoka (1):
      pinctrl: sh-pfc: r8a7794: Add DU pin groups

 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 217 +++++++++++++++++++++++++++++++++++
 1 file changed, 217 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
