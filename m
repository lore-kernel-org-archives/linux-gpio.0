From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for v4.7
Date: Tue, 17 May 2016 11:30:40 +0200
Message-ID: <CACRpkdY8_7GmhuLL5-fOoTFuYCHVSq4Cfc=oRm27CB=+L8SPvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34212 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755338AbcEQJam (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 May 2016 05:30:42 -0400
Received: by mail-oi0-f47.google.com with SMTP id k142so15712721oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 May 2016 02:30:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is the bulk of GPIO changes for the v4.7 development
cycle.

There are a few patches to other subsystems and arches here,
all should be ACKed by respective maintainer I think. The MIPS
patch created a trivial merge conflict in linux-next so you may
see it when pulling this or the MIPS tree. Piece of cake.

There is also a patch to irqdomain (exporting a single function)
which got ACKed by tglx and Marc.

A lot of patches are written by myself, I guess I'm maintaining
properly for once. Or being bad at pushing work to others, I don't
know which one it is.

The rest of the details are in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.7-1

for you to fetch changes up to d30a2b47d4c2b75573d93f60655d48ba8e3ed2b3:

  MIPS: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB (2016-05-11
13:52:05 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for kernel cycle v4.7:

Core infrastructural changes:

- Support for natively single-ended GPIO driver stages. This
  means that if the hardware has registers to configure open
  drain or open source configuration, we use that rather than
  (as we did before) try to emulate it by switching the line
  to an input to get high impedance. This is also documented
  throughly in Documentation/gpio/driver.txt for those of you
  who did not understand one word of what I just wrote.

- Start to do away with the unnecessarily complex and
  unitelligible ARCH_REQUIRE_GPIOLIB and
  ARCH_WANT_OPTIONAL_GPIOLIB, another evolutional artifact from
  the time when the GPIO subsystem was unmaintained. Archs can
  now just select GPIOLIB and be done with it, cleanups to
  arches will trickle in for the next kernel. Some minor archs
  ACKed the changes immediately so these are included in this
  pull request.

- Advancing the use of the data pointer inside the GPIO device
  for storing driver data by switching the PowerPC, Super-H
  Unicore and a few other subarches or subsystem drivers in
  ALSA SoC, Input, serial, SSB, staging etc to use it.

- The initialization now reads the input/output state of the
  GPIO lines, so that each GPIO descriptor knows - if this
  callback is implemented - whether the line is input or
  output. This also reflects nicely in userspace "lsgpio".

- It is now possible to name GPIO producer names, line names,
  from the device tree. (Platform data has been supported for
  a while.) I bet we will get a similar mechanism for ACPI
  one of those days. This makes is possible to get sensible
  producer names for e.g. GPIO rails in "lsgpio" in userspace.

New drivers:

- New driver for the Loongson1.

- The XLP driver now supports Broadcom Vulcan ARM64.

- The IT87 driver now supports IT8620 and IT8628.

- The PCA953X driver now supports Galileo Gen2.

Driver improvements:

- MCP23S08 was switched to use the gpiolib irqchip helpers and
  now also suppors level-triggered interrupts.

- 74x164 and RCAR now supports the .set_multiple() callback

- AMDPT was converted to use generic GPIO.

- TC3589x, TPS65218, SX150X, F7188X, MENZ127, VX855, WM831X, WM8994
  support the new single ended callback for open drain
  and in some cases open source.

- Implement the .get_direction() callback for a few more drivers
  like PL061, Xgene.

Cleanups:

- Paul Gortmaker combed through the drivers and de-modularized
  those who are not really modules.

- Move the GPIO poweroff DT bindings to the power subdir where
  they belong.

- Rename gpio-generic.c to gpio-mmio.c, which is much more to the
  point. That's what it is handling, nothing more, nothing less.

----------------------------------------------------------------
Alexander Stein (3):
      gpio: mcp23s08: Add support for level triggered interrupts
      gpio: gpiolib-of: Allow compile testing
      gpio: tegra: Allow compile test

Arnd Bergmann (1):
      gpio/qoriq: select IRQ_DOMAIN

Axel Lin (9):
      gpio: menz127: Drop *mdev field from struct men_z127_gpio
      gpio: mb86s7x: Remove redundant platform_set_drvdata() call
      gpio: amdpt: Convert to use gpio-generic
      gpio: octeon: Convert to use devm_ioremap_resource
      gpio: octeon: Constify octeon_gpio_match table
      irqdomain: Export irq_domain_free_irqs_common
      gpio: xgene-sb: Use irq_domain_free_irqs_common()
      gpio: tpic2810: Make sure cached buffer has consistent status
with h/w status
      gpio: brcmstb: Return proper error if bank width is invalid

Christian Lamparter (3):
      gpio: generic: fix GPIO_GENERIC_PLATFORM is set to module case
      gpio: rename gpio-generic.c into gpio-mmio.c
      gpio: dt-bindings: add wd,mbl-gpio bindings

Duc Dang (2):
      gpio: xgene: Enable ACPI support for X-Gene GFC GPIO driver
      gpio: dwapb: Add ACPI device ID for DWAPB GPIO controller on
X-Gene platforms

Geert Uytterhoeven (5):
      gpio: rcar: Implement gpiochip.set_multiple()
      gpio: 74x164: Implement gpiochip.set_multiple()
      tools/gpio: Enable compiler optimization to catch more bugs
      tools/gpio: Add missing initialization of device_name
      pinctrl: sh-pfc: Let gpio_chip.to_irq() return zero on error

Grygorii Strashko (1):
      gpio: omap: fix irq triggering in smart-idle wakeup mode

Jiang Qiu (3):
      gpio: dwapb: remove name from dwapb_port_property
      gpio: dwapb: convert device node to fwnode
      gpio: dwapb: add gpio-signaled acpi event support

Kamlakant Patel (1):
      gpio: xlp: Add GPIO driver support for Broadcom Vulcan ARM64

Kelvin Cheung (1):
      gpio: Loongson1: add Loongson1 GPIO driver

Laxman Dewangan (8):
      gpio: of: Return error if gpio hog configuration failed
      gpio: of: Scan available child node for gpio-hog
      gpio: gpiolib: Print error number if gpio hog failed
      gpio: tegra: Don't open code of_device_get_match_data()
      gpio: tegra: Make of_device_id compatible data to constant
      gpio: tegra: Get rid of all file scoped global variables
      gpio: tegra: Add support for gpio debounce
      gpio: tegra: Implement gpio_get_direction callback

Linus Walleij (61):
      gpio: mcp23s08: delete req/rel_resource callbacks
      powerpc: mpc52xx_gpt: use gpiochip data pointer
      powerpc: mpc8349emitx: use gpiochip data pointer
      powerpc: sysdev: cpm1: use gpiochip data pointer
      powerpc: cpm_common: use gpiochip data pointer
      powerpc: ppc4xx: use gpiochip data pointer
      powerpc: qe_lib-gpio: use gpiochip data pointer
      powerpc: simple-gpio: use gpiochip data pointer
      sh: sdk7786-gpio: switch to gpiochip_add_data()
      sh: x3proto-gpio: switch to gpiochip_add_data()
      unicore32: gpio: switch to gpiochip_add_data()
      input: adp5589-keys: use gpiochip data pointer
      input: ad7879: use gpiochip data pointer
      powerpc: ppc4xx: drop unused variable
      gpio: dt-bindings: document the concept of GPIO banks
      gpio: support native single-ended hardware drivers
      gpio: tc3589x: use BIT() macro
      gpio: tc3589x: implement open drain/source callback
      gpio: document open drain/source behaviour
      gpio: tps65218: use the new open drain callback
      gpio: sx150x: move platform data into driver
      gpio: sx150x: use the new open drain callback
      gpio: f7188x: use BIT() macro
      gpio: f7188x: use the new open drain callback
      gpio: menz127: use the new open drain callback
      gpio: vx855: use the new open drain callback
      gpio: wm831x: use the new open drain callback
      gpio: wm8994: use the new open drain callback
      gpio: f7188x: fix edit mistake
      gpio: move gpiod_set_array_value_priv()
      gpio: revert bank bindings
      gpio: remove deps on ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
      avr32: do away with ARCH_REQUIRE_GPIOLIB
      metag: remove ARCH_WANT_OPTIONAL_GPIOLIB
      alpha: remove ARCH_WANT_OPTIONAL_GPIOLIB
      xtensa: remove ARCH_WANT_OPTIONAL_GPIOLIB
      m68k: do away with ARCH_REQUIRE_GPIOLIB
      nios2: remove ARCH_WANT_OPTIONAL_GPIOLIB
      cris: do away with ARCH_REQUIRE_GPIOLIB
      sparc: remove ARCH_WANT_OPTIONAL_GPIOLIB
      arc: select GPIOLIB directly
      input: adp5588-keys: use gpiochip data pointer
      platform: x86: intel-pmic: use gpiochip data pointer
      ssb: gpio_driver: use gpiochip data pointer
      staging: vme: use gpiochip data pointer
      serial: max310x: use gpiochip data pointer
      serial: sc16is7xx: use gpiochip data pointer
      ASoC: rt5677: use gpiochip data pointer
      ASoC: wm5100: use gpiochip data pointer
      ASoC: wm8903: use gpiochip data pointer
      ASoC: wm8962: use gpiochip data pointer
      ASoC: wm8996: use gpiochip data pointer
      ASoC: ac97: use gpiochip data pointer
      gpio: clarify open drain/source docs
      gpio: pl061: remove range check
      gpio: pl061: implement .get_direction()
      gpio: set up initial state from .get_direction()
      gpio: xgene: implement .get_direction()
      gpio: make gpiod_to_irq() return negative for NO_IRQ
      gpio: of: make it possible to name GPIO lines
      MIPS: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB

Liu Gang (1):
      gpio: mpc8xxx: Add new platforms GPIO DT node description

Martin Blumenstingl (1):
      gpio: gpio-it87: Add support for IT8620 and IT8628

Nicolas Saenz Julienne (1):
      gpio: 74x164: add dt support for nxp's 74x594

Paul Gortmaker (19):
      gpio: bcm-kona: make explicitly non-modular
      gpio: mb86s7x: make explicitly non-modular
      gpio: mc9s08dz60: make explicitly non-modular
      gpio: moxart: make explicitly non-modular
      gpio: mvebu: make explicitly non-modular
      gpio: pl061: make explicitly non-modular
      gpio: sta2x11: make explicitly non-modular
      gpio: xgene: make explicitly non-modular
      gpio: zx: make explicitly non-modular
      gpio: rc5t583: make explicitly non-modular
      gpio: tc3589x: make explicitly non-modular
      gpio: sx150x: make explicitly non-modular
      gpio: palmas: make explicitly non-modular
      gpio: tps65910: make explicitly non-modular
      gpio: tps6586x: make explicitly non-modular
      gpio: sodaville: make it explicitly non-modular
      gpio: stmpe: make it explicitly non-modular
      gpio: timberdale: make it explicitly non-modular
      gpio: zevio: make it explicitly non-modular

Phil Reid (1):
      gpio: mcp23s08: switch to use gpiolib irqchip helpers

Shubhrajyoti Datta (1):
      gpio: zynq: Fix the error path

Wolfram Sang (2):
      MAINTAINERS: gpio: add DT bindings directory
      gpio/reset: move gpio-{poweroff|restart} DT doc to proper place

YD Tseng (1):
      gpio: amdpt: Add a new ACPI HID

Yong Li (1):
      gpio: pca953x: add PCAL9535 interrupt support for Galileo Gen2

 .../devicetree/bindings/gpio/gpio-74x164.txt       |   4 +-
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |  20 +-
 .../devicetree/bindings/gpio/gpio-xlp.txt          |   3 +
 Documentation/devicetree/bindings/gpio/gpio.txt    |  26 ++
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt       |  38 ++
 .../{gpio => power/reset}/gpio-poweroff.txt        |   0
 .../{gpio => power/reset}/gpio-restart.txt         |   0
 Documentation/gpio/driver.txt                      |  97 +++++
 MAINTAINERS                                        |   1 +
 arch/alpha/Kconfig                                 |   1 -
 arch/arc/plat-axs10x/Kconfig                       |   2 +-
 arch/arc/plat-tb10x/Kconfig                        |   2 +-
 arch/avr32/Kconfig                                 |   2 +-
 arch/cris/Kconfig                                  |   2 +-
 arch/m68k/Kconfig.cpu                              |   2 +-
 arch/metag/Kconfig.soc                             |   1 -
 arch/mips/Kconfig                                  |  32 +-
 arch/mips/alchemy/Kconfig                          |   2 +-
 arch/mips/pic32/Kconfig                            |   2 +-
 arch/nios2/Kconfig                                 |   1 -
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c          |  15 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c     |   6 +-
 arch/powerpc/sysdev/cpm1.c                         |  36 +-
 arch/powerpc/sysdev/cpm_common.c                   |  18 +-
 arch/powerpc/sysdev/ppc4xx_gpio.c                  |  17 +-
 arch/powerpc/sysdev/simple_gpio.c                  |  13 +-
 arch/sh/boards/mach-sdk7786/gpio.c                 |   4 +-
 arch/sh/boards/mach-x3proto/gpio.c                 |   4 +-
 arch/sparc/Kconfig                                 |   1 -
 arch/unicore32/kernel/gpio.c                       |   4 +-
 arch/xtensa/Kconfig                                |   1 -
 drivers/gpio/Kconfig                               |  22 +-
 drivers/gpio/Makefile                              |   6 +-
 drivers/gpio/gpio-74x164.c                         |  25 ++
 drivers/gpio/gpio-amdpt.c                          | 123 +-----
 drivers/gpio/gpio-bcm-kona.c                       |  14 +-
 drivers/gpio/gpio-brcmstb.c                        |   1 +
 drivers/gpio/gpio-dwapb.c                          |  78 ++--
 drivers/gpio/gpio-f7188x.c                         |  52 ++-
 drivers/gpio/gpio-it87.c                           |  10 +
 drivers/gpio/gpio-loongson1.c                      | 102 +++++
 drivers/gpio/gpio-mb86s7x.c                        |  10 +-
 drivers/gpio/gpio-mc9s08dz60.c                     |  12 +-
 drivers/gpio/gpio-mcp23s08.c                       | 111 ++---
 drivers/gpio/gpio-menz127.c                        |  22 +-
 drivers/gpio/{gpio-generic.c => gpio-mmio.c}       |   2 +-
 drivers/gpio/gpio-moxart.c                         |   7 +-
 drivers/gpio/gpio-mvebu.c                          |   5 +-
 drivers/gpio/gpio-octeon.c                         |  26 +-
 drivers/gpio/gpio-omap.c                           |  42 +-
 drivers/gpio/gpio-palmas.c                         |  13 +-
 drivers/gpio/gpio-pca953x.c                        |  42 +-
 drivers/gpio/gpio-pl061.c                          |  26 +-
 drivers/gpio/gpio-rc5t583.c                        |  12 -
 drivers/gpio/gpio-rcar.c                           |  20 +
 drivers/gpio/gpio-sodaville.c                      |  28 +-
 drivers/gpio/gpio-sta2x11.c                        |   8 +-
 drivers/gpio/gpio-stmpe.c                          |  31 +-
 drivers/gpio/gpio-sx150x.c                         | 100 ++++-
 drivers/gpio/gpio-tc3589x.c                        |  69 ++-
 drivers/gpio/gpio-tegra.c                          | 485 +++++++++++++--------
 drivers/gpio/gpio-timberdale.c                     |  35 +-
 drivers/gpio/gpio-tpic2810.c                       |  35 +-
 drivers/gpio/gpio-tps65218.c                       |  45 +-
 drivers/gpio/gpio-tps6586x.c                       |  13 +-
 drivers/gpio/gpio-tps65910.c                       |  16 +-
 drivers/gpio/gpio-vx855.c                          |  23 +
 drivers/gpio/gpio-wm831x.c                         |  25 +-
 drivers/gpio/gpio-wm8994.c                         |  25 +-
 drivers/gpio/gpio-xgene-sb.c                       |  15 +-
 drivers/gpio/gpio-xgene.c                          |  30 +-
 drivers/gpio/gpio-xlp.c                            |  25 +-
 drivers/gpio/gpio-zevio.c                          |  21 +-
 drivers/gpio/gpio-zx.c                             |  14 +-
 drivers/gpio/gpio-zynq.c                           |   4 +-
 drivers/gpio/gpiolib-of.c                          |  66 ++-
 drivers/gpio/gpiolib.c                             | 133 ++++--
 drivers/gpio/gpiolib.h                             |   4 +
 drivers/input/keyboard/adp5588-keys.c              |  10 +-
 drivers/input/keyboard/adp5589-keys.c              |  12 +-
 drivers/input/touchscreen/ad7879.c                 |  10 +-
 drivers/mfd/intel_quark_i2c_gpio.c                 |   3 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |   2 +-
 drivers/platform/x86/intel_pmic_gpio.c             |   6 +-
 drivers/soc/fsl/qe/gpio.c                          |  20 +-
 drivers/ssb/driver_gpio.c                          |  33 +-
 drivers/staging/vme/devices/vme_pio2_gpio.c        |  17 +-
 drivers/tty/serial/max310x.c                       |  12 +-
 drivers/tty/serial/sc16is7xx.c                     |  16 +-
 include/linux/gpio/driver.h                        |  25 +-
 include/linux/i2c/sx150x.h                         |  82 ----
 include/linux/platform_data/gpio-dwapb.h           |   3 +-
 kernel/irq/irqdomain.c                             |   1 +
 sound/soc/codecs/rt5677.c                          |  17 +-
 sound/soc/codecs/wm5100.c                          |  16 +-
 sound/soc/codecs/wm8903.c                          |  17 +-
 sound/soc/codecs/wm8962.c                          |  15 +-
 sound/soc/codecs/wm8996.c                          |  16 +-
 sound/soc/soc-ac97.c                               |   8 +-
 tools/gpio/Makefile                                |   2 +-
 tools/gpio/lsgpio.c                                |   2 +-
 101 files changed, 1566 insertions(+), 1169 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
 rename Documentation/devicetree/bindings/{gpio =>
power/reset}/gpio-poweroff.txt (100%)
 rename Documentation/devicetree/bindings/{gpio =>
power/reset}/gpio-restart.txt (100%)
 create mode 100644 drivers/gpio/gpio-loongson1.c
 rename drivers/gpio/{gpio-generic.c => gpio-mmio.c} (99%)
 delete mode 100644 include/linux/i2c/sx150x.h
