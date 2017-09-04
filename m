From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for v4.14
Date: Mon, 4 Sep 2017 21:54:45 +0200
Message-ID: <CACRpkdbY3bKWDZnr6TmKYfC0g4YJQ3SQMVw9-d6DoBV13UmrNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35476 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753953AbdIDTyq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Sep 2017 15:54:46 -0400
Received: by mail-oi0-f46.google.com with SMTP id n18so10598338oig.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Sep 2017 12:54:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

the following constitutes the big pin control pull request for v4.14.
There are just a few bigger changes (new drivers mostly) and then
a lot of small patches all over the place.

The details are in the signed tag.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit ef954844c7ace62f773f4f23e28d2d915adc419f:

  Linux 4.13-rc5 (2017-08-13 16:01:32 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.14-1

for you to fetch changes up to ac059e2aa01dcbbd7e0b2609abbef5790486fafe:

  Revert "pinctrl: sunxi: Don't enforce bias disable (for now)"
(2017-08-31 15:51:49 +0200)

----------------------------------------------------------------
This is the big bulk of pin control changes for the v4.14 kernel:

Core changes:
- Decision to wrap the sleep mode of the Spreadtrum and in the future
  others into a specially tagged state. The generic DT bindings and the
  new Spreadtrum driver conforms to this. Others should be moved over
  if possible.

New drivers:
- New driver for Spreadtrum SoCs especially the SC9860 SoC.
- New driver for Storlink/Cortina Gemini 3512 and 3516 SoCs.

New subdrivers:
- Intel Denverton subdriver.
- Intel Cannon Lake subdriver.
- Intel Lewisburg subdriver.
- Allwinner sunxi: R40 subdriver for A10.
- Socionext uniphier PXs3 subdriver.
- Rockchip RK3128 subdriver.
- Renesas SH-PFC R8A77995 subdriver.

Miscellaneous:
- Qualcomm APQ8064 can handle general purpose clock muxing.
- Mediatek MT7623 PCIe mux data fixed up.
- Intel GPIO IRQs are disabled during suspend.
- Several fixes and addtions to Renesas r8a7796.
- Qualcomm SPMI GPIO supports dtest route and LV/MV subtype.
- Input schmitt trigger support in Rockchip RV1108.
- Aspeed G4 and G5 USB host/device pin control control added.
- Qualcomm IPQ4019 has matured with a few missing pin groups and
  control bits put in place.
- Lots of constification, this is the latest in cocinelle fixes.

----------------------------------------------------------------
Andrew Jeffery (5):
      dt-bindings: pinctrl: aspeed: Add g4 USB functions
      dt-bindings: pinctrl: aspeed: Add g5 USB functions
      pinctrl: aspeed: g4: Add USB device and host support
      pinctrl: aspeed: g5: Add USB device and host support
      pinctrl: aspeed: Rework strap register write logic for the AST2500

Andy Shevchenko (2):
      pinctrl: intel: Decrease indentation in intel_gpio_set()
      pinctrl: intel: Read back TX buffer state

Andy Yan (1):
      pinctrl: rockchip: add input schmitt support for rv1108

Baolin Wang (3):
      pinctrl: Add sleep related state to indicate sleep related configs
      dt-bindings: pinctrl: Add DT bindings for Spreadtrum SC9860
      pinctrl: sprd: Add Spreadtrum pin control driver

Bhumika Goyal (1):
      pinctrl: freescale: make mxs_regs const

Christian Lamparter (1):
      dt-bindings: pinctrl: add most other IPQ4019 pin functions and groups

Dan Carpenter (1):
      pinctrl: rza1: off by one in rza1_parse_gpiochip()

David Wu (3):
      pinctrl: rockchip: Use common interface for recalced iomux
      pinctrl: rockchip: Add rk3128 pinctrl support
      pinctrl: rockchip: Add rv1108 recalculated iomux support

Dong Aisheng (6):
      dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
      pinctrl: imx: switch to use the generic pinmux property
      pinctrl: imx: add imx7ulp driver
      pinctrl: imx: remove gpio_request_enable and gpio_disable_free
      pinctrl: imx: make imx_pmx_ops.gpio_set_direction platform
specific callbacks
      pinctrl: pinctrl-imx7ulp: add gpio_set_direction support

Fenglin Wu (3):
      pinctrl: qcom: spmi-gpio: Add support for GPIO LV/MV subtype
      pinctrl: qcom: spmi-gpio: Add dtest route for digital input
      pinctrl: qcom: spmi-gpio: Correct power_source range check

Geert Uytterhoeven (3):
      pinctrl: sh-pfc: r8a7795: Add MSIOF pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Fix MSIOF3 SS2_E mux
      pinctrl: sh-pfc: r8a7791: Add missing mmc_data8_b pin group

Gustavo A. R. Silva (10):
      pinctrl: rza1: constify gpio_chip structure
      pinctrl: vt8500: wmt: constify gpio_chip structure
      pinctrl: nomadik: abx500: constify gpio_chip structure
      pinctrl: coh901: constify gpio_chip structure
      pinctrl: qcom: ssbi-gpio: constify gpio_chip structure
      pinctrl: qcom: msm: constify gpio_chip structure
      pinctrl: st: constify gpio_chip structure
      pinctrl: bcm2835: constify gpio_chip structure
      pinctrl: qcom: ssbi: mpp: constify gpio_chip structure
      pinctrl: amd: fix error return code in amd_gpio_probe()

Hans de Goede (1):
      pinctrl: baytrail: Do not call WARN_ON for a firmware bug

Icenowy Zheng (4):
      pinctrl: sunxi: add support of R40 to A10 pinctrl driver
      pinctrl: sunxi: rename R_PIO i2c pin function name
      pinctrl: sunxi: fix V3s pinctrl driver IRQ bank base
      pinctrl: sunxi: fix wrong irq_banks number for H5 pinctrl

Jacopo Mondi (1):
      pinctrl: rza1: Remove suffix from gpiochip label

Julia Lawall (17):
      pinctrl: bcm281xx: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: artpec6: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: armada-37xx: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: st: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
      pinctrl: sirf: atlas7: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: sirf: constify pinconf_ops, pinctrl_ops, and pinmux_ops
structures
      pinctrl: digicolor: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: aspeed: g4: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: aspeed: g5: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: adi2: constify pinconf_ops, pinctrl_ops, and pinmux_ops
structures
      pinctrl: ingenic: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: rza1: constify pinconf_ops, pinctrl_ops, and pinmux_ops
structures
      pinctrl: tb10x: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: tz1090-pdc: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: tz1090: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: ti-iodelay: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures
      pinctrl: vt8500: constify pinconf_ops, pinctrl_ops, and
pinmux_ops structures

Katsuhiro Suzuki (1):
      pinctrl: uniphier: add Audio out pin-mux settings

Krzysztof Kozlowski (7):
      pinctrl: samsung: Fix NULL pointer exception on external
interrupts on S3C24xx
      pinctrl: samsung: Fix invalid register offset used for
Exynos5433 external interrupts
      pinctrl: samsung: dt-bindings: Use better name for external
interrupt function
      pinctrl: samsung: Use define from dt-bindings for pin mux function
      pinctrl: samsung: Use unsigned int for number of controller IO
mem resources
      pinctrl: samsung: Consistently use unsigned instead of u32 for nr_banks
      pinctrl: samsung: Remove unneeded local variable initialization

Kunihiko Hayashi (1):
      pinctrl: uniphier: fix members of rmii group for Pro4

Linus Walleij (5):
      pinctrl: Add DT bindings for Cortina Gemini
      pinctrl: add a Gemini SoC pin controller
      Merge tag 'samsung-pinctrl-4.14' of
git://git.kernel.org/.../pinctrl/samsung into devel
      MAINTAINERS: Update the Gemini maintainer list
      Merge tag 'sh-pfc-for-v4.14-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel

Markus Elfring (2):
      pinctrl: core: Delete an error message
      pinctrl: Delete an error message

Masahiro Yamada (13):
      pinctrl: uniphier: remove unneeded EXPORT_SYMBOL_GPL()
      pinctrl: uniphier: fix pin_config_get() for input-enable
      pinctrl: uniphier: clean up GPIO port muxing
      pinctrl: uniphier: omit redundant input enable bit information
      pinctrl: uniphier: add suspend / resume support
      pinctrl: uniphier: add UniPhier PXs3 pinctrl driver
      pinctrl: move const qualifier before struct
      pinctrl: uniphier: widen all pinconf-derived arguments to u32
      pinctrl: armada-37xx: add static to local data
      pinctrl: sirf: add static to local data
      pinctrl: nomadik: fix incorrect type in return expression
      pinctrl: add __rcu annotations to fix sparse warnings
      pinctrl: check ops->pin_config_set in pinconf_set_config()

Mika Westerberg (3):
      pinctrl: intel: Add Intel Denverton pin controller support
      pinctrl: intel: Add Intel Cannon Lake PCH-H pin controller support
      pinctrl: intel: Add Intel Lewisburg GPIO support

Nava kishore Manne (2):
      pinctrl: zynq: Fix kernel doc warnings
      pinctrl: zynq: Fix warnings in the driver

Peter Robinson (1):
      pinctrl: intel: wrap Intel pin control drivers in an architecture check

Philipp Zabel (3):
      pinctrl: stm32: explicitly request exclusive reset control
      pinctrl: sunxi: explicitly request exclusive reset control
      pinctrl: tegra: explicitly request exclusive reset control

Priit Laes (1):
      Revert "pinctrl: sunxi: Don't enforce bias disable (for now)"

Ram Chandra Jangir (2):
      pinctrl: qcom: ipq4019: add most remaining pin definitions
      pinctrl: msm: add support to configure ipq40xx GPIO_PULL bits

Rob Herring (1):
      pinctrl: Convert to using %pOF instead of full_name

Rushikesh S Kadam (1):
      pinctrl: intel: Disable GPIO pin interrupts in suspend

Ryder Lee (1):
      pinctrl: mediatek: update PCIe mux data for MT7623

Sergei Shtylyov (2):
      pinctrl: sirf: atlas7: fix of_irq_get() error check
      pinctrl-st: fix of_irq_to_resource() result check

Shawn Guo (1):
      pinctrl: zte: fix 'functions' allocation in zx_pinctrl_build_state()

Takeshi Kihara (30):
      pinctrl: sh-pfc: r8a7795: Fix MSIOF3_{SS1,SS2}_E pin function definitions
      pinctrl: sh-pfc: r8a7796: Fix MSIOF3_{SS1,SS2}_E pin function definitions
      pinctrl: sh-pfc: r8a7796: Fix IPSR setting for MSIOF3_SS1_E pin
      pinctrl: sh-pfc: r8a7796: Fix MOD_SEL1 bit[25:24] to 0x3 when
using STP_ISEN_1_D
      pinctrl: sh-pfc: r8a7796: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
      pinctrl: sh-pfc: r8a7796: Fix SCIF_CLK_{A,B} pin's MOD_SEL
assignment to MOD_SEL1 bit10
      pinctrl: sh-pfc: r8a7796: Fix FMCLK{_C,_D} and FMIN{_C,_D} pin
function definitions
      pinctrl: sh-pfc: r8a7796: Fix NFDATA{0..13} and
NF{ALE,CLE,WE_N,RE_N} pin function definitions
      pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment
for TCLK{1,2}_{A,B} pins group
      pinctrl: sh-pfc: r8a7796: Fix to delete FSCLKST pin and IPSR7
bit[15:12] register definitions
      pinctrl: sh-pfc: r8a7796: Fix to delete SATA_DEVSLP_B pins
function definitions
      pinctrl: sh-pfc: r8a7796: Fix to delete MOD_SEL0 bit2 register definitions
      pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin
assignment for FSO pins group
      pinctrl: sh-pfc: r8a7796: Rename CS1# pin function definitions
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL1 bit[25:24] to 0x3 when
using STP_ISEN_1_D
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
      pinctrl: sh-pfc: r8a7795: Fix SCIF_CLK_{A,B} pin's MOD_SEL
assignment to MOD_SEL1 bit10
      pinctrl: sh-pfc: r8a7795: Fix FMCLK{_C,_D} and FMIN{_C,_D} pin
function definitions
      pinctrl: sh-pfc: r8a7795: Fix NFDATA{0..13} and
NF{ALE,CLE,WE_N,RE_N} pin function definitions
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL register pin assignment
for TCLK{1,2}_{A,B} pins group
      pinctrl: sh-pfc: r8a7795: Fix to delete FSCLKST pin and IPSR7
bit[15:12] register definitions
      pinctrl: sh-pfc: r8a7795: Rename CS1# pin function definitions
      pinctrl: sh-pfc: r8a7795: Fix to reserved MOD_SEL2 bit22
      pinctrl: sh-pfc: r8a7796: Add USB2.0 host pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add USB3.0 host pins, groups and functions
      pinctrl: sh-pfc: Initial R8A77995 PFC support
      pinctrl: sh-pfc: r8a77995: Add SCIF pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add I2C pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add MMC pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add voltage switch operations for MMC

Thierry Reding (2):
      pinctrl: sirf: atlas7: Initialize GPIO offset
      pinctrl: bcm2835: Remove unneeded irq_group field

Vinay Simha BN (1):
      pinctrl: qcom: General Purpose clocks for apq8064

Vivek Gautam (1):
      pinctrl: Add pmi8994 gpio bindings

Wolfram Sang (1):
      pinctrl: sh-pfc: Propagate errors on group config

Yong Li (1):
      pinctrl: aspeed: Fix ast2500 strap register write logic

Yoshihiro Shimoda (3):
      pinctrl: sh-pfc: r8a7795: Change USB3_{OVC,PWEN} definitions
      pinctrl: sh-pfc: r8a7795: Add USB 2.0 pins, groups and functions
      pinctrl: sh-pfc: Add PORT_GP_{10,2[01]} helper macros

Zhiyong Tao (1):
      dt-bindings: pinctrl: mt2712: add binding document

 .../bindings/pinctrl/cortina,gemini-pinctrl.txt    |   59 +
 .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |   61 +
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |    8 +-
 .../bindings/pinctrl/pinctrl-bindings.txt          |    2 +
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt      |    3 +-
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      |    6 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |   26 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    1 +
 .../devicetree/bindings/pinctrl/sprd,pinctrl.txt   |   83 +
 .../bindings/pinctrl/sprd,sc9860-pinctrl.txt       |   70 +
 MAINTAINERS                                        |    5 +
 arch/arm/boot/dts/imx7ulp-pinfunc.h                |  468 ++++
 drivers/pinctrl/Kconfig                            |    8 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |   70 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |   64 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |   21 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |    1 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |    2 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |   31 +-
 drivers/pinctrl/berlin/berlin.c                    |    4 +-
 drivers/pinctrl/core.c                             |   17 +-
 drivers/pinctrl/core.h                             |    6 +-
 drivers/pinctrl/devicetree.c                       |    9 +-
 drivers/pinctrl/freescale/Kconfig                  |    7 +
 drivers/pinctrl/freescale/Makefile                 |    1 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |  131 +-
 drivers/pinctrl/freescale/pinctrl-imx.h            |   20 +
 drivers/pinctrl/freescale/pinctrl-imx23.c          |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx28.c          |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        |  364 +++
 drivers/pinctrl/freescale/pinctrl-vf610.c          |   25 +
 drivers/pinctrl/intel/Kconfig                      |   19 +
 drivers/pinctrl/intel/Makefile                     |    2 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |    4 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |  424 +++-
 drivers/pinctrl/intel/pinctrl-denverton.c          |  302 +++
 drivers/pinctrl/intel/pinctrl-intel.c              |   32 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |  343 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2701.h      |   12 +
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |    6 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |    2 +-
 drivers/pinctrl/pinconf-generic.c                  |    9 +-
 drivers/pinctrl/pinconf.c                          |   14 +-
 drivers/pinctrl/pinconf.h                          |   24 +-
 drivers/pinctrl/pinctrl-adi2.c                     |    4 +-
 drivers/pinctrl/pinctrl-amd.c                      |    4 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |    2 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   11 +-
 drivers/pinctrl/pinctrl-coh901.c                   |    2 +-
 drivers/pinctrl/pinctrl-digicolor.c                |    4 +-
 drivers/pinctrl/pinctrl-gemini.c                   | 2359 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-ingenic.c                  |    6 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  315 ++-
 drivers/pinctrl/pinctrl-rza1.c                     |   10 +-
 drivers/pinctrl/pinctrl-st.c                       |   12 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |    8 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c               |    6 +-
 drivers/pinctrl/pinctrl-tz1090.c                   |    6 +-
 drivers/pinctrl/pinctrl-zynq.c                     |   34 +-
 drivers/pinctrl/pinmux.c                           |   16 +-
 drivers/pinctrl/pinmux.h                           |   29 +-
 drivers/pinctrl/qcom/pinctrl-apq8064.c             |   42 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |  432 +++-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   27 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |   16 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  323 ++-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   32 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h           |    1 -
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c          |   37 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |   40 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   18 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   15 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   15 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 1082 ++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  146 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              | 1812 +++++++++++++++
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   11 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   23 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |   13 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   10 +-
 drivers/pinctrl/sprd/Kconfig                       |   17 +
 drivers/pinctrl/sprd/Makefile                      |    2 +
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c         |  972 ++++++++
 drivers/pinctrl/sprd/pinctrl-sprd.c                | 1113 +++++++++
 drivers/pinctrl/sprd/pinctrl-sprd.h                |   67 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    2 +-
 drivers/pinctrl/sunxi/Kconfig                      |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |  273 ++-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c          |   26 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c        |    6 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c        |    6 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c         |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    3 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |    2 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |    4 +-
 drivers/pinctrl/uniphier/Kconfig                   |    4 +
 drivers/pinctrl/uniphier/Makefile                  |    1 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |  279 ++-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |  665 ++----
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |  714 ++----
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c    |  273 +--
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c   |  386 +---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c   |  453 +---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c   |  458 +---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c   |  386 +---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c   |  989 ++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c   |  273 +--
 drivers/pinctrl/uniphier/pinctrl-uniphier.h        |   40 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |    8 +-
 drivers/pinctrl/zte/pinctrl-zx.c                   |    7 +-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |    2 +
 include/dt-bindings/pinctrl/samsung.h              |    3 +-
 include/linux/pinctrl/machine.h                    |    4 +-
 include/linux/pinctrl/pinconf-generic.h            |    2 +
 124 files changed, 13259 insertions(+), 3903 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/imx7ulp-pinfunc.h
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx7ulp.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-denverton.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-lewisburg.c
 create mode 100644 drivers/pinctrl/pinctrl-gemini.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77995.c
 create mode 100644 drivers/pinctrl/sprd/Kconfig
 create mode 100644 drivers/pinctrl/sprd/Makefile
 create mode 100644 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
 create mode 100644 drivers/pinctrl/sprd/pinctrl-sprd.c
 create mode 100644 drivers/pinctrl/sprd/pinctrl-sprd.h
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c
