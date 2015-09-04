From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] bulk of pin control changes for v4.3
Date: Fri, 4 Sep 2015 14:51:32 +0200
Message-ID: <CACRpkdbEJQPMzQJ8=spC6+5R9GibVdSgeApDCcXR1O335V4RvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36212 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754940AbbIDMvd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2015 08:51:33 -0400
Received: by oibi136 with SMTP id i136so11146967oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2015 05:51:33 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

this is the bulk changes for the v4.3 that have been stacking up in
my tree. Like with GPIO it's a lot of stuff. If my subsystems are any
sign of the overall tempo of the kernel v4.3 will be a gigantic diff.

One dependency patch is for the clk subsystem, this has been acked
by the maintainer to go this route.

The patch from the kbuild robot is coming from Fengguang's mail
address but I guess unless he signed it off personally it's actually an
AI coding the kernel.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit bc0195aad0daa2ad5b0d76cce22b167bc3435590:

  Linux 4.2-rc2 (2015-07-12 15:10:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.3-1

for you to fetch changes up to 1ab36387ea4face01aac3560b396b1e2ce07c4ff:

  pinctrl: at91: fix null pointer dereference (2015-08-30 21:58:53 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v4.3 development
cycle

Core changes:

- It is possible configure groups in debugfs.

- Consolidation of chained IRQ handler install/remove replacing
  all call sites where irq_set_handler_data() and
  irq_set_chained_handler() were done in succession with a
  combined call to irq_set_chained_handler_and_data(). This
  series was created by Thomas Gleixner after the problem was
  observed by Russell King.

- Tglx also made another series of patches switching
  __irq_set_handler_locked() for irq_set_handler_locked() which
  is way cleaner.

- Tglx also wrote a good bunch of patches to make use of
  irq_desc_get_xxx() accessors and avoid looking up irq_descs
  from IRQ numbers. The goal is to get rid of the irq number
  from the handlers in the IRQ flow which is nice.

Driver feature enhancements:

- Power management support for the SiRF SoC Atlas 7.

- Power down support for the Qualcomm driver.

- Intel Cherryview and Baytrail: switch drivers to use raw
  spinlocks in IRQ handlers to play nice with the realtime
  patch set.

- Rework and new modes handling for Qualcomm SPMI-MPP.

- Pinconf power source config for SH PFC.

New drivers and subdrivers:

- A new driver for Conexant Digicolor CX92755.

- A new driver for UniPhier PH1-LD4, PH1-Pro4, PH1-sLD8,
  PH1-Pro5, ProXtream2 and PH1-LD6b SoC pin control support.

- Reverse-egineered the S/PDIF settings for the Allwinner
  sun4i driver.

- Support for Qualcomm Technologies QDF2xxx ARM64 SoCs

- A new Freescale i.mx6ul subdriver.

Cleanup:

- Remove platform data support in a number of SH PFC
  subdrivers.

----------------------------------------------------------------
Baruch Siach (2):
      pinctrl: dt-binding: document Conexant CX92755 SoC
      pinctrl: driver for Conexant Digicolor CX92755 pin mapping

Ben Hutchings (1):
      pinctrl: sh-pfc: Implement pinconf power-source param for
voltage switching

Bjorn Andersson (7):
      pinctrl: qcom: spmi-mpp: Transition to generic dt binding parser
      pinctrl: qcom: spmi-mpp: Fixes related to enable handling
      pinctrl: qcom: spmi-mpp: Introduce defines for MODE_CTL
      pinctrl: qcom: spmi-mpp: Implement support for sink mode
      pinctrl: qcom: spmi-mpp: Add support for setting analog output level
      pinctrl: qcom: spmi-mpp: Transpose pinmux function
      pinctrl: qcom: ssbi: Family A gpio & mpp drivers

Colin Ian King (1):
      pinctrl/mediatek: fix spelling mistake in dev_err error message

Dan Carpenter (2):
      pinctrl: samsung: don't truncate the last char
      pinctrl: samsung: remove "out of memory" messages

David Dueck (1):
      pinctrl: at91: fix null pointer dereference

Fabio Estevam (1):
      pinctrl: imx6ul: Remove .owner field

Frank Li (1):
      pinctrl: imx: add i.mx6ul subdriver

Geert Uytterhoeven (6):
      pinctrl: sh-pfc: Convert to platform_get_*()
      pinctrl: sh-pfc: sh73a0: Remove obsolete multi-platform check
      pinctrl: sh-pfc: Remove obsolete sh73a0 platform_device_id entry
      pinctrl: sh-pfc: r8a7740: Remove obsolete multi-platform check
      pinctrl: sh-pfc: Remove obsolete r8a7740 platform_device_id entry
      pinctrl: at91: Use generic irq_{request,release}_resources()

Grygorii Strashko (1):
      pinctrl: single: dra7: remove PCS_QUIRK_SHARED_IRQ

Heiko Stuebner (1):
      clk: rockchip: add pclk_pd_pmu to the list of rk3288 critical clocks

Hongzhou Yang (1):
      pinctrl: mediatek: Fix multiple registration issue.

Jiang Liu (1):
      pinctrl: Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc

Joachim Eastwood (1):
      pinctrl: lpc18xx: add support for usb1 pinconf

Jon Hunter (2):
      pinctrl: pinconf: Allow groups to be configured via debugfs
      pinctrl: pinconf: Fix display of configs

Krzysztof Kozlowski (2):
      pinctrl: sirf: Drop owner assignment from platform_driver
      MAINTAINERS: pinctrl: Move Thomas Abraham to CREDITS

Laurent Pinchart (3):
      sh-pfc: r8a7790: remove non-existing GPIO pins
      sh-pfc: r8a7791: remove non-existing GPIO pins
      pinctrl: sh-pfc: Accept standard function, pins and groups properties

Lin Huang (1):
      pinctrl: rockchip: only enable gpio clock when it setting

Linus Walleij (7):
      pinctrl: nomadik: break out state container allocator
      pinctrl: nomadik: find chip from local array
      pinctrl: nomadik: assure GPIO chips are populated
      pinctrl/ARM: move GPIO and pinctrl deps to device tree
      pinctrl: nomadik: depromote GPIO to subsystem_init()
      pinctrl: nomadik: split stn8815 UART0 pin groups
      pinctrl: nomadik: reflect current input value

Maoguang Meng (1):
      pinctrl: mediatek: Implement wake handler and suspend resume

Marcus Cooper (1):
      pinctrl: sun4i: add spdif to pin description.

Mario Bambagini (1):
      added tabs instead of spaces

Masahiro Yamada (13):
      pinctrl: simplify of_pinctrl_get()
      pinctrl: UniPhier: add UniPhier pinctrl core support
      pinctrl: UniPhier: add UniPhier PH1-LD4 pinctrl driver
      pinctrl: UniPhier: add UniPhier PH1-Pro4 pinctrl driver
      pinctrl: UniPhier: add UniPhier PH1-sLD8 pinctrl driver
      pinctrl: UniPhier: add UniPhier PH1-Pro5 pinctrl driver
      pinctrl: UniPhier: add UniPhier ProXstream2 pinctrl driver
      pinctrl: UniPhier: add UniPhier PH1-LD6b pinctrl driver
      pinctrl: move CONFIG_PINCTRL to drivers/Makefile
      pinctrl: use dev_err() to show message in pinctrl_register_one_pin()
      pinctrl: use dev_err() to show message in pinmux_func_name_to_selector()
      pinctrl: join dev_dbg strings into a single line
      pinctrl: UniPhier: PH1-Pro5: add I2C ch6 pin-mux setting

Maxime Ripard (3):
      pinctrl: sunxi: Use common functions to change irq_chip and handler
      pinctrl: sunxi: Add irq_chip name
      pinctrl: sunxi: Add custom irq_domain_ops

Mika Westerberg (5):
      pinctrl: cherryview: Serialize all register access
      pinctrl: baytrail: Drop FSF mailing address
      pinctrl: baytrail: Serialize all register access
      pinctrl: baytrail: Use raw_spinlock for locking
      pinctrl: cherryview: Use raw_spinlock for locking

Mike Looijmans (1):
      pinctrl: zynq: Fix typos in smc0_nand_grp and smc0_nor_grp

Rob Herring (1):
      pinctrl: kill off set_irq_flags usage

Shinobu Uehara (1):
      pinctrl: sh-pfc: r8a7794: add USB pin groups

Stephen Boyd (1):
      pinctrl: qcom: Hook pm_power_down for shutdown support

Thomas Gleixner (21):
      pinctrl/rockchip: Consolidate chained IRQ handler install/remove
      pinctrl: Consolidate chained IRQ handler install/remove
      pinctrl/exynos: Consolidate chained IRQ handler install/remove
      pinctrl/bcm2835: Use irq_set_handler_locked()
      pinctrl/baytrail: Use irq_set_handler_locked()
      pinctrl/cherryview: Use irq_set_handler_locked()
      pinctrl/intel: Use irq_set_handler_locked()
      pinctrl/adi2: Use irq_set_handler_locked()
      pinctrl/amd: Use irq_set_handler_locked()
      pinctrl/at91: Use irq_set_handler_locked()
      pinctrl/rockchip: Use irq_set_handler_locked()
      pinctrl/qcom: Use irq_set_handler_locked()
      pinctrl/exynos: Use irq_set_handler_locked()
      pinctrl/samsung: Use irq_set_handler_locked()
      pinctrl/amd: Prepare amd_gpio_irq_handler for irq argument removal
      pinctrl/coh901: Prepare u300_gpio_irq_handler for irq argument removal
      pinctrl/pistachio: Prepare pistachio_gpio_irq_handler for irq
argument removal
      pinctrl/rockchip: Prepare rockchip_irq_demux for irq argument removal
      pinctrl/qcom/msm: Prepare msm_gpio_irq_handler for irq argument removal
      pinctrl/sirf: Prepare xxx_gpio-handle_irq for irq argument removal
      pinctrl/sunxi: Prepare sunxi_pinctrl_irq_handler for irq argument removal

Timur Tabi (1):
      pinctrl: add support for Qualcomm Technologies QDF2xxx ARM64 SoCs

Wei Chen (2):
      pinctrl: sirf: add power management support for atlas7
      pinctrl: atlas7: clear ugly branch statements for pull and drivestrength

kbuild test robot (1):
      pinctrl: pinconf: pinconf_show_config() can be static

 CREDITS                                            |    4 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   37 +-
 .../bindings/pinctrl/cnxt,cx92755-pinctrl.txt      |   86 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |   36 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   24 +-
 .../devicetree/bindings/pinctrl/ste,nomadik.txt    |    7 +-
 MAINTAINERS                                        |    1 -
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |   23 +-
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi         |    8 +-
 drivers/Makefile                                   |    2 +-
 drivers/clk/rockchip/clk-rk3288.c                  |    1 +
 drivers/pinctrl/Kconfig                            |    7 +
 drivers/pinctrl/Makefile                           |    8 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    5 +-
 drivers/pinctrl/core.c                             |    3 +-
 drivers/pinctrl/devicetree.c                       |    8 +-
 drivers/pinctrl/freescale/Kconfig                  |    7 +
 drivers/pinctrl/freescale/Makefile                 |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6ul.c         |  322 ++++
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   68 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   76 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |    6 +-
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  120 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |    5 +
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c   |   21 -
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8540.c   |   24 -
 drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c  |   30 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |  241 +--
 drivers/pinctrl/nomadik/pinctrl-nomadik.h          |    4 -
 drivers/pinctrl/pinconf.c                          |   88 +-
 drivers/pinctrl/pinctrl-adi2-bf60x.c               |    8 +-
 drivers/pinctrl/pinctrl-adi2.c                     |    4 +-
 drivers/pinctrl/pinctrl-amd.c                      |   15 +-
 drivers/pinctrl/pinctrl-at91.c                     |   51 +-
 drivers/pinctrl/pinctrl-coh901.c                   |    7 +-
 drivers/pinctrl/pinctrl-digicolor.c                |  378 +++++
 drivers/pinctrl/pinctrl-lpc18xx.c                  |   54 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    6 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |   71 +-
 drivers/pinctrl/pinctrl-single.c                   |   14 +-
 drivers/pinctrl/pinctrl-st.c                       |    6 +-
 drivers/pinctrl/pinctrl-zynq.c                     |    4 +-
 drivers/pinctrl/pinmux.c                           |    3 +-
 drivers/pinctrl/qcom/Kconfig                       |   20 +
 drivers/pinctrl/qcom/Makefile                      |    3 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   19 +-
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c             |  122 ++
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |  376 +++--
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |  791 ++++++++++
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |  882 +++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   18 +-
 drivers/pinctrl/samsung/pinctrl-exynos5440.c       |   90 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c          |   28 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |   34 +-
 drivers/pinctrl/sh-pfc/core.c                      |   52 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |    4 -
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |   21 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   19 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |   30 +
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c                |    4 -
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   86 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    5 +
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |  525 +++++--
 drivers/pinctrl/sirf/pinctrl-sirf.c                |    5 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |   17 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   62 +-
 drivers/pinctrl/uniphier/Kconfig                   |   32 +
 drivers/pinctrl/uniphier/Makefile                  |    8 +
 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c         |  886 +++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c        | 1274 ++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c        | 1554 ++++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c        | 1351 +++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c        |  794 ++++++++++
 drivers/pinctrl/uniphier/pinctrl-proxstream2.c     | 1269 ++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |  684 +++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier.h        |  217 +++
 include/dt-bindings/pinctrl/qcom,pmic-mpp.h        |   51 +
 78 files changed, 12274 insertions(+), 954 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/cnxt,cx92755-pinctrl.txt
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx6ul.c
 create mode 100644 drivers/pinctrl/pinctrl-digicolor.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
 create mode 100644 drivers/pinctrl/uniphier/Kconfig
 create mode 100644 drivers/pinctrl/uniphier/Makefile
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-proxstream2.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier.h
