From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for v4.1
Date: Tue, 14 Apr 2015 16:57:05 +0200
Message-ID: <CACRpkdZguXCBnTeAnmQBRo+Bs-8AO6u8aOPtd4uumfet-cfn1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:35004 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527AbbDNO5H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Apr 2015 10:57:07 -0400
Received: by iejt8 with SMTP id t8so16844569iej.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2015 07:57:06 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is the big pull request for v4.1 pin control changes.
Nothing really exciting this time: we basically added a few new
drivers and subdrivers and stabilized them in linux-next. Some
cleanups too. With sunrisepoint Intel has a real fine fully featured
pin control driver for contemporary hardware, and the AMD driver
is also for large deployments. Most of the others are ARM devices.

Some details on added drivers in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.1-1

for you to fetch changes up to 1dfe0d159dc7f7b6d1734b2010aabda2bbe87d5a:

  pinctrl: sirf: move sgpio lock into state container (2015-04-09
10:16:13 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v4.1 development
cycle:

New drivers:
  - Intel Sunrisepoint
  - AMD KERNCZ GPIO
  - Broadcom Cygnus IOMUX

New subdrivers:
  - Marvell MVEBU Armada 39x SoCs
  - Samsung Exynos 5433
  - nVidia Tegra 210
  - Mediatek MT8135
  - Mediatek MT8173
  - AMLogic Meson8b
  - Qualcomm PM8916

On top of this cleanups and development history for the above
drivers as issues were fixed after merging.

----------------------------------------------------------------
Abhilash Kesavan (1):
      pinctrl: exynos: Remove eint_gpio_init call-back for exynos7
alive pinctrl block

Andrew Bresticker (1):
      pinctrl: Document "function" + "pins" pinmux binding

Axel Lin (4):
      pinctrl: mediatek: mtk-common: Remove kfree
      pinctrl: mediatek: mt8135/mt8173: Fix build error due to missing
include file
      pinctrl: mediatek: mtk-common: Use devm_kcalloc at appropriate places
      pinctrl: mediatek: mt8135/mt8173: Constify of_device_id table

Baruch Siach (11):
      pinctrl: lantiq: fix include guard #endif comment
      pinctrl: remove maxpin from documentation
      pinctrl: at91: simplify probe error handling
      pinctrl: remove enable/disable callbacks from documentation
      pinctrl: remove doc mention of the enable/disable API
      pinctrl: staticise example code funcs/structs
      pinctrl: fix example .get_group_pins implementation signature
      pinctrl: dt-binding: fix typo
      pinctrl: dt-binding: fix generic pinmux/pinconf examples
      pinctrl: pinconf-generic: scan also referenced phandle node
      pinctrl: pinconf-generic: add dt node names to error messages

Ben Dooks (1):
      pinctrl: at91: convert __raw to endian agnostic IO

Carlo Caione (3):
      pinctrl: Cleanup Meson8 driver
      documentation: Extend pinctrl docs for Meson8b
      pinctrl: Add support for Meson8b

Chanwoo Choi (1):
      pinctrl: exynos: Add support for Exynos5433

Charles Keepax (1):
      pinctrl: bcm2835: Fix support for threaded level triggered IRQs

Colin Ian King (1):
      pinctrl: sirf: fix typo in kernel warning on a bad interrupt

Fabian Frederick (1):
      pinctrl: constify of_device_id array

Geert Uytterhoeven (8):
      pinctrl: sh-pfc: Do not overwrite bias configuration
      pinctrl: sh-pfc: Use u32 to store register data
      pinctrl: sh-pfc: Store register/field widths in u8 instead of
unsigned long
      pinctrl: sh-pfc: Use unsigned int for register/field widths and offsets
      pinctrl: sh-pfc: Use reg_width instead of reg as sentinel
      pinctrl: sh-pfc: Use u32 to store register addresses
      pinctrl: sh-pfc: Remove emev2 platform_device_id entry
      pinctrl: sh-pfc: Remove r8a7790 platform_device_id entry

Guenter Roeck (1):
      pinctrl: mediatek: Fix include directive

Hongzhou Yang (4):
      pinctrl: dt-bindings: Add pinctrl bindings for mt65xx/mt81xx.
      pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.
      arm64: mediatek: Add Pinctrl/GPIO/EINT driver for mt8173.
      pinctrl: mediatek: fix build error

Ivan T. Ivanov (1):
      pinctrl: Add support for PM8916 GPIO's and MPP's

Ken Xue (2):
      pinctrl: add AMD GPIO driver support.
      Fix inconsistent spinlock of AMD GPIO driver which can be
recognized by static analysis tool smatch. Declare constant
Variables with Sparse's suggestion.

Laurent Pinchart (1):
      pinctrl: sh-pfc: Remove r8a7791 platform_device_id entry

Lee Jones (5):
      pinctrl: st: Introduce a 'get pin function' call
      pinctrl: st: Move st_get_pio_control() further up the source file
      pinctrl: st: Supply a GPIO get_direction() call-back
      pinctrl: st: Show correct pin direction also in GPIO mode
      pinctrl: st: Display pin's function when printing pinctrl debug
information

Linus Walleij (1):
      pinctrl: sirf: move sgpio lock into state container

Maoguang Meng (1):
      pinctrl: mediatek: Add EINT support to MTK pinctrl driver.

Markus Pargmann (1):
      pinctrl: fsl: imx: Check for 0 config register

Mika Westerberg (1):
      pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support

Ray Jui (5):
      pinctrl: bcm: consolidate Broadcom pinctrl drivers
      pinctrl: Broadcom Cygnus pinctrl device tree binding
      pinctrl: cygnus: add initial IOMUX driver support
      pinctrl: Cygnus: define Broadcom Cygnus GPIO/PINCONF binding
      pinctrl: cygnus: add gpio/pinconf driver

Sanjeev Sharma (1):
      pinctrl: freescale: make of_device_id array const

Sergei Shtylyov (1):
      sh-pfc: r8a7790: add EtherAVB pin groups

Stanimir Varbanov (2):
      pinctrl: qcom: enable generic pinconf
      pinctrl: qcom: handle input-enable pinconf property

Stefan Agner (2):
      pinctrl: imx: do not implicitly set pin regs to -1
      pinctrl: tegra: use signed bitfields for optional fields

Stephen Warren (4):
      pinctrl: tegra: driver layout/consistency fixes
      pinctrl: tegra: some bits move between registers
      pinctrl: tegra: support nvidia,io-hv DT property
      pinctrl: tegra: add a driver for Tegra210

Thomas Petazzoni (3):
      pinctrl: mvebu: add pinctrl driver for Marvell Armada 39x
      devicetree: bindings: add Device Tree bindings for Armada 39x
pin-muxing controller
      pinctrl: mvebu: add suspend/resume support to Armada XP pinctrl driver

Yingjoe Chen (2):
      pinctrl: mediatek: emulate GPIO interrupt on both-edges
      pinctrl: mediatek: Adjust mt8173 pinctrl kconfig

 .../bindings/pinctrl/brcm,cygnus-gpio.txt          |   98 +
 .../bindings/pinctrl/brcm,cygnus-pinmux.txt        |  132 ++
 .../pinctrl/marvell,armada-39x-pinctrl.txt         |   78 +
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |    2 +-
 .../bindings/pinctrl/nvidia,tegra210-pinmux.txt    |  166 ++
 .../bindings/pinctrl/pinctrl-bindings.txt          |   39 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |  145 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    2 +
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |    2 +
 Documentation/pinctrl.txt                          |   25 +-
 drivers/pinctrl/Kconfig                            |   31 +-
 drivers/pinctrl/Makefile                           |    6 +-
 drivers/pinctrl/bcm/Kconfig                        |   56 +
 drivers/pinctrl/bcm/Makefile                       |    6 +
 drivers/pinctrl/{ => bcm}/pinctrl-bcm281xx.c       |    4 +-
 drivers/pinctrl/{ => bcm}/pinctrl-bcm2835.c        |   28 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c          |  907 +++++++++
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           | 1022 ++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c            |   15 +-
 drivers/pinctrl/freescale/pinctrl-vf610.c          |    2 +-
 drivers/pinctrl/intel/Kconfig                      |   17 +
 drivers/pinctrl/intel/Makefile                     |    2 +
 drivers/pinctrl/intel/pinctrl-intel.c              | 1149 +++++++++++
 drivers/pinctrl/intel/pinctrl-intel.h              |  128 ++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |  336 ++++
 drivers/pinctrl/mediatek/Kconfig                   |   23 +
 drivers/pinctrl/mediatek/Makefile                  |    6 +
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |  376 ++++
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |  455 +++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      | 1257 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |  229 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h      | 2114 ++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h      | 1226 ++++++++++++
 drivers/pinctrl/meson/Makefile                     |    2 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |    9 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |    9 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             | 1050 +++++-----
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  899 +++++++++
 drivers/pinctrl/mvebu/Kconfig                      |    4 +
 drivers/pinctrl/mvebu/Makefile                     |    1 +
 drivers/pinctrl/mvebu/pinctrl-armada-370.c         |    2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-375.c         |    2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c         |    2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-39x.c         |  432 ++++
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c          |   42 +-
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c           |    2 +-
 drivers/pinctrl/mvebu/pinctrl-orion.c              |    2 +-
 drivers/pinctrl/pinconf-generic.c                  |   54 +-
 drivers/pinctrl/pinctrl-amd.c                      |  869 ++++++++
 drivers/pinctrl/pinctrl-amd.h                      |  261 +++
 drivers/pinctrl/pinctrl-as3722.c                   |    2 +-
 drivers/pinctrl/pinctrl-at91.c                     |   60 +-
 drivers/pinctrl/pinctrl-lantiq.h                   |    2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |    2 +-
 drivers/pinctrl/pinctrl-single.c                   |    4 +-
 drivers/pinctrl/pinctrl-st.c                       |   85 +-
 drivers/pinctrl/pinctrl-tegra.c                    |   28 +-
 drivers/pinctrl/pinctrl-tegra.h                    |   43 +-
 drivers/pinctrl/pinctrl-tegra114.c                 |   17 +-
 drivers/pinctrl/pinctrl-tegra124.c                 |   32 +-
 drivers/pinctrl/pinctrl-tegra20.c                  |    3 +
 drivers/pinctrl/pinctrl-tegra210.c                 | 1588 +++++++++++++++
 drivers/pinctrl/pinctrl-tegra30.c                  |  116 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c               |    2 +-
 drivers/pinctrl/pinctrl-tz1090.c                   |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   17 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    1 +
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  154 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |   79 +-
 drivers/pinctrl/sh-pfc/core.h                      |    7 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |   31 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |   91 +
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   37 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   26 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun5i-a10s.c         |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun5i-a13.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c        |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c         |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c        |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c          |    2 +-
 drivers/pinctrl/vt8500/pinctrl-vt8500.c            |    2 +-
 drivers/pinctrl/vt8500/pinctrl-wm8505.c            |    2 +-
 drivers/pinctrl/vt8500/pinctrl-wm8650.c            |    2 +-
 drivers/pinctrl/vt8500/pinctrl-wm8750.c            |    2 +-
 drivers/pinctrl/vt8500/pinctrl-wm8850.c            |    2 +-
 include/dt-bindings/gpio/meson8b-gpio.h            |   32 +
 include/dt-bindings/pinctrl/mt65xx.h               |   40 +
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   15 +
 include/dt-bindings/pinctrl/qcom,pmic-mpp.h        |    4 +
 96 files changed, 15323 insertions(+), 957 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/marvell,armada-39x-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
 create mode 100644 drivers/pinctrl/bcm/Kconfig
 create mode 100644 drivers/pinctrl/bcm/Makefile
 rename drivers/pinctrl/{ => bcm}/pinctrl-bcm281xx.c (99%)
 rename drivers/pinctrl/{ => bcm}/pinctrl-bcm2835.c (98%)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-intel.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-intel.h
 create mode 100644 drivers/pinctrl/intel/pinctrl-sunrisepoint.c
 create mode 100644 drivers/pinctrl/mediatek/Kconfig
 create mode 100644 drivers/pinctrl/mediatek/Makefile
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8135.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8173.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-common.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-common.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8b.c
 create mode 100644 drivers/pinctrl/mvebu/pinctrl-armada-39x.c
 create mode 100644 drivers/pinctrl/pinctrl-amd.c
 create mode 100644 drivers/pinctrl/pinctrl-amd.h
 create mode 100644 drivers/pinctrl/pinctrl-tegra210.c
 create mode 100644 include/dt-bindings/gpio/meson8b-gpio.h
 create mode 100644 include/dt-bindings/pinctrl/mt65xx.h
