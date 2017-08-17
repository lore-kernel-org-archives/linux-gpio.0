From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.14
Date: Thu, 17 Aug 2017 11:30:35 +0200
Message-ID: <1502962235-4877-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.14-tag1

for you to fetch changes up to 56d57391ab6720c4b7bbc0a0cbc079c7b7d653fb:

  pinctrl: sh-pfc: r8a77995: Add voltage switch operations for MMC (2017-08-16 14:26:32 +0200)

----------------------------------------------------------------
A bit delayed due to holidays, but here they are!

pinctrl: sh-pfc: Updates for v4.14

  - Propagate errors on group config, now r8a7740-armadillo800eva.dts is
    fixed,
  - Add MSIOF and USB2.0 pin groups on R-Car H3 ES2.0,
  - Add USB2.0 and USB3.0 pin groups on R-Car M3-W,
  - Add a missing MMC pin group on R-Car M2-W and RZ/G1M,
  - Add initial support for R-Car D3,
  - Small fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (3):
      pinctrl: sh-pfc: r8a7795: Add MSIOF pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Fix MSIOF3 SS2_E mux
      pinctrl: sh-pfc: r8a7791: Add missing mmc_data8_b pin group

Takeshi Kihara (30):
      pinctrl: sh-pfc: r8a7795: Fix MSIOF3_{SS1,SS2}_E pin function definitions
      pinctrl: sh-pfc: r8a7796: Fix MSIOF3_{SS1,SS2}_E pin function definitions
      pinctrl: sh-pfc: r8a7796: Fix IPSR setting for MSIOF3_SS1_E pin
      pinctrl: sh-pfc: r8a7796: Fix MOD_SEL1 bit[25:24] to 0x3 when using STP_ISEN_1_D
      pinctrl: sh-pfc: r8a7796: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
      pinctrl: sh-pfc: r8a7796: Fix SCIF_CLK_{A,B} pin's MOD_SEL assignment to MOD_SEL1 bit10
      pinctrl: sh-pfc: r8a7796: Fix FMCLK{_C,_D} and FMIN{_C,_D} pin function definitions
      pinctrl: sh-pfc: r8a7796: Fix NFDATA{0..13} and NF{ALE,CLE,WE_N,RE_N} pin function definitions
      pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for TCLK{1,2}_{A,B} pins group
      pinctrl: sh-pfc: r8a7796: Fix to delete FSCLKST pin and IPSR7 bit[15:12] register definitions
      pinctrl: sh-pfc: r8a7796: Fix to delete SATA_DEVSLP_B pins function definitions
      pinctrl: sh-pfc: r8a7796: Fix to delete MOD_SEL0 bit2 register definitions
      pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin assignment for FSO pins group
      pinctrl: sh-pfc: r8a7796: Rename CS1# pin function definitions
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL1 bit[25:24] to 0x3 when using STP_ISEN_1_D
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
      pinctrl: sh-pfc: r8a7795: Fix SCIF_CLK_{A,B} pin's MOD_SEL assignment to MOD_SEL1 bit10
      pinctrl: sh-pfc: r8a7795: Fix FMCLK{_C,_D} and FMIN{_C,_D} pin function definitions
      pinctrl: sh-pfc: r8a7795: Fix NFDATA{0..13} and NF{ALE,CLE,WE_N,RE_N} pin function definitions
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL register pin assignment for TCLK{1,2}_{A,B} pins group
      pinctrl: sh-pfc: r8a7795: Fix to delete FSCLKST pin and IPSR7 bit[15:12] register definitions
      pinctrl: sh-pfc: r8a7795: Rename CS1# pin function definitions
      pinctrl: sh-pfc: r8a7795: Fix to reserved MOD_SEL2 bit22
      pinctrl: sh-pfc: r8a7796: Add USB2.0 host pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add USB3.0 host pins, groups and functions
      pinctrl: sh-pfc: Initial R8A77995 PFC support
      pinctrl: sh-pfc: r8a77995: Add SCIF pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add I2C pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add MMC pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add voltage switch operations for MMC

Wolfram Sang (1):
      pinctrl: sh-pfc: Propagate errors on group config

Yoshihiro Shimoda (3):
      pinctrl: sh-pfc: r8a7795: Change USB3_{OVC,PWEN} definitions
      pinctrl: sh-pfc: r8a7795: Add USB 2.0 pins, groups and functions
      pinctrl: sh-pfc: Add PORT_GP_{10,2[01]} helper macros

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   15 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 1082 +++++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  146 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              | 1812 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    9 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   23 +-
 10 files changed, 2978 insertions(+), 122 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77995.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
