From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control changes for v4.5
Date: Mon, 11 Jan 2016 02:36:50 +0100
Message-ID: <CACRpkdacMprhnb9o4k6mUJxB+YeUtXwN9HPZPGoxj_uh=Tp7Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of pin control changes for the v4.5 cycle.

Notably I have a patch to driver core from Stephen Boyd in
the pull request, this has been ACKed by Greg so it should
be OK. The internal API needed some tweaking to allow modular
Qualcomm pin controllers.

There is a bit of development history in here but it should all
add up nicely and has boiled in linux-next. For example I
merged in v4.4-rc5 to get rid of some nasty merge conflicts.

More details in the signed tag as usual.

The GPIO pull request will depend on this and augment stuff
all over the place, but let's land this first, so:
Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9f9499ae8e6415cefc4fe0a96ad0e27864353c89:

  Linux 4.4-rc5 (2015-12-13 17:42:58 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.5-1

for you to fetch changes up to 14da0a91bf4ac2a90d64446ddaa39a4869530f8c:

  pinctrl: mediatek: Modify pinctrl bindings for mt2701 (2016-01-07
11:10:59 +0100)

----------------------------------------------------------------
This is the bulk of pin control patches for the v4.5
series:

- New drivers:
  - PXA2xx pin controller support
  - Broadcom NSP pin controller support

- New subdrivers:
  - Samsung EXYNOS5410 support
  - Qualcomm MSM8996 support
  - Qualcomm PM8994 support
  - Qualcomm PM8994 MPP support
  - Allwinner sunxi H3 support
  - Allwinner sunxi A80 support
  - Rockchip RK3228 support

- Rename the Cygnus pinctrl driver to "iproc" as it is more
  generic than was originally thought.

- A bunch of Lantiq/Xway updates especially from the OpenWRT
  people.

- Several refactorings for the Super-H SH PFC pin controllers.
  Adding SCIF_CLK support.

- Several fixes to the Atlas 7 driver.

- Various fixes all over the place.

----------------------------------------------------------------
Arnd Bergmann (1):
      pinctrl: at91-pio4: use %pr format string for resource

Biao Huang (1):
      pinctrl: mediatek: Modify pinctrl bindings for mt2701

Dan Carpenter (1):
      pinctrl: nsp-gpio: forever loop in nsp_gpio_get_strength()

Daniel Kurtz (1):
      pinctrl: mediatek: convert to arch_initcall

Florian Fainelli (1):
      pinctrl: bcm: Default PINCTRL_BCM281XX to y for ARCH_BCM_MOBILE

Geert Uytterhoeven (23):
      pinctrl: sh-pfc: Add PINMUX_SINGLE()
      pinctrl: sh-pfc: r8a7790: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
      pinctrl: sh-pfc: r8a7791: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
      pinctrl: sh-pfc: r8a7794: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
      pinctrl: sh-pfc: r8a7795: Make PORT_GP_x() macros consistent
      pinctrl: sh-pfc: r8a7795: Rename SEL_SCIF to SEL_SATA
      pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions
      pinctrl: sh-pfc: emev2: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
      pinctrl: sh-pfc: r8a7778: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
      pinctrl: sh-pfc: r8a7779: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
      pinctrl: sh-pfc: sh7734: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
      pinctrl: sh-pfc: r8a7795: Add pinmux data for single-function pins
      pinctrl: sh-pfc: r8a7795: Add MSIOF pins, groups, and functions
      pinctrl: sh-pfc: emev2: Correct comment for CFI data pins
      pinctrl: sh-pfc: r8a7740: Correct comment for LCD1 data pins
      pinctrl: sh-pfc: sh73a0: Correct comment for LCD2 data pins
      pinctrl: sh-pfc: sh73a0: Add MSIOF support
      pinctrl: sh-pfc: r8a7791: Add SCIF_CLK support
      pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support
      pinctrl: sh-pfc: r8a7779: Add SCIF_CLK support
      pinctrl: sh-pfc: r8a7790: Add SCIF_CLK support
      pinctrl: sh-pfc: r8a7794: Add SCIF_CLK support
      MAINTAINERS: Add co-maintainer for Renesas Pin Controllers

Guoying Zhang (1):
      pinctrl: atlas7: add pulse conter pin group without direction pin

Hakjoo Kim (1):
      pinctrl: exynos: add exynos5410 SoC specific data

Hongzhou Yang (1):
      pinctrl: mediatek: fix a memleak when do dt maps.

Jeffy Chen (1):
      pinctrl: rockchip: add support for the rk3228

Jens Kuske (1):
      pinctrl: sunxi: Add H3 PIO controller support

John Crispin (2):
      pinctrl/lantiq: Fix GPIO Setup of GPIO Port3
      pinctrl: lantiq: 2 pins have the wrong mux list

Joonwoo Park (1):
      pinctrl: qcom: Add msm8996 pinctrl driver

Julia Lawall (5):
      pinctrl-tegra: add missing of_node_put
      pinctrl: sirf: add missing of_node_put
      pinctrl: sh-pfc: add missing of_node_put
      pinctrl: rockchip: add missing of_node_put
      pinctrl: mediatek: add missing of_node_put

Kuninori Morimoto (1):
      pinctrl: sh-pfc: Share/reuse same PORT_GP_x() macros

Linus Walleij (9):
      Merge branch 'sh-pfc-for-v4.5' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge branch 'bcm-nsp' into devel
      Revert "pinctrl: intel: fix bug of register offset calculation"
      pinctrl: fixup problematic flag
      Merge tag 'v4.4-rc5' into devel
      pinctrl: bcm/cygnys/iproc: fixup rebase issue
      Merge branch 'sh-pfc-for-v4.5' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'samsung-drivers-4.5' of
https://git.kernel.org/.../krzk/linux into devel
      pinctrl: qcom: make PMIC drivers bool

Ludovic Desroches (1):
      pinctrl: at91-pio4: fix memleak after using dt map

Markus Elfring (1):
      pinctrl: Delete unnecessary checks

Martin Schiller (2):
      pinctrl/lantiq: updating devicetree binding description
      pinctrl/lantiq: introduce new dedicated devicetree bindings

Masahiro Yamada (5):
      pinctrl: uniphier: rework UniPhier pinctrl entries in Kconfig
      pinctrl: berlin: guard sub-directory with CONFIG_PINCTRL_BERLIN
      pinctrl: mvebu: guard sub-directory with CONFIG_PINCTRL_MVEBU
      pinctrl: spear: guard sub-directory with CONFIG_PINCTRL_SPEAR
      pinctrl: fix a typo in Kconfig

Maxime Ripard (1):
      pinctrl: sunxi: Add A80 special pin controller

Pramod Kumar (6):
      dt-binding: Add ngpios property to GPIO controller node
      pinctrl: use ngpios propety from DT
      pinctrl: Add new compatible string to GPIO controller driver
      gpio: Rename func/macro/var to IP-block,iproc
      Documentation: Rename gpio controller name from cygnus to iproc
      pinctrl: Rename gpio driver from cygnus to iproc

Qipeng Zha (1):
      pinctrl: intel: fix bug of register offset calculation

Robert Jarzmik (7):
      MAINTAINERS: add to pxa files pinctrl
      pinctrl: pxa: pxa2xx: add pin control skeleton
      pinctrl: pxa: pxa2xx: add pin muxing
      pinctrl: pxa: pxa2xx: add pin configuration support
      pinctrl: pxa: add pxa27x architecture
      pinctrl: activate pxa architecture
      pinctrl: pxa: pxa2xx: add pin control skeleton

Sebastian Hesselbarth (1):
      pinctrl: mvebu: complain about missing group after checking variant

Sergei Shtylyov (1):
      pinctrl: sh-pfc: r8a7791: add EtherAVB pin groups

Stefan Wahren (1):
      pinctrl: bcm2835: Fix memory leak in error path

Stephen Boyd (6):
      pinctrl: qcom: pmic-gpio/mpp: of_irq_count() == npins
      pinctrl: qcom: spmi-gpio: Add pm8994 gpio support
      pinctrl: qcom: spmi-mpp: Add pm8994 mpp support
      driver-core: platform: Add platform_irq_count()
      pinctrl: qcom: Use platform_irq_count() instead of of_irq_count()
      Revert "pinctrl: qcom: make PMIC drivers bool"

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a7795: Add SDHI support
      pinctrl: sh-pfc: r8a7795: Add SATA support

Thierry Reding (2):
      pinctrl: adi2: Use platform_register/unregister_drivers()
      pinctrl: at91: Use platform_register/unregister_drivers()

Timur Tabi (1):
      pinctrl: qcom: qdf2xxx: improve error checking and reporting

Wei Chen (3):
      pinctrl: atlas7: add cs line for atlas7 nand
      pinctrl: atlas7: adjust pin groups of atlas7 nanddisk
      pinctrl: atlas7: adjust vip pin groups for atlas7

Yendapally Reddy Dhananjaya Reddy (2):
      pinctrl: Broadcom NSP GPIO-a device tree bindings
      pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC

Yingjoe Chen (1):
      pinctrl: update document for pinconf_generic_parse_dt_config

Yonghui Zhang (1):
      pinctrl: altas7: add sd9 function mux support

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    3 +
 .../{brcm,cygnus-gpio.txt => brcm,iproc-gpio.txt}  |    9 +-
 .../devicetree/bindings/pinctrl/brcm,nsp-gpio.txt  |   80 +
 .../bindings/pinctrl/lantiq,pinctrl-xway.txt       |  110 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    9 +-
 .../bindings/pinctrl/qcom,msm8996-pinctrl.txt      |  199 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    2 +
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |    1 +
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    3 +-
 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 MAINTAINERS                                        |    2 +
 drivers/base/platform.c                            |   20 +
 drivers/pinctrl/Kconfig                            |    3 +-
 drivers/pinctrl/Makefile                           |    7 +-
 drivers/pinctrl/bcm/Kconfig                        |   48 +-
 drivers/pinctrl/bcm/Makefile                       |    3 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    2 +-
 ...{pinctrl-cygnus-gpio.c => pinctrl-iproc-gpio.c} |  358 ++--
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |  749 ++++++++
 drivers/pinctrl/berlin/Makefile                    |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   28 +-
 drivers/pinctrl/mvebu/Makefile                     |    2 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              |   29 +-
 drivers/pinctrl/pinconf-generic.c                  |    1 +
 drivers/pinctrl/pinctrl-adi2.c                     |   24 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   17 +-
 drivers/pinctrl/pinctrl-at91.c                     |   14 +-
 drivers/pinctrl/pinctrl-lantiq.h                   |    8 +
 drivers/pinctrl/pinctrl-rockchip.c                 |   58 +-
 drivers/pinctrl/pinctrl-single.c                   |    5 +-
 drivers/pinctrl/pinctrl-tegra-xusb.c               |    4 +-
 drivers/pinctrl/pinctrl-tegra.c                    |    1 +
 drivers/pinctrl/pinctrl-xway.c                     | 1187 ++++++++++--
 drivers/pinctrl/pxa/Kconfig                        |   17 +
 drivers/pinctrl/pxa/Makefile                       |    2 +
 drivers/pinctrl/pxa/pinctrl-pxa27x.c               |  566 ++++++
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c               |  436 +++++
 drivers/pinctrl/pxa/pinctrl-pxa2xx.h               |   92 +
 drivers/pinctrl/qcom/Kconfig                       |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8996.c             | 1942 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c             |   14 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |   15 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |   14 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |   21 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |   21 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  103 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 drivers/pinctrl/sh-pfc/pfc-emev2.c                 |  136 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |   22 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c               |   62 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |   58 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |  167 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |   86 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 1505 ++++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c                |  548 +++++-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |   29 +-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    4 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   74 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |  134 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |    8 +-
 drivers/pinctrl/spear/Makefile                     |    2 +-
 drivers/pinctrl/sunxi/Kconfig                      |    9 +
 drivers/pinctrl/sunxi/Makefile                     |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           |  515 ++++++
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c        |  181 ++
 drivers/pinctrl/uniphier/Kconfig                   |   23 +-
 include/linux/platform_device.h                    |    1 +
 73 files changed, 9052 insertions(+), 766 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{brcm,cygnus-gpio.txt
=> brcm,iproc-gpio.txt} (94%)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
 rename drivers/pinctrl/bcm/{pinctrl-cygnus-gpio.c =>
pinctrl-iproc-gpio.c} (56%)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
 create mode 100644 drivers/pinctrl/pxa/Kconfig
 create mode 100644 drivers/pinctrl/pxa/Makefile
 create mode 100644 drivers/pinctrl/pxa/pinctrl-pxa27x.c
 create mode 100644 drivers/pinctrl/pxa/pinctrl-pxa2xx.c
 create mode 100644 drivers/pinctrl/pxa/pinctrl-pxa2xx.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8996.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
