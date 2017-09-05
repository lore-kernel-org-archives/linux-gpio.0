From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for v4.14
Date: Tue, 5 Sep 2017 10:55:35 +0200
Message-ID: <CACRpkdYx4knf-0Nn=jN540xDBgso2n0n6P2wLZc89bNUF4Re9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36694 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750960AbdIEIzh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2017 04:55:37 -0400
Received: by mail-oi0-f54.google.com with SMTP id x190so4595271oix.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2017 01:55:36 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Daney <ddaney@caviumnetworks.com>

Hi Linus,

this is the bulk of GPIO changes for the v4.14 development cycle.

I have pulled in an immutable branch from Thomas Gleixner to build
new GPIO irqchip infrastructure on top, so some patches (that I see
already landed in your tree) appear here as well. It should all merge up
fine.

The details are in the signed tag as usual. Not so much changes this
time, phew. David Daney and Bartosz Golaszewski did all the really
interesting work in infrastructure improvement across GPIO and IRQ
core, hats off for them and to tglx and Marc Z for general help with these
patch sets.

I had to revert a semantic change for lines to be requested before
checking their direction in the core, let's see if we can figure this out
for the next cycle instead.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit ef954844c7ace62f773f4f23e28d2d915adc419f=
:

  Linux 4.13-rc5 (2017-08-13 16:01:32 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.14-1

for you to fetch changes up to 02b6bddb0b0a4e27fad6623d82579f2a1e35d3d3:

  gpio: mockup: remove unused variable gc (2017-08-31 15:21:07 +0200)

----------------------------------------------------------------
This is the bulk of the GPIO changes for the v4.14 cycle:

Core changes
- Allow the GPIO irqchip to allocate IRQs dynamically. This is
  an important change on systems where only a restricted number
  of IRQs, lesser than the number of GPIO lines, can be utilized.
  Now we can allocate these on a first-come-first-served basis
  instead of hogging up valuable IRQ lines.
- Serious fix-up of the kerneldoc documentation and inclusion
  into the kerneldoc builds.
- Pulled in the IRQ simulator from the IRQ core tree and use
  this in the GPIO mockup driver for exhaustive testing of
  interrupt abilities.

New drivers
- New driver for ThunderX and OCTEON-TX. This is especially
  interesting as it picks up improvements from the IRQ core that
  allow us to handle fasteoi ACKs upwards in a hierarchy when
  there are IRQ flag latches on several levels in a hierarchy.
  Very interesting work here.
- New subdriver for Renesas R-Car r8a7745 (RZ/G1E).

Misc
- Several fixes and improvements for Xilinx Zynq GPIO.
- Support an enablement GPIO for the 74x164 GPIO.
- Switch a bunch of chips to use devres to allocate irq
  descriptors.
- A bunch of constification fixes.

----------------------------------------------------------------
Andrew Jeffery (2):
      dt-bindings: gpio: aspeed: Remove reference to clock name
      gpio: aspeed: Remove reference to clock name in debounce warning mess=
age

Andy Shevchenko (1):
      gpio: pca953x: remove incorrect le16_to_cpu calls

Arvind Yadav (3):
      gpio: mb86s7x: Handle return value of clk_prepare_enable.
      gpio: omap : Add missing clk_unprepare().
      gpio: pl061: constify amba_id

Bartosz Golaszewski (11):
      genirq/irq_sim: Add a simple interrupt simulator framework
      genirq/irq_sim: Add a devres variant of irq_sim_init()
      gpio: mxc: disallow unbinding the driver
      gpio: mxs: disallow unbinding the driver
      gpio: sta2x11: disallow unbinding the driver
      gpio: sta2x11: use devres for irq generic chip
      gpio: ml-ioh: use devres for irq generic chip
      gpio: pch: use devres for irq generic chip
      gpio: mxc: use devres for irq generic chip
      gpio: mxs: use devres for irq generic chip
      gpio: mockup: use irq_sim

Bhumika Goyal (2):
      gpio: max77620: Make regmap_irq_chip const
      gpio: zevio: make gpio_chip const

Biju Das (1):
      gpio: rcar: Add r8a7745 (RZ/G1E) support

Colin Ian King (1):
      gpio: mockup: remove unused variable gc

David Daney (7):
      genirq: Export more irq_chip_*_parent() functions
      genirq: Add handle_fasteoi_{level,edge}_irq flow handlers
      irqdomain: Factor out code to add and remove items to and from the re=
vmap
      irqdomain: Check for NULL function pointer in
irq_domain_free_irqs_hierarchy()
      irqdomain: Add irq_domain_{push,pop}_irq() functions
      gpio: Add gpio driver support for ThunderX and OCTEON-TX
      MAINTAINERS: Add entry for THUNDERX GPIO Driver.

Diego Elio Petten=C3=B2 (1):
      gpio: it87: add support for IT8772F Super I/O.

Dmitry Torokhov (1):
      gpio: add gpio_add_lookup_tables() to add several tables at once

Dong Aisheng (2):
      dt-bindings: gpio-vf610: add imx7ulp support
      gpio: vf610: add imx7ulp support

Fabio Estevam (1):
      gpio: 74x164: Introduce 'enable-gpios' property

Grygorii Strashko (3):
      gpiolib: allow gpio irqchip to map irqs dynamically
      gpio: pxa: remove gpio_to_irq() from hw irq handlers
      gpio: tegra: remove gpio_to_irq() from hw irq handlers

Gustavo A. R. Silva (2):
      gpio: altera-a10sr: constify gpio_chip structure
      gpio: msic: fix error return code in platform_msic_gpio_probe()

Keerthy (4):
      gpio: davinci: Use devm_gpiochip_add_data in place of gpiochip_add_da=
ta
      gpio: davinci: Convert prinkt to dev_err
      dt-bindings: gpio: davinci: Add keystone-k2g compatible
      gpio: davinci: Handle the return value of davinci_gpio_irq_setup func=
tion

Linus Walleij (2):
      Merge branch 'irq/for-gpio' of git://git.kernel.org/.../tip/tip into =
devel
      Revert "gpiolib: request the gpio before querying its direction"

Masahiro Yamada (3):
      gpio: replace __maybe_unused in gpiolib.h with static inline
      gpio: brcmstb: check return value of gpiochip_irqchip_add()
      gpio: twl6040: remove unneeded forward declaration

Michal Simek (2):
      gpio: zynq: Fix empty lines in driver
      gpio: zynq: Fix driver function parameters alignment

Nava kishore Manne (2):
      gpio: zynq: Fix kernel doc warnings
      gpio: zynq: Fix warnings in the driver

Philipp Rosenberger (1):
      gpio: gpio-mxc: gpio_set_wake_irq() use proper return values

Rajmohan Mani (1):
      gpio: Add support for TPS68470 GPIOs

Rob Herring (1):
      gpio: Convert to using %pOF instead of full_name

Shubhrajyoti Datta (1):
      gpio: zynq: Add support for suspend resume

Simon Horman (1):
      gpio: rcar: add gen[123] fallback compatibility strings

Swapna Manupati (1):
      gpio: zynq: Provided workaround for GPIO

Thierry Reding (13):
      gpio: tegra: Use platform_irq_count()
      gpio: tegra: Use platform_get_irq()
      gpio: Cleanup kerneldoc
      gpio: of: Improve kerneldoc
      gpio: devres: Improve kerneldoc
      gpio: acpi: Fixup kerneldoc
      gpio: sysfs: Fixup kerneldoc
      docs: driver-api: Add GPIO section
      gpio: Use unsigned int for of_gpio_n_cells
      gpio: tegra: Remove unnecessary check
      gpio: tegra: Prefer kcalloc() over kzalloc() with multiplies
      gpio: tegra: Fix checkpatch warnings
      gpio: tegra: Use unsigned int where possible

Timur Tabi (1):
      gpiolib: request the gpio before querying its direction

 .../devicetree/bindings/gpio/gpio-74x164.txt       |   3 +
 .../devicetree/bindings/gpio/gpio-aspeed.txt       |   2 +-
 .../devicetree/bindings/gpio/gpio-davinci.txt      |  91 ++-
 .../devicetree/bindings/gpio/gpio-vf610.txt        |   4 +-
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |  16 +-
 Documentation/driver-api/gpio.rst                  |  45 ++
 Documentation/driver-api/index.rst                 |   1 +
 Documentation/driver-model/devres.txt              |   1 +
 MAINTAINERS                                        |   5 +
 drivers/gpio/Kconfig                               |  26 +-
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/devres.c                              |   3 +
 drivers/gpio/gpio-74x164.c                         |  10 +
 drivers/gpio/gpio-altera-a10sr.c                   |   2 +-
 drivers/gpio/gpio-altera.c                         |   4 +-
 drivers/gpio/gpio-aspeed.c                         |   2 +-
 drivers/gpio/gpio-brcmstb.c                        |  11 +-
 drivers/gpio/gpio-davinci.c                        |  22 +-
 drivers/gpio/gpio-ge.c                             |   6 +-
 drivers/gpio/gpio-grgpio.c                         |   2 +-
 drivers/gpio/gpio-it87.c                           |   3 +
 drivers/gpio/gpio-max77620.c                       |   2 +-
 drivers/gpio/gpio-mb86s7x.c                        |   4 +-
 drivers/gpio/gpio-ml-ioh.c                         |  12 +-
 drivers/gpio/gpio-mockup.c                         |  79 +--
 drivers/gpio/gpio-mpc8xxx.c                        |   4 +-
 drivers/gpio/gpio-msic.c                           |   4 +-
 drivers/gpio/gpio-mxc.c                            |  27 +-
 drivers/gpio/gpio-mxs.c                            |  15 +-
 drivers/gpio/gpio-omap.c                           |   2 +
 drivers/gpio/gpio-pca953x.c                        |   8 +-
 drivers/gpio/gpio-pch.c                            |  12 +-
 drivers/gpio/gpio-pl061.c                          |   2 +-
 drivers/gpio/gpio-pxa.c                            |   8 +-
 drivers/gpio/gpio-rcar.c                           |  10 +
 drivers/gpio/gpio-sta2x11.c                        |  14 +-
 drivers/gpio/gpio-tb10x.c                          |   3 +-
 drivers/gpio/gpio-tegra.c                          | 129 ++---
 drivers/gpio/gpio-thunderx.c                       | 639 +++++++++++++++++=
++++
 drivers/gpio/gpio-tps68470.c                       | 176 ++++++
 drivers/gpio/gpio-twl6040.c                        |   2 -
 drivers/gpio/gpio-tz1090.c                         |  10 +-
 drivers/gpio/gpio-vf610.c                          |  47 +-
 drivers/gpio/gpio-xilinx.c                         |   4 +-
 drivers/gpio/gpio-zevio.c                          |   2 +-
 drivers/gpio/gpio-zynq.c                           | 160 +++++-
 drivers/gpio/gpiolib-acpi.c                        |   4 +-
 drivers/gpio/gpiolib-of.c                          |  36 +-
 drivers/gpio/gpiolib-sysfs.c                       |   8 +-
 drivers/gpio/gpiolib.c                             | 130 +++--
 drivers/gpio/gpiolib.h                             |   2 +-
 include/linux/gpio/driver.h                        |  24 +-
 include/linux/gpio/machine.h                       |   3 +
 include/linux/irq.h                                |   2 +
 include/linux/irq_sim.h                            |  44 ++
 include/linux/irqdomain.h                          |   3 +
 kernel/irq/Kconfig                                 |   9 +
 kernel/irq/Makefile                                |   1 +
 kernel/irq/chip.c                                  | 109 ++++
 kernel/irq/irq_sim.c                               | 164 ++++++
 kernel/irq/irqdomain.c                             | 230 +++++++-
 61 files changed, 2049 insertions(+), 356 deletions(-)
 create mode 100644 Documentation/driver-api/gpio.rst
 create mode 100644 drivers/gpio/gpio-thunderx.c
 create mode 100644 drivers/gpio/gpio-tps68470.c
 create mode 100644 include/linux/irq_sim.h
 create mode 100644 kernel/irq/irq_sim.c
