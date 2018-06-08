From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for v4.18
Date: Fri, 8 Jun 2018 09:37:45 +0200
Message-ID: <CACRpkdZcxFVMLo2_R9wMjXSM480sk_74pA7Cv7n28ZDjp=ij-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is the big bulk of GPIO changes for v4.18.

Highlight: we get rid of the pesky VLAs.

The one change hitting MFD has an ACK from the MFD
maintainer.

The rest of the details are in the signed tag as usual.
Mostly smallish cleanups.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.18-1

for you to fetch changes up to 6310b930ccbba55168f30b610fae681d73bd7bd2:

  gpio: davinci: fix build warning when !CONFIG_OF (2018-05-30 09:11:11 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.18 development
cycle.

Core changes:

- We have killed off VLA from the core library and all drivers.
  The background should be clear for everyone at this point:
  https://lwn.net/Articles/749064/
  Also I just don't like VLA's, kernel developers hate it when
  compilers do things behind their back. It's as simple as that.
  I'm sorry that they even slipped in to begin with.
  Kudos to Laura Abbott for exorcising them.

- Support GPIO hogs in machines/board files.

New drivers and chip support:

- R-Car r8a77470 (RZ/G1C)
- R-Car r8a77965 (M3-N)
- R-Car r8a77990 (E3)
- PCA953x driver improvements to accomodate more variants.

Improvements and new features:

- Support one interrupt per line on port A in the DesignWare
  dwapb driver.

Misc:

- Random cleanups, right header files in the drivers, some
  size optimizations etc.

----------------------------------------------------------------
Andy Shevchenko (1):
      gpio: Convert to use match_string() helper

Anson Huang (1):
      gpio: mxc: add clock operation

Baolin Wang (2):
      gpio: eic: Add edge trigger emulation for EIC
      gpio: pmic_eic: Add edge trigger emulation for PMIC EIC

Bartosz Golaszewski (2):
      gpiolib: add hogs support for machine code
      gpio: mockup: use the SPDX identifier and remove license boilerplate

Benjamin Herrenschmidt (2):
      gpio: aspeed: Set output latch before changing direction
      gpio: aspeed: Use a cache of output data registers

Biju Das (1):
      dt-bindings: gpio: rcar: Add r8a77470 (RZ/G1C) support

Colin Ian King (2):
      gpio: 104-dio-48e: make array 'ports' static, shrinks object size
      gpio: make several const arrays static, shrinks object size

Dan Carpenter (1):
      gpiolib: fix gpiochip_machine_hog()

Fabio Estevam (2):
      gpio: mxc: Switch to SPDX identifier
      gpio: mxs: Switch to SPDX identifier

Grigoryev Denis (1):
      gpio: pca953x: Clear irq trigger type on irq shutdown

H. Nikolaus Schaller (8):
      gpio: pca953x: convert register constants to hex
      gpio: pca953x: add more register definitions for pcal953x
      gpio: pca953x: add more register definitions for pcal6524
      DTS: Bindings: pca953x add an optional vcc-supply property
      pca953x: add example how to use interrupt-controller and gpio-controller
      gpio: pca953x: set the PCA_PCAL flag also when matching by DT
      gpio: pca953x: define masks for addressing common and extended registers
      gpio: pca953x: fix address calculation for pcal6524

Heiko Stuebner (1):
      gpio: syscon: allow fetching syscon from parent node

Jacopo Mondi (1):
      dt-bindings: gpio: Add support for r8a77965

Laura Abbott (3):
      gpio: xra1403: Switch to a fixed upper bound for registers
      gpio: Remove VLA from gpiolib
      gpio: Remove VLA from stmpe driver

Linus Walleij (24):
      gpio: Add a reference to CEC on GPIO
      gpio: loongson: Use right include
      gpio: loongson: Create a dynamic platform device
      gpio: loongson: Use BIT() macros
      gpio: lp3943: Include the right header
      gpio: lp873x: Include the right header
      gpio: lpc32xx: Include the right header
      gpio: lynxpoint: Include the right header
      gpio: max730x: Include the right header
      gpio: mc33880: Include the right header
      gpio: mc9s08dz60: Include the right header
      gpio: ml_ioh: Include the right header
      gpio: mm-lantiq: Include the right header
      gpio: msic: Include the right header
      gpio: mvebu: Use the proper APIs
      gpio: mxc: Remove reliance on <linux/gpio.h>
      gpio: octeon: Include the right header
      gpio: omap: Include the right header
      gpio: palmas: Include the right header
      gpio: pca953x: Include the right header
      gpio: pcf857x: Include the right header
      gpio: pch: Include the right header
      gpio: pl061: Include the right header
      gpio: pxa: Include the right header

Michal Simek (1):
      gpio: zynq: Setup chip->base based on alias ID

Phil Edworthy (3):
      gpio: dwapb: Add support for 1 interrupt per port A GPIO
      gpio: dwapb: Rework support for 1 interrupt per port A GPIO
      gpio: dwapb: Fix rework support for 1 interrupt per port A GPIO

Sekhar Nori (1):
      gpio: davinci: fix build warning when !CONFIG_OF

Shubhrajyoti Datta (2):
      gpio: zynq: Remove call to platform_get_irq
      gpio: zynq: simplifly getting drvdata

Thierry Reding (13):
      gpio: 74xx-mmio: Use of_device_get_match_data()
      gpio: dwapb: Use of_device_get_match_data()
      gpio: ge: Use of_device_get_match_data()
      gpio: ingenic: Use of_device_get_match_data()
      gpio: mxs: Use of_device_get_match_data()
      gpio: palmas: Use of_device_get_match_data()
      gpio: pca953x: Use of_device_get_match_data()
      gpio: pxa: Use of_device_get_match_data()
      gpio: syscon: Use of_device_get_match_data()
      gpio: ts4900: Use of_device_get_match_data()
      gpio: vf610: Use of_device_get_match_data()
      gpio: xlp: Use of_device_get_match_data()
      gpio: ge: Fix build warning

Yoshihiro Shimoda (1):
      gpio: rcar: Add DT binding for r8a77990

 .../devicetree/bindings/gpio/gpio-pca953x.txt      |  34 +++++
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   3 +
 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   9 +-
 Documentation/driver-api/gpio/board.rst            |  16 +++
 Documentation/driver-api/gpio/drivers-on-gpio.rst  |   4 +
 drivers/gpio/Kconfig                               |  12 ++
 drivers/gpio/gpio-104-dio-48e.c                    |   2 +-
 drivers/gpio/gpio-104-idi-48.c                     |   2 +-
 drivers/gpio/gpio-74xx-mmio.c                      |   9 +-
 drivers/gpio/gpio-aspeed.c                         |  24 +++-
 drivers/gpio/gpio-davinci.c                        |   2 -
 drivers/gpio/gpio-dwapb.c                          |  57 ++++----
 drivers/gpio/gpio-eic-sprd.c                       |  73 +++++++++++
 drivers/gpio/gpio-ge.c                             |   4 +-
 drivers/gpio/gpio-gpio-mm.c                        |   2 +-
 drivers/gpio/gpio-ingenic.c                        |   4 +-
 drivers/gpio/gpio-loongson.c                       | 116 ++++++++++-------
 drivers/gpio/gpio-lp3943.c                         |   2 +-
 drivers/gpio/gpio-lp873x.c                         |   2 +-
 drivers/gpio/gpio-lpc32xx.c                        |   3 +-
 drivers/gpio/gpio-lynxpoint.c                      |   2 +-
 drivers/gpio/gpio-max730x.c                        |   2 +-
 drivers/gpio/gpio-mc33880.c                        |   2 +-
 drivers/gpio/gpio-mc9s08dz60.c                     |   2 +-
 drivers/gpio/gpio-ml-ioh.c                         |   2 +-
 drivers/gpio/gpio-mm-lantiq.c                      |   2 +-
 drivers/gpio/gpio-mockup.c                         |   7 +-
 drivers/gpio/gpio-msic.c                           |   2 +-
 drivers/gpio/gpio-mvebu.c                          |  20 ++-
 drivers/gpio/gpio-mxc.c                            |  54 ++++----
 drivers/gpio/gpio-mxs.c                            |  32 ++---
 drivers/gpio/gpio-octeon.c                         |   2 +-
 drivers/gpio/gpio-omap.c                           |   2 +-
 drivers/gpio/gpio-palmas.c                         |   8 +-
 drivers/gpio/gpio-pca953x.c                        |  81 ++++++++----
 drivers/gpio/gpio-pcf857x.c                        |   2 +-
 drivers/gpio/gpio-pch.c                            |   2 +-
 drivers/gpio/gpio-pl061.c                          |   2 +-
 drivers/gpio/gpio-pmic-eic-sprd.c                  |  58 ++++++++-
 drivers/gpio/gpio-pxa.c                            |  10 +-
 drivers/gpio/gpio-stmpe.c                          |   9 +-
 drivers/gpio/gpio-syscon.c                         |   9 +-
 drivers/gpio/gpio-ts4900.c                         |   7 +-
 drivers/gpio/gpio-vf610.c                          |   4 +-
 drivers/gpio/gpio-xlp.c                            |   9 +-
 drivers/gpio/gpio-xra1403.c                        |  15 +--
 drivers/gpio/gpio-zynq.c                           |  14 +-
 drivers/gpio/gpiolib-of.c                          |   7 +-
 drivers/gpio/gpiolib.c                             | 143 ++++++++++++++++++---
 drivers/gpio/gpiolib.h                             |   2 +-
 drivers/mfd/intel_quark_i2c_gpio.c                 |   3 +-
 include/linux/gpio/consumer.h                      |  10 +-
 include/linux/gpio/machine.h                       |  31 +++++
 include/linux/platform_data/gpio-dwapb.h           |   3 +-
 54 files changed, 647 insertions(+), 293 deletions(-)
