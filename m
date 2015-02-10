From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] bulk GPIO changes for v3.20
Date: Tue, 10 Feb 2015 10:35:58 +0800
Message-ID: <CACRpkdb7QnJk1V1EahQk-Hhq=X-hu=OB5F9cd4YE04JR24FyJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of GPIO subsystem changes accumulated for the v3.20
series. Nothing is very remarkable, there is a lot of cleanup and driver
churn as usual. Lots of authors and patches.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit ec6f34e5b552fb0a52e6aae1a5afbbb1605cc6cc:

  Linux 3.19-rc5 (2015-01-18 18:02:20 +1200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v3.20-1

for you to fetch changes up to 0a4a3529df40c4be163b3909942b16c6c46b9d03:

  gpio: kconfig: replace PPC_OF with PPC (2015-02-04 11:06:45 +0100)

----------------------------------------------------------------
This is the GPIO bulk changes for the v3.20 series:
- GPIOLIB core changes:
  - Create and use of_mm_gpiochip_remove() for removing
    memory-mapped OF GPIO chips
  - GPIO MMIO library suppports bgpio_set_multiple for
    switching several lines at once, a feature merged in
    the last cycle.
- New drivers:
  - New driver for the APM X-gene standby GPIO controller
  - New driver for the Fujitsu MB86S7x GPIO controller
- Cleanups:
  - Moved rcar driver to use gpiolib irqchip
  - Moxart converted to the GPIO MMIO library
  - GE driver converted to GPIO MMIO library
  - Move sx150x to irqdomain
  - Move max732x to irqdomain
  - Move vx855 to use managed resources
  - Move dwapb to use managed resources
  - Clean tc3589x from platform data
  - Clean stmpe driver to use device tree only probe
- New subtypes:
  - sx1506 support in the sx150x driver
  - Quark 1000 SoC support in the SCH driver
  - Support X86 in the Xilinx driver
  - Support PXA1928 in the PXA driver
- Extended drivers:
  - max732x supports device tree probe
  - sx150x supports device tree probe
- Various minor cleanups and bug fixes

----------------------------------------------------------------
Andrew Lunn (2):
      gpio: mvebu: checkpatch fixes
      gpio: mvebu: Fix probe cleanup on error

Axel Lin (6):
      gpio: vx855: Switch to use managed resources APIs
      gpio: sx150x: Fix comparing wrong value with chip->irq_masked
      gpio: tz1090: Use resource_size to fix off-by-one
      gpio: dwapb: Convert to use resource managed APIs
      gpio: ge: Convert to use devm_kstrdup
      gpio: tz1090-pdc: Use resource_size to fix off-by-one resource
size calculation

Chang Rebecca Swee Fun (2):
      gpio: sch: Add support for Intel Quark X1000 SoC
      gpio: sch: Consolidate similar algorithms

Dan Carpenter (1):
      gpio: grgpio: off by one in grgpio_to_irq()

Geert Uytterhoeven (2):
      gpio: rcar: Fix error path for devm_kzalloc() failure
      gpio: rcar: Switch to use gpiolib irqchip helpers

Jassi Brar (1):
      gpio: Add Fujitsu MB86S7x GPIO driver

Kamlakant Patel (3):
      gpio: moxart: convert to use basic mmio gpio library
      gpio: ge: convert to use basic mmio gpio library
      gpio: ge: fix compilation error

Kevin Hao (1):
      gpio: kconfig: replace PPC_OF with PPC

Linus Walleij (5):
      gpio: tc3589x: get rid of platform data
      Merge tag 'v3.19-rc5' into devel
      gpio: stmpe: enforce device tree only mode
      gpio: sx150x: fixup OF support
      gpio: max732x: use an inline function for container cast

Mans Rullgard (1):
      gpio: max732x: add set_multiple function

Masahiro Yamada (1):
      Documentation: gpio: fix bindings document

Mohammad Jamal (1):
      gpio: gpio-dln2: Added a Blank line after declaration

Olliver Schinagl (4):
      gpio: Make the vararg hacks not pass magic values
      gpio:gpiolib: use static const char const * for a suffixes array
      gpio: correctly use const char * const
      gpio: use sizeof() instead of hardcoded values

Ricardo Ribalda Delgado (16):
      gpio/xilinx: Remove offset property
      gpio/xilinx: Convert the driver to platform device interface
      gpio/xilinx: Add support for X86 Arch
      gpio/xilinx: Fix kernel-doc
      gpio/xilinx: Create a single gpio chip on dual cores
      gpio/gpiolib-of: Create of_mm_gpiochip_remove
      gpio/xilinx: Use of_mm_gpiochip_remove
      gpio/Kconfig: Fix X86 arch name
      gpio: mpc5200: Use of_mm_gpiochip_remove
      gpio :gpio-mm-lantiq: Use devm_kzalloc
      gpio: gpio-mm-lantiq: Do not replicate code
      gpio: gpio-mm-lantiq: Use of_property_read_u32
      gpio: gpio-mm-lantiq: Use of_mm_gpiochip_remove
      gpio: zevio: Use of_mm_gpiochip_remove
      gpio: mpc8xxx: Convert to platform device interface.
      gpio: mpc8xxx: Use of_mm_gpiochip_remove

Rob Herring (3):
      gpio: pxa: remove mach IRQ includes
      dt/bindings: gpio: add compatible string for marvell,pxa1928-gpio
      gpio: pxa: add PXA1928 gpio type support

Rojhalat Ibrahim (1):
      gpio-generic: add bgpio_set_multiple functions

Semen Protsenko (4):
      gpio: max732x: Add device tree support
      gpio: max732x: Rewrite IRQ code to use irq_domain API
      gpio: max732x: Fix possible deadlock
      gpio: max732x: Add DT binding documentation

Varka Bhadram (2):
      gpio-amd8111: check ioport_map return value
      gpio-amd8111: add release_region on ioport_map failure

Wei Chen (3):
      gpio: sx150x: move to irqdomain framework for sx150x driver
      gpio: sx150x: add support for sx1506 gpio expander device
      gpio: sx150x: add dts support for sx150x driver

Wolfram Sang (1):
      gpio: drop owner assignment from platform_drivers

Y Vo (2):
      gpio: Add APM X-Gene standby GPIO controller driver
      Documentation: gpio: Add APM X-Gene standby GPIO controller DTS binding

 .../bindings/gpio/fujitsu,mb86s70-gpio.txt         |  20 ++
 .../devicetree/bindings/gpio/gpio-max732x.txt      |  59 +++++
 .../devicetree/bindings/gpio/gpio-sx150x.txt       |  40 +++
 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |  32 +++
 Documentation/devicetree/bindings/gpio/gpio.txt    |   5 +-
 .../devicetree/bindings/gpio/mrvl-gpio.txt         |   4 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/gpio/Kconfig                               |  35 ++-
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/gpio-amd8111.c                        |   6 +
 drivers/gpio/gpio-dln2.c                           |   1 +
 drivers/gpio/gpio-dwapb.c                          |  53 +---
 drivers/gpio/gpio-ge.c                             |  98 +++----
 drivers/gpio/gpio-generic.c                        |  76 ++++++
 drivers/gpio/gpio-grgpio.c                         |   2 +-
 drivers/gpio/gpio-max732x.c                        | 225 +++++++++++-----
 drivers/gpio/gpio-mb86s7x.c                        | 232 +++++++++++++++++
 drivers/gpio/gpio-mm-lantiq.c                      |  42 +--
 drivers/gpio/gpio-moxart.c                         | 101 +++-----
 drivers/gpio/gpio-mpc5200.c                        |  23 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  70 +++--
 drivers/gpio/gpio-mvebu.c                          | 100 +++++---
 drivers/gpio/gpio-pxa.c                            |  55 ++--
 drivers/gpio/gpio-rcar.c                           |  75 ++----
 drivers/gpio/gpio-sch.c                            |  89 +++----
 drivers/gpio/gpio-stmpe.c                          |  23 +-
 drivers/gpio/gpio-sx150x.c                         | 251 ++++++++++--------
 drivers/gpio/gpio-tc3589x.c                        |  15 +-
 drivers/gpio/gpio-tz1090-pdc.c                     |   2 +-
 drivers/gpio/gpio-tz1090.c                         |   2 +-
 drivers/gpio/gpio-vf610.c                          |   1 -
 drivers/gpio/gpio-vx855.c                          |  44 +---
 drivers/gpio/gpio-xgene-sb.c                       | 160 ++++++++++++
 drivers/gpio/gpio-xilinx.c                         | 284 ++++++++++++---------
 drivers/gpio/gpio-zevio.c                          |  12 +
 drivers/gpio/gpiolib-of.c                          |  17 ++
 drivers/gpio/gpiolib.c                             |   8 +-
 include/linux/gpio/consumer.h                      |  17 +-
 include/linux/mfd/stmpe.h                          |  16 --
 include/linux/mfd/tc3589x.h                        |  12 -
 include/linux/of_gpio.h                            |   1 +
 41 files changed, 1518 insertions(+), 793 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
 create mode 100644 drivers/gpio/gpio-mb86s7x.c
 create mode 100644 drivers/gpio/gpio-xgene-sb.c
