From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for v4.6
Date: Mon, 14 Mar 2016 14:03:41 +0100
Message-ID: <CACRpkdaMW7L4+H7pEChM56xaLzHuzhuc-NVnnS+=d-88K+hbPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34671 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964914AbcCNNDm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2016 09:03:42 -0400
Received: by mail-ob0-f170.google.com with SMTP id ts10so174689636obc.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2016 06:03:42 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is the bulk of stuff I queued up for the v4.6 development cycle.
At one point things were smashing and clashing in linux-next because
of fixes upstream and new patches so I merged in v4.5-rc5 and things
calmed down again.

Notable is the new MCU drivers, the buzzytalk about IoT is ceasing
and people show us some code, nice.

The details are in the signed tag as usual.

Please pull this in!

Yours,
Linus Walleij

The following changes since commit 81f70ba233d5f660e1ea5fe23260ee323af5d53a:

  Linux 4.5-rc5 (2016-02-20 13:39:35 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.6-1

for you to fetch changes up to 3c177a166253653bf9c377eb28a5155ea2d9b631:

  pinctrl: single: Use a separate lockdep class (2016-03-11 23:03:06 +0700)

----------------------------------------------------------------
Pin control changes for kernel v4.6:

An almost purely driver related set of changes with no
major changes to the framework, only one patch adding
an unlocked version of the pinctrl_find_gpio_range_from_pin()
library call.

New drivers:
- ST Microelectronics STM32 MCU support: this is a non-MMU
  low-end platform for IoT things (etc).
- Microchip PIC32 MCU support: same story as for STM32.

New subdrivers:
- Allwinner SunXi H3 R_PIO controller support.
- Qualcomm IPQ4019 support.
- MediaTek MT2701 and MT7623.
- Allwinner A64

Non-critical fixes:
- gpio_disable_free() for the Vybrid.
- pinctrl single: use a separate lockdep class.

Misc:
- Substantial cleanups and rewrites for the Super-H PFC
  driver and subdrivers.
- Various fixes and cleanups, especially Paul Gortmakers
  work to make nonmodular drivers nonmodular.

----------------------------------------------------------------
Andre Przywara (1):
      drivers: pinctrl: add driver for Allwinner A64 SoC

Andrey Gusakov (1):
      pinctrl: sh-pfc: r8a7794: Fix GP2[29] muxing

Andrzej Hajda (1):
      pinctrl: mediatek: fix handling return value of mtk_pmx_find_gpio_mode

Arnd Bergmann (2):
      pinctrl: coh901: fix initconst annotation
      pinctrl: at91: use __maybe_unused to hide pm functions

Biao Huang (5):
      pinctrl: dt bindings: Add pinfunc header file for mt2701
      pinctrl: mediatek: Add Pinctrl/GPIO/EINT driver for mt2701
      pinctrl: mediatek: Add gpio_request_enable support
      pinctrl: mediatek: add input-enable setting in gpio_request_enable
      pinctrl: mediatek: add input-enable and direction setting for
eint resources

Carlo Caione (2):
      pinctrl: amlogic: Separate some pin functions for Meson8 / Meson8b
      pinctrl: amlogic: Make driver independent from two-domain configuration

Colin Ian King (1):
      pinctrl: lpc18xx: ensure ngroups is initialized at correct place

David Wu (1):
      pinctrl: rockchip: add support for the rk3399

Geert Uytterhoeven (4):
      pinctrl: sh-pfc: Improve pinmux macros documentation
      pinctrl: sh-pfc: Rename PINMUX_IPSR_DATA() to PINMUX_IPSR_GPSR()
      pinctrl: sh-pfc: r8a7795: Rename SSI_{WS,SCK}0129 to SSI_{WS,SCK}01239
      pinctrl: sh-pfc: r8a7795: Remove bits SEL_VSP_1 and SEL_VSP_0

Helmut Buchsbaum (1):
      pinctrl: zynq: fix typo in group name for qspi1

Henry Paulissen (2):
      pinctrl: sunxi: Remove non existing irq's
      pinctrl: sunxi: Change mux setting on PI irq pins

Jean Delvare (2):
      pinctrl: intel: Remove unneeded header includes
      pinctrl: Turn AMD support to tristate

Joachim Eastwood (3):
      pinctrl: core: create nolock version of pinctrl_find_gpio_range_from_pin
      pinctrl: lpc18xx: add nxp,gpio-pin-interrupt property
      pinctrl: lpc1850-scu: document nxp,gpio-pin-interrupt

John Crispin (2):
      pinctrl: mediatek: Modify pinctrl bindings for mt7623
      pinctrl: mediatek: Add Pinctrl/GPIO/EINT driver for MT7623

Joshua Henderson (2):
      pinctrl: Add DT bindings for PIC32 pin control and GPIO
      pinctrl: pinctrl-pic32: Add PIC32 pin control driver

Krzysztof Adamski (3):
      pinctrl: sunxi: Add H3 R_PIO controller support
      pinctrl: sunxi: Use pin number when calling sunxi_pmx_set
      pinctrl: sunxi: Add missing H3 R_PIO binding documentation

Linus Walleij (9):
      pinctrl: nomadik: stn8815 CLCD alternate functions
      pinctrl: stm32: fix compile error and modernize
      Merge branch 'devel-mt2701' into devel
      pinctrl: mtk2701: skip setting .owner
      Merge branch 'sh-pfc-for-v4.6' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: mediatek/7623: delete unnecessary .owner
      Merge branch 'sh-pfc-for-v4.6' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: pxa2xx: export symbols
      Merge tag 'v4.5-rc5' into devel

Magnus Damm (2):
      pinctrl: sh-pfc: r8a7795: Add support for INTC-EX IRQ pins
      pinctrl: sh-pfc: Rework PFC GPIO support

Masahiro Yamada (6):
      pinctrl: pxa: guard sub-directory with CONFIG_PINCTRL_PXA
      pinctrl: sunxi: guard sub-directory with CONFIG_PINCTRL_SUNXI
      pinctrl: tegra: move Tegra pinctrl drivers to sub-directory
      pinctrl: uniphier: add COMPILE_TEST option
      pinctrl: mediatek: guard sub-directory with CONFIG_PINCTRL_MTK
      pinctrl: uniphier: rename CONFIG options and file names

Maxime Coquelin (4):
      Documentation: dt-bindings: Document STM32 pinctrl driver DT bindings
      pinctrl: Add STM32 MCUs support
      pinctrl: stm32: Remove dependency with DT bindings header files
      pinctrl: stm32: Fix compile testing selection

Patrice Chotard (1):
      pinctrl: st: activate strict mux mode

Paul Gortmaker (7):
      pinctrl: mediatek: mt8* make driver explicitly non-modular
      pinctrl: sunxi: does not need module.h
      pinctrl: pinctrl-mt6397 driver explicitly non-modular
      pinctrl: meson: make explicitly non-modular
      pinctrl: sh-pfc: make explicitly non-modular
      pinctrl: stm32: make explicitly non-modular
      pinctrl: sunxi: make A80 explicitly non-modular

Phil Elwell (1):
      pinctrl-bcm2835: Fix cut-and-paste error in "pull" parsing

Philipp Zabel (1):
      pinctrl: imx: attach iomuxc device to gpr syscon

Ramesh Shanmugasundaram (2):
      pinctrl: sh-pfc: r8a7795: Add CAN support
      pinctrl: sh-pfc: r8a7795: Add CAN FD support

Ryo Kataoka (2):
      pinctrl: sh-pfc: r8a7794: Add SSI pin groups
      pinctrl: sh-pfc: r8a7794: Add audio clock pin groups

Sergei Shtylyov (1):
      pinctrl: sh-pfc: r8a7794: Add EtherAVB pin groups

Simon Horman (1):
      pinctrl: sh-pfc: Use ARCH_RENESAS

Stefan Agner (1):
      pinctrl: freescale: imx: implement gpio_disable_free for Vybrid

Stephen Boyd (1):
      pinctrl: qcom: spmi-mpp: Skip pullup on ULT type MPPs

Sudeep Holla (1):
      pinctrl: single: Use a separate lockdep class

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a7795: Add USB2.0 host support
      pinctrl: sh-pfc: r8a7795: Add PWM support

Varadarajan Narayanan (1):
      pinctrl: qcom: ipq4019: Add IPQ4019 pinctrl support

Wei Yongjun (1):
      pinctrl: Fix return value check in amd_gpio_probe()

Wolfram Sang (1):
      pinctrl: sh-pfc: core: don't open code of_device_get_match_data()

Yendapally Reddy Dhananjaya Reddy (1):
      pinctrl: Broadcom Northstar2 pinctrl device tree bindings

 .../bindings/gpio/microchip,pic32-gpio.txt         |   49 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    2 +
 .../bindings/pinctrl/brcm,ns2-pinmux.txt           |  102 +
 .../bindings/pinctrl/microchip,pic32-pinctrl.txt   |   60 +
 .../bindings/pinctrl/nxp,lpc1850-scu.txt           |   14 +
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      |   74 +
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    2 +-
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |  126 ++
 arch/arm/boot/dts/mt2701-pinfunc.h                 |  735 +++++++
 drivers/pinctrl/Kconfig                            |   52 +-
 drivers/pinctrl/Makefile                           |   16 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    2 +-
 drivers/pinctrl/core.c                             |   35 +-
 drivers/pinctrl/core.h                             |    4 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |   36 +
 drivers/pinctrl/freescale/pinctrl-imx.h            |    1 +
 drivers/pinctrl/freescale/pinctrl-imx50.c          |    1 +
 drivers/pinctrl/freescale/pinctrl-imx53.c          |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6dl.c         |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6q.c          |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6sl.c         |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6sx.c         |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6ul.c         |    1 +
 drivers/pinctrl/freescale/pinctrl-imx7d.c          |    1 +
 drivers/pinctrl/intel/pinctrl-intel.c              |    4 -
 drivers/pinctrl/mediatek/Kconfig                   |   22 +-
 drivers/pinctrl/mediatek/Makefile                  |   12 +-
 drivers/pinctrl/mediatek/pinctrl-mt2701.c          |  585 +++++
 drivers/pinctrl/mediatek/pinctrl-mt6397.c          |   10 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c          |  379 ++++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |    8 +-
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |    8 +-
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |    8 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   55 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |   12 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2701.h      | 2323 ++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h      | 1936 ++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |  143 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   21 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |  137 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  182 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c  |    7 +
 drivers/pinctrl/pinctrl-amd.c                      |    4 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    4 +-
 drivers/pinctrl/pinctrl-coh901.c                   |    2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  148 +-
 drivers/pinctrl/pinctrl-pic32.c                    | 2312 +++++++++++++++++++
 drivers/pinctrl/pinctrl-pic32.h                    |  141 ++
 drivers/pinctrl/pinctrl-rockchip.c                 |  369 +++-
 drivers/pinctrl/pinctrl-single.c                   |    8 +
 drivers/pinctrl/pinctrl-st.c                       |    1 +
 drivers/pinctrl/pinctrl-zynq.c                     |    2 +-
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c               |    3 +-
 drivers/pinctrl/qcom/Kconfig                       |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |  453 ++++
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |   30 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |   56 +-
 drivers/pinctrl/sh-pfc/Makefile                    |    7 +-
 drivers/pinctrl/sh-pfc/core.c                      |   24 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  690 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c               | 1136 +++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |  774 +++----
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |  624 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               | 1405 ++++++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  915 +++++---
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |  412 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   98 +-
 drivers/pinctrl/stm32/Kconfig                      |   16 +
 drivers/pinctrl/stm32/Makefile                     |    5 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  829 +++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h              |   51 +
 drivers/pinctrl/stm32/pinctrl-stm32f429.c          | 1591 ++++++++++++++
 drivers/pinctrl/sunxi/Kconfig                      |   36 +-
 drivers/pinctrl/sunxi/Makefile                     |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c         |  601 +++++
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c          |   32 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c         |  106 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c        |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    7 +-
 drivers/pinctrl/tegra/Kconfig                      |   30 +
 drivers/pinctrl/tegra/Makefile                     |    7 +
 drivers/pinctrl/{ => tegra}/pinctrl-tegra-xusb.c   |    4 +-
 drivers/pinctrl/{ => tegra}/pinctrl-tegra.c        |    4 +-
 drivers/pinctrl/{ => tegra}/pinctrl-tegra.h        |    0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra114.c     |    0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra124.c     |    0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra20.c      |    0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra210.c     |    0
 drivers/pinctrl/{ => tegra}/pinctrl-tegra30.c      |    0
 drivers/pinctrl/uniphier/Kconfig                   |   14 +-
 drivers/pinctrl/uniphier/Makefile                  |   14 +-
 .../{pinctrl-ph1-ld4.c => pinctrl-uniphier-ld4.c}  |    0
 ...{pinctrl-ph1-ld6b.c => pinctrl-uniphier-ld6b.c} |    0
 ...{pinctrl-ph1-pro4.c => pinctrl-uniphier-pro4.c} |    0
 ...{pinctrl-ph1-pro5.c => pinctrl-uniphier-pro5.c} |    0
 ...nctrl-proxstream2.c => pinctrl-uniphier-pxs2.c} |    0
 ...{pinctrl-ph1-sld8.c => pinctrl-uniphier-sld8.c} |    0
 include/dt-bindings/pinctrl/mt7623-pinfunc.h       |  520 +++++
 100 files changed, 17651 insertions(+), 3027 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/mt2701-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt2701.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7623.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt2701.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h
 create mode 100644 drivers/pinctrl/pinctrl-pic32.c
 create mode 100644 drivers/pinctrl/pinctrl-pic32.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq4019.c
 create mode 100644 drivers/pinctrl/stm32/Kconfig
 create mode 100644 drivers/pinctrl/stm32/Makefile
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.h
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f429.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c
 create mode 100644 drivers/pinctrl/tegra/Kconfig
 create mode 100644 drivers/pinctrl/tegra/Makefile
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra-xusb.c (99%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra.c (99%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra.h (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra114.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra124.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra20.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra210.c (100%)
 rename drivers/pinctrl/{ => tegra}/pinctrl-tegra30.c (100%)
 rename drivers/pinctrl/uniphier/{pinctrl-ph1-ld4.c =>
pinctrl-uniphier-ld4.c} (100%)
 rename drivers/pinctrl/uniphier/{pinctrl-ph1-ld6b.c =>
pinctrl-uniphier-ld6b.c} (100%)
 rename drivers/pinctrl/uniphier/{pinctrl-ph1-pro4.c =>
pinctrl-uniphier-pro4.c} (100%)
 rename drivers/pinctrl/uniphier/{pinctrl-ph1-pro5.c =>
pinctrl-uniphier-pro5.c} (100%)
 rename drivers/pinctrl/uniphier/{pinctrl-proxstream2.c =>
pinctrl-uniphier-pxs2.c} (100%)
 rename drivers/pinctrl/uniphier/{pinctrl-ph1-sld8.c =>
pinctrl-uniphier-sld8.c} (100%)
 create mode 100644 include/dt-bindings/pinctrl/mt7623-pinfunc.h
