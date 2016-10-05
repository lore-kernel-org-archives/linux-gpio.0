From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for the v4.9 cycle
Date: Wed, 5 Oct 2016 14:27:17 +0200
Message-ID: <CACRpkdYtH0=WKRArxOWxm86GDyEZk3Zgc+t27rhxK2_7u9U=QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35143 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752174AbcJEM1S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 08:27:18 -0400
Received: by mail-oi0-f50.google.com with SMTP id d132so67007800oib.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2016 05:27:18 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here are the GPIO changes for v4.9. Most of the details are
in the signed tag but note the following about merge mechanics:

- I created an immutable branch from this tree to the pin control tree
  to get the new mechanism for disabling mapping of BIOS-grabbed
  IRQ lines over to that tree. So it has already come in through the
  pin control tree, and the SHA1 checksums should be the same
  and resolve nicely in the merge.

- Lee sent me two immutable branches from the MFD tree for these
  types of drivers that add a MFD nexus and some GPIO driver.
  He puts a lot of effort into doing this to make things smooth in
  the merge window, the only sideffect is that you will see the MFD
  (and related) commits in this shortlog as well.

- I sent an immutable branch the other way around to MFD to get
  the HTC EGPIO driver littering that subsystem over here to GPIO.

- I fixed a header inclusion in arch/arm/mach-omap2/* as Paul G
  was removing the <linux/module.h> include from the GPIO top
  include file. However the file was deleted from the OMAP tree so
  there will be a trivial conflict (delete it) there.

- I have quite a few patches in the pca953x driver, and at the same
  time some lockdep issue was being fixed in the i2c subsystem
  affecting this driver, so Wolfram had to patch it from their end.
  It should be another trivial conflict that was solved in -next.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 694d0d0bb2030d2e36df73e2d23d5770511dbc8d=
:

  Linux 4.8-rc2 (2016-08-14 19:11:36 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.9-1

for you to fetch changes up to e0852940662362a641c059610755169e3852b873:

  gpio: add missing static inline (2016-10-03 23:38:11 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.9 series:

Subsystem improvements:

- Do away with the last users of the obsolete Kconfig options
  ARCH_REQUIRE_GPIOLIB and ARCH_WANT_OPTIONAL_GPIOLIB (the latter
  always sounded like an item on a wishlist to Santa Claus to
  me). We can now select GPIOLIB and be done with it, for all
  archs. After some struggle it even work on UM. Not that it has
  GPIO, but if it wants to, it can select the library.

- Continued efforts to make drivers properly either tristate or
  bool.

- Introduce a warning for drivers assigning default triggers to
  their irqchip lines when probed from device tree, so we find and
  fix these ambigous drivers. It is agreed that in the OF config
  path, the device tree defines trigger characteristics.

- The same warning, mutatis mutandis, for ACPI-probed GPIO
  irqchips.

- We introduce the ability to mark certain IRQ lines as "unusable"
  as they can be taken by BIOS/firmware, unrouted in silicon and
  generally nasty if you use them, and such things. This is
  put to good use in the STMPE driver and also in the Cherryview
  pin control driver.

- A new "mockup" virtual GPIO device that can be used for testing.
  The plan is to add unit tests under tools/* for exercising this
  device and verify that the kernel code paths are working as they
  should.

- Make memory-mapped I/O-drivers depend on HAS_IOMEM. This was
  implicit all the time, but when people started building UM
  with allyesconfig or allmodconfig it exploded in their face.

- Move some stray bits of device tree and ACPI HW description
  callbacks down into their respective implementation silo. These
  were causing issues when compiling on !HAS_IOMEM as well, so
  now eventually UM compiles the GPIOLIB library if it wants to.

New drivers:

- New driver for the Aspeed GPIO front-end companion to the
  pin controller merged through the pin control tree.

- New driver for the LP873x PMIC GPIO portions.

- New driver for Technologic Systems' I2C FPGA GPIO such as
  TS4900, TS-7970, TS-7990 and TS-4100.

- New driver for the Broadcom BCM63xx series including BCM6338
  and BCM6345.

- New driver for the Intel WhiskeyCove PMIC GPIO.

- New driver for the Allwinner AXP209 PMIC GPIO portions.

- New driver for Diamond Systems 48 line GPIO-MM, another of
  these port-mapped I/O expansion cards.

- Support the STMicroelectronics STMPE1600 variant in the STMPE
  driver.

Driver improvements:

- The STMPE driver now supports rising/falling edge detection
  properly for IRQs.

- The PCA954x will now fetch and enable its VCC regulator properly.

- Major rework of the PCA953x driver with the goal of eventually
  switching it over to use regmap and thus modernize it even more.

- Switch the IOP driver to use the generic MMIO GPIO library.

- Move the ages old HTC EGPIO (extended GPIO) GPIO expander driver
  over to this subsystem from MFD, achieveing some separation of
  concerns.

----------------------------------------------------------------
Alexander Shiyan (1):
      gpio: iop: Use generic GPIO MMIO functions for driver

Amitesh Singh (2):
      gpio: fix documentation for gpiod_unexport
      gpio: f7188x: use gpiochip_get_data instead of container_of

Andrew F. Davis (2):
      gpio: dt-bindings: remove ti,tps65086-gpio binding
      dt-bindings: GPIO: Add TPIC2810 binding

Andrew Jeffery (1):
      gpio: dt-bindings: Add documentation for Aspeed GPIO controllers

Arnd Bergmann (1):
      gpio: pca954x: fix undefined error code from remove

Bamvor Jian Zhang (2):
      gpio/mockup: add virtual gpio device
      gpio: MAINTAINERS: Add an entry for GPIO mockup driver

Bartosz Golaszewski (5):
      gpio: pca953x: code shrink
      gpio: pca953x: refactor pca953x_write_regs()
      gpio: pca953x: refactor pca953x_read_regs()
      gpio: pca953x: remove an unused variable
      gpio: pca953x: coding style fixes

Baruch Siach (1):
      gpio: mrvl: dt-binding: remove orion-gpio description

Bin Gao (2):
      gpio: Add Intel WhiskeyCove PMIC GPIO driver
      gpio: wcove-gpio: add get_direction method

Christian Lamparter (1):
      gpio: mmio: add brcm,bcm6345 support

Colin Ian King (1):
      gpio: pca953x: initialize ret to zero to avoid returning garbage

Joel Stanley (1):
      gpio: Add Aspeed driver

Julia Lawall (1):
      gpio: constify gpio_chip structures

Keerthy (3):
      mfd: lp873x: Add lp873x PMIC support
      gpio: lp873x: Add support for General Purpose Outputs
      regulator: lp873x: Change the MFD config option as per latest naming

Linus Walleij (22):
      arm64: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
      blackfin: do away with ARCH_REQUIRE_GPIOLIB
      ARM: do away with final ARCH_REQUIRE_GPIOLIB
      gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB
      Merge tag 'ib-mfd-gpio-v4.9' of git://git.kernel.org/.../lee/mfd
into devel
      Merge tag 'v4.8-rc2' into devel
      Merge tag 'ib-mfd-gpio-regulator-v4.9' of
git://git.kernel.org/.../lee/mfd into devel
      gpio: aspeed: add MODULE_LICENSE()
      Revert "gpio: pca953x: initialize ret to zero to avoid returning garb=
age"
      gpio: tc3589x: add .get_direction() and small cleanup
      gpio: tc3589x: fix up complaints on unsigned
      ARM: omap2: fix missing include
      Merge branch 'gpio-irq-validmask' of /home/linus/linux-pinctrl into d=
evel
      mfd/gpio: Move HTC GPIO driver to GPIO subsystem
      Merge branch 'ib-move-htc-egpio' into devel
      gpio: stmpe: forbid unused lines to be mapped as IRQs
      gpio: stmpe: use BIT() macro
      gpio: make memory-mapped drivers depend on HAS_IOMEM
      gpio: OF: separation of concerns
      gpio: acpi: separation of concerns
      gpio: OF: localize some gpiochip init functions
      gpio: add missing static inline

Lucile Quirion (2):
      gpio: add bindings for Technologic I2C-FPGA gpio controller
      gpio: add Technologic I2C-FPGA gpio support

Marc Zyngier (1):
      gpio/gpiolib: Forbid irqchip default trigger if probed over DT

Masahiro Yamada (1):
      gpio: refactor gpiochip_find() slightly

Maxime Ripard (2):
      gpio: Add AXP209 GPIO driver
      gpio: axp209: Implement get_direction

Mika Westerberg (2):
      gpiolib: Forbid irqchip default trigger for ACPI enumerated devices
      gpiolib: Make it possible to exclude GPIOs from IRQ domain

Nava kishore Manne (1):
      gpio: Added zynq specific check for special pins on bank zero

Patrice Chotard (10):
      mfd: stmpe: Add STMPE_IDX_SYS_CTRL/2 enum
      mfd: stmpe: Add reset support for all STMPE variant
      gpio: stmpe: Fix edge and rising/falling edge detection
      gpio: stmpe: Write int status register only when needed
      mfd: stmpe: Use generic bit mask name
      mfd: stmpe: Rework registers access
      gpio: stmpe: Rework registers access
      Documentation: dt: Add stmpe1600 compatible string to STMPE MFD
      mfd: Add STMPE1600 support
      gpio: stmpe: Add STMPE1600 support

Paul Gortmaker (12):
      gpio: msic: drop unused MODULE_ tags from non-modular code
      gpio: mxc: drop unused MODULE_ tags from non-modular code
      gpio: spear-spics: drop unused MODULE_ tags from non-modular code
      gpio: vf610: drop unused MODULE_ tags from non-modular code
      gpio: palmas: fix implicit assumption module.h is present
      gpio: sx150x: fix implicit assumption module.h is present
      gpio: ts4800: fix implicit assumption module.h is present
      gpio: altera: fix implicit assumption module.h is present
      gpio: ath79: fix implicit assumption module.h is present
      gpio: loongson1: fix implicit assumption module.h is present
      gpio: wcove: fix implicit assumption module.h is present
      gpio: don't include module.h in shared driver header

Phil Reid (1):
      gpio: pca954x: Add vcc regulator and enable it

Simon Horman (1):
      gpio: rcar: Add r8a7796 (R-Car M3-W) support

Vladimir Zapolskiy (1):
      gpio: lpc32xx: remove unused platform data file

Wei Yongjun (5):
      gpio: lp873x: Use devm_gpiochip_add_data() for gpio registration
      gpio: aspeed: fix return value check in aspeed_gpio_probe()
      gpio: tps65218: use devm_gpiochip_add_data() for gpio registration
      gpio: loongson1: remove redundant return value check
      gpio: aspeed: remove redundant return value check

William Breathitt Gray (1):
      gpio: Add GPIO support for the Diamond Systems GPIO-MM

=C3=81lvaro Fern=C3=A1ndez Rojas (1):
      gpio: dt-bindings: add brcm,bcm6345-gpio bindings

 .../devicetree/bindings/gpio/brcm,bcm6345-gpio.txt |  46 ++
 .../devicetree/bindings/gpio/gpio-aspeed.txt       |  36 ++
 .../devicetree/bindings/gpio/gpio-axp209.txt       |  30 ++
 .../devicetree/bindings/gpio/gpio-tpic2810.txt     |  16 +
 .../devicetree/bindings/gpio/gpio-tps65086.txt     |  16 -
 .../devicetree/bindings/gpio/gpio-ts4900.txt       |  30 ++
 .../devicetree/bindings/gpio/mrvl-gpio.txt         |  23 -
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   1 +
 Documentation/devicetree/bindings/mfd/stmpe.txt    |   2 +-
 Documentation/gpio/board.txt                       |   6 +-
 Documentation/gpio/driver.txt                      |   6 +
 Documentation/gpio/gpio-legacy.txt                 |  16 +-
 Documentation/kernel-parameters.txt                |   4 +
 MAINTAINERS                                        |  13 +
 arch/arm/mach-omap2/board-rx51-peripherals.c       |   1 +
 arch/arm/mach-pxa/hx4700.c                         |   2 +-
 arch/arm/mach-pxa/magician.c                       |   2 +-
 arch/arm/mach-sa1100/h3xxx.c                       |   2 +-
 arch/arm64/Kconfig                                 |   1 -
 arch/arm64/Kconfig.platforms                       |  12 +-
 arch/blackfin/Kconfig                              |   2 +-
 drivers/gpio/Kconfig                               | 102 ++++-
 drivers/gpio/Makefile                              |   8 +
 drivers/gpio/gpio-altera.c                         |   1 +
 drivers/gpio/gpio-arizona.c                        |   2 +-
 drivers/gpio/gpio-aspeed.c                         | 455 +++++++++++++++++=
+++
 drivers/gpio/gpio-ath79.c                          |   1 +
 drivers/gpio/gpio-axp209.c                         | 192 +++++++++
 drivers/gpio/gpio-bcm-kona.c                       |   2 +-
 drivers/gpio/gpio-da9052.c                         |   2 +-
 drivers/gpio/gpio-da9055.c                         |   2 +-
 drivers/gpio/gpio-f7188x.c                         |   3 +-
 drivers/gpio/gpio-gpio-mm.c                        | 267 ++++++++++++
 drivers/{mfd/htc-egpio.c =3D> gpio/gpio-htc-egpio.c} |   2 +-
 drivers/gpio/gpio-iop.c                            | 115 +----
 drivers/gpio/gpio-it87.c                           |   2 +-
 drivers/gpio/gpio-loongson1.c                      |   6 +-
 drivers/gpio/gpio-lp873x.c                         | 183 ++++++++
 drivers/gpio/gpio-lpc18xx.c                        |   2 +-
 drivers/gpio/gpio-lpc32xx.c                        |  15 +-
 drivers/gpio/gpio-mmio.c                           |   4 +
 drivers/gpio/gpio-mockup.c                         | 214 ++++++++++
 drivers/gpio/gpio-msic.c                           |   6 -
 drivers/gpio/gpio-mxc.c                            |  10 +-
 drivers/gpio/gpio-palmas.c                         |   1 -
 drivers/gpio/gpio-pca953x.c                        | 328 +++++++-------
 drivers/gpio/gpio-pisosr.c                         |   2 +-
 drivers/gpio/gpio-rcar.c                           |   4 +
 drivers/gpio/gpio-sch.c                            |   2 +-
 drivers/gpio/gpio-spear-spics.c                    |   7 +-
 drivers/gpio/gpio-stmpe.c                          | 204 ++++++---
 drivers/gpio/gpio-sx150x.c                         |   2 -
 drivers/gpio/gpio-tc3589x.c                        |  47 ++-
 drivers/gpio/gpio-tpic2810.c                       |   2 +-
 drivers/gpio/gpio-tps65086.c                       |   2 +-
 drivers/gpio/gpio-tps65218.c                       |  15 +-
 drivers/gpio/gpio-tps65912.c                       |   2 +-
 drivers/gpio/gpio-ts4800.c                         |   1 +
 drivers/gpio/gpio-ts4900.c                         | 190 +++++++++
 drivers/gpio/gpio-twl4030.c                        |   2 +-
 drivers/gpio/gpio-vf610.c                          |   7 +-
 drivers/gpio/gpio-wcove.c                          | 470 +++++++++++++++++=
++++
 drivers/gpio/gpio-wm831x.c                         |   2 +-
 drivers/gpio/gpio-wm8350.c                         |   2 +-
 drivers/gpio/gpio-wm8994.c                         |   2 +-
 drivers/gpio/gpio-zynq.c                           |  15 +-
 drivers/gpio/gpiolib-acpi.c                        |  57 ++-
 drivers/gpio/gpiolib-of.c                          |  39 ++
 drivers/gpio/gpiolib-sysfs.c                       |   4 +-
 drivers/gpio/gpiolib.c                             | 180 ++++----
 drivers/gpio/gpiolib.h                             |  45 +-
 drivers/mfd/Kconfig                                |  22 +-
 drivers/mfd/Makefile                               |   3 +-
 drivers/mfd/lp873x.c                               |  99 +++++
 drivers/mfd/stmpe-i2c.c                            |   2 +
 drivers/mfd/stmpe.c                                | 161 +++++--
 drivers/mfd/stmpe.h                                |  85 +++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   1 -
 drivers/regulator/Kconfig                          |   2 +-
 include/linux/gpio/driver.h                        |   8 +-
 include/linux/mfd/lp873x.h                         | 269 ++++++++++++
 include/linux/mfd/stmpe.h                          |  21 +
 include/linux/of_gpio.h                            |   5 -
 .../htc-egpio.h =3D> platform_data/gpio-htc-egpio.h} |   0
 include/linux/platform_data/gpio-lpc32xx.h         |  50 ---
 85 files changed, 3534 insertions(+), 691 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpi=
o.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.tx=
t
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.tx=
t
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
 create mode 100644 drivers/gpio/gpio-aspeed.c
 create mode 100644 drivers/gpio/gpio-axp209.c
 create mode 100644 drivers/gpio/gpio-gpio-mm.c
 rename drivers/{mfd/htc-egpio.c =3D> gpio/gpio-htc-egpio.c} (99%)
 create mode 100644 drivers/gpio/gpio-lp873x.c
 create mode 100644 drivers/gpio/gpio-mockup.c
 create mode 100644 drivers/gpio/gpio-ts4900.c
 create mode 100644 drivers/gpio/gpio-wcove.c
 create mode 100644 drivers/mfd/lp873x.c
 create mode 100644 include/linux/mfd/lp873x.h
 rename include/linux/{mfd/htc-egpio.h =3D> platform_data/gpio-htc-egpio.h}=
 (100%)
 delete mode 100644 include/linux/platform_data/gpio-lpc32xx.h
