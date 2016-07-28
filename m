From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for the v4.8 kernel cycle
Date: Thu, 28 Jul 2016 11:14:18 +0200
Message-ID: <CACRpkdaWm8n-M=PT9RsynUb4eYP0zvj5ye3eyXn2ENzE+s9xSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36515 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752006AbcG1JOU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2016 05:14:20 -0400
Received: by mail-oi0-f48.google.com with SMTP id w18so54548400oiw.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2016 02:14:19 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is the bulk of the pin control changes for the v4.8 kernel cycle.

Nothing stands out as especially exiting: new drivers, new subdrivers,
lots of cleanups and incremental features.

Business as usual.

I created an immutable branch with a single patch for the ARM SoC
tree (pinctrl: pinconf: Add generic helper function for freeing mappings)
so if this appears in another pull request, all is well. The commit ID
should be identical and coming from my tree.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.8-1

for you to fetch changes up to 9573e7923007961799beff38bc5c5a7635634eef:

  pinctrl: fix pincontrol definition for marvell (2016-07-24 16:23:50 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v4.8 kernel cycle.

New drivers:

- New driver for Oxnas pin control and GPIO. This ARM-based chipset
  is used in a few storage (NAS) type devices.

- New driver for the MAX77620/MAX20024 pin controller portions.

- New driver for the Intel Merrifield pin controller.

New subdrivers:

- New subdriver for the Qualcomm MDM9615

- New subdriver for the STM32F746 MCU

- New subdriver for the Broadcom NSP SoC.

Cleanups:

- Demodularization of bool compiled-in drivers.

Apart from this there is just regular incremental improvements to
a lot of drivers, especially Uniphier and PFC.

----------------------------------------------------------------
Alexandre TORGUE (3):
      includes: dt-bindings: Add STM32F746 pinctrl DT bindings
      Documentation: dt: Add new compatible to STM32 pinctrl driver bindings
      pinctrl: Add STM32F746 MCU support

Amitoj Kaur Chawla (2):
      pinctrl: xway: Change structure initialisation to c99 style
      pinctrl: sirf: atlas7: Add missing of_node_put

Andreas Klinger (1):
      pinctrl: fix pincontrol definition for marvell

Andrew Jeffery (3):
      pinctrl: Fix grammar in pinmux request list
      pinctrl: s/have/has/ in GPIO driver interaction description
      pinctrl: Reflow/wrap paragraph describing GPIO interaction

Andy Shevchenko (3):
      pinctrl: Flag strict is a field in struct pinmux_ops
      pinctrl: intel: Add Intel Merrifield pin controller support
      pinctrl: intel: Protect set wake flow by spin lock

Arnd Bergmann (3):
      pinctrl: fix incorrect inline keyword in multiple drivers
      pinctrl: max77620: select PINMUX
      pinctrl: bcm: add OF dependencies

Baruch Siach (1):
      Revert "pinctrl: digicolor: add missing platform_set_drvdata() call"

Ben Dooks (5):
      pinctrl: nsp-gpio: fix non-static functions
      pinctrl: at91-pio4: fix non-exported functions
      pinctrl: nomadik: fix warnings from unexported functions
      pinctrl: u300: make u300_pmx_registers static
      pinctrl: rockchip: make rockchip_irq_gc_mask_set_bit static

Dan O'Donovan (3):
      pinctrl: cherryview: prevent concurrent access to GPIO controllers
      pinctrl: cherryview: add option to set open-drain pin config
      pinctrl: cherryview: add handlers for pin_config_group_get/set

Fabio Estevam (1):
      pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro

Florian Fainelli (1):
      pinctrl: Always recurse into bcm folder

Geert Uytterhoeven (4):
      pinctrl: sh-pfc: sh7757: Fix duplicate initializer in GPIO pinmux data
      pinctrl: sh-pfc: Move SoC-specific forward declarations to sh_pfc.h
      pinctrl: sh-pfc: Improve core and user API separation
      pinctrl: sh-pfc: Convert to devm_gpiochip_add_data()

Icenowy Zheng (1):
      pinctrl: sunxi: fix nand0 function name for sun8i

Jon Hunter (3):
      pinctrl: max77620: Remove unused structure definition
      pinctrl: OF: Don't create a pinctrl handle if no pinctrl entries exist
      pinctrl: pinconf: Add generic helper function for freeing mappings

Kevin Hilman (4):
      pinctrl: amlogic: gxbb: add UART_AO_B, I2C
      pinctrl: amlogic: gxbb: add EMMC and SD pins
      pinctrl: amlogic: gxbb: add more UART pins
      pinctrl: amlogic: gxbb: add ethernet pins

Krzysztof Kozlowski (1):
      pinctrl: samsung: Suppress unbinding to prevent theoretical attacks

Kuninori Morimoto (1):
      pinctrl: sh-pfc: r8a7795: Use PINMUX_SINGLE() for I2C

Laxman Dewangan (3):
      pinctrl: tegra: Get rid of parked_reg
      pinctrl: add DT binding doc for pincontrol of PMIC max77620/max20024
      pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024

Linus Walleij (8):
      Revert "Revert "pinctrl: tegra: avoid parked_reg and parked_bank""
      pinctrl: qcom-ssbi: support for PM8058
      Merge branch 'devel-dt-free-map' into devel
      Merge tag 'sh-pfc-for-v4.8-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: qcom: add support for EBI2
      pinctrl: qcom: establish proper EBI2 pin groups
      pinctrl: qcom: update DT bindings with ebi2 groups
      pinctrl: xway: fix typo

Masahiro Yamada (27):
      pinctrl: do not care about blank pin name
      pinctrl: copy per-pin driver private data to struct pin_desc
      pinctrl: pinconf: separate config parameters with commas for debugfs
      pinctrl: digicolor: add missing platform_set_drvdata() call
      pinctrl: return -ENOMEM instead of -EINVAL for kasprintf() failure
      pinctrl: uniphier: fix .pin_dbg_show() callback
      pinctrl: uniphier: rename function and variable names
      pinctrl: uniphier: fix register offsets for drive strength control
      pinctrl: uniphier: set pinctrl_desc owner in common probe function
      pinctrl: uniphier: set pinctrl_desc name in common probe function
      pinctrl: uniphier: allocate struct pinctrl_desc in probe function
      pinctrl: uniphier: rename macros for drive strength control
      pinctrl: uniphier: support 3-bit drive strength control
      pinctrl: uniphier: support pin configuration in sparse pin space
      pinctrl: uniphier: introduce capability flag
      pinctrl: uniphier: support per-pin input enable for new SoCs
      pinctrl: uniphier: support pin configuration for dedicated pins
      pinctrl: uniphier: add dedicated pins to pin tables of PH1-LD4/sLD8
      pinctrl: uniphier: add System Bus pin-mux settings
      pinctrl: uniphier: allow to have pinctrl node under syscon node
      pinctrl: uniphier: add UniPhier PH1-LD11 pinctrl driver
      pinctrl: uniphier: add UniPhier PH1-LD20 pinctrl driver
      pinctrl: uniphier: fix NAND pin-mux settings for PH1-LD11/LD20
      pinctrl: uniphier: prohibit drive control for pin 61-66 of PH1-LD11
      pinctrl: uniphier: fix meaningless drive control offsets
      pinctrl: uniphier: remove pointless pin-mux settings for PH1-LD11
      pinctrl: uniphier: add Ethernet pin-mux settings

Mika Westerberg (2):
      pinctrl: intel: Use raw_spinlock for locking
      pinctrl: intel: Prevent force threading of the interrupt handler

Neil Armstrong (6):
      pinctrl: Add Oxford Semiconductor OXNAS pinctrl and gpio driver
      dt-bindings: Add Oxford Semiconductor OXNAS pinctrl and gpio bindings
      pinctrl: oxnas: Add GPIO get_direction
      pinctrl: oxnas: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map
      pinctrl: qcom: Add support for MDM9615 TLMM
      dt-bindings: pinctrl: Add MDM9615 TLMM bindings

Patrice Chotard (1):
      pinctrl: stm32: factorize stm32_pconf_input/output_get()

Paul Gortmaker (29):
      pinctrl: baytrail: make it explicitly non-modular
      pinctrl: at91: make it explicitly non-modular
      pinctrl: lpc18xx: make it explicitly non-modular
      pinctrl: amd: make it explicitly non-modular
      pinctrl: zynq: make it explicitly non-modular
      pinctrl: digicolor: make it explicitly non-modular
      pinctrl: at91-pio4: make it explicitly non-modular
      pinctrl: palmas: convert PINCTRL_PALMAS from bool to tristate
      pinctrl: as3722: convert PINCTRL_AS3722 from bool to tristate
      pinctrl: freescale: remove needless module.h include
      pinctrl: imx1: make it explicitly non-modular
      pinctrl: imx21: make it explicitly non-modular
      pinctrl: imx25: make it explicitly non-modular
      pinctrl: imx27: make it explicitly non-modular
      pinctrl: imx35: make it explicitly non-modular
      pinctrl: imx50: make it explicitly non-modular
      pinctrl: imx51: make it explicitly non-modular
      pinctrl: imx53: make it explicitly non-modular
      pinctrl: imx6dl: make it explicitly non-modular
      pinctrl: imx6q: make it explicitly non-modular
      pinctrl: imx6sl: make it explicitly non-modular
      pinctrl: imx6sx: make it explicitly non-modular
      pinctrl: imx6ul: make it explicitly non-modular
      pinctrl: imx7d: make it explicitly non-modular
      pinctrl: vf610: make it explicitly non-modular
      pinctrl: imx23: make it explicitly non-modular
      pinctrl: imx28: make it explicitly non-modular
      pinctrl: remove orphaned exported ".remove" function
      Revert "pinctrl: amd: make it explicitly non-modular"

Peng Fan (1):
      pinctrl: imx: fix initialization of imx_pinctrl_desc

Ramesh Shanmugasundaram (1):
      pinctrl: sh-pfc: r8a7795: Add DRIF support

Ray Jui (2):
      pinctrl: Update iProc GPIO DT bindings
      pinctrl: iproc: Add NSP and Stingray GPIO support

Stephen Boyd (2):
      pinctrl: qcom: Clear all function selection bits
      pinctrl: qcom: msm8974: Add hsic_ctl pinmux

Tan Jui Nee (1):
      pinctrl/broxton: enable platform device in the absence of ACPI enumeration

Wei Yongjun (4):
      pinctrl: ns2: fix return value check in ns2_pinmux_probe()
      sh-pfc: Use PTR_ERR_OR_ZERO() to simplify the code
      pinctrl: nsp: remove redundant dev_err call in nsp_pinmux_probe()
      pinctrl: ns2: remove redundant dev_err call in ns2_pinmux_probe()

Wolfram Sang (3):
      pinctrl: sh-pfc: refactor voltage setting
      pinctrl: sh-pfc: r8a7795: add support for voltage switching
      pinctrl: sh-pfc: fix property name in bindings doc

Yendapally Reddy Dhananjaya Reddy (2):
      pinctrl: Broadcom NSP pinctrl device tree bindings
      pinctrl: nsp: add pinmux driver support for Broadcom NSP SoC

hongkun.cao (1):
      pinctrl: mediatek: fix suspend/resume timing issue

 .../devicetree/bindings/gpio/gpio_oxnas.txt        |   47 +
 .../bindings/pinctrl/brcm,iproc-gpio.txt           |   18 +-
 .../bindings/pinctrl/brcm,nsp-pinmux.txt           |   79 +
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  |   57 +
 .../bindings/pinctrl/pinctrl-max77620.txt          |  127 ++
 .../bindings/pinctrl/qcom,mdm9615-pinctrl.txt      |  152 ++
 .../bindings/pinctrl/qcom,msm8660-pinctrl.txt      |    2 +-
 .../bindings/pinctrl/qcom,msm8974-pinctrl.txt      |    5 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |    1 +
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    2 +-
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    1 +
 Documentation/pinctrl.txt                          |   24 +-
 drivers/pinctrl/Kconfig                            |   26 +-
 drivers/pinctrl/Makefile                           |    4 +-
 drivers/pinctrl/bcm/Kconfig                        |   15 +
 drivers/pinctrl/bcm/Makefile                       |    1 +
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |  118 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |   12 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |    6 +-
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |  642 ++++++++
 drivers/pinctrl/core.c                             |   25 +-
 drivers/pinctrl/core.h                             |    2 +
 drivers/pinctrl/devicetree.c                       |    7 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |   29 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx1.c           |    9 +-
 drivers/pinctrl/freescale/pinctrl-imx21.c          |    9 +-
 drivers/pinctrl/freescale/pinctrl-imx23.c          |   17 +-
 drivers/pinctrl/freescale/pinctrl-imx25.c          |   10 -
 drivers/pinctrl/freescale/pinctrl-imx27.c          |   10 -
 drivers/pinctrl/freescale/pinctrl-imx28.c          |   17 +-
 drivers/pinctrl/freescale/pinctrl-imx35.c          |   10 -
 drivers/pinctrl/freescale/pinctrl-imx50.c          |    9 -
 drivers/pinctrl/freescale/pinctrl-imx51.c          |   10 -
 drivers/pinctrl/freescale/pinctrl-imx53.c          |   10 -
 drivers/pinctrl/freescale/pinctrl-imx6dl.c         |   14 +-
 drivers/pinctrl/freescale/pinctrl-imx6q.c          |   10 -
 drivers/pinctrl/freescale/pinctrl-imx6sl.c         |   15 +-
 drivers/pinctrl/freescale/pinctrl-imx6sx.c         |   14 +-
 drivers/pinctrl/freescale/pinctrl-imx6ul.c         |   14 +-
 drivers/pinctrl/freescale/pinctrl-imx7d.c          |   14 +-
 drivers/pinctrl/freescale/pinctrl-mxs.c            |   12 -
 drivers/pinctrl/freescale/pinctrl-mxs.h            |    1 -
 drivers/pinctrl/freescale/pinctrl-vf610.c          |   10 -
 drivers/pinctrl/intel/Kconfig                      |   11 +
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   25 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |   43 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  155 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   52 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |  911 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    4 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  163 +-
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c           |   85 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   96 --
 drivers/pinctrl/pinconf-generic.c                  |   22 +-
 drivers/pinctrl/pinconf.c                          |    8 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   26 +-
 drivers/pinctrl/pinctrl-at91.c                     |   13 +-
 drivers/pinctrl/pinctrl-digicolor.c                |   16 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |   20 +-
 drivers/pinctrl/pinctrl-max77620.c                 |  673 ++++++++
 drivers/pinctrl/pinctrl-oxnas.c                    |  846 ++++++++++
 drivers/pinctrl/pinctrl-rockchip.c                 |    4 +-
 drivers/pinctrl/pinctrl-st.c                       |    2 +-
 drivers/pinctrl/pinctrl-u300.c                     |    2 +-
 drivers/pinctrl/pinctrl-xway.c                     |   72 +-
 drivers/pinctrl/pinctrl-zynq.c                     |   13 +-
 drivers/pinctrl/pinmux.c                           |   16 +-
 drivers/pinctrl/qcom/Kconfig                       |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-mdm9615.c             |  483 ++++++
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    6 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c             |  114 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c             |   43 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    1 +
 drivers/pinctrl/samsung/pinctrl-exynos5440.c       |    1 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |   10 -
 drivers/pinctrl/sh-pfc/core.h                      |   58 -
 drivers/pinctrl/sh-pfc/gpio.c                      |   13 +-
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c               |    1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |    1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |   59 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |    1 -
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  327 +++-
 drivers/pinctrl/sh-pfc/pfc-sh7757.c                |    1 -
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   46 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   55 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |    4 +-
 drivers/pinctrl/stm32/Kconfig                      |    6 +
 drivers/pinctrl/stm32/Makefile                     |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   31 +-
 drivers/pinctrl/stm32/pinctrl-stm32f746.c          | 1681 ++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c          |    6 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          |    6 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           |    6 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |    8 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |    6 +-
 drivers/pinctrl/tegra/pinctrl-tegra114.c           |    4 +-
 drivers/pinctrl/tegra/pinctrl-tegra124.c           |    4 +-
 drivers/pinctrl/tegra/pinctrl-tegra20.c            |    6 +-
 drivers/pinctrl/tegra/pinctrl-tegra210.c           |    4 +-
 drivers/pinctrl/tegra/pinctrl-tegra30.c            |    4 +-
 drivers/pinctrl/uniphier/Kconfig                   |   20 +-
 drivers/pinctrl/uniphier/Makefile                  |    2 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |  298 ++--
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |  952 +++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   | 1050 ++++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c    |  494 +++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c   |  609 +++----
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c   |  819 +++++-----
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c   |  653 ++++----
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c   |  603 +++----
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c   |  455 +++---
 drivers/pinctrl/uniphier/pinctrl-uniphier.h        |   59 +-
 include/dt-bindings/pinctrl/stm32f746-pinfunc.h    | 1324 +++++++++++++++
 include/linux/pinctrl/pinconf-generic.h            |    2 +
 119 files changed, 12550 insertions(+), 2698 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
 create mode 100644 drivers/pinctrl/bcm/pinctrl-nsp-mux.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-merrifield.c
 create mode 100644 drivers/pinctrl/pinctrl-max77620.c
 create mode 100644 drivers/pinctrl/pinctrl-oxnas.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-mdm9615.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f746.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
 create mode 100644 include/dt-bindings/pinctrl/stm32f746-pinfunc.h
