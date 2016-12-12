From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for v4.10
Date: Mon, 12 Dec 2016 10:53:30 +0100
Message-ID: <CACRpkdaWXkm+FFmuoaMZqGKOui+=bnXswPEcHt+r=ME4_h1M3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:33567 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750712AbcLLJxb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2016 04:53:31 -0500
Received: by mail-qk0-f180.google.com with SMTP id x190so77594317qkb.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2016 01:53:31 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is the bulk of the GPIO changes for the v4.10 series.

I had some screwups in linux-next last week but ironed it out,
but in case you wonder why there are two relatively young
immutable branches (pl061 and thread-irq-simpler) merged in
dec 7 it's because of fixing that mess. It has since been tested
in linux-next.

The two immutable branches have cross dependencies to pin
control so they will appear in that pull request as well.

Please pull it in! Technical details are in the signed tag.

Yours,
Linus Walleij


The following changes since commit 07d9a380680d1c0eb51ef87ff2eab5c994949e69:

  Linux 4.9-rc2 (2016-10-23 17:10:14 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.10-1

for you to fetch changes up to acf1fcf77247efa01d7213f53082451f6c9c8f3b:

  Merge branch 'thread-irq-simpler' into devel (2016-12-07 15:24:12 +0100)

----------------------------------------------------------------
Bulk GPIO changes for the v4.10 kernel cycle:

Core changes:

- Simplify threaded interrupt handling: instead of passing
  numbed parameters to gpiochip_irqchip_add_chained() we
  create a new call: gpiochip_irqchip_add_nested() so the two
  types are clearly semantically different. Also make sure
  that all nested chips call gpiochip_set_nested_irqchip()
  which is necessary for IRQ resend to work properly if
  it happens.

- Return error on seek operations for the chardev.

- Clamp values set as part of gpio[d]_direction_output() so
  that anything != 0 will be send down to the driver as "1"
  not the value passed in.

- ACPI can now support naming of GPIO lines, hogs and holes
  in the GPIO lists.

New drivers:

- The SX150x driver was deemed unfit for the GPIO subsystem
  and was moved over to a combined GPIO+pinctrl driver in the
  pinctrl subsystem.

New features:

- Various cleanups to various drivers.

----------------------------------------------------------------
Andy Shevchenko (3):
      gpio: merrifield: set default handler to be handle_bad_irq()
      gpio: merrifield: Add support for hardware debouncer
      gpio: merrifield: Implement gpio_get_direction callback

Anthony Best (1):
      gpio: fix struct gpio_chip comment

Arnd Bergmann (1):
      ACPI / gpio: avoid warning for gpio hogging code

Axel Haslam (1):
      gpio: davinci: Use unique labels for each gpio chip

Axel Lin (1):
      gpio: max77620: Remove unused fields from struct max77620_gpio

Bamvor Jian Zhang (2):
      tools/gpio: add gpio basic opereations
      tools/gpio: re-work gpio hammer with gpio operations

Charles Keepax (2):
      gpio: arizona: Remove pointless set of platform drvdata
      gpio: arizona: Tidy up probe error path

Geliang Tang (4):
      gpio: intel-mid: use builtin_pci_driver
      gpio: etraxfs: use builtin_platform_driver
      gpio: mb86s7x: use builtin_platform_driver
      gpio: vf610: use builtin_platform_driver

Jean Delvare (1):
      gpio: ts4900: Add hardware dependencies

Lars-Peter Clausen (1):
      gpio: chardev: Return error for seek operations

Linus Walleij (15):
      Merge branch 'ib-sx150x' of /home/linus/linux-pinctrl into devel
      gpio: htc-egpio: add .get_direction() support
      gpio: htc-egpio: read output value from cache
      gpio: clamp values on gpio[d]_direction_output()
      gpio: tag line labels used for interrupts
      gpio: stmpe: fix interrupt handling bug
      gpio: simplify adding threaded interrupts
      gpio: set explicit nesting on drivers
      gpio: pl061: use local state for parent IRQ storage
      gpio: pl061: rename state container struct
      gpio: pl061: rename variable from chip to pl061
      gpio: pl061: move platform data into driver
      gpio: pl061: delete platform data handling
      Merge branch 'pl061' into devel
      Merge branch 'thread-irq-simpler' into devel

Marek Vasut (1):
      gpio: pca953x: Add MAX7318 compatible

Mika Westerberg (4):
      ACPI / gpio: Allow holes in list of GPIOs for a device
      ACPI / gpio: Add hogging support
      gpio: Rework of_gpiochip_set_names() to use device property accessors
      ACPI / gpio: Add support for naming GPIOs

Neil Armstrong (1):
      pinctrl: Add SX150X GPIO Extender Pinctrl Driver

Paul Gortmaker (1):
      gpio: htc-egpio: Make it explicitly non-modular

Peter Robinson (3):
      gpio: x86: update config dependencies for x86 specific hardware
      gpio: zx: depend on ARCH_ZX
      gpio: em: depnd on ARCH_SHMOBILE

Quentin Schulz (1):
      gpio: axp209: use correct register for GPIO input status

Sascha Hauer (2):
      gpio: mxs: use enable/disable regs to (un)mask irqs
      gpio: mxs: fix duplicate level interrupts

Thor Thayer (2):
      gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
      gpio: gpiolib-devprop: Check chip->parent pointer before dereferencing

Venkat Reddy Talla (1):
      gpio: max77620: add compatible string to device id list

Wei Yongjun (4):
      gpio: altera-a10sr: Drop unnecessary gpiochip_remove
      ACPI / gpio: add missing fwnode_handle_put() in acpi_gpiochip_scan_gpios()
      ACPI / gpio: make acpi_gpiochip_parse_own_gpio static
      gpio: of: add missing of_node_put() in of_gpiochip_scan_gpios()

 Documentation/acpi/gpio-properties.txt             |   62 ++
 .../devicetree/bindings/gpio/gpio-sx150x.txt       |   41 -
 .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |   69 ++
 Documentation/gpio/driver.txt                      |   62 +-
 arch/arm/mach-integrator/impd1.c                   |    1 -
 drivers/gpio/Kconfig                               |   38 +-
 drivers/gpio/Makefile                              |    3 +-
 drivers/gpio/gpio-adnp.c                           |   12 +-
 drivers/gpio/gpio-altera-a10sr.c                   |  130 +++
 drivers/gpio/gpio-arizona.c                        |    9 +-
 drivers/gpio/gpio-axp209.c                         |    8 +-
 drivers/gpio/gpio-crystalcove.c                    |    6 +-
 drivers/gpio/gpio-davinci.c                        |    7 +-
 drivers/gpio/gpio-dln2.c                           |    1 -
 drivers/gpio/gpio-etraxfs.c                        |    7 +-
 drivers/gpio/gpio-htc-egpio.c                      |   54 +-
 drivers/gpio/gpio-intel-mid.c                      |    7 +-
 drivers/gpio/gpio-max732x.c                        |   17 +-
 drivers/gpio/gpio-max77620.c                       |   11 +-
 drivers/gpio/gpio-mb86s7x.c                        |    6 +-
 drivers/gpio/gpio-mcp23s08.c                       |   17 +-
 drivers/gpio/gpio-merrifield.c                     |   33 +-
 drivers/gpio/gpio-mxs.c                            |   45 +-
 drivers/gpio/gpio-pca953x.c                        |   18 +-
 drivers/gpio/gpio-pcf857x.c                        |   11 +-
 drivers/gpio/gpio-pl061.c                          |  208 ++--
 drivers/gpio/gpio-stmpe.c                          |   19 +-
 drivers/gpio/gpio-sx150x.c                         |  792 ---------------
 drivers/gpio/gpio-tc3589x.c                        |   17 +-
 drivers/gpio/gpio-vf610.c                          |    6 +-
 drivers/gpio/gpio-wcove.c                          |    6 +-
 drivers/gpio/gpiolib-acpi.c                        |  107 +-
 drivers/gpio/gpiolib-devprop.c                     |   67 ++
 drivers/gpio/gpiolib-of.c                          |   51 +-
 drivers/gpio/gpiolib.c                             |  107 +-
 drivers/gpio/gpiolib.h                             |    2 +
 drivers/pinctrl/Kconfig                            |   14 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-sx150x.c                   | 1062 ++++++++++++++++++++
 include/linux/amba/pl061.h                         |   16 -
 include/linux/gpio/driver.h                        |   34 +-
 tools/gpio/gpio-hammer.c                           |   67 +-
 tools/gpio/gpio-utils.c                            |  256 +++++
 tools/gpio/gpio-utils.h                            |   16 +
 44 files changed, 2228 insertions(+), 1295 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
 create mode 100644 drivers/gpio/gpio-altera-a10sr.c
 delete mode 100644 drivers/gpio/gpio-sx150x.c
 create mode 100644 drivers/gpio/gpiolib-devprop.c
 create mode 100644 drivers/pinctrl/pinctrl-sx150x.c
 delete mode 100644 include/linux/amba/pl061.h
