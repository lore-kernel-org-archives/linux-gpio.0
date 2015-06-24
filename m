From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for the v4.2 series
Date: Wed, 24 Jun 2015 12:12:31 +0200
Message-ID: <CACRpkdatozF+HsmuW5D_Oy955KwBpxaXhopvsmPWu12zGZUXPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34919 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751486AbbFXKMc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 06:12:32 -0400
Received: by obbop1 with SMTP id op1so23648480obb.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2015 03:12:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is my collected sack of patches for the v4.2 series. Quite a
lot of new SoC subdrivers and two new main drivers this time,
apart from that business as usual.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 5ebe6afaf0057ac3eaeb98defd5456894b44=
6d22:

  Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t
tags/pinctrl-v4.2-1

for you to fetch changes up to daecdc66968f122fe53038ded8cb7abe93e0aa8c=
:

  pinctrl: rockchip: add support for the rk3368 (2015-06-17 10:21:02 +0=
200)

----------------------------------------------------------------
Here is the bulk of pin control changes for the v4.2 series:

- Core functionality:
  - Enable exclusive pin ownership: it is possible to flag a pin
    controller so that GPIO and other functions cannot use a single
    pin simultaneously.

- New drivers:
  - NXP LPC18xx System Control Unit pin controller
  - Imagination Pistachio SoC pin controller

- New subdrivers:
  - Freescale i.MX7d SoC
  - Intel Sunrisepoint-H PCH
  - Renesas PFC R8A7793
  - Renesas PFC R8A7794
  - Mediatek MT6397, MT8127
  - SiRF Atlas 7
  - Allwinner A33
  - Qualcomm MSM8660
  - Marvell Armada 395
  - Rockchip RK3368

- Cleanups:
  - A big cleanup of the Marvell MVEBU driver rectifying it to
    correspond to reality
  - Drop platform device probing from the SH PFC driver, we are now a
    DT only shop for SuperH
  - Drop obsolte multi-platform check for SH PFC
  - Various janitorial: constification, grammar etc

- Improvements:
  - The AT91 GPIO portions now supports the set_multiple() feature
  - Split out SPI pins on the Xilinx Zynq
  - Support DTs without specific function nodes in the i.MX driver

----------------------------------------------------------------
Alexander Stein (1):
      pinctrl: at91: Add set_multiple GPIO chip feature

Andrew Bresticker (2):
      pinctrl: Add Pistachio SoC pin control binding document
      pinctrl: Add Pistachio SoC pin control driver

Antoine Tenart (2):
      pinctrl: berlin: fix spi1 SS0n function name
      pinctrl: berlin: comment the spi functions

Bjorn Andersson (2):
      pinctrl: qcom: Add MSM8660 pinctrl definitions
      pinctrl: dt-binding: Add DT binding documentation for MSM8660

=46abian Frederick (1):
      pinctrl: use ERR_CAST instead of ERR_PTR/PTR_ERR

=46abio Estevam (2):
      pinctrl: Remove .owner field
      pinctrl: samsung: Fix the pointer in PTR_ERR()

=46rank Li (1):
      pinctrl: add imx7d support

Geert Uytterhoeven (5):
      pinctrl: sh-pfc: Remove r8a73a4 platform_device_id entry
      pinctrl: Grammar s/used in as/used as/
      pinctrl: sh-pfc: r8a7740: Fix typo SCIFAB in comment
      pinctrl: sh-pfc: r8a73a4: Remove obsolete multi-platform check
      pinctrl: Spelling s/reseved/reserved/

Heiko St=C3=BCbner (2):
      pinctrl: rockchip: generalize perpin driver-strength setting
      pinctrl: rockchip: add support for the rk3368

Helmut Buchsbaum (1):
      pinctrl: zynq: configure SPI SSx pins separately

Hisashi Nakamura (1):
      pinctrl: sh-pfc: add R8A7794 PFC support

Hongzhou Yang (6):
      pinctrl: mediatek: Modify pinctrl bindings for mt6397.
      pinctrl: mt6397: Add pinfunc header file for mt6397.
      pinctrl: mediatek: add ies/smt control to common code.
      pinctrl: mediatek: Add Pinctrl/GPIO driver for mt6397.
      pinctrl: mediatek: Fix bug of ies/smt setting for mt8173.
      pinctrl: mediatek: Fix pinctrl register irq fail bug.

Joachim Eastwood (4):
      pinctrl: add lpc18xx pinctrl driver
      pinctrl: add DT bindings for lpc1850-scu pinctrl driver
      pinctrl: lpc18xx: create pin cap lookup helper
      pinctrl: lpc18xx: add the missing group function map

Jon Hunter (2):
      pinctrl: tegra-xusb: Remove unused structure
      pinctrl: tegra-xusb: Fix allocation of pins

Krzysztof Kozlowski (2):
      pinctrl: single: Constify irq_domain_ops
      gpio: Constify irq_domain_ops

Linus Walleij (5):
      pinctrl: move strict option to pinmux_ops
      pinctrl: nomadik: activate strict mux mode
      pinctrl: nomadik: assign chips dynamically
      pinctrl: mediatek: add OF dependency to MT6397
      pinctrl: improve debugfs for strict controllers

Ludovic Desroches (1):
      pinctrl: don't print unavailable function groups

Markus Pargmann (1):
      pinctrl: imx: Allow parsing DT without function nodes

Masahiro Yamada (9):
      pinctrl: zynq: add static to platform_driver remove callback
      pinctrl: zynq: fix DEFINE_ZYNQ_PINMUX_FUNCTION_MUX macro
      pinctrl: zynq: fix offset address for {SD0,SD1}_WP_CD_SEL
      pinctrl: remove useless const qualifier
      pinctrl: use "const struct ..." rather than "struct ... const"
      pinctrl: zynq: add static to zynq_pins
      pinctrl: zynq: add static const to zynq_pctrl_groups
      pinctrl: fix confusing debug message in pinctrl_register_map()
      pinctrl: make pinctrl_register() return proper error code

Mika Westerberg (1):
      pinctrl: intel: sunrisepoint: Add Intel Sunrisepoint-H support

Ray Jui (1):
      pinctrl: cygnus: fixed typo in the gpio driver

Shinobu Uehara (2):
      pinctrl: sh-pfc: r8a7794: add MMCIF pin groups
      pinctrl: sh-pfc: r8a7794: add SDHI pin groups

Sonic Zhang (1):
      pinctrl: allow exlusive GPIO/mux pin allocation

Thomas Petazzoni (34):
      pinctrl: mvebu: armada-38x: fix PCIe functions
      pinctrl: mvebu: armada-370: fix spi0 pin description
      pinctrl: mvebu: armada-375: remove non-existing NAND re/we pins
      pinctrl: mvebu: armada-xp: remove non-existing NAND pins
      pinctrl: mvebu: armada-xp: remove non-existing VDD cpu_pd functio=
ns
      pinctrl: mvebu: armada-xp: fix functions of MPP48
      pinctrl: mvebu: armada-375: remove incorrect space in pin descrip=
tion
      pinctrl: mvebu: armada-38x: fix incorrect total number of GPIOs
      pinctrl: mvebu: armada-39x: fix incorrect total number of GPIOs
      pinctrl: mvebu: armada-{375,38x,39x}: normalize naming of PTP sub=
names
      pinctrl: mvebu: armada-{38x,39x,xp}: normalize naming of DRAM fun=
ctions
      pinctrl: mvebu: armada-39x: normalize SATA present functionality =
naming
      pinctrl: mvebu: armada-39x: normalize SDIO pin naming
      pinctrl: mvebu: armada-{370,375,38x,39x}: normalize dev pins
      pinctrl: mvebu: armada-39x: align NAND pin naming
      pinctrl: mvebu: armada-{370,375,38x,39x,xp}: normalize TDM pins
      pinctrl: mvebu: armada-{370,375}: normalize PCIe pins
      pinctrl: mvebu: armada-{370,375}: normalize audio pins
      pinctrl: mvebu: armada-{370,xp}: normalize ethernet txclkout pins
      pinctrl: mvebu: armada-xp: fix binding documentation of ge1 pins
      pinctrl: mvebu: armada-370: align VDD cpu-pd pin naming with data=
sheet
      pinctrl: mvebu: armada-370: align spi1 clock pin naming
      pinctrl: mvebu: armada-xp: rename spi to spi0
      pinctrl: mvebu: armada-39x: normalize ref clock naming
      pinctrl: mvebu: armada-xp: add spi1 function
      pinctrl: mvebu: armada-xp: add nand rb function
      pinctrl: mvebu: armada-xp: add dram functions
      pinctrl: mvebu: armada-38x: add sata functions
      pinctrl: mvebu: armada-38x: add nand functions
      pinctrl: mvebu: armada-38x: add ua1 functions
      pinctrl: mvebu: armada-38x: add ptp functions
      pinctrl: mvebu: armada-39x: add missing PCIe functions
      pinctrl: mvebu: armada-39x: add missing SATA functions
      pinctrl: mvebu: armada-39x: add support for Armada 395 variant

Ulrich Hecht (3):
      pinctrl: sh-pfc: Add r8a7793 support
      pinctrl: sh-pfc: Enable building of r8a7793 PFC support
      pinctrl: sh-pfc: Add renesas,pfc-r8a7793 to binding documentation

Vishnu Patekar (1):
      pinctrl: sunxi: Add allwinner A33 PIO controller support

Wei Chen (1):
      pinctrl: sirf: add sirf atlas7 pinctrl and gpio support

Yingjoe Chen (3):
      pinctrl: mediatek: data struct optimize and remove unused member
      pinctrl: mediatek: add mtk_pctrl_spec_pull_set_samereg common cod=
e
      pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt8127

Yoshihiro Shimoda (2):
      pinctrl: sh-pfc: r8a7790: Add PWM pin groups and functions
      pinctrl: sh-pfc: r8a7791: Add PWM pin groups and functions

 .../devicetree/bindings/gpio/gpio-atlas7.txt       |   50 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    2 +
 .../bindings/pinctrl/img,pistachio-pinctrl.txt     |  217 +
 .../pinctrl/marvell,armada-370-pinctrl.txt         |   18 +-
 .../pinctrl/marvell,armada-375-pinctrl.txt         |   34 +-
 .../pinctrl/marvell,armada-38x-pinctrl.txt         |   66 +-
 .../pinctrl/marvell,armada-39x-pinctrl.txt         |   84 +-
 .../bindings/pinctrl/marvell,armada-xp-pinctrl.txt |   80 +-
 .../bindings/pinctrl/nxp,lpc1850-scu.txt           |   57 +
 .../devicetree/bindings/pinctrl/pinctrl-atlas7.txt |  109 +
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    9 +-
 .../bindings/pinctrl/qcom,msm8660-pinctrl.txt      |   90 +
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    4 +-
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    5 +-
 .../bindings/pinctrl/xlnx,zynq-pinctrl.txt         |    7 +-
 Documentation/pinctrl.txt                          |   11 +
 drivers/gpio/gpio-bcm-kona.c                       |    2 +-
 drivers/gpio/gpio-em.c                             |    2 +-
 drivers/gpio/gpio-grgpio.c                         |    2 +-
 drivers/gpio/gpio-mpc8xxx.c                        |    2 +-
 drivers/gpio/gpio-sa1100.c                         |    2 +-
 drivers/gpio/gpio-sodaville.c                      |    2 +-
 drivers/pinctrl/Kconfig                            |   19 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c          |    8 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |    4 +-
 drivers/pinctrl/berlin/berlin-bg2.c                |   18 +-
 drivers/pinctrl/berlin/berlin-bg2cd.c              |    8 +-
 drivers/pinctrl/berlin/berlin-bg2q.c               |   16 +-
 drivers/pinctrl/berlin/berlin.c                    |    4 +-
 drivers/pinctrl/core.c                             |   21 +-
 drivers/pinctrl/freescale/Kconfig                  |    7 +
 drivers/pinctrl/freescale/Makefile                 |    1 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |   59 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx7d.c          |  384 ++
 drivers/pinctrl/freescale/pinctrl-mxs.c            |    4 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    4 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |    4 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |  263 ++
 drivers/pinctrl/mediatek/Kconfig                   |   13 +
 drivers/pinctrl/mediatek/Makefile                  |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c          |   77 +
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |  358 ++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |   13 +-
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |  377 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  161 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |   75 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6397.h      |  424 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8127.h      | 1318 ++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    4 +-
 drivers/pinctrl/mvebu/pinctrl-armada-370.c         |   22 +-
 drivers/pinctrl/mvebu/pinctrl-armada-375.c         |   50 +-
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c         |  120 +-
 drivers/pinctrl/mvebu/pinctrl-armada-39x.c         |  131 +-
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c          |   98 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              |    4 +-
 drivers/pinctrl/nomadik/pinctrl-ab8505.c           |    2 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    5 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   66 +-
 drivers/pinctrl/pinctrl-adi2.c                     |    5 +-
 drivers/pinctrl/pinctrl-amd.c                      |    5 +-
 drivers/pinctrl/pinctrl-as3722.c                   |    4 +-
 drivers/pinctrl/pinctrl-at91.c                     |   20 +-
 drivers/pinctrl/pinctrl-lantiq.c                   |    4 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  | 1220 +++++
 drivers/pinctrl/pinctrl-palmas.c                   |    4 +-
 drivers/pinctrl/pinctrl-pistachio.c                | 1504 +++++++
 drivers/pinctrl/pinctrl-rockchip.c                 |  131 +-
 drivers/pinctrl/pinctrl-single.c                   |    6 +-
 drivers/pinctrl/pinctrl-st.c                       |    4 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |    4 +-
 drivers/pinctrl/pinctrl-tegra-xusb.c               |   27 +-
 drivers/pinctrl/pinctrl-tegra.c                    |    4 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c               |    4 +-
 drivers/pinctrl/pinctrl-tz1090.c                   |    4 +-
 drivers/pinctrl/pinctrl-u300.c                     |    4 +-
 drivers/pinctrl/pinctrl-zynq.c                     |   91 +-
 drivers/pinctrl/pinmux.c                           |   59 +-
 drivers/pinctrl/qcom/Kconfig                       |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    4 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c             |  984 +++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    4 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    4 +-
 drivers/pinctrl/samsung/pinctrl-exynos5440.c       |    4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    6 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |   10 +
 drivers/pinctrl/sh-pfc/Makefile                    |    2 +
 drivers/pinctrl/sh-pfc/core.c                      |   15 +-
 drivers/pinctrl/sh-pfc/core.h                      |    2 +
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c               |    4 -
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |  101 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |  186 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               | 4207 ++++++++++++=
++++++
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    4 +-
 drivers/pinctrl/sirf/Makefile                      |    1 +
 drivers/pinctrl/sirf/pinctrl-atlas7.c              | 4637 ++++++++++++=
++++++++
 drivers/pinctrl/sirf/pinctrl-sirf.c                |    4 +-
 drivers/pinctrl/spear/pinctrl-spear.c              |    4 +-
 drivers/pinctrl/sunxi/Kconfig                      |    4 +
 drivers/pinctrl/sunxi/Makefile                     |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c         |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          |  513 +++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    4 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |    4 +-
 include/dt-bindings/pinctrl/mt6397-pinfunc.h       |  256 ++
 include/linux/pinctrl/consumer.h                   |    2 +-
 include/linux/pinctrl/pinctrl.h                    |    2 +-
 include/linux/pinctrl/pinmux.h                     |    6 +-
 113 files changed, 18261 insertions(+), 843 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-atlas7.=
txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-a=
tlas7.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx7d.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6397.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8127.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6397.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8127.h
 create mode 100644 drivers/pinctrl/pinctrl-lpc18xx.c
 create mode 100644 drivers/pinctrl/pinctrl-pistachio.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8660.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7794.c
 create mode 100644 drivers/pinctrl/sirf/pinctrl-atlas7.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c
 create mode 100644 include/dt-bindings/pinctrl/mt6397-pinfunc.h
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
