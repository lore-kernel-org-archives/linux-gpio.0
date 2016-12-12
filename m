From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for the v4.10 cycle
Date: Mon, 12 Dec 2016 11:40:27 +0100
Message-ID: <CACRpkdbhN5kt2nje7=oDwbFtcfX-RqytYbfJJyvrOsMMyFQy8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:33325 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754135AbcLLKk3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2016 05:40:29 -0500
Received: by mail-qt0-f182.google.com with SMTP id p16so71715232qta.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2016 02:40:28 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here are the bulk of pin control changes for the v4.10 kernel.

I have pulled two immutable branches from GPIO into this
request because of dependencies identified by the build servers,
and as mentioned in the GPIO pull request. So a bunch of patches
appear here again, but with the same hashes, subjects "gpio:".

Apart from that it is business as usual, details in the signed tag.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 07d9a380680d1c0eb51ef87ff2eab5c994949e69=
:

  Linux 4.9-rc2 (2016-10-23 17:10:14 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.10-1

for you to fetch changes up to f821444508743a3e56320d0cb2b8c4603637660c:

  pinctrl: sx150x: use new nested IRQ infrastructure (2016-12-07 16:02:55 +=
0100)

----------------------------------------------------------------
Bulk pin control changes for the v4.10 kernel cycle:

No core changes this time. Mainly gradual improvement and
feature growth in the drivers.

New drivers:

- New driver for TI DA850/OMAP-L138/AM18XX pinconf

- The SX150x was moved over from the GPIO subsystem and
  reimagined as a pin control driver with GPIO support
  in a joint effort by three independent users of this
  hardware. The result was amazingly good!

- New subdriver for the Oxnas OX820

Improvements:

- The sunxi driver now supports the generic pin control
  bindings rather than the sunxi-specific. Add debouncing
  support to the driver.

- Simplifications in pinctrl-single adding a generic parser.

- Two downstream fixes and move the Raspberry Pi BCM2835 over
  to use the generic GPIOLIB_IRQCHIP.

----------------------------------------------------------------
Andrey Smirnov (15):
      pinctrl-sx150x: Improve OF device matching code
      pinctrl-sx150x: Add SX1503 specific data
      bindings: pinctrl-sx150x: Document SX1503 compatibility string
      pinctrl-sx150x: Replace magic number in sx150x_init_hw
      pinctrl-sx150x: Fix incorrect constant in sx150x_init_hw
      pinctrl-sx150x: Move some code out of sx150x_init_hw
      pinctrl-sx150x: Improve sx150x_init_misc for SX1504/5/6
      pinctrl-sx150x: Convert driver to use regmap API
      pinctrl-sx150x: Replace sx150x_*_cfg by means of regmap API
      pinctrl-sx150x: Remove excessive locking
      pinctrl-sx150x: Improve oscio GPIO functions
      pinctrl-sx150x: Simplify interrupt handler
      pinctrl-sx150x: Use handle_bad_irq instead of handle_edge_irq
      pinctrl-sx150x: Remove magic numbers from sx150x_irq_set_type
      pinctrl-sx150x: Remove magic numbers from sx150x_reset

Andy Shevchenko (2):
      pinctrl: intel: merrifield: Add pin config group handlers
      pinctrl: intel: set default handler to be handle_bad_irq()

Andy Yan (2):
      dt-bindings: add documentation for rk1108 pinctrl
      pinctrl: rockchip: add support for rk1108

Arnd Bergmann (2):
      pinctrl: max77620: add OF dependency
      pinctrl: sunxi: fix theoretical uninitialized variable access

Axel Haslam (2):
      pinctrl: single: check for any error when getting rows
      pinctrl: single: search for the bits property when parsing bits

Boris Brezillon (1):
      pinctrl: at91: add support for OUTPUT config

Chanwoo Choi (2):
      pinctrl: samsung: Add the support the multiple IORESOURCE_MEM
for one pin-bank
      pinctrl: samsung: Add GPF support for Exynos5433

Chen-Yu Tsai (4):
      pinctrl: sunxi: Free configs in pinctrl_map only if it is a config ma=
p
      pinctrl: sunxi: Fix PIN_CONFIG_BIAS_PULL_{DOWN,UP} argument
      pinctrl: sunxi: Add support for fetching pinconf settings from hardwa=
re
      pinctrl: sunxi: Make sunxi_pconf_group_set use sunxi_pconf_reg helper

Chunfeng Yun (1):
      pinctrl: mt8173: set GPIO16 to usb iddig mode

Dan Carpenter (2):
      pinctrl: single: Fix a couple error codes
      pinctrl: sunxi: Testing the wrong variable

David Lechner (2):
      devicetree: bindings: pinctrl: Add binding for ti,da850-pupd
      pinctrl: New driver for TI DA850/OMAP-L138/AM18XX pinconf

Gary Bisson (1):
      pinctrl: imx: fix imx_pinctrl_desc initialization

Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for SDHI2/3

Geliang Tang (2):
      pinctrl: stm32: use builtin_platform_driver
      pinctrl: mediatek: use builtin_platform_driver

Heinrich Schuchardt (2):
      pinctrl: st: st_pinconf_dbg_show wrong format string
      pinctrl: st: st_pctl_dt_parse_groups simplify expression

Jason Gunthorpe (1):
      pinctrl: zynq: Add a 8 bit wide nand option

Keerthy (1):
      Documentation: pinctrl: palmas: Add ti,palmas-powerhold-override
property definition

Laxman Dewangan (1):
      pinctrl: generic: Parse pinmux init nodes if node status is okay

Linus Walleij (16):
      Merge branch 'ib-sx150x' into devel
      pinctrl: sx150x: fix up headers
      Merge tag 'sh-pfc-for-v4.10-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'sh-pfc-for-v4.10-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: nomadik: split up and comments MC0 pins
      gpio: simplify adding threaded interrupts
      gpio: set explicit nesting on drivers
      gpio: pl061: use local state for parent IRQ storage
      gpio: pl061: rename state container struct
      gpio: pl061: rename variable from chip to pl061
      gpio: pl061: move platform data into driver
      gpio: pl061: delete platform data handling
      pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP
      Merge branch 'pl061' of /home/linus/linux-gpio into devel
      Merge branch 'thread-irq-simpler' of /home/linus/linux-gpio into deve=
l
      pinctrl: sx150x: use new nested IRQ infrastructure

Maxime Ripard (7):
      pinctrl: sunxi: Rework the pin config building code
      pinctrl: sunxi: Use macros from bindings header file for DT parsing
      pinctrl: sunxi: Handle bias disable
      pinctrl: sunxi: Support generic binding
      pinctrl: sunxi: Deprecate sunxi pinctrl bindings
      pinctrl: sunxi: Deal with configless pins
      pinctrl: sunxi: Add support for interrupt debouncing

Michael Scott (1):
      pinctrl: qcom: Add msm8994 pinctrl driver

Mika Westerberg (1):
      pinctrl: cherryview: Drop ctrlX prefix from the pin debugfs output

Neil Armstrong (5):
      pinctrl: oxnas: Move OX810SE specific function and structure as separ=
ate
      pinctrl: oxnas: Add support for OX820
      dt-bindings: oxnas: Update Pinctrl and GPIO for OX820 Support
      pinctrl: Add SX150X GPIO Extender Pinctrl Driver
      pinctrl: meson: Add GXL pinctrl definitions

Niklas S=C3=B6derlund (10):
      pinctrl: sh-pfc: r8a7796: Add DU support
      pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISAB=
LE
      pinctrl: sh-pfc: Add helper to handle bias lookup table
      pinctrl: sh-pfc: r8a7795: Simplify get bias logic
      pinctrl: sh-pfc: r8a7795: Use lookup function for bias data
      pinctrl: sh-pfc: r8a7778: Use lookup function for bias data
      pinctrl: sh-pfc: Support named pins with custom configuration
      pinctrl: sh-pfc: r8a7795: Support none GPIO pins with
configurable drive-strength
      pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
      pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins

Paul Gortmaker (2):
      pinctrl: sunxi: make bool drivers explicitly non-modular
      pinctrl: vt8500: make bool drivers explicitly non-modular

Peter Rosin (8):
      pinctrl: sx150x: various spelling fixes and some white-space cleanup
      pinctrl: sx150x: support setting multiple pins at once
      pinctrl: sx150x: use correct registers for reg_sense (sx1502 and sx15=
08)
      pinctrl: sx150x: sort chips by part number
      pinctrl: sx150x: add support for sx1501, sx1504, sx1505 and sx1507
      pinctrl: sx150x: access the correct bits in the 4-bit regs of sx150[1=
47]
      pinctrl: sx150x: rename 'reg_advance' to 'reg_advanced'
      pinctrl: sx150x: handle missing 'advanced' reg in sx1504 and sx1505

Phil Elwell (2):
      pinctrl: bcm2835: Fix ints for GPIOs 28-31 & 46-53
      pinctrl: bcm2835: Return pins to inputs when freed

Ramesh Shanmugasundaram (1):
      pinctrl: sh-pfc: r8a7796: Add DRIF support

Stefan Wahren (1):
      pinctrl: bcm2835: reduce GPPUD set-up time

Takeshi Kihara (1):
      pinctrl: sh-pfc: r8a7796: Add EtherAVB pins, groups and functions

Tony Lindgren (5):
      pinctrl: single: Drop custom names
      pinctrl: single: Drop pointless macro
      pinctrl: Introduce generic #pinctrl-cells and
pinctrl_parse_index_with_args
      pinctrl: single: Use generic parser and #pinctrl-cells for
pinctrl-single,pins
      pinctrl: single: Use generic parser and #pinctrl-cells for
pinctrl-single,bits

Ulrich Hecht (1):
      pinctrl: sh-pfc: r8a7796: Add I2C pin support

 .../devicetree/bindings/gpio/gpio-sx150x.txt       |   41 -
 .../devicetree/bindings/gpio/gpio_oxnas.txt        |    2 +-
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   30 +
 .../bindings/pinctrl/atmel,at91-pinctrl.txt        |    2 +
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |    2 +
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  |    2 +-
 .../bindings/pinctrl/pinctrl-bindings.txt          |   44 +-
 .../devicetree/bindings/pinctrl/pinctrl-palmas.txt |    9 +
 .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |   74 ++
 .../bindings/pinctrl/qcom,msm8994-pinctrl.txt      |  177 +++
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    9 +-
 .../bindings/pinctrl/samsung-pinctrl.txt           |   19 +
 .../devicetree/bindings/pinctrl/ti,da850-pupd.txt  |   55 +
 Documentation/gpio/driver.txt                      |   62 +-
 arch/arm/mach-integrator/impd1.c                   |    1 -
 drivers/gpio/Kconfig                               |   13 +-
 drivers/gpio/Makefile                              |    1 -
 drivers/gpio/gpio-adnp.c                           |   12 +-
 drivers/gpio/gpio-crystalcove.c                    |    6 +-
 drivers/gpio/gpio-dln2.c                           |    1 -
 drivers/gpio/gpio-max732x.c                        |   17 +-
 drivers/gpio/gpio-mcp23s08.c                       |   17 +-
 drivers/gpio/gpio-pca953x.c                        |   16 +-
 drivers/gpio/gpio-pcf857x.c                        |   11 +-
 drivers/gpio/gpio-pl061.c                          |  208 ++-
 drivers/gpio/gpio-stmpe.c                          |   17 +-
 drivers/gpio/gpio-sx150x.c                         |  792 -----------
 drivers/gpio/gpio-tc3589x.c                        |   17 +-
 drivers/gpio/gpio-wcove.c                          |    6 +-
 drivers/gpio/gpiolib.c                             |   69 +-
 drivers/pinctrl/Kconfig                            |   26 +-
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/bcm/Kconfig                        |    1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |  165 ++-
 drivers/pinctrl/devicetree.c                       |  144 ++
 drivers/pinctrl/devicetree.h                       |   23 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |    8 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |    2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    2 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |    2 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |   41 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c          |    6 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h      |    2 +-
 drivers/pinctrl/meson/Makefile                     |    3 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  589 +++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    8 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    2 +
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c   |   23 +-
 drivers/pinctrl/pinconf-generic.c                  |    2 +-
 drivers/pinctrl/pinctrl-at91.c                     |   21 +
 drivers/pinctrl/pinctrl-da850-pupd.c               |  210 +++
 drivers/pinctrl/pinctrl-oxnas.c                    |  605 +++++++--
 drivers/pinctrl/pinctrl-rockchip.c                 |   86 ++
 drivers/pinctrl/pinctrl-single.c                   |  217 +--
 drivers/pinctrl/pinctrl-st.c                       |    4 +-
 drivers/pinctrl/pinctrl-sx150x.c                   | 1275 ++++++++++++++++=
++
 drivers/pinctrl/pinctrl-zynq.c                     |    6 +-
 drivers/pinctrl/qcom/Kconfig                       |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8994.c             | 1379 ++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   45 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   11 +
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c          |   37 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |   40 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   40 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   10 +-
 drivers/pinctrl/sh-pfc/core.c                      |   15 +
 drivers/pinctrl/sh-pfc/core.h                      |    4 +
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  342 ++---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  616 ++++++---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  576 +++++++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   14 +
 drivers/pinctrl/stm32/pinctrl-stm32f429.c          |    6 +-
 drivers/pinctrl/sunxi/pinctrl-gr8.c                |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun5i-a10s.c         |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun5i-a13.c          |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c        |   10 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c         |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c          |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c        |   11 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c          |   10 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c         |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c          |    9 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |  506 +++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    8 +-
 drivers/pinctrl/vt8500/pinctrl-vt8500.c            |   17 +-
 drivers/pinctrl/vt8500/pinctrl-wm8505.c            |   17 +-
 drivers/pinctrl/vt8500/pinctrl-wm8650.c            |   17 +-
 drivers/pinctrl/vt8500/pinctrl-wm8750.c            |   17 +-
 drivers/pinctrl/vt8500/pinctrl-wm8850.c            |   17 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |   10 -
 drivers/pinctrl/vt8500/pinctrl-wmt.h               |    1 -
 include/dt-bindings/gpio/meson-gxl-gpio.h          |  131 ++
 include/dt-bindings/pinctrl/at91.h                 |    2 +
 include/linux/amba/pl061.h                         |   16 -
 include/linux/gpio/driver.h                        |   32 +-
 100 files changed, 7214 insertions(+), 2053 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-sx150=
x.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd=
.txt
 delete mode 100644 drivers/gpio/gpio-sx150x.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gxl.c
 create mode 100644 drivers/pinctrl/pinctrl-da850-pupd.c
 create mode 100644 drivers/pinctrl/pinctrl-sx150x.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8994.c
 create mode 100644 include/dt-bindings/gpio/meson-gxl-gpio.h
 delete mode 100644 include/linux/amba/pl061.h
